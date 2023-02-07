part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Trips trip;
  const DetailPage({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDetailWidget(
      trip: trip,
      body: DetailBodyWidget(trip: trip),
      onBottomNavBarTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckoutPage(
              trip: trip,
            ),
          ),
        );
      },
      onBottomNavBarText: "Book Trip",
    );
  }
}

class DetailBodyWidget extends StatelessWidget {
  const DetailBodyWidget({
    super.key,
    required this.trip,
  });

  final Trips trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                trip.destinationName,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: AppColor.darkBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "\$${trip.price}",
                textAlign: TextAlign.right,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        color: AppColor.darkBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0)),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: AppColor.yellowColor,
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/navigate-icon.svg',
                            semanticsLabel: 'Navigate icon'),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "View map",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: AppColor.darkBlueColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Text(
                trip.location,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: AppColor.darkGreyColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: AppColor.shadowColor),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/peoples-icon.svg",
                      semanticsLabel: "Peoples icon",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${trip.minimumPerson} ${trip.person}",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: AppColor.shadowColor),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/time-icon.svg",
                      semanticsLabel: "Time icon",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "2 days",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: AppColor.shadowColor),
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/star-icon.svg",
                      semanticsLabel: "Star icon",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      trip.rating.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: Text(
            "Mount Bromo is a part of the Bromo Tengger Semeru National Park that covers a massive area of 800 square km. While it may be small when measured against other volcanoes in Indonesia, the magnificent Mt Bromo will not disappoint with its spectacular views and dramatic landscapes.",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: AppColor.darkGreyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.0),
            ),
          ),
        )
      ],
    );
  }
}
