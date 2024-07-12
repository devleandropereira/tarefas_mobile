import 'package:flutter/material.dart';

import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String urlImage;
  final int difficulty;

  const Task(this.nome, this.urlImage, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 1;
  int maestria = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              // Azul, verde, amarelo, laranja, vermelho, roxo e preto
              color: maestria >= 6 ? Colors.black
                  : maestria == 5 ? Colors.purpleAccent
                  : maestria == 4 ? Colors.red
                  : maestria == 3 ? Colors.orange
                  : maestria == 2 ? Colors.yellow
                  : maestria == 1 ? Colors.green
                  : Colors.blue
            ),
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.black26,
                      ),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset(
                          widget.urlImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            )
                        ),
                        Difficulty(difficultyLevel: widget.difficulty)
                      ],
                    ),
                    SizedBox(
                      height: 64,
                      width: 64,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                              bool upLevel = (nivel/widget.difficulty)/10 > 1;
                              if (upLevel) {
                                if (maestria <= 5) {
                                  maestria++;
                                  nivel = 1;
                                }
                              }
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.blue),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0)),
                              )),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_drop_up,
                                color: Colors.white,
                              ),
                              Text('UP', style: TextStyle(fontSize: 12, color: Colors.white))
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: widget.difficulty > 0 ? (nivel/widget.difficulty) / 10 : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: $nivel',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}