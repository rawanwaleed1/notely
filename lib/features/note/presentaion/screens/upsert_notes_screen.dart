import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/themes/app_colors.dart';
import 'package:notely/features/note/data/models/note_model.dart';
import 'package:notely/features/note/data/service/note_service.dart';
import 'package:notely/generated/locale_keys.g.dart';

class UpsertNotesScreen extends StatefulWidget {
  const UpsertNotesScreen({super.key, this.note});

  final NoteModel? note;

  @override
  State<UpsertNotesScreen> createState() => _UpsertNotesScreenState();
}

class _UpsertNotesScreenState extends State<UpsertNotesScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _service = NoteService();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note?.title);
    descriptionController = TextEditingController(
      text: widget.note?.description,
    );

    print(titleController.text);
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> execute() {
      if (widget.note != null) {
        return _service.updateNote(
          NoteModel(
            id: widget.note?.id ?? '',
            title: titleController.text,
            description: descriptionController.text,
          ),
        );
      }
      return _service.createNote(
        NoteModel(
          title: titleController.text,
          description: descriptionController.text,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          widget.note != null
              ? LocaleKeys.notesScreen_editNote.tr()
              : LocaleKeys.notesScreen_createNote.tr(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.red),
                    ),
                    hintText: 'Enter a Title...',
                    filled: false,
                    fillColor: Colors.transparent,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: descriptionController,
                  maxLines: 25,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.red),
                    ),
                    filled: false,
                    fillColor: Colors.transparent,
                    hintText: 'Enter a Description...',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final isSuccess = await execute();
                      if (isSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added Successfully'),
                            backgroundColor: AppColors.green,
                          ),
                        );
                        context.pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Something Went Wrong !'),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.note != null
                        ? LocaleKeys.notesScreen_editNote.tr()
                        : LocaleKeys.notesScreen_createNote.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
