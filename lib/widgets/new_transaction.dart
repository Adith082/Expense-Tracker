//import 'package:expense_tracker/widgets/user_transactions.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";

class NewTransaction extends StatelessWidget {
  final titleController =
      TextEditingController(); //creates a controller of an editable text field.
  final amountController = TextEditingController();
  final Function addTxt;
  NewTransaction(this.addTxt);
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTxt(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              cursorColor: Colors.green,
              onSubmitted: (_) =>
                  submitData(), //convention for calling functions on submitted
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              cursorColor: Colors.red,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), //we can give proper field for proper formated input fields.
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                "Save Transaction",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
