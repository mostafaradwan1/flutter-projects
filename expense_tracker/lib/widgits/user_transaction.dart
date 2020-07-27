import 'package:flutter/material.dart';
import './new_transaction.dart';
import 'transactions_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> transactions = [
    Transaction(
        id: "t1", amount: 25.5, date: DateTime.now(), title: "tomatoies"),
    Transaction(id: "t2", amount: 50, date: DateTime.now(), title: "groceries"),
    Transaction(id: "t3", amount: 40, date: DateTime.now(), title: "555555"),
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(transactions),
      ],
    );
  }
}
