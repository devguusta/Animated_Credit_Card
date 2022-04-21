import 'package:credit_card/credit_card/credit_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<String> _numberController = ValueNotifier<String>('');
  final ValueNotifier<String> _validityController = ValueNotifier<String>('');
  final ValueNotifier<String> _nameController = ValueNotifier<String>('');

  @override
  void dispose() {
    _numberController.dispose();
    _validityController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CreditCard(
                  validityController: _validityController,
                  numberController: _numberController,
                  nameController: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  onChanged: (value) => _nameController.value = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Card number',
                  ),
                  onChanged: (value) => _numberController.value = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Validity',
                  ),
                  onChanged: (value) => _validityController.value = value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
