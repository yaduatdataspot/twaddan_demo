import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';

import 'CustomDataTable.dart';
import 'my_data_tbale.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ScrollController _scrollController = ScrollController();
  OverlayEntry? _overlayEntry;
  bool isExpandDashBoard = true;
  int _counter = 1;
  Offset _popupPosition = Offset.zero;
  String? _selectedValue;
  bool isShrinkDashBoard=false;

  // List of items in the dropdown
  final List<String> _dropdownItems = ['Select Month', 'Select Date range '];

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  void _showPopup(BuildContext context, GlobalKey key, String hint) {
    if (_overlayEntry != null) {
      _removePopup();
    }
    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + 40,
        width: 180,
        // height: 100,
        child: Material(
          elevation: 4.0,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 5),
                  child: Container(
                    height: 20,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: TextFormField(
                        cursorHeight: 15,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          // This removes the underline
                          hintText: 'Search $hint',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    "Search",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(0),
                            ),
                          )),
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Center(
                                child: Text(
                                  "Reset",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(0),
                                border: Border.all(color: Colors.black)),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(_overlayEntry!);
  }

  void _removePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey serviceProviderKey = GlobalKey();
    final GlobalKey bankAccountNameKey = GlobalKey();
    final GlobalKey bankAccountNumberKey = GlobalKey();
    final GlobalKey ibanKey = GlobalKey();
    final GlobalKey bankKey = GlobalKey();
    final GlobalKey branchKey = GlobalKey();
    final GlobalKey contactNumberKey = GlobalKey();
    final GlobalKey emailKey = GlobalKey();

    return Container(
      child: Row(
        children: [
          Material(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              width: isExpandDashBoard ? 200 : 100,
              color: Color(0xff498BC9),
              height: double.infinity,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Image.asset("assets/twaddanlogo.png")),
                    ),
                    SizedBox(height: 20,),
                   isExpandDashBoard==true? Expanded(child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.menu,color: Colors.white,),
                              Expanded(
                                child: Text("Dashboard",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                                ),),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.analytics,color: Colors.white,),
                              Expanded(
                                child: Text("Analytics",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.admin_panel_settings,color: Colors.white,),
                              Expanded(
                                child: Text("Super Admin",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                  ),),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )):Container(
                     child: Expanded(
                       child: Column(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.menu,color: Colors.white,),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.analytics,color: Colors.white,),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.admin_panel_settings,color: Colors.white,),
                           ),
                         ],
                       ),
                     ),
                   )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // flex: 12,
            child: Container(
              color: Colors.white,
              height: double.infinity,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  leading: InkWell(
                      onTap: () async{
                        setState(() {
                          isExpandDashBoard = !isExpandDashBoard;
                          if(isExpandDashBoard==false){
                            Future.delayed(Duration(milliseconds: 800)).then((value) {
                              isShrinkDashBoard=true;
                            });
                          }
                          else{
                            isShrinkDashBoard=false;
                          }
                        });
                      },
                      child: Icon(Icons.menu)),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.notification_add),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Icon(Icons.person),
                    )
                  ],
                ),
                body: Container(
                  color: Color(0xffF2F2F3),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          width: double.infinity,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 17, top: 15, bottom: 15),
                            child: Text("Home/Net balance"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _removePopup();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 17, top: 15, bottom: 15),
                                          child: Text(
                                            "Net balance sheet",
                                            style:
                                                TextStyle(color: Colors.indigo),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.green,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          )),
                                                  child: Text(
                                                    "Excel",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.blue,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0),
                                                          )),
                                                  child: Text(
                                                    "Pdf",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                    SizedBox(height: 30,),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,bottom: 10),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                              child: Text("Date Range",style: TextStyle(
                                                fontSize: 15
                                              ),)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black, width: 1),
                                                    borderRadius: BorderRadius.circular(0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton<String>(
                                                        hint: Text('Select'),
                                                        value: _selectedValue,
                                                        iconSize: 24,
                                                        elevation: 16,
                                                        style: TextStyle(color: Colors.black),
                                                        underline: Container(
                                                          height: 2,
                                                          color: Colors.black,
                                                        ),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            _selectedValue = newValue;
                                                          });
                                                        },
                                                        items: _dropdownItems
                                                            .map<DropdownMenuItem<String>>(
                                                                (String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(value),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20,),
                                              SizedBox(
                                                height: 40,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.blue,
                                                    shape: RoundedRectangleBorder()
                                                  ),
                                                    onPressed: () {

                                                }, child: Text('Submit',style: TextStyle(color: Colors.white),)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Expanded(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 1,
                                              right: 1,
                                              top: 30,
                                              bottom: 20),
                                          child: Container(
                                            child: ScrollbarTheme(
                                              data: ScrollbarThemeData(
                                                thumbColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blue),
                                              ),
                                              child: Scrollbar(
                                                thumbVisibility: true,
                                                trackVisibility: true,
                                                controller: _scrollController,
                                                child: SingleChildScrollView(
                                                  controller: _scrollController,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Stack(
                                                    children: [
                                                      SingleChildScrollView(
                                                        child: DataTable(
                                                          columnSpacing: 10,
                                                          columns: [
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            50,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                            DataColumn(
                                                                label: Visibility(
                                                                    visible:
                                                                        false,
                                                                    child: SizedBox(
                                                                        width:
                                                                            150,
                                                                        child: Text(
                                                                            "")))),
                                                          ],
                                                          rows: List.generate(
                                                              100, (index) {
                                                            return DataRow(
                                                                cells: [
                                                                  DataCell(SizedBox(
                                                                      width: 50,
                                                                      child: Text(
                                                                          "1"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          150,
                                                                      child: Text(
                                                                          "TestProvider"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          150,
                                                                      child: Text(
                                                                          "50000"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          180,
                                                                      child: Text(
                                                                          "Test name"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          180,
                                                                      child: Text(
                                                                          "1234556"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          150,
                                                                      child: Text(
                                                                          "123456"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          150,
                                                                      child: Text(
                                                                          "Dubai bank"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          150,
                                                                      child: Text(
                                                                          "Dubai"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          180,
                                                                      child: Text(
                                                                          "5265655656"))),
                                                                  DataCell(SizedBox(
                                                                      width:
                                                                          180,
                                                                      child: Text(
                                                                          "yadu@yopmail.com"))),
                                                                ]);
                                                          }),
                                                        ),
                                                      ),
                                                      DataTable(
                                                          columnSpacing: 10,
                                                          border: TableBorder(
                                                              verticalInside:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      0xffF2F2F3)),
                                                          columns: [
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 50,
                                                                    child: GestureDetector(
                                                                        onTap:
                                                                            () {},
                                                                        child: Text(
                                                                            "Sl No")))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 150,
                                                                    child: GestureDetector(
                                                                        key: serviceProviderKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              serviceProviderKey,
                                                                              'Service Provider');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Service Provider"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 150,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            "Amount Due"),
                                                                        Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              child: Icon(Icons.arrow_drop_up),
                                                                            ),
                                                                            Container(
                                                                              child: Icon(Icons.arrow_drop_down),
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 180,
                                                                    child: GestureDetector(
                                                                        key: bankAccountNameKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              bankAccountNameKey,
                                                                              'Bank Account name');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Bank Account name"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 180,
                                                                    child: GestureDetector(
                                                                        key: bankAccountNumberKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              bankAccountNumberKey,
                                                                              'Bank Account number');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Bank Account Number"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 150,
                                                                    child: GestureDetector(
                                                                        key: ibanKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              ibanKey,
                                                                              'IBAN Provider');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("IBAN"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 150,
                                                                    child: GestureDetector(
                                                                        key: bankKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              bankKey,
                                                                              'Bank');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Bank"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 150,
                                                                    child: GestureDetector(
                                                                        key: branchKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              branchKey,
                                                                              'Branch');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Branch"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 180,
                                                                    child: GestureDetector(
                                                                        key: contactNumberKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              contactNumberKey,
                                                                              'Contact number');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Contact Number"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                            DataColumn(
                                                                label: SizedBox(
                                                                    width: 180,
                                                                    child: GestureDetector(
                                                                        key: emailKey,
                                                                        onTap: () {
                                                                          _showPopup(
                                                                              context,
                                                                              emailKey,
                                                                              'Email id');
                                                                        },
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text("Email id"),
                                                                            Icon(Icons.search),
                                                                          ],
                                                                        )))),
                                                          ],
                                                          rows: []),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Container(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                          child: SelectableText(
                                                             'Hello! How are you?',
                                                             textAlign: TextAlign.center,
                                                             style: TextStyle(fontWeight: FontWeight.bold),
                                                           )
                                                          )),
                                                  Expanded(
                                                    flex: 1,
                                                    child: WebPagination(
                                                        currentPage: _counter,
                                                        totalPage: 15,
                                                        displayItemCount: 5,
                                                        onPageChanged: (page) {
                                                          setState(() {
                                                            _counter = page;
                                                          });
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
