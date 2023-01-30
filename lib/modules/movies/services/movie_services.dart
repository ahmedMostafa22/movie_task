import 'package:alpha/constants/network_consts.dart';
import 'package:alpha/enums/request_methods.dart';
import 'package:alpha/helpers/network_helper.dart';
import 'package:alpha/network/network_layer.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class MoviesServices {
  Future<Either<Exception, Response>> getLatestMovies() => Api().request(
      NetworkConstants.baseUrl + NetworkConstants.search,
      RequestMethod.get,
      NetworkHelper().getHeadersWithToken(),
      body: {'start_year': '2022'});
}
