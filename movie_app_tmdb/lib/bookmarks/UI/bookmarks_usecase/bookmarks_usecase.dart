String durationToString(num? minutes) {
  var d = Duration(minutes: int.parse(minutes.toString()));
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
}