import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  String _choosenValue = 'Public';
  List<String> _groupPrivacies = ['Public', 'Private'];

  File? _image;
  ImagePicker imagePicker = ImagePicker();
  String _isNull = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _bodyUI(context)),
    );
  }

  Future _getCameraImage() async {
    final _originalImage =
        await ImagePicker().getImage(source: ImageSource.camera);

    if (_originalImage != null) {
      File? _croppedImage = await ImageCropper.cropImage(
          sourcePath: _originalImage.path,
          aspectRatio: CropAspectRatio(ratioX: 1.5, ratioY: 1),
          androidUiSettings: AndroidUiSettings(
            lockAspectRatio: false,
          ));

      setState(() {
        _image = _croppedImage;
      });
    }
  }

  Future _getGalleryImage() async {
    final _originalImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (_originalImage != null) {
      File? _croppedImage = await ImageCropper.cropImage(
          sourcePath: _originalImage.path,
          aspectRatio: CropAspectRatio(ratioX: 1.5, ratioY: 1),
          androidUiSettings: AndroidUiSettings(
            lockAspectRatio: false,
          ));

      setState(() {
        _image = _croppedImage;
      });
    }
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
          width: size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * .08,
                    right: size.width * .08,
                    top: size.width * .06),
                child: Container(
                  height: size.width * .6,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black, width: size.width * .001),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: _image == null
                            ? Center(
                                child: Text(
                                  'Upload a group photo',
                                  style: TextStyle(fontSize: size.width * .05),
                                ),
                              )
                            : Container(
                                height: size.width * .6,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.fill),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            _cameraGalleryBottomSheet(context);
                          },
                          radius: 10,
                          child: Container(
                            width: size.width * .1,
                            height: size.width * .1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[500],
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.width * .04,
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.only(
                  left: size.width * .08,
                  right: size.width * .08,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: size.width * .02,
                        ),
                        Text(
                          'Group name',
                          style: TextStyle(fontSize: size.width * .042),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.width * .02,
                    ),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: size.width * .04,
                          right: size.width * .04,
                          top: size.width * .02,
                          bottom: size.width * .02),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.grey)),
                      child: textFormFieldBuilder(TextInputType.text, 1),
                    ),
                    SizedBox(height: size.width * .04),
                    Row(
                      children: [
                        Icon(
                          Icons.security,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: size.width * .02,
                        ),
                        Text(
                          'Privacy',
                          style: TextStyle(fontSize: size.width * .042),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.width * .02,
                    ),
                    Container(
                        width: size.width,
                        height: size.width * .095,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: EdgeInsets.only(
                            left: size.width * .04, right: size.width * .04),
                        child: Container(
                          child: DropdownButton<String>(
                            value: _choosenValue,
                            isExpanded: true,
                            underline: SizedBox(),
                            onChanged: (value) {
                              setState(() {
                                _choosenValue = value.toString();
                              });
                            },
                            items: _groupPrivacies
                                .map((item) => DropdownMenuItem<String>(
                                      child: Text(item),
                                      value: item,
                                    ))
                                .toList(),
                          ),
                        )),
                    SizedBox(height: size.width * .04),
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: size.width * .02,
                        ),
                        Text(
                          'Description',
                          style: TextStyle(fontSize: size.width * .042),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.width * .02,
                    ),
                    Container(
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: size.width * .04,
                          right: size.width * .04,
                          top: size.width * .02,
                          bottom: size.width * .02),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.grey),
                      ),
                      child: textFormFieldBuilder(TextInputType.multiline, 6),
                    ),
                    SizedBox(
                      height: size.width * .04,
                    ),
                    Container(
                      height: size.width * .12,
                      // width: size.width,
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Create Group',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * .045,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget textFormFieldBuilder(TextInputType keyboardType, int maxLine) {
    return Column(
      children: [
        TextFormField(
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
            maxLines: maxLine),
      ],
    );
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
                        Navigator.pop(context);
                      });
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
