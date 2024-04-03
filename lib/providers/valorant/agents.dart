import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/valorant/agents.dart' as model;

class AgentsProvider extends ChangeNotifier {
  final List<model.Agents> _agents = [];
  final _selectedAgent = [];

  Dio dio = Dio();

  List<model.Agents> get agents {
    return [..._agents];
  }

  get selectedAgent {
    return [..._selectedAgent];
  }

  model.Agents findById({required String agentId}) {
    // Find the agent by ID
    //store the agent in the selectedAgent

    final agent = _agents.firstWhere((d) => d.uuid == agentId);
    print('Agent: ${agent.displayName}');
    _selectedAgent.clear(); // Clear previous selection (optional)
    _selectedAgent.add(agent);
    notifyListeners();
    return agent;
  }

  Future<void> fetchAgents({
    required BuildContext context,
  }) async {
    const url = 'https://valorant-api.com/v1/agents';
    final response = await dio.get(url);
    final data = response.data['data'];

    _agents.clear();
    List<model.Agents> agents = [];

    for (final agent in data) {
      agents.add(model.Agents.fromJson(agent));
    }

    _agents.addAll(agents);

    notifyListeners();
  }
}
