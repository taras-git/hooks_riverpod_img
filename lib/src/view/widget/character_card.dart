import 'package:flutter/material.dart';
import 'package:hooks_riverpod_test/src/data/models/character.dart';

import 'custom_card.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCharacterImage(),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name ?? 'No name...',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 7.0,
                      width: 7.0,
                      decoration: BoxDecoration(
                        color: statusColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      '${character.status} - ${character.species}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                buildCharacterInfo(
                    'Last known location:', character.origin?.name),
                const SizedBox(height: 5.0),
                buildCharacterInfo('Origin:', character.location?.name),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ClipRRect buildCharacterImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        bottomLeft: Radius.circular(10.0),
      ),
      child: Image.network(
        character.image!,
        height: 145.0,
      ),
    );
  }

  Column buildCharacterInfo(String title, String? content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        Text(
          content ?? 'No content...',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Color statusColor() {
    switch (character.status!.toLowerCase()) {
      case 'alive':
        return Colors.green.shade300;
      case 'dead':
        return Colors.red;
      case 'unknown':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }
}
