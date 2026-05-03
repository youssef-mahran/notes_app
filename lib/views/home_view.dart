import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/components/add_butom_sheet.dart';
import 'package:notes_app/components/constants.dart';
import 'package:notes_app/components/custom_app_bar.dart';
import 'package:notes_app/components/list_view_items.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Notes',
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
      body: const ListViewItems(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: KPrimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) => BlocProvider(
              create: (context) => AddNoteCubit(),
              child: AddBottomshet(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.black, size: 40),
      ),
    );
  }
}
