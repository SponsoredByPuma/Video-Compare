import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/common/providers.dart';
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
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.firstTabTitle),
              Tab(text: AppLocalizations.of(context)!.secondTabTitle),
              Tab(text: AppLocalizations.of(context)!.thirdTabTitle),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildFirstTab(context),
            const AboutWidget(),
            SettingsTab(
              changeLanguage: (String languageCode) {
                controller.changeLanguage(context, languageCode);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.firstTabTitle,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/videoCompare');
                },
                child: Image.asset(
                  'assets/images/goToVideoButton.png',
                  height: 300,
                  width: 300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

abstract class LandingController extends StateNotifier<LandingModel> {
  LandingController(LandingModel state) : super(state);
  void changeLanguage(BuildContext context, String languageCode);
}
