import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/features/home/provider/home_provider.dart';
import 'package:riverpod_api/features/home/widgets/joke_view.dart';
import 'package:riverpod_api/features/home/widgets/refresh_joke.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(jokeDataProvider).isLoading;
    final joke = ref.watch(jokeDataProvider).joke;
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.tr()),
      ),
      floatingActionButton: const RefreshJoke(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : JokeView(joke: joke),
    );
  }
}
