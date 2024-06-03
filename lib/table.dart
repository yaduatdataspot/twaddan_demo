import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class Tabledata extends StatefulWidget {
  const Tabledata({super.key});

  @override
  State<Tabledata> createState() => _TabledataState();
}

class _TabledataState extends State<Tabledata> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 600,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  width: 400,
                  child: DataTable2(
                    columns: [
                      DataColumn2(
                        label: Text('ID'),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Text('Name'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Age'),
                        size: ColumnSize.S,
                      ),
                      DataColumn2(
                        label: Text('Occupation'),
                        size: ColumnSize.M,
                      ),
                      DataColumn2(
                        label: Text('City'),
                        size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('Country'),
                        size: ColumnSize.M,
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      10,
                          (index) => DataRow(
                        cells: [
                          DataCell(Text('ID $index')),
                          DataCell(Text('Name $index')),
                          DataCell(Text('${20 + index}')),
                          DataCell(Text('Occupation $index')),
                          DataCell(Text('City $index')),
                          DataCell(Text('Country $index')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
