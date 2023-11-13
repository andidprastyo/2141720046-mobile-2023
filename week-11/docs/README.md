# Week 11 - Basic State Management

Nama : 
- Andi Dwi Prastyo
- 2141720046
- 06
- Kelas TI-3H

# Praktikum 1

## Model task.dart

```dart
class Task {
  final String description;
  final bool complete;

  const Task({this.description = '', this.complete = false});
}

```

## File plan.dart

```dart
import 'task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;
  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}

```

## File data_layer.dart
```dart
export 'plan.dart';
export 'task.dart';
```

## Move file to main.dart
```dart
import 'package:flutter/material.dart';

import './views/plan_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const PlanScreen(),
    );
  }
}
```

## plan_screen.dart

```dart
import 'package:flutter/material.dart';

import '../models/data_layer.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  late Plan _plan;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
    _plan = widget.plan;
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(_plan.name)),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          Plan currentPlan = plans.firstWhere((p) => p.name == _plan.name);
          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(
        context,
      ),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = _plan;
        int planIndex =
            planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
        List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
          ..add(const Task());
        planNotifier.value = List<Plan>.from(planNotifier.value)
          ..[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
        _plan = Plan(
          name: currentPlan.name,
          tasks: updatedTasks,
        );
      },
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            Plan currentPlan = _plan;
            int planIndex = planNotifier.value
                .indexWhere((p) => p.name == currentPlan.name);
            List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: task.description,
                complete: selected ?? false,
              );

            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: updatedTasks,
              );

            _plan = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            Plan currentPlan = _plan;
            int planIndex = planNotifier.value
                .indexWhere((p) => p.name == currentPlan.name);
            List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: text,
                complete: task.complete,
              );

            planNotifier.value = List<Plan>.from(planNotifier.value)
              ..[planIndex] = Plan(
                name: currentPlan.name,
                tasks: updatedTasks,
              );

            _plan = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
          });
        },
      ),
    );
  }

  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTaskTile(plan.tasks[index], index, context),
    );
  }
}

```

## Hasil

![image](./images/Week%2011%20-%20Step%201.gif)

# Jawaban Tugas Praktikum 1 

1. Error terjadi karena baris kode yang ditujuk tidak ditemukan, misal ketika mengerjakan main.dart, menggunakan PlanScreen() yang belum dibuat. Namun diluar itu, tidak ditemukan error dan berjalan dengan baik.

2. Kode tersebut digunakan untuk membuat dua file, plan.dart dan task.dart, dapat diakses secara publik dalam modul atau paket saat ini. Artinya, siapa pun yang mengimpor modul atau paket saat ini akan dapat menggunakan konten dari dua file tersebut secara langsung tanpa harus mengimpornya secara eksplisit.

3. const Plan() digunakan sebagai efisiensi memori, dan ini digunakan karena const Plan() hanya digunakan untuk value awal yang nantinya dapat diubah

4. Membuat aplikasi to-do list yang bisa menambah list, mengisi text, dan mencentang list

![image](./images/tugas%201.gif)

5. Kegunaan method pada langkah 11 dan 13 dalam lifecycle state

- Metode initState() dipanggil saat widget pertama kali dibuat. Metode ini dapat digunakan untuk melakukan inisialisasi widget, seperti menginisialisasi variabel atau mengatur nilai properti. Ini membuat scroll controller baru dan menambahkan event listener ke dalamnya. Event Listener dipanggil setiap kali posisi scroll scroll controller berubah. Saat event listener dipanggil, akan diminta fokus untuk node fokus baru.

- Metode dispose() dipanggil saat widget dihancurkan. Metode ini dapat digunakan untuk membebaskan sumber daya yang digunakan oleh widget, seperti menutup koneksi jaringan atau melepaskan memori. Kode ini membuang scroll controller. Hal ini penting dilakukan karena akan mengosongkan sumber daya yang digunakan oleh scroll controller.

# Praktikum 2

## File plan_provide.dart

```dart
import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider(
      {super.key, required Widget child, required ValueNotifier<Plan> notifier})
      : super(child: child, notifier: notifier);
  static ValueNotifier<Plan> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}
```

## Main.dart

```dart
import 'package:flutter/material.dart';
import 'package:master_plan/models/data_layer.dart';
import 'package:master_plan/provider/plan_provider.dart';

import './views/plan_screen.dart';

void main() => runApp(const MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.purple),
        home: PlanProvider(
          notifier: ValueNotifier<Plan>(
            const Plan(),
          ),
          child: const PlanScreen(),
        ));
  }
}
```

## Add method on plan.dart

```dart
import 'task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  const Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;
  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
```

## Edit method _buildAddTaskButton

```dart
  Widget _buildAddTextButton(BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)..add(const Task()),
          );
        });
  } 
```

## Edit method _buildTaskTile

```dart
Widget _buildTextTile(Task task, int index, BuildContext context) {
    ValueNotifier<Plan> planNotifier = PlanProvider.of(context);
    return ListTile(
      leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            Plan currentPlan = planNotifier.value;
            planNotifier.value = Plan(
              name: currentPlan.name,
              tasks: List<Task>.from(currentPlan.tasks)
                ..[index] = Task(
                  description: task.description,
                  complete: selected ?? false,
                ),
            );
          }),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value;
          planNotifier.value = Plan(
            name: currentPlan.name,
            tasks: List<Task>.from(currentPlan.tasks)
              ..[index] = Task(
                description: text,
                complete: task.complete,
              ),
          );
        },
      ),
    );
  }
```

## Edit _buildList

```dart
  Widget _buildList(Plan plan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) =>
          _buildTextTile(plan.tasks[index], index, context),
      keyboardDismissBehavior: Theme.of(context).platform == TargetPlatform.iOS
          ? ScrollViewKeyboardDismissBehavior.onDrag
          : ScrollViewKeyboardDismissBehavior.manual,
    );
  }
```

## Add widget SafeArea

```dart
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Plan Ziedny'),
      ),
      body: ValueListenableBuilder<Plan>(
        valueListenable: PlanProvider.of(context),
        builder: (context, plan, child) {
          return Column(
            children: [
              Expanded(child: _buildList(plan)),
              SafeArea(child: Text(plan.completenessMessage))
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTextButton(context),
    );
  }
```

# Jawaban Tugas Praktikum 2

2. InheritedWidget dan InheritedNotifier adalah widget Flutter yang memungkinkan berbagi data antar widget.

3. Langkah 3 memberikan jumlah dari task yang sudah terselesaikan

4. 

![image](./images/tugas%202.gif)

# Jawaban Tugas Praktikum 3

2. Ketika rute berpindah dari PlanCreatorScreen menuju PlanScreen variable plan akan digunakan sebagai parameter, kemudian plan ini akan menjadi variable yang digunakan untuk memunculkan list pada halaman PlanScreen

3. 

![image](./images/tugas%203.gif)