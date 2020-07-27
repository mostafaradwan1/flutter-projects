import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final addTransaction;
  NewTransaction(this.addTransaction);
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  void _submitData() {
    addTransaction(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SingleChildScrollView(
        child: Card(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_) => _submitData,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData,
                ),
                FlatButton(
                    onPressed: () {
                      _submitData();
                    },
                    child: Text(
                      'add transaction',
                      style: TextStyle(color: Colors.teal),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
