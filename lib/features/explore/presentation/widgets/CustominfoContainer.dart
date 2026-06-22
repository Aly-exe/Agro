import 'package:agro/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer(
      {super.key,
      required this.imageLink,
      required this.description,
      required this.title});
  final String imageLink;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Container(
              //   height: 90,
              //   width: 85,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       image: DecorationImage(
              //           image: CachedNetworkImageProvider(imageLink,

              //           ),
              //           fit: BoxFit.fill)),
              // ),

              CachedNetworkImage(
                imageUrl: imageLink,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 90,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => Container(
                  height: 90,
                  width: 85,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 90,
                  width: 85,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.broken_image),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // Title And Description
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    // Description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
