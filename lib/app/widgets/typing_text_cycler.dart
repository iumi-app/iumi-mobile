import 'dart:async';
import 'package:flutter/material.dart';

class TypingTextCycler extends StatefulWidget {
  const TypingTextCycler({super.key});

  @override
  State<TypingTextCycler> createState() => _TypingTextCyclerState();
}

class _TypingTextCyclerState extends State<TypingTextCycler> {
  final String staticText = 'Alimente-se de maneira ';
  final List<String> words = ['saudável', 'equilibrada', 'inteligente'];
  int wordIndex = 0;
  String currentWord = '';
  bool isTyping = true;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTyping();
  }

  void startTyping() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        final fullWord = words[wordIndex];
        if (isTyping) {
          if (currentWord.length < fullWord.length) {
            currentWord = fullWord.substring(0, currentWord.length + 1);
          } else {
            isTyping = false;
            _timer.cancel();
            Future.delayed(const Duration(seconds: 2), () {
              startDeleting();
            });
          }
        }
      });
    });
  }

  void startDeleting() {
    _timer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      setState(() {
        if (currentWord.isNotEmpty) {
          currentWord = currentWord.substring(0, currentWord.length - 1);
        } else {
          _timer.cancel();
          wordIndex = (wordIndex + 1) % words.length;
          isTyping = true;
          startTyping();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$staticText$currentWord',
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    );
  }
}
