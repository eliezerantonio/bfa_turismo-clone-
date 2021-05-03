import 'package:atm/account/account.dart';
import 'package:atm/account/account_manger.dart';
import 'package:atm/helpers/api_response.dart';
import 'package:atm/helpers/nav.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:atm/widgets/stain_images_widget.dart';
import 'package:atm/widgets/stain_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  Account account;
  PaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    account = context.watch<AccountManager>().account;

    final loading = context.watch<AccountManager>().loading;
    final _contollerBalance = TextEditingController();
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Theme.of(context).accentColor;

    _onClickDeposit() async {
      if (_contollerBalance.text.isNotEmpty) {
        int currentAccount = account.id;
        num balance = int.parse(_contollerBalance.text);

        ApiResponse apiResponse = await context.read<AccountManager>().raise(
              currentAccount: currentAccount,
              balance: balance,
            );

        if (apiResponse.ok) {
          messenger(context, "Levantamento realizado com sucesso");
        } else {
          messenger(context, apiResponse.msg, error: true);
        }
      } else {
        messenger(context, "Preencha  valor ", error: true);
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Pagamentos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (loading)
                    LinearProgressIndicator(
                      backgroundColor: accentColor,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  MyCreditCard(),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 150,
                      height: 800,
                      child: GridView(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: StainImageWidget(
                              image: "unitel",
                              name: "unitel",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: StainImageWidget(
                              image: "movicel",
                              name: "movicel",
                            ),
                          ),
                          StainImageWidget(
                            image: "atelecom",
                            name: "atelecom",
                          ),
                          GestureDetector(
                            onTap: () {
                              push(context, PaymentScreen());
                            },
                            child: StainImageWidget(
                              name: "dstv",
                              image: "dstv",
                            ),
                          ),
                          StainImageWidget(
                            image: "ende",
                            name: "ende",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 30, right: 40),
              child: Column(
                children: [
                  Text(
                    "Saldo Actual",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${account.balance ?? 0},00 KZ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}