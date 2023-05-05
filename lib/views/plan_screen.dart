import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stopwatch/models/data_layer.dart';
import 'package:stopwatch/plan_provider.dart';
import '../models/plan.dart';


class PlanScreen extends StatefulWidget {
  final Plan? plan;
  const PlanScreen({Key? key, this.plan}) : super(key: key);
  @override
  State createState() => _PlanScreenState();
}


class _PlanScreenState extends State<PlanScreen> {
  Plan get plan => widget.plan!;
  late ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    //final plan = PlanProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Master Plan')),
      body: Column(
        children: [
          Expanded(child: _buildList()),
          SafeArea(child: Text(plan.completenessMessage))
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }
  Widget _buildAddTaskButton() {
    //final plan = PlanProvider.of(context);
  return FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: () {
      setState(() {
        plan.tasks.add(Task());
        });
      },
    );
  }
  Widget _buildList() {
    //final plan = PlanProvider.of(context);
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
    );
  }
  Widget _buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            task.complete = selected;
          });
        }
      ),
      title: TextFormField(
        initialValue: task.description,
        onFieldSubmitted: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
