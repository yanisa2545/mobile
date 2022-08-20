import 'package:flutter/material.dart';
import 'package:mobile/game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();
  var _feedbacktext = '';
  var _showTestButton = false;
  void handleClickGuess() {
   setState(() {
     _showTestButton = !_showTestButton;
   });
    print('Button clicked!');
    print(_controller.text);
    var guess = int.tryParse(_controller.text);
    if (guess == null) {
      //แจ้งerror
      print('Input error');
      setState(() {
        _feedbacktext = 'Input error, please try again';
      });
    } else {
      var result = _game.doGuess(guess);
      if (result == Result.tooHigh) {
        //ทายมากไป
        print('Too high');
        setState(() {
          _feedbacktext = 'Too high, please try again';
        });
      } else if (result == Result.tooLow) {
        //ทายน้อยไป
        print('Too low');
        setState(() {
          _feedbacktext = 'Too low, please try again';
        });
      } else {
        //ทายถูก
        print('corret');
        setState(() {
          _feedbacktext = 'Good job!!!!';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Guess the Number')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Please enter number between 1 and 100'),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            //callback function
            ElevatedButton(
              onPressed: handleClickGuess,
              child: Text('Guess'),
            ),
            Text(_feedbacktext),

             ElevatedButton(
             style: OutlinedButton.styleFrom(
               primary: _showTestButton ? Colors.pink : Colors.black,
               //หรือใช้backgroundColor แทนตรงprimary
             ),
              onPressed: (){},
              child: Text('Test'),
            ),
            Icon(_showTestButton ? Icons.print : Icons.access_alarm_rounded),
          ],
        ),
      ),
    );
  }
}
