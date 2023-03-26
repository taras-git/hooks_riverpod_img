import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_test/src/data/service/network_service.dart';
import 'package:hooks_riverpod_test/src/view/widget/character_card.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiService = useMemoized(NetworkService.new);
    final getCharactersRequest =
        useValueNotifier(apiService.getCharactersList());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod and Hooks"),
      ),
      body: Center(
        child: HookBuilder(
          builder: (_) {
            final future = useValueListenable(getCharactersRequest);
            return FutureBuilder(
                future: future,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final characters = snapshot.data!;
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: characters.length,
                        itemBuilder: (context, index) {
                          final character = characters[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: CharacterCard(character: character),
                          );
                        },
                      );
                    } else {
                      return Text(snapshot.error != null
                          ? snapshot.error! as String
                          : 'Unknown error');
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                });
          },
        ),
      ),
    );
  }
}
