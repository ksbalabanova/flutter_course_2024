class WWeather {
  final double temp;
  final String type;

  const WWeather(this.temp, this.type);

  @override
  String toString() {
    return 'WWeather{temp: $temp, type: $type}';
  }
}