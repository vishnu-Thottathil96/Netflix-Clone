import 'package:flutter/material.dart';
import 'package:netflix/models/model_movie.dart';

ValueNotifier<List<MovieModel>> nowPlayingNotifier = ValueNotifier([]);
ValueNotifier<List<MovieModel>> popularNotifier = ValueNotifier([]);
ValueNotifier<List<MovieModel>> upcomingNotifier = ValueNotifier([]);
ValueNotifier<List<MovieModel>> topRatedNotifier = ValueNotifier([]);
ValueNotifier<List<MovieModel>> searchNotifier = ValueNotifier([]);
ValueNotifier<String> randomNotifier = ValueNotifier('');
