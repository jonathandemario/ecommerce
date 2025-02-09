import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:test2ambw/customer/detail.dart';
import 'package:test2ambw/customer/home.dart';
import 'package:test2ambw/customer/detail.dart';

class ScrollImageCarouselHotel extends StatelessWidget {
  var menuData;
  final String username;

  ScrollImageCarouselHotel(
      {Key? key, required this.menuData, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        clipBehavior: Clip.none,
        child: Row(
          children: List.generate(menuData.length, (index) {
            final tour = menuData[index];
            print(index);
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            menuType: "mhotel",
                            index: index + 1,
                            id: "HotelID",
                            username: username,
                          )),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 220,
                      height: 260,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(tour['image_url']),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    Container(
                      width: 220,
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromRGBO(0, 0, 0, 1),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Stack(children: <Widget>[
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xFFFFA800),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: FaIcon(
                                FontAwesomeIcons.solidStar,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${tour['RatingHotel'].toStringAsFixed(1)}',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ]),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tour['NamaHotel'],
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tour['LokasiHotel'],
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(5),
                                ),
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(0, 0),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.white,
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFFFA800),
                                ),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                            menuType: "mhotel",
                                            index: index + 1,
                                            id: "HotelID",
                                            username: username,
                                          )),
                                );
                              },
                              child: Text(
                                'Details',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
