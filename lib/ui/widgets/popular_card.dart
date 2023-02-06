part of 'widgets.dart';

class PopularCard extends StatelessWidget {
  final Vacation vacation;
  final Function() onTap;
  const PopularCard({
    super.key,
    required this.vacation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 145,
          height: 194,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.whiteColor,
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 0,
                color: AppColor.shadowColor,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // animation for the vacation image
              Hero(
                tag: vacation.vacationName,
                child: Container(
                  height: 119,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        vacation.urlImage,
                      ),
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
                          vacation.vacationName,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blackColor,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "\$200",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 10),
                child: Text(
                  vacation.location,
                  style: GoogleFonts.poppins(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: AppColor.darkGreyColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
