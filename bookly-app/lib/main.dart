import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:booklyapp/Features/home/domain/usecases/fetch_newset_books_use_case.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:booklyapp/Features/home/presentation/manager/newset_books_cubit/newset_books_cubit.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/app_routers.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBookCubit(FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ));
          },
        ),
        BlocProvider(
          create: (context) {
            return NewsetBooksCubit(
              FetchNewSetBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        //home: const SplashView(),
      ),
    );
  }
}
