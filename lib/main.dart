import 'dart:math' as math;

import 'package:credit_card/credit_card/credit_card.dart';
import 'package:credit_card/credit_card/credit_card_back.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final _numberController = TextEditingController();
  final _validityController = TextEditingController();
  final _nameController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cvvFocus = FocusNode();
  final _creditCardController = ValueNotifier<CardEntity>(const CardEntity());

  late final AnimationController cardAnimationController;
  late final Animation animation;

  @override
  void initState() {
    super.initState();
    _numberController.addListener(changeCardData);
    _nameController.addListener(changeCardData);
    _validityController.addListener(changeCardData);
    _cvvController.addListener(changeCardData);

    _cvvFocus.addListener(() {
      if (_cvvFocus.hasFocus) {
        cardAnimationController.forward();
      } else {
        cardAnimationController.reverse();
      }
    });

    cardAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(
        milliseconds: 300,
      ),
    );
    animation = Tween(begin: 0.0, end: math.pi).animate(CurvedAnimation(
        parent: cardAnimationController, curve: Curves.bounceOut));
  }

  void changeCardData() {
    _creditCardController.value = CardEntity(
      validity: _validityController.text,
      name: _nameController.text,
      number: _numberController.text,
      cvv: _cvvController.text,
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    _validityController.dispose();
    _nameController.dispose();
    _creditCardController.dispose();
    _cvvController.dispose();
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
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (contex, child) {
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, .002)
                        ..rotateY(animation.value),
                      child: animation.value > math.pi / 2
                          ? ValueListenableBuilder<CardEntity>(
                              valueListenable: _creditCardController,
                              builder: (context, value, child) {
                                return CreditCardBack(
                                  cvv: value.cvv,
                                );
                              })
                          : ValueListenableBuilder<CardEntity>(
                              valueListenable: _creditCardController,
                              builder: (context, value, child) {
                                return CreditCard(
                                  validity: value.validity,
                                  number: value.number,
                                  name: value.name,
                                );
                              },
                            ),
                    );
                  },
                ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  focusNode: _cvvFocus,
                  decoration: const InputDecoration(
                    labelText: 'Security code',
                  ),
                  controller: _cvvController,
                ),
              ),
              const SizedBox(height: 16),
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
  final String cvv;

  const CardEntity({
    Key? key,
    this.number = "",
    this.validity = "",
    this.name = "",
    this.cvv = "",
  }) : super();
}
