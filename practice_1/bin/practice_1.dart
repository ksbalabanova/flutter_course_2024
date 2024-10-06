import 'package:practice_1/features/core/data/debug/weather_repository_debug.dart';
import 'package:practice_1/features/core/data/osm/osm_api.dart';
import 'package:practice_1/features/core/data/osm/weather_repository_osm.dart';
import 'package:practice_1/features/core/data/ww/ww_api.dart';
import 'package:practice_1/features/core/data/ww/weather_repository_ww.dart';
import 'package:practice_1/features/core/presentation/app.dart';

const String version = '0.0.1';
const String url = 'http://api.weatherapi.com/v1';
const String apiKey = '2229532b41f242019ae140124240610';

void main(List<String> arguments) {
  var app = App(WeatherRepositoryDebug());

  app.run();
}
