import 'package:flutter/material.dart';
import '../../../models/script_model.dart';
import '../../../widgets/common/script_card.dart';

class ScriptSection extends StatelessWidget {
  final List<ScriptModel> scriptItems;

  const ScriptSection({
    super.key,
    required this.scriptItems,
  });

  @override
  Widget build(BuildContext context) {
    if (scriptItems.isEmpty) {
      return const Center(child: Text('No script practice items for this section.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: scriptItems.length,
      itemBuilder: (context, index) {
        final item = scriptItems[index];
        return ScriptCard(
          script: item,
          onAudioTap: () {},
        );
      },
    );
  }
}
