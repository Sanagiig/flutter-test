import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class DataUtils {
  static const String SP_AC_TOKEN = "accessToken";
  static const String SP_RE_TOKEN = "refreshToken";
  static const String SP_UID = "uid";
  static const String SP_IS_LOGIN = "isLogin";
  static const String SP_EXPIRES_IN = "expiresIn";
  static const String SP_TOKEN_TYPE = "tokenType";

  static const String SP_USER_NAME = "name";
  static const String SP_USER_ID = "id";
  static const String SP_USER_LOC = "location";
  static const String SP_USER_GENDER = "gender";
  static const String SP_USER_AVATAR = "avatar";
  static const String SP_USER_EMAIL = "email";
  static const String SP_USER_URL = "url";

  static const String SP_COLOR_THEME_INDEX = "colorThemeIndex";

   // 是否登录
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool b = sp.getBool(SP_IS_LOGIN);
    return b != null && b;
  }

  // 获取accesstoken
  static Future<String> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(SP_AC_TOKEN);
  }

  static Future<int> getColorThemeIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(SP_COLOR_THEME_INDEX);
  }
  
}
