import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gamerz/models/valorant/agents.dart';
import 'package:gamerz/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/valorant/agents.dart';

class AgentDetails extends StatelessWidget {
  static const routeName = '/agent-details';

  const AgentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final agent = Provider.of<AgentsProvider>(context).selectedAgent.first;

    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                // Use AspectRatio for image scaling
                aspectRatio: 0.7, // Adjust based on image aspect ratio
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(agent.background),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(agent.fullPortrait),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            agent.displayName,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'valorant',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(agent.role.displayIcon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                agent.role.displayName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'valorant',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  agent.description,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )),
          const SizedBox(height: 20),
          const Text(
            'Abilities',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'valorant',
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: agent.abilities.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _buildAbilityWidget(agent.abilities[index], context),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Recruitment',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'valorant',
            ),
          ),
          const SizedBox(height: 20),
          if (agent.recruitmentData != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  agent.recruitmentData.startDate,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ],
      )),
    );
  }
}

Widget _buildAbilityWidget(Abilities ability, BuildContext context) {
  double width = MediaQuery.of(context).size.width - 100;
  return Row(
    children: [
      Container(
        alignment: Alignment.topCenter,
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(ability.displayIcon ?? ''),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ability.displayName ?? '',
            style: const TextStyle(
                fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width,
            child: Text(
              ability.description ?? '',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ],
  );
}
