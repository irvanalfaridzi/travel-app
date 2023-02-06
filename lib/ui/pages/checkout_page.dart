part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.vacation,
  });

  final Vacation vacation;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  void loadingWidget() {
    showDialog(
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColor.darkBlueColor.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
    content: Text('Order succeed'),
  );

  @override
  Widget build(BuildContext context) {
    return BaseDetailWidget(
      vacation: widget.vacation,
      onBottomNavBarTap: () async {
        print("Order");
        loadingWidget();

        await Future.delayed(const Duration(milliseconds: 500))
            .whenComplete(() {
          // navigate back to home page
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (Route<dynamic> route) => false,
          );
        });

        await Future.delayed(const Duration(milliseconds: 100))
            .whenComplete(() => // show the snackbar
                ScaffoldMessenger.of(context).showSnackBar(snackBar));
      },
      onBottomNavBarText: "Order",
      isCheckoutPage: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.vacation.vacationName,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: AppColor.darkBlueColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SvgPicture.asset(
                  "assets/icons/mountain.svg",
                  semanticsLabel: "Mountain icon",
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            widget.vacation.location,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: AppColor.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              // Duration
              _smalltemWidget(
                label: "Duration",
                value: "2 days",
              ),
              const SizedBox(width: 27),
              // Prize
              _smalltemWidget(
                label: "Price",
                value: "\$100 / person",
              )
            ],
          ),
          const SizedBox(height: 34),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _smalltemWidget(
                  label: "Choose Date",
                  field: _baseItemButton(
                    onTap: () {
                      print("choose a date");
                    },
                    child: _buttonChild(),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _smalltemWidget(
                  label: "Persons",
                  field: _baseItemButton(
                    child: _personChild(onAdd: () {
                      print("Add");
                    }, onRemove: () {
                      print("Remove");
                    }),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          _smalltemWidget(
            label: "Paymenr Method",
            field: _baseItemButton(
              onTap: () {
                print("choose a payment method");
              },
              child: _buttonChild(
                leftItem: Row(
                  children: [
                    Image.asset(
                      "assets/icons/master-card.png",
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Master Card",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: AppColor.blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                  ],
                ),
                urlAsset: "assets/icons/caret-down.svg",
              ),
            ),
          ),
          const SizedBox(height: 29),
          Text(
            "Total (include tax)",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "\$2200",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _personChild({
    required Function() onRemove,
    required Function() onAdd,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onRemove,
            child: Text(
              "-",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          Text(
            "20",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: AppColor.blackColor,
                fontWeight: FontWeight.w400,
                fontSize: 10.0,
              ),
            ),
          ),
          InkWell(
            onTap: onAdd,
            child: Text(
              "+",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: AppColor.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _baseItemButton({
    required Widget child,
    Function()? onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shadowColor: MaterialStateProperty.all(AppColor.shadowColor),
        elevation: MaterialStateProperty.all(3),
        backgroundColor: MaterialStateProperty.all(AppColor.whiteColor),
        overlayColor: MaterialStateProperty.all(AppColor.shadowColor),
      ),
      child: child,
    );
  }

  Padding _buttonChild(
      {Widget? leftItem, String urlAsset = "assets/icons/calender.svg"}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: leftItem ??
                Text(
                  "Jan 2, 2023",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: AppColor.blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0,
                    ),
                  ),
                ),
          ),
          SvgPicture.asset(
            urlAsset,
            semanticsLabel: "Calender icon",
          ),
        ],
      ),
    );
  }

  Column _smalltemWidget({
    required String label,
    String? value,
    Widget field = const SizedBox(),
  }) {
    // for the Widget below the label
    final body = value != null
        ? Text(
            value,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: AppColor.darkGreyColor,
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
          )
        : field;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              color: AppColor.blackColor,
              fontWeight: FontWeight.w400,
              fontSize: 13.0,
            ),
          ),
        ),
        const SizedBox(height: 4),
        body,
      ],
    );
  }
}
