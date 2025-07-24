import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listadetarefasestado_app/pages/tarefas_page.dart';
import 'package:listadetarefasestado_app/repositories/tarefa_store.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TarefaStore>(create: (_) => TarefaStore(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
        home: TarefasPage(),
      ),
    );
  }
}