import 'package:flutter/material.dart';
import 'package:interactive_destini/story_brain.dart';

void main() => runApp(const Destini());
StoryBrain storyBrain = StoryBrain();

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              actionButton(1),
              const SizedBox(
                height: 20.0,
              ),
              ((storyBrain.getChoice2() != '') ? actionButton(2) : Container()),
            ],
          ),
        ),
      ),
    );
  }

  Expanded actionButton(int choicePreference) {
    return Expanded(
      flex: 2,
      child: TextButton(
        onPressed: () {
          //Choice 1 made by user.
          setState(() {
            storyBrain.nextStory(choicePreference);
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
          ((choicePreference == 1) ? Colors.red : Colors.blue),
        )),
        child: Text(
          ((choicePreference == 1)
              ? storyBrain.getChoice1()
              : storyBrain.getChoice2()),
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
