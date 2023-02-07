part of 'widgets.dart';

class Skeleton {
  static Widget baseSkeleton({Widget child = const SizedBox()}) =>
      Shimmer.fromColors(
        baseColor: Colors.grey[300] ?? Colors.grey,
        highlightColor: Colors.grey[100] ?? Colors.white54,
        child: child,
      );

  static Widget tripsSkeleton({int skeletonLength = 3}) => ListView.builder(
        itemCount: skeletonLength,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 40, top: 13, bottom: 13),
        itemBuilder: (context, index) => baseSkeleton(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
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
            ),
          ),
        ),
      );
}
