import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/theme/app_color.dart';

class MovieCard extends StatelessWidget {
  final String name;
  final String image;
  final String genre;
  final String ratings;
  const MovieCard({super.key, required this.name, required this.image, required this.genre, required this.ratings});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        double imageWidth = constraints.maxWidth * 0.38;
        return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 130,
                      padding: EdgeInsets.only(
                          left: imageWidth + 30, right: 15, top: 15, bottom: 15),
                      margin:  EdgeInsets.only(top: imageWidth * 0.6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            genre.replaceAll(',', ' |'),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColor.greyColor, fontSize: 10),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                              color:double.parse(ratings) > 7.0 ? AppColor.greenColor : AppColor.blueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "$ratings IMDB",
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          image,
                          width: imageWidth,
                          height: imageWidth * 1.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }
    );
  }
}
