part of 'pages.dart';

class DetailPage extends StatelessWidget {
  final Vacation vacation;
  const DetailPage({Key? key, required this.vacation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.darkBlueColor,
            body: Stack(
              children: [
                // animation for the vacation image
                Hero(
                  tag: vacation.vacationName,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              vacation.urlImage,
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                CustomScrollView(
                  anchor: 0.2,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: AppColor.whiteColor,
                        ),
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    vacation.vacationName,
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
                                    "\$100",
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
                                            SvgPicture.asset(
                                                'assets/icons/navigate-icon.svg',
                                                semanticsLabel:
                                                    'Navigate icon'),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "View map",
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color:
                                                        AppColor.darkBlueColor,
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
                                    vacation.location,
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      border: Border.all(
                                          color: AppColor.shadowColor),
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
                                          "10 peoples",
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      border: Border.all(
                                          color: AppColor.shadowColor),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0)),
                                      border: Border.all(
                                          color: AppColor.shadowColor),
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
                                          "4,8",
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
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/checkmark-circle-icon.svg",
                    semanticsLabel: "Check icon",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Book Trip",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            )));
  }
}
