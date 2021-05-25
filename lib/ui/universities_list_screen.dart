import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rma_lv8_universities_app/data/network/apis/university_api.dart';
import 'package:rma_lv8_universities_app/injection_container.dart';
import 'package:rma_lv8_universities_app/models/university.dart';

class UniversitiesListScreen extends StatelessWidget {
  const UniversitiesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Popis sveučilišta'),
        ),
        child: FutureBuilder<List<University>>(
          future: locator<UniversityApi>().getUniversities(),
          builder: (context, snapshot) => ListView.builder(
              itemCount: snapshot.data?.length ?? 1,
              itemBuilder: (context, index) {
                if (snapshot.hasError) {
                  Future.delayed(
                    Duration(milliseconds: 100),
                    () => showCupertinoDialog(
                      context: context,
                      builder: (cotnext) => CupertinoAlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'The Internet connection appears to be offline.'),
                        actions: [
                          CupertinoDialogAction(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  return _buildCard(
                    snapshot.data?[index].name ?? '',
                    snapshot.data?[index].country ?? '',
                    snapshot.data?[index].url ?? '',
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }

  Widget _buildCard(
    String name,
    String country,
    String url,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(name),
          Text(country),
          Text(url),
        ],
      ),
    );
  }
}
