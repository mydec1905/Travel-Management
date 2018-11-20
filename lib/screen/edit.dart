
import 'package:flutter/material.dart';
import 'package:hotel_manager/model.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class Edit extends StatefulWidget {
  final List<Customer> temp;
  final int index;

  Edit({Key key, this.temp, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditState();
  }
}

class EditState extends State<Edit> {
  TextEditingController editName = TextEditingController();
  TextEditingController editPhone = TextEditingController();
  TextEditingController editPaid = TextEditingController();
  DateTime editStart = DateTime.now();
  DateTime editEnd = DateTime.now();
  final dateFormat = DateFormat.yMd();

  Future<Null> _selectDatestart(BuildContext context) async {
    final DateTime datestart = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(0),
        lastDate: DateTime(3000));
    if (datestart != null && datestart != editStart)
      setState(() {
        editStart = datestart;
      });
  }

  Future<Null> _selectDateend(BuildContext context) async {
    final DateTime dateend = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(0),
        lastDate: DateTime(3000));
    if (dateend != null && dateend != editEnd)
      setState(() {
        editEnd = dateend;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editName.text = widget.temp[widget.index].name;
    editPhone.text = widget.temp[widget.index].phone;
    editPaid.text = widget.temp[widget.index].paid;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: editName,
            autofocus: true,
            keyboardType: TextInputType.text,
            autocorrect: false,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
                labelText: 'Input Name', icon: Icon(Icons.person)),
          ),
          TextField(
            controller: editPhone,
            autofocus: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'Input Phone Number', icon: Icon(Icons.phone)),
          ),
          TextField(
            controller: editPaid,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'PrePaid', icon: Icon(Icons.attach_money)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  _selectDatestart(context);
                },
                icon: Icon(Icons.calendar_today),
              ),
              Text('Date Start :\n${DateFormat.yMd().format(editStart)}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  _selectDateend(context);
                },
                icon: Icon(Icons.calendar_today),
              ),
              Text('Date End :\n${DateFormat.yMd().format(editEnd)}'),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Customer temp = new Customer(
            editName.text,
            editPhone.text,
            editPaid.text,
            DateFormat.yMd().format(editStart),
            DateFormat.yMd().format(editEnd),
          );
          widget.temp[widget.index] = temp;

          Navigator.pop(context);
        },
        icon: Icon(Icons.save),
        label: Text('Save'),
        elevation: 50.0,
      ),
    );
  }
}
