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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
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
                child: Text('Dark mode is ' +
                    (isDarkModeEnabled ? 'enabled' : 'disabled') +
                    '.'),
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
