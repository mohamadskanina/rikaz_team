import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/widgets/toast.dart';
import 'package:rikaz_team/features/language/language_cubit.dart';
import 'package:rikaz_team/features/language/language_state.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';
import 'package:rikaz_team/features/offline_mode_ui/controller/internet_cubit.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/view_user_bloc/user_bloc.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';
import 'package:rikaz_team/main.dart';
import 'package:rikaz_team/routes/router_screens.dart';
import 'package:rikaz_team/routes/routes_name.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
          designSize: const Size(492, 948),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => LanguageCubit(),
                  lazy: false,
                ),
                BlocProvider(
                  create: (context) => InternetCubit(),
                  lazy: false,
                ),
                BlocProvider(create: (context) => sl<LoginBloc>()),
                BlocProvider(
                  create: (_) => sl<UserBloc>(),
                ),
                BlocProvider(create: (_) => ExcelBloc()),
              ],
              child: BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  currentLocale = state.locale;
                  return MaterialApp(
                    title: 'Users Managment',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(
                          seedColor: Colors.blue,
                        ),
                        primaryColor: const Color(0xFF247CFF),
                        scaffoldBackgroundColor: Colors.white,
                        cardColor: Colors.blue.shade50,
                        useMaterial3: true),
                    localizationsDelegates: const [
                      Lang.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate
                    ],
                    locale: currentLocale,
                    supportedLocales: Lang.delegate.supportedLocales,
                    onGenerateRoute: AppRouter.router.generator,
                    initialRoute: RoutesNames.login,
                    navigatorKey: SingleInstanceService.navigatorKey,
                    builder: (context, child) {
                      return BlocListener<InternetCubit, InternetState>(
                        listener: (context, state) {
                          if (state.isConnected) {
                            InternetToast.online(context);
                          } else {
                            InternetToast.offline(context);
                          }
                        },
                        child: child,
                      );
                    },
                  );
                },
              ),
            );
          }),
    );
  }
}
