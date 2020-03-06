import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

/// Hello world !
void main() => runApp(_DayNightSwitcherExample());

/// The main widget.
class _DayNightSwitcherExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DayNightSwitcherExampleState();
}

/// The main widget state.
class _DayNightSwitcherExampleState extends State<_DayNightSwitcherExample> {
  /// Whether dark mode is enabled.
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day / night switcher example',
      theme: _AppTheme.of(isDarkModeEnabled).themeData,
      home: Scaffold(
        appBar: AppBar(title: Text('Day / night switcher example')),
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: onStateChanged,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: DayNightSwitcherIcon(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Dark mode is ' + (isDarkModeEnabled ? 'enabled' : 'disabled') + '.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Called when the state (day / night) has changed.
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }
}

/// A basic app theme class.
class _AppTheme {
  /// The primary color.
  final Color primaryColor;

  /// The scaffold background color.
  final Color scaffoldBackgroundColor;

  /// The text color.
  final Color textColor;

  /// Creates a new app theme instance.
  const _AppTheme({
    @required this.primaryColor,
    this.scaffoldBackgroundColor,
    this.textColor,
  });

  /// Creates a Flutter theme data.
  ThemeData get themeData => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: TextTheme(
          body1: TextStyle(color: textColor),
        ),
      );

  /// Returns the corresponding app theme.
  static _AppTheme of(bool isDarkModeEnabled) => isDarkModeEnabled ? _DarkAppTheme() : _LightAppTheme();
}

/// The light app theme.
class _LightAppTheme extends _AppTheme {
  /// Creates a new light app theme instance.
  _LightAppTheme() : super(primaryColor: Colors.blue);
}

/// The dark app theme.
class _DarkAppTheme extends _AppTheme {
  /// Creates a new dark app theme instance.
  _DarkAppTheme()
      : super(
          primaryColor: const Color(0xFF253341),
          scaffoldBackgroundColor: const Color(0xFF15202B),
          textColor: Colors.white70,
        );
}
