int toMS(String timestamp) {
  RegExp reg = new RegExp(r"^(?:(\d{2,}):)?(\d{2}):(\d{2})[,.](\d{3})$");
  Match match = reg.firstMatch(timestamp);
  if (match == null) {
    throw 'Invalid SRT or VTT time format: $timestamp';
  }
  var hours = match.group(1) != null ? int.parse(match.group(1)) * 3600000 : 0;
  var minutes = int.parse(match.group(2)) * 60000;
  var seconds = int.parse(match.group(3)) * 1000;
  var milliseconds = int.parse(match.group(4));

  return hours + minutes + seconds + milliseconds;
}
