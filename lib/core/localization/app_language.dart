import 'package:get/get.dart';
import 'package:standard_project/core/localization/language/en_language.dart';
import 'package:standard_project/core/localization/language/id_language.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enLanguage,
        'id': idLanguage,
      };
}
