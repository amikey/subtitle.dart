import 'caption.dart';
import 'parseTimestamps.dart';
import 'dart:io';

List<Caption> parse(String srtOrVtt) {
  if (srtOrVtt == null) return [];

  srtOrVtt = srtOrVtt.trim() + '\n';
  var source = srtOrVtt
      .replaceAllMapped(RegExp(r'\r\n'), (Match m) => '\n')
      .replaceAllMapped(RegExp(r'\n{3,}'), (Match m) => '\n\n')
      .replaceAllMapped(RegExp(r'^WEBVTT.*\n(?:.*: .*\n)*\n'), (Match m) => '')
      .split('\n');

  List<Caption> captions = [Caption()];
  for (var i = 0; i < source.length; i++) {
    var row = source[i];
    var caption = captions[captions.length - 1];
    if (caption.index == null) {
      if (RegExp(r"^\d+$").hasMatch(row)) {
        //caption.index = int.parse(row);
        caption.index = captions.length;
      }
      continue;
    }
    if (caption.start == null) {
      var timestamp = parseTimestamps(row);
      if (timestamp != null) {
        caption.start = timestamp.start;
        caption.end = timestamp.end;
        caption.settings = timestamp.settings;
      } else if (captions.length > 1) {
        captions[captions.length - 2].text += '\n' + row;
      }
      continue;
    }
    if (row == '') {
      if (i != source.length - 1) {
        captions.add(Caption());
      }
    } else {
      caption.text = caption.text != null ? caption.text + '\n' + row : row;
    }
  }

  return captions;
}
