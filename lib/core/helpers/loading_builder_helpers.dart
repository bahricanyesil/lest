import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lest/core/extensions/loading_progress_extensions.dart';
import 'package:lest/core/widgets/indicators/percent_indicator.dart';

mixin LoadingBuilderHelpers {
  static Widget networkImageLoading(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    final progressPercentage = loadingProgress?.percent;
    if (progressPercentage == null) return child;
    return PercentIndicator(percentage: progressPercentage);
  }

  static Widget cachedNetworkLoading(
    BuildContext context,
    String text,
    DownloadProgress downloadProgress,
  ) {
    final percent = (downloadProgress.progress ?? 0) * 100;
    return PercentIndicator(percentage: percent);
  }
}
