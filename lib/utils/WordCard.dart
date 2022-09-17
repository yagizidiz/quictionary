import 'package:flutter/material.dart';
import 'package:quictionary/blocs/word_bloc.dart';
import 'package:quictionary/models/word_model.dart';

class WordCard extends StatelessWidget {
  final WordModel wordModel;

  const WordCard({Key? key, required this.wordModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        background: Container(
          color: const Color(0xff6442ED),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(width: 10),
              Icon(Icons.bookmark, size: 50, color: Colors.white)
            ],
          ),
        ),
        secondaryBackground: Container(
            color: const Color(0xffE75C5C),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.delete,
                  size: 50,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            )),
        onDismissed: (direction) {
          if (direction == AxisDirection.left) {
            WordBloc().add(WordDismissEvent());
          } else {
            WordBloc().add(
                WordSaveEvent(wordModel: wordModel, word: wordModel.word!));
          }
        },
        key: const ValueKey<int>(1),
        child: Card(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          shadowColor: Colors.black,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          elevation: 5,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Text(
                        wordModel.word!,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          WordSaveEvent(
                              wordModel: wordModel, word: wordModel.word!);
                        },
                        child: const Icon(
                          Icons.bookmark_border_outlined,
                          color: Color(0xff6442ED),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 15),
                  const Icon(
                    size: 37,
                    Icons.volume_up,
                    color: Color(0xff6442ED),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  wordModel.phonetics!.isNotEmpty
                      ? wordModel.phonetics!.elementAt(0).text != null
                          ? Text(wordModel.phonetics!.elementAt(0).text!)
                          : const Text('Phonetic Not Found')
                      : const Text('Phonetic Not Found'),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(
                    size: 37,
                    Icons.volume_up,
                    color: Color(0xffE75C5C),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  wordModel.phonetics!.length > 1
                      ? Text(wordModel.phonetics!.elementAt(1)!.text!)
                      : const Text('Phonetics not found')
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  wordModel.meanings!.elementAt(0)!.partOfSpeech != null
                      ? Text(wordModel.meanings!.elementAt(0)!.partOfSpeech!)
                      : const Text('Part of speech not found')
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Def:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  wordModel.meanings!
                              .elementAt(0)!
                              .definitions!
                              .elementAt(0)!
                              .definition !=
                          null
                      ? Expanded(
                          child: Text(wordModel.meanings!
                              .elementAt(0)!
                              .definitions!
                              .elementAt(0)!
                              .definition!))
                      : const Text('Definition not found')
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'Example:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  wordModel.meanings!
                              .elementAt(0)!
                              .definitions!
                              .elementAt(0)!
                              .example !=
                          null
                      ? Expanded(
                          child: Text(wordModel.meanings!
                              .elementAt(0)!
                              .definitions!
                              .elementAt(0)!
                              .example!))
                      : const Text('Example not found')
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Show More...',
                  style: TextStyle(color: Color(0xff6442ED)),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
