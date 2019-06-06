import 'to_vtt_time.dart';
import 'caption.dart';

String stringifyVtt(List<Caption> captions) {
  return 'WEBVTT\n\n' +
      captions
          .asMap()
          .map((index, caption) {
            var value = (index > 0 ? '\n' : '') +
                [
                  index + 1,
                  '${toVttTime(caption.start)} --> ${toVttTime(caption.end)}${caption.settings != null ? ' ' + caption.settings : ''}',
                  caption.text
                ].join('\n');
            return MapEntry(index, value);
          })
          .values
          .join('\n') +
      '\n';
}