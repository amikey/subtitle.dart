import 'package:subtitle/subtitle.dart';
import 'dart:io';

main(List<String> arguments) {
  new File('/Users/leo/space/project/lang/lang_lab/subtitle/example/test.srt')
      .readAsString()
      .then((String contents) {
    var captions = parse(contents);
    captions.forEach(print);
  });
}
