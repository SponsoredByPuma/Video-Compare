import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vison/common/providers.dart';
import 'package:vison/widgets/AboutWidget.dart';

import '../widgets/SettingTab.dart';
import 'landing_model.dart';

class LandingView extends ConsumerWidget {
  const LandingView({super.key});

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
            indicatorColor: Colors.white,
            indicatorWeight: 4,
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
              switchColorMode: () {
                controller.switchColorMode();
              },
              getLightmode: controller.getLightmode(),

            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstTab(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, -0.85),
          child: Text(
            AppLocalizations.of(context)!.firstTabTitle,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.65),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/videoCompare');
            },
            child: Text(AppLocalizations.of(context)!.goToCompareVideos),
          ),
        )
      ],
    );
  }
}

abstract class LandingController extends StateNotifier<LandingModel> {
  LandingController(LandingModel state) : super(state);
  void changeLanguage(BuildContext context, String languageCode);
  void switchColorMode();
  bool getLightmode();
}
