
import 'dart:ui';

abstract class LocaleStates {}
class InitialState extends LocaleStates{}
class UpdateLocaleState extends LocaleStates{
  final Locale locale;
  UpdateLocaleState(this.locale);
}
class UpdateLoacleStateTwo extends LocaleStates{
  final Locale locale;
  UpdateLoacleStateTwo(this.locale);
}