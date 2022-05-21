import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

part 'localizations.g.dart';
//https://github.com/aloisdeniel/flutter_sheet_localization
//to rebuild language files
//delete the localizations.g.dart file
//on command line run...
//flutter packages pub run build_runner build

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.languages.containsKey(locale);
  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
