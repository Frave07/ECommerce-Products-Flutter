import 'package:e_commers/Data/ListCard.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/Profile/card/add_card.dart';
import 'package:e_commers/ui/themes/colors_frave.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CreditCardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){ 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const TextFrave(text: 'My Cards', color: ColorsFrave.primaryColorFrave, fontWeight: FontWeight.w600),
        elevation: 0,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(Icons.arrow_back_ios_rounded, color: ColorsFrave.primaryColorFrave),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          InkWell(
            onTap: (){},
            child: Row(
              children: [
                const Icon(Icons.add_circle_outline_rounded, color: ColorsFrave.primaryColorFrave, size: 17),
                const SizedBox(width: 5.0),
                GestureDetector(
                  child: const TextFrave(text: 'Add Card', color: ColorsFrave.primaryColorFrave, fontSize: 15),
                  onTap: () => Navigator.of(context).push(routeSlide(page: AddCreditCardPage())),
                ),
                const SizedBox(width: 7.0),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 200,
              child: PageView.builder(
                controller: PageController(viewportFraction: .9),
                physics: const BouncingScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (_, i){
                  final card = cards[i];

                  return _CreditCard(
                    cardHolderName: card.cardHolderName,
                    cardNumber: card.cardNumber,
                    expiryDate: card.expiracyDate,
                    cvvCode: card.cvv,
                    brand: card.brand,
                  );
                },
              ),
            ),

            const SizedBox(height: 15),
            const TextFrave(text: 'Last movements', fontSize: 19),

            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(20.0)
                ),
              ),
            )
          ],
        ),
      ),
     );
  }
}



class _CreditCard extends StatelessWidget {

  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final String brand;

  const _CreditCard({
    required this.cardNumber, 
    required this.expiryDate, 
    required this.cardHolderName, 
    required this.cvvCode,
    required this.brand
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      margin: const EdgeInsets.only(right: 15.0),
      height: 220,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xFF3A4960)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('Assets/card-chip.png', height: 60),
              SvgPicture.asset('Assets/$brand.svg', height: 80 )
            ],
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: TextFrave(text: cardNumber, fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFrave(text: cardHolderName, fontSize: 23, color: Colors.white ),
                TextFrave(text: expiryDate, color: Colors.white, fontSize: 19),
              ],
            ),
          )
        ],
      ),
    );
  }
}










