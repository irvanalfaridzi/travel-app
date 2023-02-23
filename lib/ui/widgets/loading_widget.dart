part of 'widgets.dart';

class LoadingWidget {
  static loadingDialog(BuildContext context) {
    final color = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: color.colorScheme.background.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColor.whiteColor,
          ),
        ),
      ),
    );
  }
}
