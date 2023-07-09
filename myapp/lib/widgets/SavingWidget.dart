import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SavingWidget {
  static final SavingWidget _singleton = SavingWidget._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory SavingWidget() {
    return _singleton;
  }

  SavingWidget._internal();

  show(BuildContext context, {String text = 'Saving Video'}) {
    if (isDisplayed) {
      return;
    }
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        _context = context;
        isDisplayed = true;
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: CupertinoActivityIndicator(
                        color: Color.fromARGB(255, 39, 176, 130),
                        radius: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        textScaleFactor: 2,
                        text,
                        style: const TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  dismiss() {
    if (isDisplayed) {
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }
}
