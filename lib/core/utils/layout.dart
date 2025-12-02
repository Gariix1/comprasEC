import 'package:flutter/widgets.dart';

import '../theme/app_spacing.dart';

enum DeviceSize { mobile, tablet, desktop }

DeviceSize deviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 600) return DeviceSize.mobile;
  if (width < 1024) return DeviceSize.tablet;
  return DeviceSize.desktop;
}

bool isMobile(BuildContext context) => deviceSize(context) == DeviceSize.mobile;
bool isTablet(BuildContext context) => deviceSize(context) == DeviceSize.tablet;
bool isDesktop(BuildContext context) => deviceSize(context) == DeviceSize.desktop;

double edgePadding(BuildContext context) {
  switch (deviceSize(context)) {
    case DeviceSize.mobile:
      return 16;
    case DeviceSize.tablet:
      return 20;
    case DeviceSize.desktop:
      return 24;
  }
}

double maxContentWidth(BuildContext context) {
  switch (deviceSize(context)) {
    case DeviceSize.mobile:
      return double.infinity;
    case DeviceSize.tablet:
      return 720;
    case DeviceSize.desktop:
      return 960;
  }
}

int gridColumns(BuildContext context, {int mobile = 1, int tablet = 2, int desktop = 3}) {
  switch (deviceSize(context)) {
    case DeviceSize.mobile:
      return mobile;
    case DeviceSize.tablet:
      return tablet;
    case DeviceSize.desktop:
      return desktop;
  }
}

SliverGridDelegateWithFixedCrossAxisCount cardGridDelegate(
  BuildContext context, {
  double aspectRatio = 1.6,
  double spacing = AppSpacing.sm,
  int mobile = 1,
  int tablet = 2,
  int desktop = 3,
}) {
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: gridColumns(context, mobile: mobile, tablet: tablet, desktop: desktop),
    mainAxisSpacing: spacing,
    crossAxisSpacing: spacing,
    childAspectRatio: aspectRatio,
  );
}
