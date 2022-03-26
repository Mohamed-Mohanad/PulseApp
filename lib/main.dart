import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Modules/selection_screen/selection_screen.dart';
import 'package:pulse_app/cubits/authintication/auth_cubit.dart';
import 'Shared/Cubit/bloc_observer.dart';
import 'Shared/Cubit/cubit.dart';
import 'Shared/Cubit/states.dart';
import 'Shared/Network/Local/cache_helper.dart';
import 'Shared/Network/Remote/dio_helper.dart';
import 'Shared/Style/theme.dart';
import 'cubits/calculation/calculation_cubit.dart';
import 'cubits/onboarding/onboarding_cubit.dart';
import 'cubits/questions/questions_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  DioHelper.init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => QuestionsCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CalculationCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(390, 844),
            splitScreenMode: true,
            builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Pulse',
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('ar', ''),
              ],
              locale: const Locale.fromSubtags(languageCode: 'ar'),
              builder: (context, widget) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              theme: lightMode,
              themeMode: ThemeMode.light,
              home: const SelectionScreen(),
            ),
          );
        },
      ),
    );
  }
}
