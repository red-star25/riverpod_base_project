import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/features/home/provider/home_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(jokeDataProvider).isLoading;
    final joke = ref.watch(jokeDataProvider).joke;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Testing'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(jokeDataProvider.notifier).getJoke,
        child: const Icon(Icons.refresh),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      joke.setup ?? '',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      joke.delivery ?? '',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
