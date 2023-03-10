part of 'pages.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.trip,
  });

  final Trips trip;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final snackBar = const SnackBar(
    content: Text('Order succeed'),
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // back button navigate to detail page
        final uri = Uri(
          path: '/detail',
          queryParameters: widget.trip.toJson(),
        );
        context.go(uri.toString());
        return false;
      },
      child: BaseDetailWidget(
        trip: widget.trip,
        onBottomNavBarTap: () async {
          LoadingWidget.loadingDialog(context);

          await Future.delayed(const Duration(milliseconds: 500))
              .whenComplete(() {
            // navigate back to home page

            Router.neglect(context, () {
              context.go("/");
            });
          });

          await Future.delayed(const Duration(milliseconds: 100)).whenComplete(
            () => // show the snackbar
                AppRouter.scaffoldKey.currentState?.showSnackBar(snackBar),
          );
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
                    widget.trip.destinationName,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
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
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              widget.trip.location,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
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
                  value: "${widget.trip.minimumPerson} / person",
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
                        log("choose a date");
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
                        log("Add");
                      }, onRemove: () {
                        log("Remove");
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
                  log("choose a payment method");
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
                          textStyle: TextStyle(
                            color: Theme.of(context)
                                .buttonTheme
                                .colorScheme
                                ?.onPrimary,
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
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${widget.trip.price}",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 40.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _personChild({
    required Function() onRemove,
    required Function() onAdd,
  }) {
    final color = Theme.of(context);
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
                textStyle: TextStyle(
                  color: color.buttonTheme.colorScheme?.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          Text(
            "20",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: color.buttonTheme.colorScheme?.onPrimary,
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
                textStyle: TextStyle(
                  color: color.buttonTheme.colorScheme?.onPrimary,
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
    final color = Theme.of(context);
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        shadowColor:
            MaterialStateProperty.all(color.buttonTheme.colorScheme?.shadow),
        elevation: MaterialStateProperty.all(3),
        backgroundColor: MaterialStateProperty.all(
            color.buttonTheme.colorScheme?.background),
        overlayColor:
            MaterialStateProperty.all(color.buttonTheme.colorScheme?.shadow),
      ),
      child: child,
    );
  }

  Padding _buttonChild(
      {Widget? leftItem, String urlAsset = "assets/icons/calender.svg"}) {
    final color = Theme.of(context);
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
                    textStyle: TextStyle(
                      color: color.buttonTheme.colorScheme?.onPrimary,
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0,
                    ),
                  ),
                ),
          ),
          SvgPicture.asset(
            urlAsset,
            semanticsLabel: "Calender icon",
            color: color.buttonTheme.colorScheme?.onPrimary,
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
