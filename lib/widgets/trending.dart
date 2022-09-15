import 'package:flutter/material.dart';
import 'package:movie_app/widgets/description.dart';
import 'package:movie_app/widgets/text.dart';

// ignore: must_be_immutable
class TrendingMovies extends StatelessWidget {
  List? trending;
  TrendingMovies({Key? key, this.trending}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      
        padding: const EdgeInsets.all(10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ModifiedText(text: 'Trending movies', size: 20, color: Colors.white,),
            Container(
              padding: const EdgeInsets.only(top: 10),
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,

                    itemCount: trending!.length,

                    itemBuilder: (context, index) =>

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            Description(name: trending![index]['title'],
                                description: trending![index]['overview'],
                                bannerurl: 'https://image.tmdb.org/t/p/w500'+trending![index]['backdrop_path'],
                                posterurl: 'https://image.tmdb.org/t/p/w500'+trending![index]['poster_path'],
                                vote: trending![index]['vote_count'].toString(),
                                launch_on: trending![index]['release_date'])));
                          },
                            child: Container(
                              height: 250,
                              width: 120,
                              child: Column(
                                children: [
                                  Image(image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+trending![index]['poster_path'],
                                  ),),

                                  const SizedBox(height: 10,),

                                  Expanded(
                                      child: ModifiedText(
                                        text: trending![index]['title'],
                                        color: Colors.white,
                                        size: 10,)),
                                ],
                              ),
                            ),
                    ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                ),
            ),
          ],
        ),
    );
  }
}
