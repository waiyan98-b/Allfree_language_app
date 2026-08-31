import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';

enum ButtonVariant {
  primary,
  secondary,
  outline,
  danger,
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.height = 52.0,
  });

  @override
  Widget build(BuildContext context) {
    Color getBackgroundColor() {
      if (onPressed == null) return Colors.grey.shade400;
      switch (variant) {
        case ButtonVariant.primary:
          return AppColors.primary;
        case ButtonVariant.secondary:
          return AppColors.accent;
        case ButtonVariant.outline:
          return Colors.transparent;
        case ButtonVariant.danger:
          return AppColors.error;
      }
    }

    Color getForegroundColor() {
      if (onPressed == null) return Colors.white;
      switch (variant) {
        case ButtonVariant.primary:
        case ButtonVariant.secondary:
        case ButtonVariant.danger:
          return Colors.white;
        case ButtonVariant.outline:
          return AppColors.primary;
      }
    }

    BorderSide getBorderSide() {
      if (variant == ButtonVariant.outline) {
        return BorderSide(
          color: onPressed == null ? Colors.grey.shade400 : AppColors.primary,
          width: 1.5,
        );
      }
      return BorderSide.none;
    }

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(),
          foregroundColor: getForegroundColor(),
          elevation: variant == ButtonVariant.outline ? 0 : 2,
          side: getBorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20, color: getForegroundColor()),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: AppTypography.h3.copyWith(
                      fontSize: 16,
                      color: getForegroundColor(),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
