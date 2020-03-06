import 'package:flutter/material.dart';

/// Should be called when a widget state has changed.
typedef StateChangedCallback = Function(bool isDarkModeEnabled);

/// The base widget for every day / night switch widget.
abstract class DayNightSwitcherBaseWidget extends StatefulWidget {
  /// The widget outer padding.
  final EdgeInsetsGeometry padding;

  /// Whether the dark mode is currently enabled.
  final bool isDarkModeEnabled;

  /// Called when the state has changed.
  final StateChangedCallback onStateChanged;

  /// The day background color.
  final Color dayBackgroundColor;

  /// The night background color.
  final Color nightBackgroundColor;

  /// The sun color.
  final Color sunColor;

  /// The moon color.
  final Color moonColor;

  /// The stars color.
  final Color starsColor;

  /// The clouds color.
  final Color cloudsColor;

  /// The craters color.
  final Color cratersColor;

  /// Creates a new day / night switcher base widget instance.
  const DayNightSwitcherBaseWidget({
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    @required bool isDarkModeEnabled,
    @required this.onStateChanged,
    Color dayBackgroundColor,
    Color nightBackgroundColor,
    Color sunColor,
    Color moonColor,
    Color starsColor,
    Color cloudsColor,
    Color cratersColor,
  })  : assert(padding != null),
        assert(onStateChanged != null),
        this.isDarkModeEnabled = isDarkModeEnabled ?? false,
        dayBackgroundColor = dayBackgroundColor ?? const Color(0xFF3498DB),
        nightBackgroundColor = nightBackgroundColor ?? const Color(0xFF192734),
        sunColor = sunColor ?? const Color(0xFFFFCF96),
        moonColor = moonColor ?? const Color(0xFFFFE5B5),
        starsColor = starsColor ?? Colors.white,
        cloudsColor = cloudsColor ?? Colors.white,
        cratersColor = cratersColor ?? const Color(0xFFE8CDA5);

  /// The widget height.
  double get height => 36;

  /// The widget width.
  double get width;
}

/// The base state for every day / night switch widget.
abstract class DayNightSwitcherBaseState<T extends DayNightSwitcherBaseWidget> extends State<T> with TickerProviderStateMixin {
  /// The animation progress.
  double progress;

  /// The animation controller.
  AnimationController controller;

  /// The animation instance.
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    progress = widget.isDarkModeEnabled ? 1.0 : 0.0;
  }

  @override
  void didUpdateWidget(T oldWidget) {
    if(widget.isDarkModeEnabled && progress == 0 || !widget.isDarkModeEnabled && progress == 1) {
      onTap();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: widget.padding,
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: GestureDetector(
            onTap: onTap,
            child: CustomPaint(
              painter: createCustomPainter(context),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  /// Creates the corresponding custom painter.
  CustomPainter createCustomPainter(BuildContext context);

  /// Triggered when the widget has been tapped.
  void onTap() {
    controller = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    animation = Tween(begin: progress, end: progress > 0.0 ? 0.0 : 1.0).animate(controller)
      ..addListener(() {
        if (mounted) {
          setState(() => progress = animation.value);
        }
      });

    bool enableDarkMode = progress == 0.0;
    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        widget.onStateChanged(enableDarkMode);
      }
    });
    controller.forward();
  }
}
