import 'dart:convert';
import 'dart:io';

import 'package:conferance_app/providers/event_provider.dart';
import 'package:conferance_app/services/http_services/event_services/event_services.dart';
import 'package:conferance_app/utils/text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../practice/practice_event_model.dart';
import '../../../widgets/custom_loading_button.dart';

class CreateBasicEvent extends StatefulWidget {
  const CreateBasicEvent({super.key});

  @override
  State<CreateBasicEvent> createState() => _CreateBasicEventState();
}

class _CreateBasicEventState extends State<CreateBasicEvent> {
  final _formKey = GlobalKey<FormState>();
  SizedBox space = SizedBox(
    height: 15.h,
  );

  File? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  uploadImage(File image) async {
    var bytes = await rootBundle.load(_pickedImage!.path);
    var buffer = bytes.buffer;
    var imageBytes =
        buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    var base64Image = base64Encode(imageBytes);
  }

  TextEditingController titleController = TextEditingController(text: 'titt');

  TextEditingController descriptionController =
      TextEditingController(text: 'desc');

  TextEditingController addressController = TextEditingController(text: 'add');

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Event"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Consumer<EventProvider>(
              builder: (context, eventPrvInstance, child) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space,
                  InkWell(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: Container(
                      color: Colors.red,
                      child: _pickedImage == null
                          ? Icon(Icons.add_a_photo)
                          : Image.file(
                              _pickedImage!,
                              fit: BoxFit.cover,
                            ),
                      height: 200.h,
                      width: 1.sw,
                    ),
                  ),
                  space,
                  _fieldsHeading('Title'),
                  space,
                  TextFormField(
                    controller: titleController,
                    decoration: TextFeildDecorationClass.inputDecoration(
                        context,
                        hintText: 'Enter Title'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title text';
                      }
                      return null;
                    },
                  ),
                  space,
                  _fieldsHeading('Description'),
                  space,
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 10,
                    decoration: TextFeildDecorationClass.inputDecoration(
                        context,
                        hintText: 'Enter Description'),
                  ),
                  space,
                  _fieldsHeading('Address'),
                  space,
                  TextFormField(
                    controller: addressController,
                    maxLines: 5,
                    decoration: TextFeildDecorationClass.inputDecoration(
                        context,
                        hintText: 'Enter Address'),
                  ),
                  space,
                  _fieldsHeading('Start Date'),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    title: Text(eventPrvInstance.startDate.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.date_range_rounded),
                      onPressed: () {
                        eventPrvInstance.startDateFunction(context);
                      },
                    ),
                  ),
                  space,
                  _fieldsHeading('End Date'),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    title: Text(eventPrvInstance.endDate.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.date_range_rounded),
                      onPressed: () {
                        eventPrvInstance.endDateFunction(context);
                      },
                    ),
                  ),
                  CustomLoadingButton(
                    text: 'Save',
                    borderRadius: 10.r,
                    height: 60.h,
                    width: 1.sw,
                    condition: eventPrvInstance.isLoading,
                    isLoading: eventPrvInstance.isLoading,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        //addImage is a dummy function
                        // await EventServices.addImage(
                        //     {'title': "aaaaa"}, _pickedImage!.path);
                        eventPrvInstance.getDaysInBetween();

                        if (eventPrvInstance.daysSchedule.isNotEmpty &&
                            eventPrvInstance.daysSchedule.length > 0) {
                          if (eventPrvInstance.listOfDays.isNotEmpty &&
                              eventPrvInstance.listOfDays.length > 0) {
                            EventModelData eventModelData = EventModelData(
                                address: addressController.text.trim(),
                                dateOfEvent: eventPrvInstance.listOfDays,
                                title: titleController.text.trim(),
                                description: descriptionController.text.trim(),
                                daySchedule: eventPrvInstance.daysSchedule);

                            print(eventModelData.address.toString());
                            await eventPrvInstance.uploadDataToServer(
                                eventModelData, _pickedImage!);
                          }
                        }
                      }
                    },
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  _fieldsHeading(String? title) {
    return Text(
      title ?? '',
      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
    );
  }
}
