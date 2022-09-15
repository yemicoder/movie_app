import 'package:flutter/material.dart';
import 'package:movie_app/widgets/description.dart';
import 'package:movie_app/widgets/text.dart';

// ignore: must_be_immutable
class TvShow extends StatelessWidget {
  List? tvShow;
  TvShow({Key? key, this.tvShow}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: 'Popular TV Show Movies', size: 20, color: Colors.white,),
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: tvShow!.length,

              itemBuilder: (context, index) =>

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              Description(name: tvShow![index]['name'],
                                  description: tvShow![index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+tvShow![index]['poster_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500'+tvShow![index]['poster_path'],
                                  vote: tvShow![index]['vote_average'].toString(),
                                  launch_on: tvShow![index]['first_air_date'])));
                        },

                          child: Column(
                            children: [
                              Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage('https://image.tmdb.org/t/p/w500'+tvShow![index]['poster_path']),
                                  ),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                              ),

                              const SizedBox(height: 10,),

                              Expanded(
                                  child: ModifiedText(
                                    text: tvShow![index]['name']!=null?tvShow!
                                    [index]['name']:'loading',
                                    color: Colors.white,
                                    size: 10,)),
                            ],
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
