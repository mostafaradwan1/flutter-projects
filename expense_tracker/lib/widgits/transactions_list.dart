import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (ctx, i) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: Colors.black,
                          style: BorderStyle.solid)),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    transactions[i].title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[i].amount.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(transactions[i].date.toString()),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
