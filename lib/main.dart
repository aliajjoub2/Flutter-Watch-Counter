import 'dart:async';


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterWatch(),
    );
  }
}

class CounterWatch extends StatefulWidget {
  const CounterWatch({Key? key}) : super(key: key);

  @override
  State<CounterWatch> createState() => _CounterWatchState();
}

class _CounterWatchState extends State<CounterWatch> {
  Duration duration = const Duration(seconds: 0);

  Timer? repeatedFunction;

  bool isRunning = false;

  startTimer() {
    repeatedFunction = Timer.periodic(const Duration(seconds: 1), (qqqqqq) {
      setState(() {
        int neuSecond = duration.inSeconds + 1;
        duration = Duration(seconds: neuSecond);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch Counter App'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 109, 186, 245),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(11),
                  margin: const EdgeInsets.all(11),
                    //color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.red[200],
                    border: Border.all(
                      color: Colors.red,
                      width: 3,
                    ),
                    // shape: BoxShape.circle,
                  ),
                  child: Text(duration.inHours.toString().padLeft(2, '0')),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(11),
                  margin: const EdgeInsets.all(11),
                    //color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.red[200],
                    border: Border.all(
                      color: Colors.red,
                      width: 3,
                    ),
                    // shape: BoxShape.circle,
                  ),
                  child: Text(duration.inMinutes
                      .remainder(60)
                      .toString()
                      .padLeft(2, '0')),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(11),
                  margin: const EdgeInsets.all(11),
                  //color: Colors.red,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.red[200],
                    border: Border.all(
                      color: Colors.red,
                      width: 3,
                    ),
                    // shape: BoxShape.circle,
                  ),
                  child: Text(duration.inSeconds
                      .remainder(60)
                      .toString()
                      .padLeft(2, '0')),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isRunning
                    ? Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (repeatedFunction!.isActive) {
                                  setState(() {
                                    repeatedFunction!.cancel();
                                  });
                                } else {
                                  startTimer();
                                }
                              },
                              child: Text(repeatedFunction!.isActive
                                  ? 'Stop'
                                  : 'Resume')),
                          const SizedBox(width: 20),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  duration = const Duration(seconds: 0);
                                  repeatedFunction!.cancel();
                                  isRunning = false;
                                });
                              },
                              child: const Text('Cancel')),
                        ],
                      )
                    : ElevatedButton(
                        onPressed: () {
                          startTimer();
                          setState(() {
                            isRunning = true;
                          });
                        },
                        child: const Text('Start'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
