import 'package:flutter/material.dart';
import 'package:listadetarefasestado_app/model/back4app/tarefas_back4app_model.dart';
import 'package:listadetarefasestado_app/repositories/back4app/tarefas_back4app_repository.dart';

class TarefaStore extends ChangeNotifier {
  final TarefasBack4appRepository _repository = TarefasBack4appRepository();

  List<TarefaBack4appModel> _tarefas = [];
  bool _loading = false;
  bool _apenasNaoConcluidos = false;

  List<TarefaBack4appModel> get tarefas => _tarefas;
  bool get loading => _loading;
  bool get apenasNaoConcluidos => _apenasNaoConcluidos;

  set apenasNaoConcluidos(bool value) {
    _apenasNaoConcluidos = value;
    carregarTarefas(naoConcluidas: value);
    notifyListeners();
  }

  Future<void> carregarTarefas({bool naoConcluidas = false}) async {
    _loading = true;
    notifyListeners();

    var tarefasModel = await _repository.obterTarefas(naoConcluidas);
    _tarefas = tarefasModel.tarefas;

    _loading = false;
    notifyListeners();
  }

  Future<void> adicionarTarefa(TarefaBack4appModel tarefa) async {
    await _repository.criar(tarefa);
    await carregarTarefas(naoConcluidas: _apenasNaoConcluidos);
  }

  Future<void> atualizarTarefa(TarefaBack4appModel tarefa) async {
    await _repository.atualizar(tarefa);
    await carregarTarefas(naoConcluidas: _apenasNaoConcluidos);
  }

  Future<void> removerTarefa(String objectId) async {
    _tarefas.removeWhere((t) => t.objectId == objectId);
    notifyListeners();

    try {
      await _repository.remover(objectId);
    } catch (e) {
      debugPrint("Erro ao remover do backend: $e");
    }
  }
}
