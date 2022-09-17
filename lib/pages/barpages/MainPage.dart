import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quictionary/blocs/word_bloc.dart';
import 'package:quictionary/utils/mainpageutils/ProfileItem.dart';
import 'package:quictionary/utils/WordCard.dart';
import 'package:quictionary/utils/mainpageutils/SearchBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: BlocBuilder<WordBloc, WordState>(builder: (context, state) {
            if (state is WordInitial) {
              return Column(
                children: const [
                  ProfileItem(),
                  SizedBox(height: 10),
                  SearchBar(),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            } else if (state is WordLoadingState) {
              return Column(
                children: const [
                  ProfileItem(),
                  SizedBox(height: 20),
                  SearchBar(),
                  SizedBox(height: 20),
                  CircularProgressIndicator()
                ],
              );
            } else if (state is WordLoadedState) {
              return Column(
                children: [
                  const ProfileItem(),
                  const SizedBox(height: 20),
                  const SearchBar(),
                  const SizedBox(height: 20),
                  WordCard(
                    wordModel: state.word,
                  )
                ],
              );
            } else {
              return Column(
                children: const [
                  ProfileItem(),
                  SizedBox(height: 20),
                  SearchBar(),
                  SizedBox(height: 20),
                ],
              );
            }
          }),
        ));
  }
}
