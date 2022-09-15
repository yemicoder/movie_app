import 'package:flutter/material.dart';
import 'package:movie_app/widgets/text.dart';

class Description extends StatelessWidget {

  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body:  Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(bannerurl, fit: BoxFit.cover,),
                      ),),
                  Positioned(
                      child: ModifiedText(text:
                        "    🌟 Average Rating - " + vote! , size: 18,),
                  bottom: 10,),
                ],

              ),
            ),

            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(text: name!=null?name:'Not Loaded', size: 24,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(text: 'Rleasing on - ' + launch_on, size: 14,),

            ),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                SizedBox(width: 20,),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: ModifiedText(
                      text: description, size: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
