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
  final _numberController = TextEditingController();
  final _validityController = TextEditingController();
  final _nameController = TextEditingController();

  final _creditCardController = ValueNotifier<CardEntity>(const CardEntity());

  @override
  void initState() {
    super.initState();
    _numberController.addListener(changeCardData);
    _nameController.addListener(changeCardData);
    _validityController.addListener(changeCardData);
  }

  void changeCardData() {
    _creditCardController.value = CardEntity(
      validity: _validityController.text,
      name: _nameController.text,
      number: _numberController.text,
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    _validityController.dispose();
    _nameController.dispose();
    _creditCardController.dispose();
    super.dispose();
  }

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
                child: ValueListenableBuilder<CardEntity>(
                    valueListenable: _creditCardController,
                    builder: (context, value, child) {
                      return CreditCard(
                        validity: value.validity,
                        number: value.number,
                        name: value.name,
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Card number',
                  ),
                  controller: _numberController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Validity',
                  ),
                  controller: _validityController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardEntity {
  final String number;
  final String validity;
  final String name;

  const CardEntity({
    Key? key,
    this.number = "",
    this.validity = "",
    this.name = "",
  }) : super();
}
