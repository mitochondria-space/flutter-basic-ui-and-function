import 'package:dio/dio.dart';
import 'package:flutter_football_app/model/detail_team.dart';
import 'package:flutter_football_app/model/list_team.dart';

class DataSource {
  final Dio _dio = Dio();
  final String baseUrl = 'https://api.sportmonks.com';
  final token = 'f2ipVTENUI0ClLmBQ6mLxkcAmDKPLXRKiALuy09wW6xxuORuDXDmogX1aEke';

  Future<ListTeam?> fetchTeams() async {
    try {
      final response = await _dio.get(
        '$baseUrl/v3/football/teams',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      return ListTeam.fromJson(response.data);
    } on DioException catch (e) {
      print('DioError: $e');
      return null;
    }
  }

  Future<DetailTeam?> fetchDetailTeam(int id) async {
    try {
      final response = await _dio.get(
        '$baseUrl/v3/football/teams/$id?include=country;venue',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );
      return DetailTeam.fromJson(response.data);
    } on DioException catch (e) {
      print('DioError: $e');
      return null;
    }
  }
}
