import 'package:flutter/material.dart';

import 'build_text.dart';
import 'movie.dart';

class MovieCard extends StatelessWidget {
  Movie movie ;
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
   // PageController pageController=PageController(viewportFraction: .8);
    Size size = MediaQuery.of(context).size;
    var cardWidth = size.width - 70;
    var cardHeight = size.height*.65;
    return Stack(
      children: [
       /// buildBackgroundImage(movie.imageBlur,size),
        ///buildToolbar(size),
        buildMovieImage(cardWidth,cardHeight,size,movie.imageTop),
       /// buildMovieText(movie.name,movie.rate,size,movie.description),

      ],
    );
  }
  Widget buildBackgroundImage(String img, Size size){
    return Container(
        height:size.height,
        width:size.width,
        child: Image.asset(
            img,fit:BoxFit.cover));
  }
  Widget buildToolbar(Size size ){
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: SizedBox(
        height: 150,
        child: InkWell(
          onTap: (){},
          child: Row(
            children: [
              SizedBox(width: 20,),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children:[
                 Text('Top Rated', style:TextStyle(
                     color:Colors.white,
                     fontSize: 30,
                     fontWeight:FontWeight.bold
                 )),
                 Icon(Icons.arrow_drop_down_rounded,color: Colors.white,size: 30,)
                 ]),

               Spacer(),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.search)
              ),
              SizedBox(width: 20,),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildMovieImage(double cardWidth, double cardHeight, Size size,String img){
    return Positioned(
      bottom: size.height*.20, //TODO:
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
          width:cardWidth ,
          height: cardHeight,
        child: Image.asset(img,fit: BoxFit.fitWidth,),


      ),
    );

  }
  Widget buildMovieText(String movieName,double rate,Size size,String description){
    return Positioned(
      bottom: size.height*.20 -100,//TODO
      child: Container(
        width:size.width,
        padding:const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
               SizedBox(width: 20,),
                AppText(text: movieName,fontWeight: FontWeight.bold,textSize: 30,),
                Spacer(),
                AppText(text: rate.toString(),fontWeight: FontWeight.bold,textSize: 20,),
                AppText(text: '/10',textSize: 20,color: Colors.white.withOpacity(.5),),
                SizedBox(width: 20,),

              ],
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
                child: AppText(text: description))
          ],
        ),
      ),
    );
  }

}



