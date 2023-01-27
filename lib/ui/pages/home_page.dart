part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 0,
              color: AppColor.shadowColor,
              offset: Offset(0, -4),
            )
          ],
          color: AppColor.whiteColor,
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 58),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Find Your",
                  style: GoogleFonts.poppins(
                    color: AppColor.blackColor,
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
                    color: AppColor.darkBlueColor,
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: AppColor.softBlueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 14),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColor.blueColor,
                    ),
                    hintText: "Let's find here",
                    hintStyle: GoogleFonts.poppins(
                      color: AppColor.lightBlueColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  cursorColor: AppColor.darkBlueColor,
                ),
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular tips",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blackColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // TODO: create dummy data for popular tips
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 220,
                child: Center(
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(left: 40, top: 13, bottom: 13),
                    itemBuilder: (context, index) => const PopularCard(),
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
                    color: AppColor.blackColor,
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
          ),
        ),
      ),
    );
  }
}
