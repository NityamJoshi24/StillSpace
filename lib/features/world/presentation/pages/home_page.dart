import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stillspace/features/focus/presentation/focus_providers.dart';
import 'package:stillspace/features/presence/presentation/widgets/presence_widget.dart';
import 'package:stillspace/features/sound/presentation/widgets/calm_button.dart';
import 'package:stillspace/features/world/presentation/widgets/world_background.dart';
import 'package:just_audio/just_audio.dart';

import '../../../focus/domain/entities/focus_state.dart';

class HomePage extends ConsumerWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focus = ref.watch(focusControlProvider);

    return Scaffold(
      body: WorldBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PresenceWidget(),
              SizedBox(height: 40,),
              Text(
                focus.state == FocusState.focusing
                ? 'Stay here for a while'
                : 'Take a quick moment',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 30,),
              CalmButton(
                label: focus.state == FocusState.focusing
                    ? 'End Focus'
                    : 'Start Focus',
                onTap: () {
                  final controller = ref.read(focusControlProvider.notifier);
                  if(focus.state == FocusState.focusing) {
                    controller.end(ref);
                  } else {
                    controller.start(Duration(minutes: 25));
                  }
                },
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '25 Minutes · Calm',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}