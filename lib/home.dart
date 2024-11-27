import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';
import 'extension.dart';

import 'theme_provider.dart';
import 'widgets/material_showcase.dart';
import 'widgets/color_scheme.dart';
import 'widgets/sub_theme_colors.dart';
import 'widgets/theme_data_colors.dart';

const double appBarHeight = 120;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget colorSeedPopupItem(ColorSeed colorSeed) => Row(children: [
        Icon(Icons.palette, color: colorSeed.color),
        const SizedBox(width: 20),
        Text(colorSeed.label),
      ]);

  Widget centerContainerNoScrollBar(
    BuildContext context, {
    required Widget child,
  }) =>
      Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: const EdgeInsets.all(16),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: child,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    final TextStyle headerStyle = context.textTheme.headlineMedium!;
    final Color borderColor = context.colorScheme.onSurface;
    final isDarkMode = context.isDarkMode();

    return DefaultTabController(
      length: tabName.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(context.width, appBarHeight),
          child: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text("Flutter Theme Preview"),
            actions: [
              IconButton(
                onPressed: themeProvider.triggerMaterialTheme,
                icon: Icon(
                  themeProvider.isMaterial3 ? Icons.filter_3 : Icons.filter_2,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () => themeProvider.changeThemeMode(
                  isDarkMode ? ThemeMode.light : ThemeMode.dark,
                ),
                icon: Icon(
                  isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  color: Colors.white,
                ),
              ),
              PopupMenuButton<ColorSeed>(
                initialValue: ColorSeed.baseColor,
                icon: const Icon(
                  Icons.palette,
                  color: Colors.white,
                ),
                onSelected: themeProvider.changeColorSeed,
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<ColorSeed>>[
                  ...ColorSeed.values.map(
                    (colorSeed) => PopupMenuItem<ColorSeed>(
                      value: colorSeed,
                      child: colorSeedPopupItem(colorSeed),
                    ),
                  )
                ],
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              tabs: tabName
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        e,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        body: centerContainerNoScrollBar(
          context,
          child: TabBarView(
            children: <Widget>[
              const SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColorSchemeColors(),
                    SizedBox(height: 24),
                    ThemeDataColors(),
                    SizedBox(height: 24),
                    SubThemeColors(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Material Buttons', style: headerStyle),
                    [
                      const ElevatedButtonDemo(),
                      const FilledButtonDemo(),
                      const FilledButtonTonalDemo(),
                      const OutlinedButtonDemo(),
                      const TextButtonDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                    Text('ToggleButtons', style: headerStyle),
                    [
                      const ToggleButtonsDemo(),
                    ].wrapBorder(borderColor),
                    Text('SegmentedButton', style: headerStyle),
                    [
                      const SegmentedButtonDemo(),
                    ].wrapBorder(borderColor),
                    Text('FloatingActionButton', style: headerStyle),
                    [
                      const FabDemo(),
                    ].wrapBorder(borderColor),
                    Text('Chip', style: headerStyle),
                    [
                      const ChipDemo(),
                    ].wrapBorder(borderColor),
                    Text('IconButton', style: headerStyle),
                    [
                      const IconButtonDemo(),
                      const IconButtonVariantsDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TextField with InputDecorator', style: headerStyle),
                    [
                      const TextFieldDemo(),
                    ].wrapBorder(borderColor),
                    Text('Search Bar', style: headerStyle),
                    [
                      const SearchBarDemo(),
                    ].wrapBorder(borderColor),
                    Text('Switch', style: headerStyle),
                    [
                      const SwitchDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                    Text('Checkbox', style: headerStyle),
                    [
                      const CheckboxDemo(),
                    ].wrapBorder(borderColor),
                    Text('Radio', style: headerStyle),
                    [
                      const RadioDemo(),
                    ].wrapBorder(borderColor),
                    Text('Slider and RangeSlider', style: headerStyle),
                    [
                      const SliderDemo(),
                      const Divider(),
                      const RangeSliderDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ListTile', style: headerStyle),
                    [
                      const ListTileDemo(),
                      const Divider(height: 1),
                      const SwitchListTileDemo(),
                      const Divider(height: 1),
                      const CheckboxListTileDemo(),
                      const Divider(height: 1),
                      const RadioListTileDemo(),
                    ].wrapBorder(borderColor),
                    Text('ExpansionTile', style: headerStyle),
                    [
                      const ExpansionTileDemo(),
                    ].wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('AppBar', style: headerStyle),
                    [
                      const AppBarDemo(),
                    ].wrapBorder(borderColor),
                    Text('TabBar', style: headerStyle),
                    [
                      const TabBarForAppBarDemo(),
                      const TabBarForBackgroundDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                    Text('Bottom AppBar', style: headerStyle),
                    [
                      const BottomAppBarDemo(),
                    ].wrapBorder(borderColor),
                    Text('Bottom Navigation Bar', style: headerStyle),
                    [
                      const BottomNavigationBarDemo(),
                    ].wrapBorder(borderColor),
                    Text('Navigation Bar', style: headerStyle),
                    [
                      const BadgeDemo(),
                    ].wrapBorder(borderColor),
                    Text('Navigation Rail', style: headerStyle),
                    [
                      const NavigationRailDemo(),
                    ].wrapBorder(borderColor),
                    Text('Drawer', style: headerStyle),
                    [
                      const NavigationDrawerDemo(),
                    ].wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card', style: headerStyle),
                    [
                      const CardDemo(),
                    ].wrapBorder(borderColor),
                    Text('Material', style: headerStyle),
                    [
                      const MaterialDemo(),
                    ].wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PopupMenu Button', style: headerStyle),
                    [
                      const PopupMenuButtonsDemo(),
                    ].wrapBorder(borderColor),
                    // const SizedBox(height: 16),
                    Text('Dropdown', style: headerStyle),
                    [
                      const DropdownButtonFormFieldDemo(),
                      const DropDownButtonDemo(),
                      const DropDownMenuDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                    Text('MenuBar', style: headerStyle),
                    [
                      const MenuAnchorDemo(),
                      const MenuBarDemo(),
                    ].separateCenter().wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Dialog', style: headerStyle),
                    [
                      const DialogDemo(),
                    ].wrapBorder(borderColor),
                    Text('Time Picker', style: headerStyle),
                    [
                      const TimePickerDialogDemo(),
                    ].wrapBorder(borderColor),
                    Text('Date Picker', style: headerStyle),
                    [
                      const DatePickerDialogDemo(),
                    ].wrapBorder(borderColor),
                    Text('BottomSheet', style: headerStyle),
                    [
                      const BottomSheetDemo(),
                    ].wrapBorder(borderColor),
                    Text('SnackBar', style: headerStyle),
                    [
                      const SnackBarDemo(),
                    ].wrapBorder(borderColor),
                    Text('MaterialBanner', style: headerStyle),
                    [
                      const MaterialBannerDemo(),
                    ].wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Icon', style: headerStyle),
                    [
                      const IconDemo(),
                    ].wrapBorder(borderColor),
                    Text('Badge', style: headerStyle),
                    [
                      const BadgeDemo(),
                    ].wrapBorder(borderColor),
                    Text('CircleAvatar', style: headerStyle),
                    [
                      const CircleAvatarDemo(),
                    ].wrapBorder(borderColor),
                    Text('Tooltip', style: headerStyle),
                    [
                      const TooltipDemo(),
                    ].wrapBorder(borderColor),
                    Text('Theme Extension', style: headerStyle),
                    [
                      const ThemeExtensionDemo(),
                    ].wrapBorder(borderColor),
                    Text('Progress Indicator', style: headerStyle),
                    [
                      const ProgressIndicatorDemo(),
                    ].wrapBorder(borderColor),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextThemeDemo(),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'PrimaryTextTheme',
                              style: context.textTheme.titleLarge,
                            ),
                            const PrimaryTextThemeDemo(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
