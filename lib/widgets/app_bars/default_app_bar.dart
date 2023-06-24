
import 'package:flutter/material.dart';
import 'package:gizu_github_app/pages/favorites_page.dart';
import 'package:gizu_github_app/theme/theme.dart';
import 'package:gizu_github_app/widgets/buttons/default_switcher.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.title,
    this.hasFavoriteBtn = true,
    this.hasBackBtn = true,
    this.themeSwitcher = false,
    Key? key,
  }) : super(key: key);
  final String? title;
  final bool? hasFavoriteBtn;
  final bool? hasBackBtn;
  final bool themeSwitcher;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: AppTheme.lightOrange,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (themeSwitcher) const DefaultSwitcher(),
          if (!themeSwitcher)
            _buildIcon(
              visible: hasBackBtn,
              icon: Icons.arrow_back,
              onPressed: () => Navigator.of(context).pop(),
            ),
          Text(
            title ?? 'Github gz',
            style: AppTheme.twentyBold,
          ),
          _buildIcon(
            icon: Icons.favorite,
            onPressed: () {
              Navigator.of(context).pushNamed(
                FavoritesPage.routeName,
              );
            },
            visible: hasFavoriteBtn,
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required VoidCallback onPressed,
    visible = true,
  }) {
    return visible
        ? IconButton(
            iconSize: 40,
            icon: Icon(
              icon,
              color: AppTheme.darkOrange,
            ),
            onPressed: onPressed,
          )
        : const SizedBox(
            width: 40,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
