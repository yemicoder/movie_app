import 'package:flutter/material.dart';
import 'package:movie_app/widgets/description.dart';
import 'package:movie_app/widgets/text.dart';

// ignore: must_be_immutable
class TopRated extends StatelessWidget {
  List? topRated;
  TopRated({Key? key, this.topRated}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(10),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(text: 'Top Rated', size: 20, color: Colors.white,),
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: topRated!.length,

              itemBuilder: (context, index) =>

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              Description(name: topRated![index]['name'],
                                  description: topRated![index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500'+topRated![index]['poster_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500'+topRated![index]['poster_path'],
                                  vote: topRated![index]['vote_average'].toString(),
                                  launch_on: topRated![index]['first_air_date'])));
                        },
                        child: Container(
                          height: 250,
                          width: 120,
                          child: Column(
                            children: [
                              Image(image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500'+topRated![index]['poster_path'],
                              ),),

                              const SizedBox(height: 10,),

                              Expanded(
                                  child: ModifiedText(
                                    text: topRated![index]['name'],
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
