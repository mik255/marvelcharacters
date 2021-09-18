import 'dart:convert';
import 'package:crypto/crypto.dart';

String textToMd5(String text) {
  var result = md5.convert(utf8.encode(text)).toString();
  return result;
}
