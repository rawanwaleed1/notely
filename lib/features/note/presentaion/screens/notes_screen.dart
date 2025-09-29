import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notely/core/routes/app_routes.dart';
import 'package:notely/core/themes/app_assets.dart';
import 'package:notely/core/themes/app_colors.dart';
import 'package:notely/features/note/data/service/note_service.dart';
import 'package:notely/generated/locale_keys.g.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
final stream = NoteService().getNotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    leading: IconButton(onPressed: (){},icon: Icon(Icons.menu)),
    actions:[
      IconButton(onPressed: (){},icon: Icon(Icons.search))],
      centerTitle: true,
      title: Text(
        LocaleKeys.notesScreen_title.tr(),
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ),
    body: StreamBuilder(
    stream: stream,builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text(snapshot.error.toString()));
      } else if (snapshot.data?.isEmpty == true) {
        return Center(child: _Empty());
      } else {
      return GridView.builder(
      itemCount: snapshot.data?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10
      ),
      itemBuilder: (context,index) {
        final note = snapshot.data![index];
        return InkWell(
          onTap: () {
            context.push(AppRoutes.upsertNotesScreen, extra: note);
          },
          child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(note.title, style: TextStyle(fontSize: 16)),
             Text(note.description, style: TextStyle(fontSize: 12)),
            ],
            ),
          ),
          ),
        );
      },
      );
      }
      } ,


    ),
    floatingActionButton: FloatingActionButton(
    onPressed: (){
    context.push(AppRoutes.upsertNotesScreen);
    },
    child: Icon(Icons.add),
    ),
    );
  }
}



class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
      Image.asset(AppAssets.empty),
      Text(LocaleKeys.notesScreen_emptyTitle.tr(),
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
      ),
      SizedBox(height: 10),
        Text(LocaleKeys.notesScreen_emptyDescription.tr(),
          style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.darkLight,
          ),
            textAlign: TextAlign.center
        ),
        Spacer(),
        ElevatedButton(
        onPressed: (){
        context.push(AppRoutes.upsertNotesScreen);
        },
        child:Text(LocaleKeys.notesScreen_createNote.tr()),
        ),
        SizedBox(height: 40,),

      ],
      ),
    );
  }
}
