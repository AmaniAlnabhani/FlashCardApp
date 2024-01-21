import 'package:flashcard_app/flashcard.dart';
import 'package:flashcard_app/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<FlashCard> _flashcards = [
    FlashCard(
        question: " What are two things you can never eat for breakfast?",
        answer: "Lunch and Dinner"),
    FlashCard(
        question: " What is always coming but never arrives? ",
        answer: "Tomorrow"),
    FlashCard(
        question:
            " What is it that lives if it is fed, and dies if you give it a drink?",
        answer: "Fire"),
    FlashCard(
        question: "  What goes up but never ever comes down? ",
        answer: "Your age"),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                front: FlashcardView(text: _flashcards[_currentIndex].question),
                back: FlashcardView(text: _flashcards[_currentIndex].answer),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: showPreviousCard,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev'),
                ),
                OutlinedButton.icon(
                  onPressed: showNextCard,
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
  void showNextCard(){
   setState(() {
     _currentIndex=
     (_currentIndex+1 < _flashcards.length) ?_currentIndex+1 :0;
   });
  }
  void showPreviousCard(){
    setState(() {
      _currentIndex=
      (_currentIndex-1 >0) ?_currentIndex =1 :_flashcards.length -1;

    });

  }
}
