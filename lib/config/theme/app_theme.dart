import 'package:flutter/material.dart';

const colorSeed = Color.fromARGB(255, 255, 121, 18);
final Color secondaryColor = Colors.grey[200]!;

const scaffoldBackgroundColor = Color.fromARGB(255, 245, 245, 245);

class AppTheme {
  ThemeData getTheme() => ThemeData(
        ///* General
        useMaterial3: true,
        fontFamily: "QuicksandRegular",
        primaryColor: colorSeed,
        disabledColor: secondaryColor,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color?>(Colors.white),
        ),

        scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all<Color?>(colorSeed)),

        ///* Texts
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 40, fontFamily: "QuicksandBold"),
          titleMedium: TextStyle(fontSize: 30, fontFamily: "QuicksandBold"),
          titleSmall: TextStyle(fontSize: 20, fontFamily: "QuicksandRegular"),
        ),

        ///* Scaffold Background Color
        scaffoldBackgroundColor: scaffoldBackgroundColor,

        ///* Buttons
        filledButtonTheme: const FilledButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontFamily: "QuicksandSemiBold"),
            ),
          ),
        ),

        ///* AppBar
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: "QuicksandMedium",
            color: Colors.black,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.all<Color?>(Colors.white),
          fillColor: MaterialStateProperty.all<Color?>(colorSeed),
        ),

        dropdownMenuTheme: DropdownMenuThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              iconColor: colorSeed,
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            menuStyle: MenuStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 10),
              ),
            )),
      );

  ///* TextFormField
}
