import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/azker_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, watch) {
    final viewModel = watch(getDataFuture);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("أذكار الصباح"),
          centerTitle: true,
        ),
        body: viewModel.listDataModel.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: viewModel.listDataModel.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            viewModel.listDataModel[index].zekr,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            viewModel.listDataModel[index].bless,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.blue),
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                viewModel.onClick(
                                    viewModel.listDataModel[index].repeat);
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              child: Text(
                                viewModel.listDataModel[index].repeat
                                    .toString(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
