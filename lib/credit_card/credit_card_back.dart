import 'dart:math' as math;

import 'package:flutter/material.dart';

class CreditCardBack extends StatelessWidget {
  final String cvv;
  const CreditCardBack({
    Key? key,
    this.cvv = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(math.pi),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: AspectRatio(
          aspectRatio: 480 / 300,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.8),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(5, 5),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.grey[800],
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 30,
                  color: Colors.white,
                  child: Text(
                    cvv,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
