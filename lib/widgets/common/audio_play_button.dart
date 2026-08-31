import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AudioPlayButton extends StatefulWidget {
  final VoidCallback onPlay;
  final double size;
  final Color? color;

  const AudioPlayButton({
    super.key,
    required this.onPlay,
    this.size = 40.0,
    this.color,
  });

  @override
  State<AudioPlayButton> createState() => _AudioPlayButtonState();
}

class _AudioPlayButtonState extends State<AudioPlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.85,
      upperBound: 1.0,
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _handleTap() {
    _animController.reverse().then((_) {
      _animController.forward();
    });
    widget.onPlay();
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = widget.color ?? AppColors.primary;

    return ScaleTransition(
      scale: _animController,
      child: InkWell(
        onTap: _handleTap,
        borderRadius: BorderRadius.circular(widget.size / 2),
        child: Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: buttonColor.withAlpha(30),
            shape: BoxShape.circle,
            border: Border.all(color: buttonColor.withAlpha(80), width: 1.2),
          ),
          child: Icon(
            Icons.volume_up_rounded,
            size: widget.size * 0.55,
            color: buttonColor,
          ),
        ),
      ),
    );
  }
}
