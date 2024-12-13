import 'package:flutter/material.dart';

class GardeningService extends StatefulWidget {
  @override
  State<GardeningService> createState() => _GardeningServiceState();
}

class _GardeningServiceState extends State<GardeningService> {
  String? selectedGardener = "Select Gardener";
  String? selectedDuration = "Select Duration";

  final List<String> gardeners = [
    'Gardener 1',
    'Gardener 2',
    'Gardener 3',
    'Gardener 4',
    'Gardener 5',
    'Gardener 6',
  ];
  final List<String> durations = [
    '30 min',
    '1 hour',
    '2 hours',
    '3 hours',
    '4 hours',
    '5 hours',
    '6 hours',
    '7 hours',
    '8 hours',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Gardening Services',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.red[500],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              customDropdown(
                label: selectedGardener!,
                items: gardeners,
                onSelected: (value) {
                  setState(() {
                    selectedGardener = value;
                  });
                },
              ),
              SizedBox(height: 16),
              textFieldWithBorder(label: 'Date and Time'),
              SizedBox(height: 16),
              customDropdown(
                label: selectedDuration!,
                items: durations,
                onSelected: (value) {
                  setState(() {
                    selectedDuration = value;
                  });
                },
              ),
              SizedBox(height: 16),
              textFieldWithBorder(label: 'Unit No and Address'),
              SizedBox(height: 16),
              textFieldWithBorder(label: 'Contact Person Name'),
              SizedBox(height: 16),
              textFieldWithBorder(
                label: 'Contact Person Mobile',
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customDropdown({
    required String label,
    required List<String> items,
    required void Function(String) onSelected,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          PopupMenuButton<String>(
            onSelected: onSelected,
            color: Color.fromRGBO(186, 183, 184, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            itemBuilder: (context) => items
                .map((item) => PopupMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
                .toList(),
            child: Icon(Icons.arrow_drop_down),
          ),
        ],
      ),
    );
  }

  Widget textFieldWithBorder({
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
