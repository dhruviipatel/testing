import 'package:flutter/material.dart';
import 'package:testing_app/logic/counter.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.title});

  final String title;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final counter = Counter();

  void _incrementCounter() {
    setState(() {
      counter.incrementCount();
    });
  }

  void _decrementCounter() {
    setState(() {
      counter.decrementCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        //crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key('_incrementCounter'),
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            key: const Key('_decrementCounter'),
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
