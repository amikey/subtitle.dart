import 'caption.dart';

List<Caption> resync(List<Caption> captions, int time) {
  return captions.map((caption) {
    caption.start = caption.start + time;
    caption.end = caption.end + time;
    return caption;
  });
}
