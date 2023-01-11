import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';

class ImageApp extends StatefulWidget {
  final String? url;
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const ImageApp(
      {Key? key,
      this.url,
      this.radius,
      this.width,
      this.height,
      this.color,
      this.fit})
      : super(key: key);

  @override
  State<ImageApp> createState() => _ImageAppState();
}

class _ImageAppState extends State<ImageApp> {
  @override
  Widget build(BuildContext context) {
    final _url = widget.url ?? '';
    if (_url.isEmpty) {
      return SvgPicture.asset(
        AppPath.imageNotFound,
        color: Colors.white60,
        height: widget.width ?? 24,
        width: widget.height ?? 24,
      );
    }
    if (_url.endsWith('.svg') && !_url.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.radius ?? 0),
        child: SvgPicture.asset(
          _url,
          width: widget.width ?? 16.0,
          height: widget.height ?? 16.0,
          color: widget.color,
          fit: widget.fit ?? BoxFit.scaleDown,
        ),
      );
    }
    if (_url.startsWith('http')) {
      return CachedNetworkImage(
        imageUrl: _url,
        width: widget.width ?? 16.0,
        height: widget.height ?? 16.0,
        color: widget.color ?? Colors.black87,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          size: 16,
        ),
      );
    }
    return Image.asset(
      _url,
      width: widget.width ?? 16.0,
      height: widget.height ?? 16.0,
      color: widget.color,
      fit: widget.fit ?? BoxFit.cover,
    );
  }
}
