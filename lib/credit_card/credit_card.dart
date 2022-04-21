import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final ValueNotifier<String> numberController;
  final ValueNotifier<String> validityController;
  final ValueNotifier<String> nameController;
  const CreditCard({
    Key? key,
    required this.numberController,
    required this.validityController,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: Padding(
            padding: const EdgeInsets.only(
                left: 32.0, top: 16, right: 16, bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.credit_card_sharp,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "GuustaBank",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 16),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(Icons.chair_alt)),
                              ),
                              const SizedBox(width: 16),
                              const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.wifi_outlined,
                                    color: Colors.white, size: 24),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ValueListenableBuilder<String>(
                            valueListenable: numberController,
                            builder: (context, value, child) {
                              return Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        "Utilizar função de Crédito".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "VALID\nTHRU",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 6),
                            ValueListenableBuilder<String>(
                                valueListenable: validityController,
                                builder: (context, value, _) {
                                  return Text(
                                    value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  );
                                }),
                          ],
                        ),
                        const SizedBox(height: 4),
                        ValueListenableBuilder<String>(
                            valueListenable: nameController,
                            builder: (context, value, _) {
                              return Text(
                                value.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  letterSpacing: 1.2,
                                ),
                              );
                            }),
                      ],
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "VISA",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
