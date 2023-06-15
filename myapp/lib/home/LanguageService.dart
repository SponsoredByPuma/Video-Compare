import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageService extends GetxService {
  static LanguageService get to => Get.find();

  late final Box<Language> _languageBox;
  String get currentLanguage => _languageBox.get(0)?.code ?? 'en';

  @override
  Future<void> onInit() async {
    super.onInit();
    await Hive.openBox<Language>('language');
    _languageBox = Hive.box<Language>('language');
  }

  void changeLanguage(BuildContext context, String languageCode) {
    if (AppLocalizations.of(context)?.localeName != languageCode) {
      Get.updateLocale(Locale(languageCode));
      _languageBox.put(0, Language(code: languageCode));
    }
  }
}

@HiveType(typeId: 0)
class Language extends HiveObject {
  @HiveField(0)
  final String code;

  Language({required this.code});
}
class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 0;

  @override
  Language read(BinaryReader reader) {
    final code = reader.readString();
    return Language(code: code);
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer.writeString(obj.code);
  }
}


