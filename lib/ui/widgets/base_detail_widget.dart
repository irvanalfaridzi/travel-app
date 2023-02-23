part of 'widgets.dart';

class BaseDetailWidget extends StatelessWidget {
  const BaseDetailWidget({
    super.key,
    required this.trip,
    required this.body,
    required this.onBottomNavBarTap,
    required this.onBottomNavBarText,
    this.isCheckoutPage = false,
  });

  final Trips trip;
  final Widget body;
  final Function() onBottomNavBarTap;
  final String onBottomNavBarText;
  final bool isCheckoutPage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        body: Stack(
          children: [
            // animation for the vacation image
            Hero(
              tag: trip.destinationName,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      trip.photoCover,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            CustomScrollView(
              anchor: 0.2,
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(isCheckoutPage ? 0 : 40.0),
                        topRight: Radius.circular(isCheckoutPage ? 0 : 40.0),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      color: Theme.of(context).colorScheme.background,
                    ),
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: body,
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: onBottomNavBarTap,
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/checkmark-circle-icon.svg",
                  semanticsLabel: "Check icon",
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  onBottomNavBarText,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
