String toVttTime(int timestamp) {
  var date = new DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);

  var hours = date.hour.toString().padLeft(2, '0');
  var minutes = date.minute.toString().padLeft(2, '0');
  var seconds = date.second.toString().padLeft(2, '0');
  var ms = date.millisecond.toString().padLeft(3, '0');

  return '${hours}:${minutes}:${seconds}.${ms}';
}

