import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(SelectionShape());

class SelectionShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectionShapeInPicker(),
    );
  }
}

class SelectionShapeInPicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PickerState();
}

class PickerState extends State<SelectionShapeInPicker> {
  final DateRangePickerController _controller = DateRangePickerController();
  final List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.calendar_today),
          itemBuilder: (BuildContext context) => views.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList(),
          onSelected: (String value) {
            if (value == 'Month') {
              _controller.view = DateRangePickerView.month;
            } else if (value == 'Year') {
              _controller.view = DateRangePickerView.year;
            } else if (value == 'Decade') {
              _controller.view = DateRangePickerView.decade;
            } else if (value == 'Century') {
              _controller.view = DateRangePickerView.century;
            }
          },
        ),
      ),
      body: Card(
          margin: const EdgeInsets.fromLTRB(40, 150, 40, 150),
          child: SfDateRangePicker(
            controller: _controller,
            selectionShape: DateRangePickerSelectionShape.rectangle,
            selectionMode: DateRangePickerSelectionMode.range,
            allowViewNavigation: false,
          )),
    );
  }
}
