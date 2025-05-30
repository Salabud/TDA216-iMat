import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imat_app/model/imat/customer.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imat_app/app_theme.dart';
import 'package:imat_app/model/imat_data_handler.dart';
import 'package:imat_app/pages/main_view.dart';
import 'package:imat_app/widgets/previous_button.dart';

class CardInfo extends StatefulWidget {
  const CardInfo({super.key});

  @override
  CardInfoState createState() => CardInfoState();
}

class CardInfoState extends State<CardInfo> {
  late TextEditingController cardNumberController;
  late TextEditingController cvcController;
  late TextEditingController holderController;
  late TextEditingController expiryController;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController postCodeController;
  late TextEditingController addressController;
  late TextEditingController postAddressController;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    final iMat = context.read<ImatDataHandler>();
    final customer = iMat.getCustomer();
    final card = iMat.getCreditCard();
    cardNumberController = TextEditingController(text: card.cardNumber);
    cvcController = TextEditingController(
      text: card.verificationCode.toString(),
    );
    holderController = TextEditingController(text: card.holdersName);
    expiryController = TextEditingController(text: card.validYear.toString());

    firstNameController = TextEditingController(text: customer.firstName);
    lastNameController = TextEditingController(text: customer.lastName);
    phoneNumberController = TextEditingController(text: customer.phoneNumber);
    postCodeController = TextEditingController(text: customer.postCode);
    addressController = TextEditingController(text: customer.address);
    postAddressController = TextEditingController(text: customer.postAddress);

    _initialized = true;
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cvcController.dispose();
    holderController.dispose();
    expiryController.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    postCodeController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> saveCustomerData() async {
    final iMat = context.read<ImatDataHandler>();

    final customer = iMat.getCustomer();
    customer.firstName = firstNameController.text;
    customer.lastName = lastNameController.text;
    customer.phoneNumber = phoneNumberController.text;
    customer.mobilePhoneNumber = ""; // Add value if needed
    customer.email = ""; // Add value if needed
    customer.address = addressController.text;
    customer.postCode = postCodeController.text;
    customer.postAddress = postAddressController.text;

    await iMat.setCustomer(customer);
  }

  Future<void> saveCreditCardData() async {
    final iMat = context.read<ImatDataHandler>();

    final creditCard = iMat.getCreditCard();

    creditCard.holdersName = holderController.text;
    creditCard.cardNumber = cardNumberController.text;
    creditCard.verificationCode = int.tryParse(cvcController.text) ?? 0;
    creditCard.validYear = int.tryParse(expiryController.text) ?? 0;

    await iMat.setCreditCard(creditCard);
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 20, 30, 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PersonUppgifter(
                firstName: firstNameController,
                lastName: lastNameController,
                phoneNumber: phoneNumberController,
                postCode: postCodeController,
                postAddress: postAddressController,
                address: addressController,
              ),
              KortUppgifter(
                cardNumber: cardNumberController,
                cvc: cvcController,
                holder: holderController,
                expiry: expiryController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentInfoBottom extends StatelessWidget {
  const PaymentInfoBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 30, 25),
      child: Container(
        color:Colors.white,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PreviousButton(page: MainView(), label: "Tillbaka"),
            CreditCard(),
          ],
        ),
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4D597E), // The blue card background
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "COOLBANK AB",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color(0xFFFFA43C), // orange
                ),
                SizedBox(width: 4),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color(0xFFFA453C), // red
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonUppgifter extends StatelessWidget {
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController phoneNumber;
  final TextEditingController postCode;
  final TextEditingController address;
  final TextEditingController postAddress;

  const PersonUppgifter({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.postCode,
    required this.address,
    required this.postAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personuppgifter",
          style: GoogleFonts.openSans(
            fontSize: 40,
            color: AppTheme.offBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        DoubleFieldRow(
          label1: "Förnamn",
          label2: "Efternamn",
          controller1: firstName,
          controller2: lastName,
        ),
        const SizedBox(height: 16),
        DoubleFieldRow(
          label1: "Adress",
          label2: "Postnummer",
          controller1: address,
          controller2: postCode,
        ),
        const SizedBox(height: 16),
        DoubleFieldRow(
          label1: "Ort",
          label2: "Telefonnummer",
          controller1: postAddress,
          controller2: phoneNumber,
        ),
      ],
    );
  }
}

class KortUppgifter extends StatelessWidget {
  final TextEditingController cardNumber;
  final TextEditingController cvc;
  final TextEditingController holder;
  final TextEditingController expiry;
  const KortUppgifter({
    super.key,
    required this.cardNumber,
    required this.cvc,
    required this.holder,
    required this.expiry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kortuppgifter",
          style: GoogleFonts.openSans(
            fontSize: 40,
            color: AppTheme.offBlack,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex: 7,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: cardNumber,
                decoration: InputDecoration(
                  labelText: "Kortnummer",
                  hintText: "1234 5678 9012 3456",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: TextField(
                controller: cvc,
                decoration: InputDecoration(
                  labelText: "CVC",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
              child: TextField(
                controller: holder,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Korthavare",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: TextField(
                controller: expiry,
                decoration: InputDecoration(
                  labelText: "Utgångsdatum",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DoubleFieldRow extends StatelessWidget {
  final String label1;
  final String label2;
  final TextEditingController controller1;
  final TextEditingController controller2;

  const DoubleFieldRow({
    super.key,
    required this.label1,
    required this.label2,
    required this.controller1,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextField(
              controller: controller1,
              decoration: InputDecoration(
                labelText: label1,
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              controller: controller2,
              decoration: InputDecoration(
                labelText: label2,
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TillbakaKnapp extends StatelessWidget {
  const TillbakaKnapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder:
                  (context, animation, secondaryAnimation) => const MainView(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                return child; // Just return the child without any animation
              },
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        },
        child: Container(
          width: 250,
          height: 90,
          decoration: BoxDecoration(
            color: AppTheme.red,
            borderRadius: BorderRadius.all((Radius.circular(15))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: AppTheme.darkRed,
                size: 35,
              ),
              Text(
                "  Tillbaka",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'MadimiOne',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
