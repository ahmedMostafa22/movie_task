import 'package:flutter/material.dart';

import '../Constants/assets_paths.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget(this.exception, this.imagePath,
      {Key? key, required this.onRetry})
      : super(key: key);
  final Object exception;
  final String imagePath;
  final void Function() onRetry;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath,
                width: MediaQuery.of(context).size.width * .2,
                fit: BoxFit.cover,
                color: imagePath == AssetPaths.noInternet
                    ? Theme.of(context).primaryColor
                    : null),
            const SizedBox(
              height: 8,
            ),
            Text(
              exception
                  .toString()
                  .substring(exception.toString().indexOf(':') + 1),
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: onRetry,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Retry',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
