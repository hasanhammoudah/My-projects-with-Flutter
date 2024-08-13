import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/presentation/manager/similar_books_cubit/similar_box_cubit.dart';
import 'package:booklyapp/Features/home/presentation/view/book_Details_view.dart';
import 'package:booklyapp/Features/home/presentation/view/home_view.dart';
import 'package:booklyapp/Features/search/presentation/views/search_view.dart';
import 'package:booklyapp/Features/splash/presentation/views/splash_view.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSerachView = '/searchView';

  static final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        }),
    GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        }),
    GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BookDetailsView(
            bookModel: state.extra as BookModel,
          );
        }),
    GoRoute(
        path: kSerachView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        }),
  ]);
}
