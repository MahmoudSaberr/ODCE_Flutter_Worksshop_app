import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/res/constants.dart';
import 'package:login/utils/network/local/cache_helper.dart';
import 'package:login/utils/network/remote/dio_helper.dart';
import 'package:login/view/pages/auth/login_screen.dart';
import 'package:login/view/pages/bar_items/news/news_details.dart';
import 'package:login/view/pages/bar_items/news/news_screen.dart';
import 'package:login/view/pages/intro/splash_screen.dart';
import 'package:login/view_model/bloc/app_cubit/app_cubit.dart';
import 'package:login/view_model/bloc/bloc_observer.dart';
import 'package:login/view_model/bloc/login_cubit/login_cubit.dart';
import 'package:login/view_model/bloc/note_cubit/note_cubit.dart';
import 'package:login/view_model/bloc/register_cubit/register_cubit.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => AppCubit()),
          BlocProvider(create: (BuildContext context) => RegisterCubit()..getGradesData()..getUniversitiesData()),
          BlocProvider(create: (BuildContext context) => LoginCubit()),
          BlocProvider(create: (BuildContext context) => NoteCubit()..getNotes()..getTime()),
        ],
        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
              home: AnimatedSplashScreen(
                duration: 3000,
                splash: const SplashScreen(),
                nextScreen: LoginScreen(),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.leftToRight,
                backgroundColor: Colors.white,
              ),
              routes:
              {
                "news_details": (context) => NewsDetailsScreen(),
                "news": (context) => NewsScreen(),
              },
            );
          },
        )
    );
  }
}

