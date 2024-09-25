import 'package:despesaspessoaisgv/components/transaction_form.dart';
import 'package:flutter/material.dart';
import "../models/transaction.dart";
import "./components/transaction_form.dart";
import "./components/transaction_list.dart";
import "dart:math";

main() => runApp(DespesasApp());

class DespesasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        textTheme: tema.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

    Navigator.of(context).pop();

  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(context: context, builder: (_){
      return TransactionForm(_addTransaction);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text("Despesas Pessoais"),
          titleTextStyle: TextStyle(
            fontFamily: "OpenSans",
            fontSize: 20,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed:() => _openTransactionFormModal(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text("Grafico"),
                  elevation: 5,
                ),
              ),
              TransactionList(_transaction),
              ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed:() => _openTransactionFormModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
  }
}
