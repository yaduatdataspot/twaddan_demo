



import 'package:flutter/material.dart';

import 'data.dart';

class FixedColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: 10,
      headingRowColor: MaterialStateProperty.all(Colors.green[300]),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      ),
      columns: [
        DataColumn(label: Text('Team')),
      ],
      rows: [
        ...teamsData.map((team) => DataRow(
          cells: [
            DataCell(Text(
              '${team.position.toString()}  ${team.name}',
              // style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
        ))
      ],
    );
  }
}




class ScrollableColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.green[100]),
            columnSpacing: 40,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            columns: [
              DataColumn(label: Text('Points')),
              DataColumn(label: Text('Won')),
              DataColumn(label: Text('Lost')),
              DataColumn(label: Text('Drawn')),
              DataColumn(label: Text('Against')),
              DataColumn(label: Text('GD')),
            ],
            rows: [
              ...teamsData
                  .map((team) => DataRow(
                cells: [
                  DataCell(
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            team.points.toString(),
                            // style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  DataCell(
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.won.toString()))),
                  DataCell(
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.lost.toString()))),
                  DataCell(
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.drawn.toString()))),
                  DataCell(
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.against.toString()))),
                  DataCell(
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(team.gd.toString()))),
                ],
              ))
            ]),
      ),
    );
  }
}

class BiDirectionalScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Row(
              children: [
                FixedColumnWidget(),
                ScrollableColumnWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}