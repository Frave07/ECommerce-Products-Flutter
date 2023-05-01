// import 'dart:convert';
// import 'package:http/http.dart' as http ;
// import 'package:stripe_payment/stripe_payment.dart';

// import 'package:e_commers/Models/Stripe/PaymentIntentResponse.dart';

// class StripeService {

//   StripeService._privateConstructor();
//   static final _intance = StripeService._privateConstructor();
//   factory StripeService() => _intance;

//   String _paymentApiUrl = "https://api.stripe.com/v1/payment_intents";
//   String _secretKey = "Here your Secret Key - Stripe";
//   String _apiKey = "Here you Api Key - Stripe";

//   void init(){

//     StripePayment.setOptions(
//       StripeOptions(
//         publishableKey: _apiKey,
//         androidPayMode: 'test',
//         merchantId: 'test'
//       )
//     );
//   }

//   Future<StripeResponseCustom> payWithCardExists({ required String amount, required String currency, required CreditCard creditCard }) async {

//     try {

//       final paymentMethod = await StripePayment.createPaymentMethod( PaymentMethodRequest( card: creditCard ) );

//       return await _makePayment(amount: amount, currency: currency, paymentMethod: paymentMethod );
      
//     } catch (e) {
//       return StripeResponseCustom(ok: false, msg: e.toString());
//     }

//   }

//   Future<StripeResponseCustom> payWithNewCard({ required String amount, required String currency }) async {

//       try {

//           final paymentMethod = await StripePayment.paymentRequestWithCardForm(
//             CardFormPaymentRequest()
//           );

//           return await _makePayment(amount: amount, currency: currency, paymentMethod: paymentMethod );

        
//       } catch (e) {
//         return StripeResponseCustom(ok: false, msg: e.toString());
//       }


//   }


//   Future<PaymentIntentResponse> _paymentIntent({ required String amount, required String currency }) async {

//       try {

//         final resp = await http.post(Uri.parse( _paymentApiUrl ),
//           headers: {
//             'Accept': 'application/json',
//             'Authorization' : 'Bearer $_secretKey'
//           },
//           body: {
//             'amount': amount,
//             'currency': currency
//           }
//         );

//         return PaymentIntentResponse.fromJson( jsonDecode( resp.body ) );
        
//       } catch (e) {
//         return PaymentIntentResponse(status: '400');
//       }

//   }


//   Future<StripeResponseCustom> _makePayment({ required String amount, required String currency, required PaymentMethod paymentMethod }) async {

//       try {

//         final paymentIntent = await _paymentIntent(amount: amount, currency: currency);

//         final paymentResult = await StripePayment.confirmPaymentIntent(
//           PaymentIntent(
//             clientSecret: paymentIntent.clientSecret,
//             paymentMethodId: paymentMethod.id
//           )
//         );

//         if( paymentResult.status == 'succeeded' ){
//           return StripeResponseCustom(ok: true);
//         } else {
//           return StripeResponseCustom(ok: false, msg: 'Something went wrong');
//         }
        
//       } catch (e) {
//         return StripeResponseCustom(ok: false, msg: e.toString());
//       }
//   }


// }

// final stripeService = StripeService();
