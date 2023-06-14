import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/common/providers.dart';
import 'package:myapp/home/home_model.dart';
import 'package:myapp/widgets/AboutWidget.dart';

import '../widgets/SettingTab.dart';
import 'landing_model.dart';

class LandingView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final LandingController controller =
        ref.read(providers.landingControllerProvider.notifier);
    final LandingModel model = ref.watch(providers.landingControllerProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.of(context)!.appTitle),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.firstTabTitle),
              Tab(text: AppLocalizations.of(context)!.secondTabTitle),
              Tab(text: "settings"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFirstTab(context),
            AboutWidget(),
            SettingsTab(),
          ],
        ),
      )
);


  }

  Widget _buildFirstTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.firstTabTitle,
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/videoCompare');
                  },
                  child: Text(AppLocalizations.of(context)!.goToCompareVideos),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  }


abstract class LandingController extends StateNotifier<LandingModel> {
  LandingController(LandingModel state) : super(state as LandingModel);
}



