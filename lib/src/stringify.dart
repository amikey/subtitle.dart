import 'to_srt_time.dart';
import 'caption.dart';

String stringify(List<Caption> captions) {
  return captions
          .asMap()
          .map((index, caption) {
            var value = (index > 0 ? '\n' : '') +
                [
                  index + 1,
                  '${toSrtTime(caption.start)} --> ${toSrtTime(caption.end)}',
                  caption.text
                ].join('\n');
            return MapEntry(index, value);
          })
          .values
          .join('\n') +
      '\n';
}

