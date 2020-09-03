import 'package:flutter/cupertino.dart';

import 'app_localization.dart';

String getTranslatedValue(BuildContext context,String key) {
  return AppLocalization.of(context).getTranslatedValue(key);
}