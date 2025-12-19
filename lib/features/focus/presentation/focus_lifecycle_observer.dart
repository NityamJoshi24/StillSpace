import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'focus_providers.dart';

class FocusLifecycleObserver extends ConsumerStatefulWidget {
  final Widget child;
  const FocusLifecycleObserver({super.key, required this.child});

  @override
  ConsumerState<FocusLifecycleObserver> createState() => _FocusLifecycleObserverState();
}

class _FocusLifecycleObserverState extends ConsumerState<FocusLifecycleObserver> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
   if( state == AppLifecycleState.paused || state == AppLifecycleState.inactive) {
     ref.read(focusControlProvider.notifier).end(ref);
   }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}