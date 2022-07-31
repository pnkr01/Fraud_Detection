import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_order/src/global/global.dart';
import '../../../global/constants.dart';
import '../../../global/size_configuration.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
//   removeAt(int index) async{
// await
//   }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('phone')
            .doc(sharedPreferences!.getString('phone'))
            .collection('items')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Dismissible(
                          key: Key(
                            documentSnapshot.id.toString(),
                          ),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            // removeAt(index);
                          },
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                SvgPicture.asset("assets/icons/Trash.svg"),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 88,
                                child: AspectRatio(
                                  aspectRatio: 0.88,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(10)),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F6F9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset(
                                        documentSnapshot['image'][0]),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    documentSnapshot['title'],
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 10),
                                  Text.rich(
                                    TextSpan(
                                      text: 'Rs.' +
                                          documentSnapshot['price'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: kPrimaryColor),
                                      children: [
                                        TextSpan(
                                          text:
                                              " x 1",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    );
                  }))
              : const Center(
                  child: Text('No Data here'),
                );
        },
      ),
      // ListView.builder(
      //   itemCount: demoCarts.length,
      //   itemBuilder: (context, index) => Padding(
      //     padding: const EdgeInsets.symmetric(vertical: 10),
      //     child: Dismissible(
      //       key: Key(demoCarts[index].product.id.toString()),
      //       direction: DismissDirection.endToStart,
      //       onDismissed: (direction) {
      //         setState(() {
      //           demoCarts.removeAt(index);
      //         });
      //       },
      //       background: Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         decoration: BoxDecoration(
      //           color: const Color(0xFFFFE6E6),
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      //         child: Row(
      //           children: [
      //             const Spacer(),
      //             SvgPicture.asset("assets/icons/Trash.svg"),
      //           ],
      //         ),
      //       ),
      //       child: CartCard(cart: demoCarts[index]),
      //     ),
      //   ),
      // ),
    );
  }
}
