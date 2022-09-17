import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/word_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordBloc = BlocProvider.of<WordBloc>(context);
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            filled: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 18)),
        onSubmitted: (value) => {wordBloc.add(WordSearchEvent(word: value))},
      ),
    );
  }
}
