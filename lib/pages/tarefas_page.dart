import 'package:flutter/material.dart';

class TarefasPage extends StatelessWidget {
  const TarefasPage({super.key});

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
            onPressed: () {},
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
                Switch(
                  value: true,
                  onChanged: (bool value) {},
                  activeColor: Colors.grey.shade200,
                  activeTrackColor: Colors.green.shade500,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade200,
                )
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
              child: ListView.builder(
                itemCount: 11,
                itemBuilder: (BuildContext context, int i) {
                  return Dismissible(
                    key: Key(i.toString()),
                    onDismissed: (DismissDirection direction) {},
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        title: Text(
                          "Tarefa $i",
                          style: TextStyle(fontSize: 16),
                        ),
                        trailing: Switch(
                          value: true,
                          onChanged: (bool value) {},
                          activeColor: Colors.grey.shade200,
                          activeTrackColor: Colors.green.shade500,
                          inactiveThumbColor: Colors.grey.shade300,
                          inactiveTrackColor: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
