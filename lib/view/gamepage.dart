// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/controller/gamepage_controller.dart';
import 'package:tic_tac_toe/view/botpaly%20test.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<GamePageController>(context,listen: false).resetGame();
    return ColorFiltered(
      // ignore: prefer_const_constructors
      colorFilter: ColorFilter.mode(
        Colors.blue, // Background color
        BlendMode.overlay, // Blend mode
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent[700],
          // image: const DecorationImage(image: AssetImage("assets/images/tictactoe.jpg"))
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Center the children of the column
              children: <Widget>[
                // Add other widgets here, such as a title or header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    // This is important to make the GridView work inside a Column
                    physics: const NeverScrollableScrollPhysics(),
                    // Disable scrolling in the GridView
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10, // Adjust the spacing as needed
                      crossAxisSpacing: 10, // Adjust the spacing as needed
                    ),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      final row = index ~/ 3;
                      final col = index % 3;

                      return GestureDetector(
                        onTap: () => Provider.of<GamePageController>(context,
                                listen: false)
                            .onCellTapped(row, col, context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 3, 241, 138),
                            border: Border.all(
                                width: 3, color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          child: Center(
                            child: Consumer<GamePageController>(
                              builder: (BuildContext context,
                                  GamePageController value, Widget? child) {
                                return Text(
                                  value.gameGrid[row][col],
                                  style: const TextStyle(
                                    fontSize: 52,
                                    color: Color.fromARGB(255, 255, 59, 59),
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<GamePageController>(
                  builder: (context, value, child) {
                    if (value.isGameEnd) {
                      return ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BotPlay(),
                                ));
                            // value.resetGame();
                          },
                          child: const Icon(Icons.restart_alt_rounded));
                    } else {
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
