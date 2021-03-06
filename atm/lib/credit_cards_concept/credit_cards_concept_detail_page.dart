import 'dart:math';

import 'package:atm/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'credit_card.dart';
import 'credit_card_widget.dart';

class CreditCardsConceptDetailPage extends StatelessWidget {
  final CreditCard card;

  const CreditCardsConceptDetailPage({Key key, this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: LogoWidget(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Movimentos",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              elevation: 0,
              actions: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Text(
                          'Full card',
                          textAlign: TextAlign.center,
                          style: textTheme.headline6.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: MyCardHeaderDelegate(card, 170.0),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 25.0),
                      child: Text(
                        'Hoje',
                        textAlign: TextAlign.left,
                        style: textTheme.headline6.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return MovementWidget(
                          index: index,
                        );
                      },
                      childCount: 25,
                    ),
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

class MyCardHeaderDelegate extends SliverPersistentHeaderDelegate {
  final CreditCard card;
  final double height;

  MyCardHeaderDelegate(
    this.card,
    this.height,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: CreditCardWidget(
        card: card,
        isDetail: true,
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}

const categories = ['Tranferencia', 'Deposito', 'Levantamento', 'Pagamento'];
final random = Random();

class MovementWidget extends StatelessWidget {
  final int index;

  const MovementWidget({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Movimento ${index + 1}",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        categories[index % categories.length],
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[index % Colors.primaries.length],
      ),
      trailing: Text(
        doubleInRange(random, 1, 5000).toStringAsFixed(2),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
