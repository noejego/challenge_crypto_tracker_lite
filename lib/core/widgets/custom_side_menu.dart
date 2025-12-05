import 'package:challenge_crypto_tracker_lite/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSideMenu extends StatelessWidget {
  const CustomSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = AppColorScheme.dark;

    return Drawer(
      width: 350,
      backgroundColor: AppColors.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 24),
          ColoredBox(
            color: colors.primaryContainer,
            child: Padding(
              padding: const EdgeInsetsGeometry.only(top: 100, bottom: 30),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colors.primary,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: colors.primary.withValues(alpha: 0.6),
                            blurRadius: 25,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpeg',
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Noe Jenaro",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: colors.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.email_outlined,
                          color: colors.onSurfaceVariant,
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "noejego@gmail.com",
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 40),

          _MenuItem(
            icon: Icons.star,
            title: "Favoritos",
            iconColor: colors.primary,
            borderColor: colors.primary.withValues(alpha: 0.5),
            bgColor: colors.primary.withValues(alpha: 0.3),
            onTap: () {
              Navigator.of(context).pop();
              context.push('/favorites');
            },
          ),

          _MenuItem(
            icon: Icons.person,
            title: "Perfil",
            iconColor: colors.tertiaryContainer,
            borderColor: colors.tertiary.withValues(alpha: 0.5),
            bgColor: colors.tertiary.withValues(alpha: 0.3),
            onTap: () {},
          ),

          _MenuItem(
            icon: Icons.settings,
            title: "Configuración",
            iconColor: colors.surface,
            borderColor: colors.primaryContainer,
            bgColor: colors.primaryContainer.withValues(alpha: 0.8),
            disabled: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color borderColor;
  final Color bgColor;
  final VoidCallback onTap;
  final bool disabled;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.borderColor,
    required this.onTap,
    required this.bgColor,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = AppColorScheme.dark;

    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 0.5),
          color: colors.surfaceContainerHighest,
        ),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: bgColor,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                color: disabled ? colors.onSurfaceVariant : iconColor,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: disabled ? colors.onSurfaceVariant : colors.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: disabled ? colors.onSurfaceVariant : colors.onSurface,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
