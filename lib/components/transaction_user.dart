import "dart:math";

import 'package:flutter/material.dart';

import "../models/transaction.dart";
import "transaction_form.dart";
import "transaction_list.dart";

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transaction = [
    Transaction(
        id: 't1',
        title: "Tênis de Corrida",
        value: 310.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: "Oculos de natação",
        value: 510.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: "Oculos de natação",
        value: 510.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: "Oculos de natação",
        value: 510.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: "Oculos de natação",
        value: 510.99,
        date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction),
        TransactionList(_transaction),
      ],
    );
  }
}
