import 'package:flutter/material.dart';
import 'package:listadetarefasestado_app/model/back4app/tarefas_back4app_model.dart';
import 'package:listadetarefasestado_app/repositories/tarefa_store.dart';
import 'package:provider/provider.dart';

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  final descricaoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<TarefaStore>(context, listen: false).carregarTarefas();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F2F8),
      appBar: AppBar(
        title: Text(
          "Lista de Tarefas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Color(0xFFF3F2F8),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(
              color: Colors.grey.shade600,
              height: 0.5,
            )),
        actions: [
          IconButton(
            onPressed: () {
              descricaoController.text = "";
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      // ignore: deprecated_member_use
                      backgroundColor: Color(0xFFE4E5E9).withOpacity(0.9),
                      title: Text(
                        "Adicionar Tarefa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            textAlign: TextAlign.center,
                            controller: descricaoController,
                            decoration: InputDecoration(
                              hintText: "Digite a descrição",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Color(0xFF0070FA),
                                  width: 1,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: ColoredBox(color: Colors.grey.shade400),
                          ),
                          TextButton(
                              onPressed: () async {
                                Provider.of<TarefaStore>(context, listen: false)
                                    .adicionarTarefa(TarefaBack4appModel.criar(
                                        descricaoController.text, false));
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Salvar",
                                style: TextStyle(
                                  color: Color(0xFF0070FA),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              )),
                          SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: ColoredBox(color: Colors.grey.shade400),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar",
                                  style: TextStyle(
                                    color: Color(0xFF0070FA),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ))),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(Icons.add),
            color: Color(0xFF0070FA),
            iconSize: 35,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Apenas não concluídos",
                  style: TextStyle(fontSize: 17),
                ),
                Consumer<TarefaStore>(builder: (context, store, child) {
                  return Switch(
                    value: store.apenasNaoConcluidos,
                    onChanged: (bool value) {
                      Provider.of<TarefaStore>(context, listen: false)
                          .apenasNaoConcluidos = value;
                    },
                    activeColor: Colors.grey.shade200,
                    activeTrackColor: Colors.green.shade500,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.grey.shade200,
                  );
                })
              ],
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 1,
              width: double.infinity,
              child: ColoredBox(color: Colors.grey.shade400),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Consumer<TarefaStore>(builder: (context, store, child) {
                return ListView.builder(
                  itemCount: store.tarefas.length,
                  itemBuilder: (BuildContext context, int i) {
                    final tarefa = store.tarefas[i];
                    return Dismissible(
                      key: Key(i.toString()),
                      onDismissed: (DismissDirection direction) {
                        Provider.of<TarefaStore>(context, listen: false)
                            .removerTarefa(tarefa.objectId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Tarefa removida com sucesso!"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          title: Text(
                            tarefa.descricao,
                            style: TextStyle(fontSize: 16),
                          ),
                          trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) {
                              tarefa.concluido = value;
                              store.atualizarTarefa(tarefa);
                            },
                            activeColor: Colors.grey.shade200,
                            activeTrackColor: Colors.green.shade500,
                            inactiveThumbColor: Colors.grey.shade300,
                            inactiveTrackColor: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
