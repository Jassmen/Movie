/// 1 - Add screen Util
/// 2 - refactor UI Code
//// 3 - Details Page
/// 4 - Align Movie Name with Image
/// 5 - Add HeightBox , WidthBox Widgets  and use it in all the app
/// 6 - Remove all Commented Code
/// 7 - Remove unused prints
/// late Future<void> initializeVideoPlayerFuture;
/*       child: FutureBuilder(
         future: initializeVideoPlayerFuture,
         builder: (context,snapshot){
           if( snapshot.connectionState == ConnectionState.done){
             return Stack(
               children: [
                 AspectRatio(
                     aspectRatio: controller.value.aspectRatio,
                   child: VideoPlayer(controller),
                 ),
                 Center(
                   child: IconButton(
                     onPressed: (){
                       setState(() {
                         controller.value.isPlaying?
                             controller.pause(): controller.play();
                       });
                     },
                     icon: Icon(Icons.play_circle_outline_outlined),
                   ),
                 )
               ],
             );
           }else{
             return Center(
               child: CircularProgressIndicator(),
             );
           }
         },
       )
    );*/


