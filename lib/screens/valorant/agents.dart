import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gamerz/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/valorant/agents.dart';
import 'agent_details.dart';

class Agents extends StatefulWidget {
  const Agents({super.key});
  static const routeName = '/agents';

  @override
  State<Agents> createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  @override
  void initState() {
    _fetchData(context);
    super.initState();
  }

  Future<void> _fetchData(BuildContext context) async {
    await Provider.of<AgentsProvider>(context, listen: false)
        .fetchAgents(context: context);

    try {
      if (!mounted) return;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final agents = Provider.of<AgentsProvider>(context).agents;
    return Scaffold(
      appBar: const MyAppBar(),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemCount: agents.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      final agentId = agents[index].uuid;
                      Provider.of<AgentsProvider>(context, listen: false)
                          .findById(agentId: agentId);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const AgentDetails();
                      }));
                    },
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            agents[index].background != ''
                                ? AspectRatio(
                                    aspectRatio: 1,
                                    child: CachedNetworkImage(
                                      imageUrl: agents[index].background,
                                      fit: BoxFit.cover,
                                    ))
                                : AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      color: Colors.black,
                                    )),
                            Center(
                                child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: CachedNetworkImage(
                                    imageUrl: agents[index].displayIcon,
                                    fit: BoxFit.cover,
                                  )),
                            ))
                          ],
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text(
                            agents[index].displayName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'valorant',
                            ),
                          ),
                        ),
                      ],
                    ));
              },
            )),
      ),
    );
  }
}
