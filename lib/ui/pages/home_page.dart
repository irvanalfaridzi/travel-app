part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: Theme.of(context).colorScheme.shadow,
              offset: const Offset(0, -4),
            )
          ],
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TODO: make a logic to change the page with setstate
            NavBarButtonItem(
              iconButton: Icons.home_rounded,
              textButton: "Home",
              isSelected: true,
              onTap: () {},
            ),
            NavBarButtonItem(
              iconButton: Icons.favorite_rounded,
              textButton: "Saved",
              isSelected: false,
              onTap: () {},
            ),
            NavBarButtonItem(
              iconButton: Icons.featured_play_list_rounded,
              textButton: "Orders",
              isSelected: false,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              stretch: true,
              onStretchTrigger: () async {
                print('Load new data!');
                // await Server.requestNewData();
              },
              expandedHeight: 247.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                ],
                titlePadding: const EdgeInsets.all(0),
                expandedTitleScale: 1,
                title: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 131,
                      margin:
                          const EdgeInsets.only(left: 40, right: 40, bottom: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 14),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          hintText: "Let's find here",
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const BrightnessToggle(),
                  ],
                ),
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 58),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Find Your",
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "great vacation",
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  _bodyHomePage(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _bodyHomePage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 23),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular trips",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Center(
            child: FutureBuilder(
              future: ApiService.getTrips(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final trips = snapshot.data;
                  return ListView.builder(
                    itemCount: trips?.length,
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(left: 40, top: 13, bottom: 13),
                    itemBuilder: (context, index) {
                      final trip = trips![index];
                      return _OpenPopularTripWrapper(
                        trip: trip,
                        closedChild: PopularCard(
                          trip: trip,
                          onTap: () {},
                        ),
                      );
                    },
                  );
                }

                // loading while requesting the API
                return Skeleton.tripsSkeleton();
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, bottom: 20),
          child: Text(
            "Wishlist",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // TODO: create dummy data for wishlist
        ...List.generate(
          2,
          (index) => const WishlistItem(),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}

// tranform transition animation
class _OpenPopularTripWrapper extends StatelessWidget {
  const _OpenPopularTripWrapper({
    required this.trip,
    required this.closedChild,
  });

  final Trips trip;
  final Widget closedChild;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OpenContainer(
      openBuilder: (context, closedContainer) {
        return DetailPage(trip: trip);
      },
      openColor: theme.cardColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      closedElevation: 5,
      closedColor: theme.colorScheme.background,
      closedBuilder: (context, openContainer) {
        return InkWell(
          onTap: () {
            openContainer();
          },
          child: closedChild,
        );
      },
    );
  }
}
