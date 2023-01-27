part of 'pages.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.darkBlueColor,
            body: Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/flagged/photo-1557804521-990f076ccb96?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80",
                          ),
                          fit: BoxFit.cover)),
                ),
                CustomScrollView(
                  anchor: 0.2,
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverFillRemaining(
                      child: Container(
                        color: AppColor.whiteColor,
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
                                    "Bromo Mountain National Park",
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
                                                'assets/images/navigate-icon.svg',
                                                semanticsLabel: 'Acme Logo'),
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
                                    "Malang, East Java, Indonesia",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: AppColor.darkGreyColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            bottomNavigationBar: const SizedBox(
              height: 58,
              child: Text("Book Trip"),
            )));
  }
}
