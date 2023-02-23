part of 'widgets.dart';

class NavBarButtonItem extends StatelessWidget {
  final String textButton;
  final IconData iconButton;
  final bool isSelected;
  final Function onTap;
  const NavBarButtonItem({
    super.key,
    required this.iconButton,
    required this.textButton,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconButton,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          const SizedBox(height: 8),
          Text(
            textButton,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
