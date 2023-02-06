part of 'pages.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({
    super.key,
    required this.vacation,
  });

  final Vacation vacation;

  @override
  Widget build(BuildContext context) {
    return BaseDetailWidget(
      vacation: vacation,
      body: const Center(
        child: Text("Checkout Page"),
      ),
      onBottomNavBarTap: () {
        print("Order");
      },
      onBottomNavBarText: "Order",
    );
  }
}
