import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/constants/strings.dart';
import 'package:movie_app/models/popularmovies.dart';
import 'package:movie_app/models/trending.dart';
import 'package:movie_app/models/upcoming.dart';

class MoviesApi {
  Future<PopularMovies> getpopular() async {
    var popularmovies;

    try {
      var response = await http.get(Uri.parse(Strings.Movies_uri));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = json.decode(jsonstring);
        popularmovies = PopularMovies.fromJson(jsonMap);
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return popularmovies;
  }

  Future<Upcoming> getupcoming() async {
    var upcoming;

    try {
      final response = await http.get(Uri.parse(Strings.upcoming_uri));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = json.decode(jsonstring);
        upcoming = Upcoming.fromJson(jsonMap);
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return upcoming;
  }

  Future<Trending> gettrending() async {
    var trending;

    try {
      final response = await http.get(Uri.parse(Strings.trending_uri));
      if (response.statusCode == 200) {
        var jsonstring = response.body;
        var jsonMap = json.decode(jsonstring);
        trending = Trending.fromJson(jsonMap);
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
    return trending;
  }
}
