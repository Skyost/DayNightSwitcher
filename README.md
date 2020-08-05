# DayNightSwitcher

Just a simple simple day / night switcher widget made in pure Dart.
It allows you to quickly show a beautiful dark mode switcher widget to your users.

<img src="https://github.com/Skyost/DayNightSwitcher/raw/master/screenshots/preview.gif" height="500">

## How to use ?

Using this plugin is pretty straightforward. You have two widgets : `DayNightSwitcher` and `DayNightSwitcherIcon`.

Here's a sample code for `DayNightSwitcher` :

```dart
DayNightSwitcher(
  isDarkModeEnabled: isDarkModeEnabled,
  onStateChanged: (isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  },
),
```

The other one is very similar :

```dart
DayNightSwitcherIcon(
  isDarkModeEnabled: isDarkModeEnabled,
  onStateChanged: (isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  },
),
```

## Contributions

You have a lot of options to contribute to this project ! You can :

* [Fork it](https://github.com/Skyost/DayNightSwitcher/fork) on Github.
* [Submit](https://github.com/Skyost/DayNightSwitcher/issues/new/choose) a feature request or a bug report.
* [Donate](https://paypal.me/Skyost) to the developer.
* [Watch a little ad](https://www.clipeee.com/creator/skyost) on Clipeee.
