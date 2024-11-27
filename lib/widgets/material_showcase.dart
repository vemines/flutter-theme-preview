// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../extension.dart';
import '../theme_extension.dart';
import 'color_card.dart';

class ElevatedButtonDemo extends StatelessWidget {
  const ElevatedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated button'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Elevated icon'),
          ),
          const ElevatedButton(
            onPressed: null,
            child: Text('Elevated button'),
          ),
        ],
      ),
    );
  }
}

class FilledButtonDemo extends StatelessWidget {
  const FilledButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          FilledButton(
            onPressed: () {},
            child: const Text('Filled button'),
          ),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Filled icon'),
          ),
          const FilledButton(
            onPressed: null,
            child: Text('Filled button'),
          ),
        ],
      ),
    );
  }
}

class FilledButtonTonalDemo extends StatelessWidget {
  const FilledButtonTonalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          FilledButton.tonal(
            onPressed: () {},
            child: const Text('Filled tonal button'),
          ),
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Filled tonal icon'),
          ),
          const FilledButton.tonal(
            onPressed: null,
            child: Text('Filled tonal button'),
          ),
        ],
      ),
    );
  }
}

class OutlinedButtonDemo extends StatelessWidget {
  const OutlinedButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined button'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Outlined icon'),
          ),
          const OutlinedButton(
            onPressed: null,
            child: Text('Outlined button'),
          ),
        ],
      ),
    );
  }
}

class TextButtonDemo extends StatelessWidget {
  const TextButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text('Text button'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Text icon'),
          ),
          const TextButton(
            onPressed: null,
            child: Text('Text button'),
          ),
        ],
      ),
    );
  }
}

class ToggleButtonsDemo extends StatefulWidget {
  const ToggleButtonsDemo({this.compareButtons, super.key});
  final bool? compareButtons;

  @override
  State<ToggleButtonsDemo> createState() => _ToggleButtonsDemoState();
}

class _ToggleButtonsDemoState extends State<ToggleButtonsDemo> {
  List<bool> selected = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          ToggleButtons(
            isSelected: selected,
            onPressed: (int toggledIndex) {
              setState(() {
                selected[toggledIndex] = !selected[toggledIndex];
              });
            },
            children: const <Widget>[
              Icon(Icons.adb),
              Icon(Icons.phone),
              Icon(Icons.account_circle),
            ],
          ),
          if (widget.compareButtons ?? false)
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined'),
            ),
          if (widget.compareButtons ?? false)
            FilledButton(
              onPressed: () {},
              child: const Text('Filled'),
            ),
          ToggleButtons(
            isSelected: const <bool>[true, false, false],
            onPressed: null,
            children: const <Widget>[
              Icon(Icons.adb),
              Icon(Icons.phone),
              Icon(Icons.account_circle),
            ],
          ),
          if (widget.compareButtons ?? false)
            const OutlinedButton(
              onPressed: null,
              child: Text('Outlined'),
            ),
        ],
      ),
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoiceSegment extends StatefulWidget {
  const MultipleChoiceSegment({super.key});

  @override
  State<MultipleChoiceSegment> createState() => _MultipleChoiceSegmentState();
}

class _MultipleChoiceSegmentState extends State<MultipleChoiceSegment> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class SegmentedButtonDemo extends StatefulWidget {
  const SegmentedButtonDemo({super.key});

  @override
  State<SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

enum Calendar { day, week, month, year }

class _SegmentedButtonDemoState extends State<SegmentedButtonDemo> {
  Calendar _selected = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SegmentedButton<Calendar>(
            showSelectedIcon: false,
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                label: Text('Week'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                label: Text('Month'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                label: Text('Year'),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                icon: Icon(Icons.calendar_view_week),
                label: Text('Week'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                icon: Icon(Icons.calendar_view_month),
                label: Text('Month'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                icon: Icon(Icons.calendar_today),
                label: Text('Year'),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                value: Calendar.day,
                label: Text('Day'),
                icon: Icon(Icons.calendar_view_day),
                enabled: false,
              ),
              ButtonSegment<Calendar>(
                value: Calendar.week,
                icon: Icon(Icons.calendar_view_week),
                label: Text('Week'),
              ),
              ButtonSegment<Calendar>(
                value: Calendar.month,
                icon: Icon(Icons.calendar_view_month),
                label: Text('Month'),
                enabled: false,
              ),
              ButtonSegment<Calendar>(
                value: Calendar.year,
                icon: Icon(Icons.calendar_today),
                label: Text('Year'),
              ),
            ],
            selected: <Calendar>{_selected},
            onSelectionChanged: (Set<Calendar> selected) {
              setState(() {
                _selected = selected.first;
              });
            },
          ),
          Text("Multi choice segment"),
          MultipleChoiceSegment(),
        ].separateCenter(),
      ),
    );
  }
}

class FabDemo extends StatefulWidget {
  const FabDemo({super.key});

  @override
  State<FabDemo> createState() => _FabDemoState();
}

class _FabDemoState extends State<FabDemo> {
  bool extended = true;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: <Widget>[
          Tooltip(
            verticalOffset: 40,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton.small',
            child: FloatingActionButton.small(
              heroTag: 'FAB small',
              onPressed: () {},
              child: const Icon(Icons.accessibility),
            ),
          ),
          Tooltip(
            verticalOffset: 40,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton',
            child: FloatingActionButton(
              heroTag: 'FAB standard',
              onPressed: () {},
              child: const Icon(Icons.accessibility),
            ),
          ),
          Tooltip(
            verticalOffset: 40,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton.extended(isExtended: $extended)',
            child: FloatingActionButton.extended(
              heroTag: 'FAB extendable',
              isExtended: extended,
              onPressed: () {
                setState(() {
                  extended = !extended;
                });
              },
              icon: const Icon(Icons.accessibility),
              label: const Text('Extended'),
            ),
          ),
          Tooltip(
            verticalOffset: 60,
            waitDuration: const Duration(milliseconds: 500),
            message: 'FloatingActionButton.large',
            child: FloatingActionButton.large(
              heroTag: 'FAB large',
              onPressed: () {},
              child: const Icon(Icons.accessibility),
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool isOn1 = true;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          const Text('Material:'),
          Switch(
            value: isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = value;
              });
            },
          ),
          Switch(
            thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Icon(Icons.check,
                    color:
                        isLight ? colorScheme.primary : colorScheme.onPrimary);
              }
              return Icon(Icons.close, color: colorScheme.onPrimary);
            }),
            value: isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = value;
              });
            },
          ),
          Switch(
            value: isOn1,
            onChanged: null,
          ),
          Switch(
            value: !isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = !value;
              });
            },
          ),
          Switch(
            value: !isOn1,
            onChanged: null,
          ),
          const Text('iOS:'),
          CupertinoSwitch(
            activeColor: colorScheme.primary,
            value: isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = value;
              });
            },
          ),
          CupertinoSwitch(
            activeColor: colorScheme.primary,
            value: isOn1,
            onChanged: null,
          ),
          CupertinoSwitch(
            activeColor: colorScheme.primary,
            value: !isOn1,
            onChanged: (bool value) {
              setState(() {
                isOn1 = !value;
              });
            },
          ),
          CupertinoSwitch(
            activeColor: colorScheme.primary,
            value: !isOn1,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool? isSelected1 = true;
  bool? isSelected2;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Checkbox(
            value: isSelected1,
            onChanged: (bool? value) {
              setState(() {
                isSelected1 = value;
              });
            },
          ),
          Checkbox(
            tristate: true,
            value: isSelected2,
            onChanged: (bool? value) {
              setState(() {
                isSelected2 = value;
              });
            },
          ),
          Checkbox(
            value: false,
            onChanged: (bool? value) {},
          ),
          const Checkbox(
            value: true,
            onChanged: null,
          ),
          const Checkbox(
            value: null,
            tristate: true,
            onChanged: null,
          ),
          const Checkbox(
            value: false,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  bool? groupValue = true;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Radio<bool>(
            value: true,
            groupValue: groupValue,
            onChanged: (bool? value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Radio<bool>(
            value: false,
            groupValue: groupValue,
            onChanged: (bool? value) {
              setState(() {
                groupValue = value;
              });
            },
          ),
          Radio<bool>(
            value: true,
            groupValue: groupValue,
            onChanged: null,
          ),
          Radio<bool>(
            value: false,
            groupValue: groupValue,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double value = 5;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('Slider stepped (${value.toStringAsFixed(0)})'),
            subtitle: Slider(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue.roundToDouble();
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('Slider continuous (${value.toStringAsFixed(2)})'),
            subtitle: Slider(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title:
                Text('Slider stepped disabled (${value.toStringAsFixed(0)})'),
            subtitle: Slider(
              max: 30,
              divisions: 31,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text(
                'Slider continuous disabled (${value.toStringAsFixed(2)})'),
            subtitle: Slider(
              max: 30,
              label: value.toStringAsFixed(0),
              value: value,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class RangeSliderDemo extends StatefulWidget {
  const RangeSliderDemo({super.key});

  @override
  State<RangeSliderDemo> createState() => _RangeSliderDemoState();
}

class _RangeSliderDemoState extends State<RangeSliderDemo> {
  RangeValues values = const RangeValues(5, 12);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            dense: true,
            title: Text('RangeSlider stepped (${RangeLabels(
              values.start.toStringAsFixed(0),
              values.end.toStringAsFixed(0),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(0),
                values.end.toStringAsFixed(0),
              ),
              values: values,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values = RangeValues(
                    newValues.start.roundToDouble(),
                    newValues.end.roundToDouble(),
                  );
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('RangeSlider continuous (${RangeLabels(
              values.start.toStringAsFixed(2),
              values.end.toStringAsFixed(2),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              labels: RangeLabels(
                values.start.toStringAsFixed(2),
                values.end.toStringAsFixed(2),
              ),
              values: values,
              onChanged: (RangeValues newValues) {
                setState(() {
                  values = newValues;
                });
              },
            ),
          ),
          ListTile(
            dense: true,
            title: Text('RangeSlider stepped disabled (${RangeLabels(
              values.start.toStringAsFixed(0),
              values.end.toStringAsFixed(0),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(0),
                values.end.toStringAsFixed(0),
              ),
              values: values,
              onChanged: null,
            ),
          ),
          ListTile(
            dense: true,
            title: Text('RangeSlider continuous disabled (${RangeLabels(
              values.start.toStringAsFixed(2),
              values.end.toStringAsFixed(2),
            )})'),
            subtitle: RangeSlider(
              max: 30,
              divisions: 31,
              labels: RangeLabels(
                values.start.toStringAsFixed(2),
                values.end.toStringAsFixed(2),
              ),
              values: values,
              onChanged: null,
            ),
          ),
        ],
      ),
    );
  }
}

class PopupMenuButtonsDemo extends StatelessWidget {
  const PopupMenuButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'PopupMenuButton',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'The PopupMenuButton is a Material-2 design commonly used in '
              'Material apps. In M3 it has received a slightly updated style '
              'with elevation tint.',
              style: denseBody,
            ),
          ),
          const Row(
            children: <Widget>[
              PopupMenuButtonDemo(),
              SizedBox(width: 16),
              PopupMenuButtonTilesDemo(),
              SizedBox(width: 16),
              PopupMenuButton2Demo(),
            ],
          ),
        ]);
  }
}

class PopupMenuButtonDemo extends StatelessWidget {
  const PopupMenuButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
          PopupMenuItem<int>(value: 1, child: Text('Option 1')),
          PopupMenuItem<int>(value: 2, child: Text('Option 2')),
          PopupMenuItem<int>(value: 3, child: Text('Option 3')),
          PopupMenuItem<int>(value: 4, child: Text('Option 4')),
          PopupMenuItem<int>(value: 5, child: Text('Option 5')),
        ],
        icon: const Icon(Icons.more_vert),
      ),
    );
  }
}

class PopupMenuButton2Demo extends StatelessWidget {
  const PopupMenuButton2Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MenuAnchor(
        builder: (context, controller, child) {
          return FilledButton.tonal(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: const Text('Show menu'),
          );
        },
        menuChildren: [
          MenuItemButton(
            leadingIcon: const Icon(Icons.people_alt_outlined),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Item 1'),
            ),
            onPressed: () {},
          ),
          MenuItemButton(
            leadingIcon: const Icon(Icons.remove_red_eye_outlined),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Item 2'),
            ),
            onPressed: () {},
          ),
          MenuItemButton(
            leadingIcon: const Icon(Icons.refresh),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Item 3'),
            ),
          ),
        ],
      ),
    );
  }
}

class PopupMenuButtonTilesDemo extends StatelessWidget {
  const PopupMenuButtonTilesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: PopupMenuButton<int>(
        tooltip: 'Show menu using\nListTile items',
        onSelected: (_) {},
        position: PopupMenuPosition.under,
        itemBuilder: (BuildContext context) => const <PopupMenuItem<int>>[
          PopupMenuItem<int>(
              value: 1,
              child:
                  ListTile(leading: Icon(Icons.alarm), title: Text('Alarm'))),
          PopupMenuItem<int>(
              value: 2,
              child: ListTile(
                  leading: Icon(Icons.cabin), title: Text('Wood cabin'))),
          PopupMenuItem<int>(
              value: 3,
              child: ListTile(
                  leading: Icon(Icons.camera_outdoor_rounded),
                  title: Text('Surveillance'))),
          PopupMenuItem<int>(
              value: 4,
              child: ListTile(
                  leading: Icon(Icons.water_damage),
                  title: Text('Water damage'))),
        ],
        icon: const Icon(Icons.more_horiz),
      ),
    );
  }
}

class DropDownButtonDemo extends StatefulWidget {
  const DropDownButtonDemo({super.key});

  @override
  State<DropDownButtonDemo> createState() => _DropDownButtonDemoState();
}

class _DropDownButtonDemoState extends State<DropDownButtonDemo> {
  String selectedItem = '1 DropdownButton';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'DropdownButton',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'An older Material-2 widget, it cannot be themed. '
              'Consider using M3 DropdownMenu instead.',
              style: denseBody,
            ),
          ),
          DropdownButton<String>(
            value: selectedItem,
            onChanged: (String? value) {
              setState(() {
                selectedItem = value ?? '1 DropdownButton';
              });
            },
            items: <String>[
              '1 DropdownButton',
              '2 DropdownButton',
              '3 DropdownButton',
              '4 DropdownButton',
              '5 DropdownButton',
              '6 DropdownButton',
              '7 DropdownButton',
              '8 DropdownButton',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(value),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class DropdownButtonFormFieldDemo extends StatefulWidget {
  const DropdownButtonFormFieldDemo({super.key});

  @override
  State<DropdownButtonFormFieldDemo> createState() =>
      _DropdownButtonFormFieldDemoState();
}

class _DropdownButtonFormFieldDemoState
    extends State<DropdownButtonFormFieldDemo> {
  String selectedItem = '1 DropdownButtonFormField';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'DropdownButtonFormField',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'An older M2 widget. Cannot theme its open style. '
              'Closed style uses InputDecorator theme. Maybe consider '
              'using M3 DropDownMenu instead.',
              style: denseBody,
            ),
          ),
          DropdownButtonFormField<String>(
            value: selectedItem,
            onChanged: (String? value) {
              setState(() {
                selectedItem = value ?? '1 DropdownButtonFormField';
              });
            },
            items: <String>[
              '1 DropdownButtonFormField',
              '2 DropdownButtonFormField',
              '3 DropdownButtonFormField',
              '4 DropdownButtonFormField',
              '5 DropdownButtonFormField',
              '6 DropdownButtonFormField',
              '7 DropdownButtonFormField',
              '8 DropdownButtonFormField',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class DropDownMenuDemo extends StatefulWidget {
  const DropDownMenuDemo({super.key});

  @override
  State<DropDownMenuDemo> createState() => _DropDownMenuDemoState();
}

class _DropDownMenuDemoState extends State<DropDownMenuDemo> {
  String selectedItem = 'one';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'DropdownMenu',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'The M3 DropdownMenu shares building blocks with MenuBar '
              'and MenuAnchor, also uses InputDecorator for text entry.',
              style: denseBody,
            ),
          ),
          DropdownMenu<String>(
            initialSelection: selectedItem,
            onSelected: (String? value) {
              setState(() {
                selectedItem = value ?? 'one';
              });
            },
            dropdownMenuEntries: const <DropdownMenuEntry<String>>[
              DropdownMenuEntry<String>(
                label: 'Alarm settings',
                leadingIcon: Icon(Icons.alarm),
                value: 'one',
              ),
              DropdownMenuEntry<String>(
                label: 'Disabled settings',
                leadingIcon: Icon(Icons.settings),
                value: 'two',
                enabled: false,
              ),
              DropdownMenuEntry<String>(
                label: 'Cabin overview',
                leadingIcon: Icon(Icons.cabin),
                value: 'three',
              ),
              DropdownMenuEntry<String>(
                label: 'Surveillance view',
                leadingIcon: Icon(Icons.camera_outdoor_rounded),
                value: 'four',
              ),
              DropdownMenuEntry<String>(
                label: 'Water alert',
                leadingIcon: Icon(Icons.water_damage),
                value: 'five',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TooltipDemo extends StatelessWidget {
  const TooltipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Tooltip(
          message: 'Current tooltip theme',
          child: Text('Text with tooltip'),
        ),
        const Tooltip(
          message: 'Current tooltip theme.\nThis a two row tooltip.',
          child: Text('Text with two row tooltip'),
        ),
        const Tooltip(
          message: 'Current tooltip theme.\nThis tooltip is too long.\n'
              'Try to keep them short.',
          child: Text('Text with three row tooltip'),
        ),
      ].separateCenter(),
    );
  }
}

class IconDemo extends StatelessWidget {
  const IconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 4,
      children: <Widget>[
        Tooltip(
          message: 'Icon is Icons\nAddCircle',
          child: Icon(Icons.add_circle),
        ),
        Tooltip(
          message: 'Icon is Icons\nCameraAltOutlined',
          child: Icon(Icons.camera_alt_outlined),
        ),
        Tooltip(
          message: 'Icon is Icons\nFlutterDash',
          child: Icon(Icons.flutter_dash),
        ),
        Tooltip(
          message: 'Icon is Icons\nWarningAmber',
          child: Icon(Icons.warning_amber),
        ),
      ],
    );
  }
}

class CircleAvatarDemo extends StatelessWidget {
  const CircleAvatarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 4,
      children: <Widget>[
        Tooltip(
          message: 'This is a\nCircleAvatar',
          child: CircleAvatar(
            child: Text('CA'),
          ),
        ),
        Tooltip(
          message: 'CircleAvatar\nwith image',
          child: CircleAvatar(
            child: FlutterLogo(),
          ),
        ),
        Tooltip(
          message: 'CircleAvatar\nwith image\nradius 30',
          child: CircleAvatar(
            radius: 30,
            child: FlutterLogo(size: 40),
          ),
        ),
      ],
    );
  }
}

class IconButtonDemo extends StatefulWidget {
  const IconButtonDemo({super.key});

  @override
  State<IconButtonDemo> createState() => _IconButtonDemoState();
}

class _IconButtonDemoState extends State<IconButtonDemo> {
  bool isLockOpen = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 4,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.accessibility),
            tooltip: 'This is an\nIconButton',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.lock_outlined),
            selectedIcon: const Icon(Icons.lock_open_outlined),
            tooltip: isLockOpen
                ? 'This is an IconButton\nIn M3 tap to close lock'
                : 'This is an IconButton\nIn M3 tap to open lock',
            isSelected: isLockOpen,
            onPressed: () {
              setState(() {
                isLockOpen = !isLockOpen;
              });
            },
          ),
        ],
      ),
    );
  }
}

class IconButtonVariantsDemo extends StatelessWidget {
  const IconButtonVariantsDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 0,
      runSpacing: 4,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
                width: 65, child: Text('Default', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Standard',
              variant: _IconButtonVariant.standard,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Standard toggleable',
              variant: _IconButtonVariant.standard,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Standard (disabled)',
              variant: _IconButtonVariant.standard,
              toggleable: false,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
                width: 65, child: Text('Filled', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled',
              variant: _IconButtonVariant.filled,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled toggleable',
              variant: _IconButtonVariant.filled,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Filled (disabled)',
              variant: _IconButtonVariant.filled,
              toggleable: false,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
                width: 65, child: Text('Tonal', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled tonal',
              variant: _IconButtonVariant.filledTonal,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Filled tonal toggleable',
              variant: _IconButtonVariant.filledTonal,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Filled tonal (disabled)',
              variant: _IconButtonVariant.filledTonal,
              toggleable: false,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(
                width: 65,
                child: Text('Outlined', textAlign: TextAlign.center)),
            SizedBox(height: 4),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Outlined',
              variant: _IconButtonVariant.outlined,
              toggleable: false,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: true,
              tooltip: 'Outlined toggleable',
              variant: _IconButtonVariant.outlined,
            ),
            SizedBox(height: 8),
            _IconToggleButton(
              isEnabled: false,
              tooltip: 'Outlined (disabled)',
              variant: _IconButtonVariant.outlined,
              toggleable: false,
            ),
          ],
        ),
      ],
    );
  }
}

enum _IconButtonVariant { standard, filled, filledTonal, outlined }

class _IconToggleButton extends StatefulWidget {
  const _IconToggleButton({
    required this.isEnabled,
    required this.tooltip,
    required this.variant,
    this.toggleable = true,
  });

  final bool isEnabled;
  final String tooltip;
  final _IconButtonVariant variant;
  final bool toggleable;

  @override
  State<_IconToggleButton> createState() => _IconToggleButtonState();
}

class _IconToggleButtonState extends State<_IconToggleButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
            setState(() {
              selected = !selected;
            });
          }
        : null;

    final String toggleState = widget.toggleable
        ? selected
            ? '\n(selected)'
            : '\n(not selected)'
        : '';

    switch (widget.variant) {
      case _IconButtonVariant.standard:
        {
          return IconButton(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
      case _IconButtonVariant.filled:
        {
          return IconButton.filled(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
      case _IconButtonVariant.filledTonal:
        {
          return IconButton.filledTonal(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
      case _IconButtonVariant.outlined:
        {
          return IconButton.outlined(
            isSelected: selected & widget.toggleable,
            tooltip: '${widget.tooltip}$toggleState',
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            onPressed: onPressed,
          );
        }
    }
  }
}

class ProgressIndicatorDemo extends StatefulWidget {
  const ProgressIndicatorDemo({super.key});

  @override
  State<ProgressIndicatorDemo> createState() => _ProgressIndicatorDemoState();
}

class _ProgressIndicatorDemoState extends State<ProgressIndicatorDemo> {
  bool playProgressIndicator = false;
  @override
  Widget build(BuildContext context) {
    final double? progressValue = playProgressIndicator ? null : 0.75;

    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: <Widget>[
          IconButton(
            isSelected: playProgressIndicator,
            selectedIcon: const Icon(Icons.pause),
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                playProgressIndicator = !playProgressIndicator;
              });
            },
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(
              value: progressValue,
            ),
          ),
          SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: progressValue,
              )),
        ],
      ),
    );
  }
}

class ChipDemo extends StatelessWidget {
  const ChipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: <Widget>[
          Chip(
            label: const Text('Chip'),
            onDeleted: () {},
          ),
          const Chip(
            label: Text('Chip'),
            avatar: FlutterLogo(),
          ),
          ActionChip(
            label: const Text('ActionChip'),
            avatar: const Icon(Icons.settings),
            onPressed: () {},
          ),
          const ActionChip(
            label: Text('ActionChip'),
            avatar: Icon(Icons.settings),
            onPressed: null,
          ),
          FilterChip(
            label: const Text('FilterChip'),
            selected: true,
            onSelected: (bool value) {},
          ),
          const FilterChip(
            label: Text('FilterChip'),
            selected: true,
            onSelected: null,
          ),
          FilterChip(
            label: const Text('FilterChip'),
            selected: false,
            onSelected: (bool value) {},
          ),
          const FilterChip(
            label: Text('FilterChip'),
            selected: false,
            onSelected: null,
          ),
          ChoiceChip(
            label: const Text('ChoiceChip'),
            selected: true,
            onSelected: (bool value) {},
          ),
          const ChoiceChip(
            label: Text('ChoiceChip'),
            selected: true,
          ),
          ChoiceChip(
            label: const Text('ChoiceChip'),
            selected: false,
            onSelected: (bool value) {},
          ),
          const ChoiceChip(
            label: Text('ChoiceChip'),
            selected: false,
            onSelected: null,
          ),
          InputChip(
            selected: true,
            label: const Text('InputChip'),
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
          InputChip(
            selected: true,
            label: const Text('InputChip'),
            isEnabled: false,
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
          InputChip(
            label: const Text('InputChip'),
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
          InputChip(
            label: const Text('InputChip'),
            isEnabled: false,
            onSelected: (bool value) {},
            onDeleted: () {},
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  late TextEditingController _textController1;
  late TextEditingController _textController2;
  late TextEditingController _textController3;
  late TextEditingController _textController4;
  bool _errorState1 = false;
  bool _errorState2 = false;
  bool _errorState3 = false;

  @override
  void initState() {
    super.initState();
    _textController1 = TextEditingController();
    _textController2 = TextEditingController();
    _textController3 = TextEditingController();
    _textController4 = TextEditingController();
  }

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState1 = false;
                } else {
                  _errorState1 = true;
                }
              });
            },
            key: const Key('TextField1'),
            controller: _textController1,
            decoration: InputDecoration(
              hintText: 'Hint: Write something...',
              helperText: 'supporting text',
              labelText: 'Default Textfield',
              errorText: _errorState1
                  ? "Any entry without an 'a' will trigger this error"
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState2 = false;
                } else {
                  _errorState2 = true;
                }
              });
            },
            key: const Key('TextField2'),
            controller: _textController2,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Hint: Write something...',
              helperText: 'supporting text',
              labelText: 'Filled TextField',
              errorText: _errorState2
                  ? "Any entry without an 'a' will trigger this error"
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            onChanged: (String text) {
              setState(() {
                if (text.contains('a') | text.isEmpty) {
                  _errorState3 = false;
                } else {
                  _errorState3 = true;
                }
              });
            },
            key: const Key('TextField3'),
            controller: _textController3,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Hint: Write something...',
              helperText: 'supporting text',
              labelText: 'Outline TextField',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.info),
              errorText: _errorState3
                  ? "Any entry without an 'a' will trigger this error"
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('TextField4'),
            controller: _textController4,
            decoration: const InputDecoration.collapsed(
              hintText: 'Collapsed TextField',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: TextEditingController(),
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'TextField - Disabled label',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: TextEditingController(text: 'Disabled with text entry'),
            enabled: false,
            decoration: const InputDecoration(
              labelText: 'TextField - Disabled label',
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.info),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarDemo extends StatelessWidget {
  const AppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  title: const Text('AppBar'),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverAppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {},
                      ),
                      title: const Text('SliverAppBar'),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar.medium(
                    title: const Text('Medium'),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SliverFillRemaining(),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 130,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar.large(
                    title: const Text('Large'),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SliverFillRemaining(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ColorItem {
  red('red', Colors.red),
  orange('orange', Colors.orange),
  yellow('yellow', Colors.yellow),
  green('green', Colors.green),
  blue('blue', Colors.blue),
  indigo('indigo', Colors.indigo),
  violet('violet', Color(0xFF8F00FF)),
  purple('purple', Colors.purple),
  pink('pink', Colors.pink),
  silver('silver', Color(0xFF808080)),
  gold('gold', Color(0xFFFFD700)),
  beige('beige', Color(0xFFF5F5DC)),
  brown('brown', Colors.brown),
  grey('grey', Colors.grey),
  black('black', Colors.black),
  white('white', Colors.white);

  const ColorItem(this.label, this.color);
  final String label;
  final Color color;
}

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({super.key});

  @override
  State<SearchBarDemo> createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  bool isMicOn = false;
  String? selectedColor;
  List<ColorItem> searchHistory = <ColorItem>[];

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map((color) => ListTile(
          leading: const Icon(Icons.history),
          title: Text(color.label),
          trailing: IconButton(
              icon: const Icon(Icons.call_missed),
              onPressed: () {
                controller.text = color.label;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              }),
          onTap: () {
            controller.closeView(color.label);
            handleSelection(color);
          },
        ));
  }

  void handleSelection(ColorItem color) {
    setState(() {
      selectedColor = color.label;
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, color);
    });
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    return ColorItem.values
        .where((color) => color.label.contains(input))
        .map((filteredColor) => ListTile(
              leading: CircleAvatar(backgroundColor: filteredColor.color),
              title: Text(filteredColor.label),
              trailing: IconButton(
                  icon: const Icon(Icons.call_missed),
                  onPressed: () {
                    controller.text = filteredColor.label;
                    controller.selection =
                        TextSelection.collapsed(offset: controller.text.length);
                  }),
              onTap: () {
                controller.closeView(filteredColor.label);
                handleSelection(filteredColor);
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          filled: false,
        ),
      ),
      child: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...<Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: Text(
                    'SearchBar',
                    style: denseHeader,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    'The M3 SearchBar can in some use cases be used instead '
                    'of an AppBar or BottomAppBar.',
                    style: denseBody,
                  ),
                ),
              ],
              SearchAnchor.bar(
                barHintText: 'Search colors',
                suggestionsBuilder: (context, controller) {
                  if (controller.text.isEmpty) {
                    if (searchHistory.isNotEmpty) {
                      return getHistoryList(controller);
                    }
                    return <Widget>[
                      const Center(
                        child: Text('No search history.',
                            style: TextStyle(color: Colors.grey)),
                      )
                    ];
                  }
                  return getSuggestions(controller);
                },
              ),
              const SizedBox(height: 20),
              if (selectedColor == null)
                const Text('Select a color')
              else
                Text('Last selected color is $selectedColor')
            ],
          ),
        );
      }),
    );
  }
}

class TabBarForAppBarDemo extends StatelessWidget {
  const TabBarForAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final bool useM3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;

    final Color effectiveTabBackground = theme.appBarTheme.backgroundColor ??
        (isDark
            ? colorScheme.surface
            : useM3
                ? colorScheme.surface
                : colorScheme.primary);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...<Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  'TabBar in an AppBar',
                  style: denseHeader,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  'If the TabBar is used in an AppBar, then try style '
                  'FlexTabBarStyle forAppBar, it will fit contrast wise '
                  'here regardless of selected AppBar background color.',
                  style: denseBody,
                ),
              )
            ],
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeTop: true,
              child: Material(
                color: effectiveTabBackground,
                child: SizedBox(
                  height: 130,
                  child: AppBar(
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                      ),
                    ],
                    title: const Text('TabBar in AppBar'),
                    bottom: const TabBar(
                      tabs: <Widget>[
                        Tab(
                          text: 'Chat',
                          icon: Badge(
                            label: Text('18'),
                            child: Icon(Icons.chat_bubble),
                          ),
                        ),
                        Tab(
                          text: 'Tasks',
                          icon: Icon(Icons.beenhere),
                        ),
                        Tab(
                          text: 'Folder',
                          icon: Icon(Icons.create_new_folder),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarForBackgroundDemo extends StatelessWidget {
  const TabBarForBackgroundDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...<Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  'TabBar on a surface',
                  style: denseHeader,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Text(
                  'If TabBar is used on surface colors, consider style '
                  'FlexTabBarStyle forBackground.',
                  style: denseBody,
                ),
              ),
            ],
            Material(
              color: theme.colorScheme.surface,
              child: const SizedBox(
                height: 70,
                child: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Chat',
                      icon: Badge(
                        label: Text('+99'),
                        child: Icon(Icons.chat_bubble),
                      ),
                    ),
                    Tab(
                      text: 'Tasks',
                      icon: Icon(Icons.beenhere),
                    ),
                    Tab(
                      text: 'Folder',
                      icon: Icon(Icons.create_new_folder),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarDemo extends StatelessWidget {
  const BottomAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ...<Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Text('BottomAppBar', style: denseHeader)),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                      'Typically used as a command bar at the bottom of the '
                      'screen. Flutter M2 past default color was '
                      'ThemeData.bottomAppBarColor. It was deprecated in '
                      'Flutter 3.7. New M2 default is colorScheme.surface and '
                      'elevation 8. In M3 it defaults to colorScheme.surface '
                      'color, elevation 3, no shadow, but with surface '
                      'elevation tint.',
                      style: denseBody))
            ],
            BottomAppBar(
              child: Row(
                children: <Widget>[
                  IconButton(
                    tooltip: 'Open navigation menu',
                    icon: const Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Search',
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    tooltip: 'Favorite',
                    icon: const Icon(Icons.favorite),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarDemo extends StatefulWidget {
  const BottomNavigationBarDemo({super.key});

  @override
  State<BottomNavigationBarDemo> createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(
                'BottomNavigationBar',
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Older Material 2 navigation bar, prefer using NavigationBar. '
                'Flutter default background '
                'color is theme canvasColor via Material. The canvasColor '
                'typically equals colorScheme.background. Default elevation '
                'is 8. FCS sub-theme default is colorScheme.background '
                'and elevation 0.',
                style: denseBody,
              ),
            ),
          ],
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      const Text('Behind Bottom'),
                      FloatingActionButton.small(
                        heroTag: 'Behind Bottom',
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                      InputChip(
                        showCheckmark: true,
                        selected: true,
                        label: const Text('Chip check'),
                        onSelected: (bool value) {},
                      ),
                    ],
                  ),
                ),
                BottomNavigationBar(
                  currentIndex: buttonIndex,
                  onTap: (int value) {
                    setState(() {
                      buttonIndex = value;
                    });
                  },
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Badge(
                        label: Text('3'),
                        child: Icon(Icons.chat_bubble),
                      ),
                      label: 'Chat',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.beenhere),
                      label: 'Tasks',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.create_new_folder),
                      label: 'Folder',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationRailDemo extends StatefulWidget {
  const NavigationRailDemo({
    super.key,
    this.child,
    this.height = 350,
  });

  final Widget? child;

  final double height;

  @override
  State<NavigationRailDemo> createState() => _NavigationRailDemoState();
}

class _NavigationRailDemoState extends State<NavigationRailDemo> {
  int buttonIndex = 0;
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Text(
              'NavigationRail',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Text(
              'Flutter default background color is colorScheme.surface. '
              'FlexColorScheme sub-theme default is colorScheme.background.',
              style: denseBody,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: widget.height,
            child: ClipRect(
              child: OverflowBox(
                alignment: AlignmentDirectional.topStart,
                maxHeight: 1200,
                child: Row(
                  children: <Widget>[
                    MediaQuery.removePadding(
                      context: context,
                      removeBottom: true,
                      removeTop: true,
                      child: NavigationRail(
                        extended: isExtended,
                        minExtendedWidth: 150,
                        labelType:
                            isExtended ? NavigationRailLabelType.none : null,
                        selectedIndex: buttonIndex,
                        onDestinationSelected: (int value) {
                          setState(() {
                            buttonIndex = value;
                          });
                        },
                        destinations: const <NavigationRailDestination>[
                          NavigationRailDestination(
                            icon: Badge(
                              label: Text('5'),
                              child: Icon(Icons.chat_bubble),
                            ),
                            label: Text('Chat'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.beenhere),
                            label: Text('Tasks'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.create_new_folder),
                            label: Text('Folder'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.logout),
                            label: Text('Logout'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          SwitchListTile(
                            title: const Text('Expand and collapse'),
                            subtitle:
                                const Text('ON to expand  OFF to collapse\n'
                                    'Only used for local control of Rail '
                                    'presentation.'),
                            value: isExtended,
                            onChanged: (bool value) {
                              setState(() {
                                isExtended = value;
                              });
                            },
                          ),
                          if (widget.child != null)
                            RepaintBoundary(child: widget.child)
                          else
                            const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuBarDemo extends StatelessWidget {
  const MenuBarDemo({
    super.key,
    this.explainIndent = 0,
  });
  final double explainIndent;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);
    return Shortcuts(
      shortcuts: const <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.keyT, control: true):
            VoidCallbackIntent(debugDumpApp),
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(explainIndent, 16, 0, 0),
            child: Text(
              'MenuBar',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(explainIndent, 0, 0, 8),
            child: Text(
              'The M3 menus can be used in a MenuBar via SubMenuButton '
              'and its MenuItemButton, but they can also be used in a '
              'MenuAnchor anywhere.',
              style: denseBody,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MenuBar(
                  children: <Widget>[
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            showAboutDialog(
                              context: context,
                              useRootNavigator: false,
                              applicationName: 'MenuBar Demo',
                              applicationVersion: '1.0.0',
                            );
                          },
                          child: const MenuAcceleratorLabel('&About'),
                        ),
                        SubmenuButton(
                          menuChildren: <Widget>[
                            MenuItemButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Saved!'),
                                  ),
                                );
                              },
                              child: const MenuAcceleratorLabel('&Save now'),
                            ),
                            MenuItemButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Load!'),
                                  ),
                                );
                              },
                              child: const MenuAcceleratorLabel('&Load now'),
                            ),
                          ],
                          child: const Text('File'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Quit!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Quit'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&File'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Bold!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Bold'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Italic!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Italic'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Underline!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('&Underline'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&Style'),
                    ),
                    SubmenuButton(
                      menuChildren: <Widget>[
                        const MenuItemButton(
                          onPressed: null,
                          child: MenuAcceleratorLabel('&Disabled item'),
                        ),
                        MenuItemButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Minify!'),
                              ),
                            );
                          },
                          child: const MenuAcceleratorLabel('Mi&nify'),
                        ),
                      ],
                      child: const MenuAcceleratorLabel('&View'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuAnchorDemo extends StatelessWidget {
  const MenuAnchorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...<Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'MenuAnchor',
              style: denseHeader,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              'The M3 MenuAnchor used on a Container as a context menu.',
              style: denseBody,
            ),
          ),
        ],
        const Row(
          children: <Widget>[
            Expanded(
              child: MenuAnchorContextMenu(
                message: 'The M3 MenuAnchor is cool!',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

enum MenuEntry {
  about('About'),
  showMessage(
      'Show Message', SingleActivator(LogicalKeyboardKey.keyS, control: true)),
  hideMessage(
      'Hide Message', SingleActivator(LogicalKeyboardKey.keyH, control: true)),
  colorMenu('Color Menu'),
  colorRed('Red', SingleActivator(LogicalKeyboardKey.keyR, control: true)),
  colorGreen('Green', SingleActivator(LogicalKeyboardKey.keyG, control: true)),
  colorBlue('Blue', SingleActivator(LogicalKeyboardKey.keyB, control: true));

  const MenuEntry(this.label, [this.shortcut]);
  final String label;
  final MenuSerializableShortcut? shortcut;
}

class MenuAnchorContextMenu extends StatefulWidget {
  const MenuAnchorContextMenu({super.key, required this.message});

  final String message;

  @override
  State<MenuAnchorContextMenu> createState() => _MenuAnchorContextMenuState();
}

class _MenuAnchorContextMenuState extends State<MenuAnchorContextMenu> {
  MenuEntry? _lastSelection;
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final MenuController _menuController = MenuController();
  ShortcutRegistryEntry? _shortcutsEntry;
  bool get showingMessage => _showingMessage;
  bool _showingMessage = false;
  set showingMessage(bool value) {
    if (_showingMessage != value) {
      setState(() {
        _showingMessage = value;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shortcutsEntry?.dispose();
    final Map<ShortcutActivator, Intent> shortcuts =
        <ShortcutActivator, Intent>{
      for (final MenuEntry item in MenuEntry.values)
        if (item.shortcut != null)
          item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    final Map<ShortcutActivator, Intent>? entries =
        ShortcutRegistry.maybeOf(context)?.shortcuts;
    if (entries?.isEmpty ?? false) {
      _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
    }
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: MenuAnchor(
        controller: _menuController,
        consumeOutsideTap: true,
        menuChildren: <Widget>[
          MenuItemButton(
            child: Text(MenuEntry.about.label),
            onPressed: () => _activate(MenuEntry.about),
          ),
          const MenuItemButton(
            child: Text('Disabled item'),
          ),
          if (_showingMessage)
            MenuItemButton(
              onPressed: () => _activate(MenuEntry.hideMessage),
              shortcut: MenuEntry.hideMessage.shortcut,
              child: Text(MenuEntry.hideMessage.label),
            ),
          if (!_showingMessage)
            MenuItemButton(
              onPressed: () => _activate(MenuEntry.showMessage),
              shortcut: MenuEntry.showMessage.shortcut,
              child: Text(MenuEntry.showMessage.label),
            ),
          SubmenuButton(
            menuChildren: <Widget>[
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorRed),
                shortcut: MenuEntry.colorRed.shortcut,
                child: Text(MenuEntry.colorRed.label),
              ),
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorGreen),
                shortcut: MenuEntry.colorGreen.shortcut,
                child: Text(MenuEntry.colorGreen.label),
              ),
              MenuItemButton(
                onPressed: () => _activate(MenuEntry.colorBlue),
                shortcut: MenuEntry.colorBlue.shortcut,
                child: Text(MenuEntry.colorBlue.label),
              ),
            ],
            child: const Text('Color'),
          ),
        ],
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Click anywhere on this container to show the '
                  'MenuAnchor context menu.',
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Menu keyboard shortcuts also work.',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    showingMessage ? widget.message : '',
                    style: theme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  _lastSelection != null
                      ? 'Last Selected: ${_lastSelection!.label}'
                      : '',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _activate(MenuEntry selection) {
    setState(() {
      _lastSelection = selection;
    });
    switch (selection) {
      case MenuEntry.about:
        showAboutDialog(
          context: context,
          useRootNavigator: false,
          applicationName: 'MenuAnchor Demo',
          applicationVersion: '1.0.0',
        );
      case MenuEntry.showMessage:
      case MenuEntry.hideMessage:
        showingMessage = !showingMessage;
      case MenuEntry.colorMenu:
        break;
      case MenuEntry.colorRed:
        break;
      case MenuEntry.colorGreen:
        break;
      case MenuEntry.colorBlue:
        break;
    }
  }

  void _handleTapDown(TapDownDetails details) {
    _menuController.open(position: details.localPosition);
  }
}

class NavigationDrawerDemo extends StatefulWidget {
  const NavigationDrawerDemo({super.key});

  @override
  State<NavigationDrawerDemo> createState() => _NavigationDrawerDemoState();
}

class _NavigationDrawerDemoState extends State<NavigationDrawerDemo> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle denseHeader = theme.textTheme.titleLarge!.copyWith(
      fontSize: 13,
    );
    final TextStyle denseBody = theme.textTheme.bodyMedium!
        .copyWith(fontSize: 12, color: theme.textTheme.bodySmall!.color);

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ...<Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'NavigationDrawer',
                style: denseHeader,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                'Default Flutter background color is colorScheme.surface, '
                'with addition of elevation tint in Material 3 mode.',
                style: denseBody,
              ),
            ),
          ],
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            removeLeft: true,
            removeRight: true,
            child: SizedBox(
              height: 280,
              child: NavigationDrawer(
                selectedIndex: selectedIndex,
                onDestinationSelected: (int value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                children: const <Widget>[
                  SizedBox(height: 16),
                  NavigationDrawerDestination(
                    icon: Badge(
                      label: Text('26'),
                      child: Icon(Icons.chat_bubble),
                    ),
                    label: Text('Chat'),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.beenhere),
                    label: Text('Tasks'),
                  ),
                  Divider(),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.create_new_folder),
                    label: Text('Folder'),
                  ),
                  NavigationDrawerDestination(
                    icon: Icon(Icons.logout),
                    label: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('ListTile'),
            subtitle: const Text('List tile sub title'),
            trailing: const Text('Trailing'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('ListTile selected'),
            subtitle: const Text('Selected list tile sub title'),
            trailing: const Text('Trailing'),
            selected: true,
            onTap: () {},
          ),
          ListTile(
            enabled: false,
            leading: const Icon(Icons.info),
            title: const Text('ListTile disabled'),
            subtitle: const Text('Selected list tile sub title'),
            trailing: const Text('Trailing'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SwitchListTileDemo extends StatelessWidget {
  const SwitchListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: const Text('SwitchListTile'),
            subtitle: const Text('The switch list tile is OFF'),
            value: false,
            onChanged: (bool value) {},
          ),
          SwitchListTile(
            secondary: const Icon(Icons.info),
            title: const Text('SwitchListTile'),
            subtitle: const Text('The switch list tile is ON'),
            value: true,
            onChanged: (bool value) {},
          ),
          const SwitchListTile(
            secondary: Icon(Icons.info),
            title: Text('SwitchListTile disabled'),
            subtitle: Text('The switch list tile is ON'),
            value: true,
            onChanged: null,
          ),
        ],
      ),
    );
  }
}

class CheckboxListTileDemo extends StatelessWidget {
  const CheckboxListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile'),
            subtitle: const Text('The checkbox list tile is unchecked'),
            value: false,
            onChanged: (bool? value) {},
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile'),
            subtitle: const Text('The checkbox list tile is checked'),
            value: true,
            onChanged: (bool? value) {},
          ),
          CheckboxListTile(
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile'),
            subtitle: const Text('The checkbox list tile is null in tristate'),
            tristate: true,
            value: null,
            onChanged: (bool? value) {},
          ),
          CheckboxListTile(
            enabled: false,
            secondary: const Icon(Icons.info),
            title: const Text('CheckboxListTile disabled'),
            subtitle: const Text('The checkbox list tile is checked'),
            value: true,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }
}

class RadioListTileDemo extends StatelessWidget {
  const RadioListTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile'),
            subtitle: const Text('The radio option is unselected'),
            value: 0,
            onChanged: (_) {},
            groupValue: 1,
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile'),
            subtitle: const Text('The radio option is selected'),
            value: 1,
            onChanged: (_) {},
            groupValue: 1,
          ),
          RadioListTile<int>(
            secondary: const Icon(Icons.info),
            title: const Text('RadioListTile'),
            subtitle: const Text('The radio option and list tile is selected'),
            value: 1,
            selected: true,
            onChanged: (_) {},
            groupValue: 1,
          ),
          const RadioListTile<int>(
            secondary: Icon(Icons.info),
            title: Text('RadioListTile disabled'),
            subtitle: Text('The radio option is selected'),
            value: 1,
            onChanged: null,
            groupValue: 1,
          ),
        ],
      ),
    );
  }
}

class ExpansionTileDemo extends StatefulWidget {
  const ExpansionTileDemo({super.key});

  @override
  State<ExpansionTileDemo> createState() => _ExpansionTileDemoState();
}

class _ExpansionTileDemoState extends State<ExpansionTileDemo> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        children: <Widget>[
          const ExpansionTile(
            title: Text('ExpansionTile 1'),
            subtitle: Text('Trailing expansion arrow icon'),
            children: <Widget>[
              ListTile(title: Text('This is tile number 1')),
            ],
          ),
          ExpansionTile(
            title: const Text('ExpansionTile 2'),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(
              _customTileExpanded
                  ? Icons.arrow_drop_down_circle
                  : Icons.arrow_drop_down,
            ),
            children: const <Widget>[
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expanded) {
              setState(() => _customTileExpanded = expanded);
            },
          ),
          const ExpansionTile(
            title: Text('ExpansionTile 3'),
            subtitle: Text('Leading expansion arrow icon'),
            controlAffinity: ListTileControlAffinity.leading,
            children: <Widget>[
              ListTile(title: Text('This is tile number 3')),
            ],
          ),
        ],
      ),
    );
  }
}

class DialogDemo extends StatelessWidget {
  const DialogDemo({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => const _AlertDialogExample());
  }

  Future<void> _openFullscreenDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (context) => Dialog.fullscreen(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Full-screen dialog'),
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: [
                TextButton(
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            body: const Center(
              child: _AlertDialogExample(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const AbsorbPointer(child: _AlertDialogExample()),
        TextButton(
          child: const Text(
            'Show AlertDialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
        TextButton(
          child: const Text(
            'Show Full Screen Dialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openFullscreenDialog(context),
        ),
      ],
    );
  }
}

class _AlertDialogExample extends StatelessWidget {
  const _AlertDialogExample();

  @override
  Widget build(BuildContext context) {
    final bool useMaterial3 = Theme.of(context).useMaterial3;
    final String cancel = useMaterial3 ? 'Cancel' : 'CANCEL';
    final String allow = useMaterial3 ? 'Allow' : 'ALLOW';

    return AlertDialog(
      title: const Text('Allow location services'),
      content: const Text('Let us help determine location. This means '
          'sending anonymous location data to us'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text(cancel)),
        TextButton(
            onPressed: () => Navigator.of(context).pop(), child: Text(allow)),
      ],
    );
  }
}

class TimePickerDialogDemo extends StatelessWidget {
  const TimePickerDialogDemo({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => TimePickerDialog(
        initialTime: TimeOfDay.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: TimePickerDialog(
            initialTime: TimeOfDay.now(),
          ),
        ),
        TextButton(
          child: const Text(
            'Show TimePickerDialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
      ],
    );
  }
}

class DatePickerDialogDemo extends StatelessWidget {
  const DatePickerDialogDemo({super.key});

  Future<void> _openDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useRootNavigator: false,
      builder: (BuildContext context) => DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime(2050),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AbsorbPointer(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: DatePickerDialog(
              initialDate: DateTime.now(),
              firstDate: DateTime(1930),
              lastDate: DateTime(2050),
            ),
          ),
        ),
        TextButton(
          child: const Text(
            'Show DatePickerDialog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async => _openDialog(context),
        ),
      ],
    );
  }
}

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  bool isNonModalBottomSheetOpen = false;
  PersistentBottomSheetController? _nonModalBottomSheetController;
  @override
  Widget build(BuildContext context) {
    List<Widget> buttonList = <Widget>[
      IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.archive_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
    ];
    List<Text> labelList = const <Text>[
      Text('Share'),
      Text('Add to'),
      Text('Trash'),
      Text('Archive'),
      Text('Settings'),
      Text('Favorite')
    ];
    buttonList = List.generate(
        buttonList.length,
        (index) => Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buttonList[index],
                  labelList[index],
                ],
              ),
            ));

    return Column(
      children: [
        TextButton(
          child: const Text(
            'Show modal bottom sheet',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              showDragHandle: true,
              context: context,
              constraints: const BoxConstraints(maxWidth: 640),
              builder: (context) {
                return SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: buttonList,
                    ),
                  ),
                );
              },
            );
          },
        ),
        TextButton(
          child: Text(
            isNonModalBottomSheetOpen
                ? 'Hide bottom sheet'
                : 'Show bottom sheet',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            if (isNonModalBottomSheetOpen) {
              _nonModalBottomSheetController?.close();
              setState(() {
                isNonModalBottomSheetOpen = false;
              });
              return;
            } else {
              setState(() {
                isNonModalBottomSheetOpen = true;
              });
            }

            _nonModalBottomSheetController = showBottomSheet(
              elevation: 8.0,
              context: context,
              constraints: const BoxConstraints(maxWidth: 640),
              builder: (context) {
                return SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: buttonList,
                    ),
                  ),
                );
              },
            );

            _nonModalBottomSheetController?.closed.then((_) => setState(() {
                  isNonModalBottomSheetOpen = false;
                }));
          },
        ),
      ],
    );
  }
}

class BottomSheetModalDemo extends StatelessWidget {
  const BottomSheetModalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AbsorbPointer(
      child: BottomSheet(
        elevation: theme.bottomSheetTheme.modalElevation,
        backgroundColor: theme.bottomSheetTheme.modalBackgroundColor,
        enableDrag: false,
        onClosing: () {},
        builder: (final BuildContext context) => SizedBox(
          height: 150,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Modal BottomSheet',
                  style: theme.textTheme.titleLarge,
                ),
                Text(
                  'Uses Material of type canvas as default background.\n'
                  'ColorScheme background in M2, but surface in M3.',
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  Future<void> _showDemoSnackBar(
      BuildContext context, String message, bool keep) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        showCloseIcon: true,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
        duration: Duration(milliseconds: keep ? 24 * 60 * 60 * 1000 : 3000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isLight = theme.brightness == Brightness.light;

    final Color defaultBackgroundColor = isLight
        ? useMaterial3
            ? colorScheme.inverseSurface
            : Color.alphaBlend(
                colorScheme.onSurface.withOpacity(0.80), colorScheme.surface)
        : colorScheme.onSurface;
    final Color snackBackground =
        theme.snackBarTheme.backgroundColor ?? defaultBackgroundColor;

    final Color snackForeground =
        ThemeData.estimateBrightnessForColor(snackBackground) ==
                Brightness.light
            ? Colors.black
            : Colors.white;

    final Color defaultActionColor =
        useMaterial3 ? colorScheme.inversePrimary : colorScheme.secondary;
    final Color snackActionColor =
        theme.snackBarTheme.actionTextColor ?? defaultActionColor;

    final TextStyle snackStyle = theme.snackBarTheme.contentTextStyle ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleLarge!
            .copyWith(color: snackForeground);
    final TextStyle snackActionStyle = theme.snackBarTheme.contentTextStyle
            ?.copyWith(color: snackActionColor) ??
        ThemeData(brightness: Brightness.light)
            .textTheme
            .titleLarge!
            .copyWith(color: snackActionColor);
    final double snackElevation = theme.snackBarTheme.elevation ?? 6;

    final ShapeBorder? shape = theme.snackBarTheme.shape;

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              final snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                width: 400.0,
                content: const Text('This is a snackbar'),
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {},
                ),
              );

              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text("Show SnackBar"),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Material(
              color: snackBackground,
              elevation: snackElevation,
              shadowColor: colorScheme.shadow,
              shape: shape ??
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(width: 24),
                      Text('A floating SnackBar', style: snackStyle),
                      const Spacer(),
                      Text('Undo', style: snackActionStyle),
                      const SizedBox(width: 24),
                      Icon(Icons.close, color: snackForeground),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              child: const Text(
                'Show floating SnackBar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _showDemoSnackBar(context, 'A floating SnackBar', false);
              },
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              child: const Text(
                'Show fixed (1 day) SnackBar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                _showDemoSnackBar(context, 'A floating SnackBar', true);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialBannerDemo extends StatelessWidget {
  const MaterialBannerDemo({super.key});

  Future<void> _showDemoMaterialBanner(
      BuildContext context, String message) async {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        elevation: 3,
        leading: const Icon(Icons.agriculture_outlined),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
          ),
          TextButton(
            child: const Text('Dismiss'),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MaterialBanner(
            elevation: 3,
            content: const Text('I am a MaterialBanner at elevation 3'),
            leading: const Icon(Icons.agriculture_outlined),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Dismiss'),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                TextButton(
                  child: const Text(
                    'Show MaterialBanner',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    _showDemoMaterialBanner(
                        context, 'I am a MaterialBanner at elevation 3');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle textStyle = theme.textTheme.titleLarge!.copyWith(
      fontSize: 14,
    );

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...<Widget>[
            Text(
              'Material widget is a lower level building block. It cannot '
              'be themed, but it has Material-2 and Material-3 mode dependent '
              'behavior. Material is responsible for clipping, elevation '
              'and ink effects below its children. '
              'Material can also specify surfaceTint color, '
              'which is applied when Material is elevated, but only in '
              'Material 3 mode.',
              style: textStyle,
            ),
            const SizedBox(height: 12),
          ],
          Text('Material type canvas', style: textStyle),
          Text(
            'Default background color is theme canvasColor, and '
            'theme canvasColor is set to theme colorScheme background. The '
            'color canvasColor is going to be deprecated in Flutter.',
            style: textStyle,
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.canvas,
            elevation: 0,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 0, default '
                    'tint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 1, default tint '
                    'and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: const SizedBox(
              height: 60,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 1, '
                    'assigned surfaceTint and no shadow',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.canvas,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 1, '
                    'assigned surfaceTint, and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 6,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 6, default tint '
                    'and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 6, '
                    'assigned surfaceTint and no shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.canvas,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type canvas, elevation 6, '
                    'assigned surfaceTint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text('Material type card', style: textStyle),
          Text(
            'Default background color is theme cardColor, and '
            'theme cardColor is set to theme colorScheme surface. The '
            'color cardColor is going to be deprecated in Flutter.',
            style: textStyle,
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.card,
            elevation: 0,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 0, default tint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 1,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 1, default tint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.card,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 1, '
                    'assigned surfaceTint and no shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            type: MaterialType.card,
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 1, '
                    'assigned surfaceTint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 6,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 6, default tint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 6, '
                    'assigned surfaceTint and no shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Material(
            type: MaterialType.card,
            elevation: 6,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: colorScheme.shadow,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Material type card, elevation 6, '
                    'assigned surfaceTint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextStyle textStyle = theme.textTheme.titleLarge!.copyWith(
      fontSize: 14,
    );

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              'In M2 default background color comes from theme.cardColor, '
              'which typically is set to theme.colorScheme.surface. '
              'In M3 background defaults to theme.colorScheme.surface and '
              'it gets elevation based surfaceTint. In M2 surfaceTint has no '
              'effect even if specified. Card gets elevation shadow by '
              'default in both M2 and M3 mode.',
              style: textStyle,
            ),
          ),
          Card(
            elevation: 0,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 0, assigned surfaceTint and '
                    'default shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 1,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'Card, elevation 1, default surfaceTint and shadow',
                  textAlign: TextAlign.center,
                  style: textStyle,
                )),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Card(
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 1, assigned surfaceTint and '
                    'default shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Card(
            elevation: 1,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 1, assigned surfaceTint and '
                    'transparent shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Card(
            elevation: 4,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 4, default surfaceTint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            elevation: 4,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Center(
                child: Text(
                  'Card, elevation 4, assigned surfaceTint and default shadow',
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Card(
            elevation: 4,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 4, assigned surfaceTint and '
                    'transparent shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Card(
            elevation: 10,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 10, default surfaceTint and shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 10,
            surfaceTintColor: colorScheme.surfaceTint,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Card, elevation 10, assigned surfaceTint and '
                    'default shadow',
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 10,
            surfaceTintColor: colorScheme.surfaceTint,
            shadowColor: Colors.transparent,
            child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  'Card, elevation 10, assigned surfaceTint and '
                  'transparent shadow',
                  textAlign: TextAlign.center,
                  style: textStyle,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextThemeDemo extends StatelessWidget {
  const TextThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnDemo(
      textTheme: Theme.of(context).textTheme,
    );
  }
}

class PrimaryTextThemeDemo extends StatelessWidget {
  const PrimaryTextThemeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return TextThemeColumnDemo(
      textTheme: Theme.of(context).primaryTextTheme,
    );
  }
}

class TextThemeColumnDemo extends StatelessWidget {
  const TextThemeColumnDemo({
    super.key,
    required this.textTheme,
  });
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Font: ${textTheme.bodyMedium!.fontFamily}',
            style: textTheme.titleSmall),
        _ShowTextStyle(
          'Display Large '
          '(${textTheme.displayLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayLarge!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Display Medium '
          '(${textTheme.displayMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displayMedium!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Display Small '
          '(${textTheme.displaySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.displaySmall!,
          infoStyle: textTheme.labelSmall!,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Headline Large '
          '(${textTheme.headlineLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineLarge!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Headline Medium '
          '(${textTheme.headlineMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineMedium!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Headline Small '
          '(${textTheme.headlineSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.headlineSmall!,
          infoStyle: textTheme.labelSmall!,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Title Large '
          '(${textTheme.titleLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleLarge!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Title Medium '
          '(${textTheme.titleLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleLarge!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Title Small '
          '(${textTheme.titleSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.titleSmall!,
          infoStyle: textTheme.labelSmall!,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Body Large '
          '(${textTheme.bodyLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyLarge!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Body Medium '
          '(${textTheme.bodyMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodyMedium!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Body Small '
          '(${textTheme.bodySmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.bodySmall!,
          infoStyle: textTheme.labelSmall!,
        ),
        const SizedBox(height: 12),
        _ShowTextStyle(
          'Label Large '
          '(${textTheme.labelLarge!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelLarge!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Label Medium '
          '(${textTheme.labelMedium!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelMedium!,
          infoStyle: textTheme.labelSmall!,
        ),
        _ShowTextStyle(
          'Label Small '
          '(${textTheme.labelSmall!.fontSize!.toStringAsFixed(0)})',
          style: textTheme.labelSmall!,
          infoStyle: textTheme.labelSmall!,
        ),
      ],
    );
  }
}

class _ShowTextStyle extends StatelessWidget {
  const _ShowTextStyle(
    this.label, {
    required this.style,
    required this.infoStyle,
  });

  final String label;
  final TextStyle style;
  final TextStyle infoStyle;

  @override
  Widget build(BuildContext context) {
    final String fontWeight = style.fontWeight!.toString();
    final String spacing = style.letterSpacing != null
        ? style.letterSpacing!.toStringAsFixed(2)
        : '';
    final String height = style.height != null
        ? ' height: ${style.height!.toStringAsFixed(2)}'
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: style),
        ...<Widget>[
          const SizedBox(height: 4),
          Text(
            '$fontWeight '
            'Letter spacing: $spacing$height',
            style: infoStyle,
          ),
          const SizedBox(height: 4),
        ],
      ],
    );
  }
}

class ThemeExtensionDemo extends StatelessWidget {
  const ThemeExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    var themeExtension =
        (Theme.of(context).extension<CustomColors>() ?? lightExt).colorTheme;
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ColorCard(
          label: 'Success',
          color: themeExtension.success,
          textColor: Colors.white,
        ),
        ColorCard(
          label: 'Info',
          color: themeExtension.info,
          textColor: Colors.white,
        ),
        ColorCard(
          label: 'warning',
          color: themeExtension.warning,
          textColor: Colors.white,
        ),
        ColorCard(
          label: 'Error',
          color: themeExtension.error,
          textColor: Colors.white,
        ),
      ],
    );
  }
}

class BadgeDemo extends StatefulWidget {
  const BadgeDemo({super.key});

  @override
  State<BadgeDemo> createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> barWithBadgeDestinations = [
      NavigationDestination(
        tooltip: '',
        icon: Badge.count(count: 1000, child: const Icon(Icons.mail_outlined)),
        label: 'Mail',
        selectedIcon: Badge.count(count: 1000, child: const Icon(Icons.mail)),
      ),
      const NavigationDestination(
        tooltip: '',
        icon: Badge(label: Text('10'), child: Icon(Icons.chat_bubble_outline)),
        label: 'Chat',
        selectedIcon: Badge(label: Text('10'), child: Icon(Icons.chat_bubble)),
      ),
      const NavigationDestination(
        tooltip: '',
        icon: Badge(child: Icon(Icons.group_outlined)),
        label: 'Rooms',
        selectedIcon: Badge(child: Icon(Icons.group_rounded)),
      ),
      NavigationDestination(
        tooltip: '',
        icon: Badge.count(count: 3, child: const Icon(Icons.videocam_outlined)),
        label: 'Meet',
        selectedIcon: Badge.count(count: 3, child: const Icon(Icons.videocam)),
      )
    ];

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MediaQuery.removePadding(
            context: context,
            removeBottom: true,
            removeTop: true,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: <Widget>[
                      const Text('Behind NavBar'),
                      FloatingActionButton.small(
                        heroTag: 'Behind NavBar',
                        onPressed: () {},
                        child: const Icon(Icons.add),
                      ),
                      InputChip(
                        showCheckmark: true,
                        selected: true,
                        label: const Text('Chip check'),
                        onSelected: (bool value) {},
                      ),
                    ],
                  ),
                ),
                NavigationBar(
                  selectedIndex: buttonIndex,
                  onDestinationSelected: (int value) {
                    setState(() {
                      buttonIndex = value;
                    });
                  },
                  destinations: barWithBadgeDestinations,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
