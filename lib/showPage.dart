import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class showPage extends StatefulWidget {
  final title;
  showPage({Key? key, this.title}) : super(key: key);

  @override
  State<showPage> createState() => _showPageState();
}

class _showPageState extends State<showPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('clips/${widget.title}Clip.mp4')
      ..addListener(()=> setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title.toString().toUpperCase()),
        ),
        body: Center(
          child: RawKeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKey: (RawKeyEvent event){
              if(event.isKeyPressed(LogicalKeyboardKey.arrowUp)){
                setState(() {
                  if(_controller.value.isPlaying){
                    _controller.pause();
                  }else{
                    _controller.play();
                  }
                });
              }else if(event.isKeyPressed(LogicalKeyboardKey.arrowDown)){
                setState(() {
                  if(_controller.value.isPlaying){
                    _controller.pause();
                  }else{
                    _controller.play();
                  }
                });
              }
            },
            child: Center(
              child:
              _controller.value.isInitialized ?  VideoPlayer(_controller) : CircularProgressIndicator(color: Colors.deepPurple,),
            ),
          ),)
        );
  }
}
