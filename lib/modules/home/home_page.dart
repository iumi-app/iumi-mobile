import 'package:Iumi/app/widgets/typing_text_cycler.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // espaço superior vazio

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'lib/shared/assets/images/logo.png',
                    height: size.height * 0.3,
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Y",
                          style: TextStyle(color: Colors.pink),
                        ),
                        TextSpan(
                          text: "u",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "M",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: "i",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TypingTextCycler(),
                ],
              ),

              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        // navegação aqui
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Começar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16), // espaçamento de 16px

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: TextButton(
                      onPressed: () {
                        // ação de login
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.pink,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: const Text('Já tenho uma conta Yumi'),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
