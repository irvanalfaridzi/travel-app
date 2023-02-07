part of 'widgets.dart';

class LoadingWidget {
  static loadingDialog(BuildContext context) {
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
}
