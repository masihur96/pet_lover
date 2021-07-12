import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_lover/custom_classes/DatabaseManager.dart';
import 'package:pet_lover/custom_classes/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddAnimal extends StatefulWidget {
  @override
  _AddAnimalState createState() => _AddAnimalState();
}

class _AddAnimalState extends State<AddAnimal> {
  TextEditingController _petNameController = TextEditingController();
  TextEditingController _colorController = TextEditingController();
  TextEditingController _genusController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  bool _isLoading = false;

  File? _file;

  File? _image;
  String? animalsImageLink;
  String? animalsVideoLink;
  String? imageLink;
  String? _currentMobileNo;

  File? _croppedImage;
  bool profileImageUploadVisibility = false;
  VideoPlayerController? controller;

  Future<String?> getCurrentMobileNo() async {
    final prefs = await SharedPreferences.getInstance();
    _currentMobileNo = prefs.getString('mobileNo');
    print('Current Mobile no is $_currentMobileNo');
    return _currentMobileNo;
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Add Animal",
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * .05,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: bodyUI(context),
    );
  }

  //body demo design
  Widget bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //container for image or video loading
              width: size.width,
              height: size.width * .7,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
              child: Center(
                child: _image != null || _file != null
                    ? Container(
                        width: size.width,
                        height: size.width * .7,
                        alignment: Alignment.topCenter,
                        child:
                            _image != null ? Image.file(_image!) : buildVideo())
                    : Text(
                        'No image or video selected!',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width * .05,
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: size.width * .02,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * .04),
              child: Row(
                children: [
                  ElevatedButton(
                      //video pick button
                      onPressed: () async {
                        final file = await pickVideoFile();
                        controller = VideoPlayerController.file(file)
                          ..addListener(() => setState(() {}))
                          ..setLooping(true)
                          ..initialize().then((_) {
                            controller!.play();
                            setState(() {
                              _file = file;
                              _image = null;
                            });
                          });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.video_camera_front,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .03,
                          ),
                          Text(
                            'Video',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          )
                        ],
                      )),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  ElevatedButton(
                      //image pick button
                      onPressed: () async {
                        _cameraGalleryBottomSheet(context);

                        print(_file);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width * .03,
                          ),
                          Text(
                            'Photo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.fromLTRB(size.width * .04, size.width * .06,
                  size.width * .04, size.width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Animal Details',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * .05,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.width * .05),
                  Text(
                    'Pet name',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for pet name input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(
                        TextInputType.text, 1, _petNameController),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Color',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for pet color input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(
                        TextInputType.text, 1, _colorController),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Genus',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for genus input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(
                        TextInputType.text, 1, _genusController),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Gender',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for gender input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(
                        TextInputType.text, 1, _genderController),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Text(
                    'Age',
                    style: TextStyle(fontSize: size.width * .042),
                  ),
                  SizedBox(
                    height: size.width * .02,
                  ),
                  Container(
                    //textformfield for pet age input
                    width: size.width,
                    padding: EdgeInsets.only(
                        left: size.width * .04,
                        right: size.width * .04,
                        top: size.width * .02,
                        bottom: size.width * .02),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey)),
                    child: textFormFieldBuilder(
                        TextInputType.text, 1, _ageController),
                  ),
                  SizedBox(
                    height: size.width * .04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          //Cancel button
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          )),
                      SizedBox(
                        width: size.width * .04,
                      ),
                      ElevatedButton(
                          //save button
                          onPressed: () {
                            final String uuid = Uuid().v1();
                            setState(() async {
                              _currentMobileNo = await getCurrentMobileNo();
                              uploadData(uuid, _currentMobileNo!);
                            });
                            _emptyFildCreator();
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * .038),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadData(String uuid, String _currentMobileNo) async {
    if (_image != null || _file != null) {
      setState(() => _isLoading = true);
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('Animals')
          .child(uuid);

      if (_image != null) {
        firebase_storage.UploadTask storageUploadTask =
            storageReference.putFile(_image!);

        firebase_storage.TaskSnapshot taskSnapshot;
        storageUploadTask.then((value) {
          taskSnapshot = value;
          taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl) {
            final downloadUrl = newImageDownloadUrl;
            setState(() {
              animalsImageLink = downloadUrl;
            });
            _submitData(uuid, _currentMobileNo);
          });
        });
      } else {
        firebase_storage.UploadTask storageUploadTask =
            storageReference.putFile(_file!);

        firebase_storage.TaskSnapshot taskSnapshot;
        storageUploadTask.then((value) {
          taskSnapshot = value;
          taskSnapshot.ref.getDownloadURL().then((newImageDownloadUrl) {
            final downloadUrl = newImageDownloadUrl;
            setState(() {
              animalsVideoLink = downloadUrl;
            });
            _submitData(uuid, _currentMobileNo);
          });
        });
      }
    } else {
      print('Please Select File');
    }
  }

  Future<void> _submitData(String uuid, String _currentMobileNo) async {
    DateTime date = DateTime.now();
    String dateData = '${date.month}-${date.day}-${date.year}';
    // if (_petNameController.text.isEmpty) {
    //   print('Select Name');
    // } else {
    // setState(() => _isLoading = true);
    Map<String, String> map = {
      'petName': _petNameController.text,
      'color': _colorController.text,
      'genus': _genusController.text,
      'gender': _genderController.text,
      'age': _ageController.text,
      'mobile': _currentMobileNo,
      'photo': _image != null ? animalsImageLink! : '',
      'video': _file != null ? animalsVideoLink! : '',
      'followers': '',
      'comments': '',
      'date': dateData,
      'id': uuid
    };
    await DatabaseManager().addAnimalsData(map).then((value) {
      if (value) {
        _emptyFildCreator();
        //    setState(() => _isLoading = false);
      } else {
        //   setState(() => _isLoading = false);
      }
    });
    // }
  }

  _emptyFildCreator() {
    _petNameController.clear();
    _colorController.clear();
    _genusController.clear();
    _genderController.clear();
    _ageController.clear();
  }

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(
              child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => controller!.value.isPlaying
                ? controller!.pause()
                : controller!.play(),
            child: Stack(
              children: <Widget>[
                buildPlay(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: buildIndicator(),
                ),
              ],
            ),
          )),
        ],
      );
  Widget buildPlay() => controller!.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller!,
        allowScrubbing: true,
      );

  Future<File> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    return File(result!.files.single.path.toString());
  }

  void _cameraGalleryBottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: size.width * .3,
            color: Color(0xff737373),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size.width * .03),
                      topRight: Radius.circular(size.width * .03))),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(FontAwesomeIcons.camera),
                    title: Text('Camera'),
                    onTap: () {
                      setState(() {
                        _getCameraImage();
                        _file = null;
                        Navigator.pop(context);
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(FontAwesomeIcons.images),
                    title: Text('Gallery'),
                    onTap: () {
                      setState(() {
                        _getGalleryImage();
                        _file = null;
                        Navigator.pop(context);
                      });
                    },
                  )
                ],
              ),
            ),
          );
        }).then((value) {
      profileImageUploadVisibility = true;
    });
  }

  Future _getGalleryImage() async {
    final _originalImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (_originalImage != null) {
      _croppedImage = await ImageCropper.cropImage(
          sourcePath: _originalImage.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          androidUiSettings: AndroidUiSettings(
            lockAspectRatio: false,
          )).then((value) {
        setState(() {
          _image = value;
        });
      });
    }
  }

  Future _getCameraImage() async {
    final _originalImage =
        await ImagePicker().getImage(source: ImageSource.camera);

    if (_originalImage != null) {
      _croppedImage = await ImageCropper.cropImage(
          sourcePath: _originalImage.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          androidUiSettings: AndroidUiSettings(
            lockAspectRatio: false,
          )).then((value) {
        setState(() {
          _image = value;
        });
      });
    }
  }

  //textformfile demo design
  Widget textFormFieldBuilder(TextInputType keyboardType, int maxLine,
      TextEditingController textEditingController) {
    return TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        maxLines: maxLine);
  }
}
