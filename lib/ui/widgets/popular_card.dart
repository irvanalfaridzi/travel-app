part of 'widgets.dart';

class PopularCard extends StatelessWidget {
  final Trips trip;
  final Function() onTap;
  const PopularCard({
    super.key,
    required this.trip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      height: 194,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            color: Theme.of(context).colorScheme.shadow,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // animation for the vacation image
          Hero(
            tag: trip.destinationName,
            child: Container(
              height: 119,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    trip.photoCover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      trip.destinationName,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Text(
                  "\$200",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 10),
            child: Text(
              trip.location,
              style: GoogleFonts.poppins(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
