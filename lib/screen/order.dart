import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tps_ros/dummy.dart';
import 'package:tps_ros/model/menu.dart';
import 'package:tps_ros/model/note.dart';

import 'package:tps_ros/widget/custom_text.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int catCurrentIndex = 1;
  int selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 50, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: (MediaQuery.of(context).size.width / 6) * 1,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Table 1 ( Ground Floor)',
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          CustomText(
                            text: 'MMK 9800',
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2A9E01),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: (MediaQuery.of(context).size.width / 3),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.grey.shade100,
                            height: 500,
                            child: SizedBox(
                              height: 500,
                              child: ListView.builder(
                                  itemCount: Dummy.selectedMenu.length,
                                  itemBuilder: (_, index) {
                                    var obj = Dummy.selectedMenu[index];
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          catCurrentIndex =
                                              obj['menu'].categoryId;
                                          selectedMenu = obj['menu'].id;
                                        });
                                      },
                                      child: Dismissible(
                                        direction: DismissDirection.endToStart,
                                        confirmDismiss: (dir) async {
                                          setState(() {
                                            selectedMenu = 0;
                                            Dummy.reduceMenu(obj['menu'],noteId: obj['noteId']);
                                          });
                                          return false;
                                        },
                                        key: Key(index.toString()),
                                        child: Card(
                                            child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0,
                                              right: 20,
                                              top: 20,
                                              bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      CustomText(
                                                        text: (index + 1)
                                                            .toString(),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 20,
                                                      ),
                                                      CustomText(
                                                        text:
                                                            " - ${obj['menu'].name ?? ''}",
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ],
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        Dummy.selectMenu(
                                                            obj['menu']);
                                                      });
                                                    },
                                                    child: CircleAvatar(
                                                      child: CustomText(
                                                        text: "${obj['qty']!}",
                                                        fontSize: 20,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (obj['noteId'] != 0)
                                                CustomText(
                                                  text:
                                                      "( ${Dummy.getNote(obj['noteId'])[0].note} )",
                                                  color: Colors.indigo,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                )
                                            ],
                                          ),
                                        )),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B3763),
                              ),
                              onPressed: () {
                                for (var menu in Dummy.selectedMenu) {
                                  print(menu['noteId']);
                                }
                              },
                              child: const CustomText(
                                text: 'Order',
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedMenu = 0;
                                        catCurrentIndex = categories[index].id!;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(right: 40),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: catCurrentIndex ==
                                                    categories[index].id!
                                                ? Colors.indigo
                                                : Colors.white,
                                            width: 5.0,
                                          ),
                                        ),
                                      ),
                                      child: CustomText(
                                        text: categories[index].name ?? '',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            height:
                                (MediaQuery.of(context).size.height / 4) * 2,
                            color: const Color(0xFFD9D9D9),
                            child: GridView.builder(
                                itemCount:
                                    Dummy.selectCatByMenus(catCurrentIndex)
                                        .length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 3,
                                  crossAxisSpacing: 20,
                                ),
                                itemBuilder: (_, index) {
                                  Menu menu = Dummy.selectCatByMenus(
                                      catCurrentIndex)[index];
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedMenu = menu.id ?? 0;
                                        Dummy.selectMenu(menu);
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        border: selectedMenu == menu.id
                                            ? const Border(
                                                bottom: BorderSide(
                                                    color: Colors.blue,
                                                    width: 8),
                                                top: BorderSide(
                                                    color: Colors.blue,
                                                    width: 8),
                                              )
                                            : null,
                                        color: const Color(0xFF3DB120),
                                      ),
                                      child: CustomText(
                                        text: menu.name ?? '',
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 300,
                            child: GridView.builder(
                                itemCount:
                                    Dummy.selectCatBNotes(catCurrentIndex)
                                        .length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 5,
                                  crossAxisSpacing: 20,
                                ),
                                itemBuilder: (_, index) {
                                  Note note = Dummy.selectCatBNotes(
                                      catCurrentIndex)[index];
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        var menu =
                                            Dummy.findById(menus, selectedMenu);

                                        Dummy.selectMenu(menu,
                                            noteId: note.id!);
                                        selectedMenu =0;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        color: selectedMenu == 0
                                            ? Colors.red.shade200
                                            : const Color(0xFFD9D9D9),
                                      ),
                                      child: CustomText(
                                        text: note.note ?? '',
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
