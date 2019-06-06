import 'caption.dart';
import 'to_ms.dart';

Caption parseTimestamps(value) {
  RegExp reg = new RegExp(
      r"^((?:\d{2,}:)?\d{2}:\d{2}[,.]\d{3}) --> ((?:\d{2,}:)?\d{2}:\d{2}[,.]\d{3})(?: (.*))?$");
  Match match = reg.firstMatch(value);
  if (match == null) {
    throw 'Invalid value';
  }
  var caption = Caption();
  caption.start = toMS(match.group(1));
  caption.end = toMS(match.group(2));
  if (match.group(3) != null) {
    caption.settings = match.group(3);
  }
  return caption;
}

