import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolumeButton extends StatelessWidget {
  VolumeButton({super.key, this.color = Colors.white});
  final Color color;
  final ValueNotifier<bool> isVolumeUpNotifier = ValueNotifier<bool>(true);

  void toggleIcon() {
    isVolumeUpNotifier.value = !isVolumeUpNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isVolumeUpNotifier,
      builder: (context, isVolumePress, child) {
        return IconButton(
          onPressed: () {
            toggleIcon();
          },
          icon: Icon(
            isVolumePress
                ? CupertinoIcons.volume_down
                : CupertinoIcons.volume_off,
            size: 30,
            color: color,
          ),
        );
      },
    );
  }
}
