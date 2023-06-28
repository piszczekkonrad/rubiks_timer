import 'package:flutter/material.dart';
import 'package:rubiks_timer/Solving/solving_model.dart';

class SolvingPageContents extends StatelessWidget {
  const SolvingPageContents({
    Key? key,
    required this.solvingModels,
    required this.backwards,
    required this.forward,
  }) : super(key: key);
  final Function backwards;
  final Function forward;
  final List<SolvingModel> solvingModels;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView(
            children: [
              _SolvingTitleWidget(
                solvingModel: solvingModels.first,
              ),
              for (final solvingModel
                  in solvingModels.where((element) => element.id % 2 == 1))
                solvingModel != solvingModels.last
                    ? _SolvingItemWidget(
                        solvingModel: solvingModel,
                        solvingModel2: solvingModels[solvingModel.id + 1],
                      )
                    : _SolvingItemWidget(
                        solvingModel: solvingModel,
                        solvingModel2: null,
                      )
            ],
          ),
        ),
        SolvingBottomNavigationBar(
          backwards: backwards,
          forward: forward,
        )
      ],
    );
  }
}

class SolvingBottomNavigationBar extends StatelessWidget {
  const SolvingBottomNavigationBar({
    Key? key,
    required this.backwards,
    required this.forward,
  }) : super(key: key);
  final Function backwards;
  final Function forward;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (newIndex) {
        if (newIndex == 0) {
          backwards();
        } else {
          forward();
        }
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_back,
            ),
            label: "Oops, go back..."),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_forward,
            ),
            label: "Got it, next!")
      ],
      backgroundColor: Colors.green,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
    );
  }
}

class _SolvingTitleWidget extends StatelessWidget {
  const _SolvingTitleWidget({
    Key? key,
    required this.solvingModel,
  }) : super(key: key);

  final SolvingModel solvingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    solvingModel.picture,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          solvingModel.alghorithm,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SolvingItemWidget extends StatelessWidget {
  const _SolvingItemWidget({
    Key? key,
    required this.solvingModel,
    required this.solvingModel2,
  }) : super(key: key);

  final SolvingModel solvingModel;

  final SolvingModel? solvingModel2;
  @override
  Widget build(BuildContext context) {
    if (solvingModel2 == null) {
      return _SingleSolvingItem(solvingModel: solvingModel);
    }
    return _DoubleSolvingItem(
        solvingModel: solvingModel, solvingModel2: solvingModel2);
  }
}

class _DoubleSolvingItem extends StatelessWidget {
  const _DoubleSolvingItem({
    Key? key,
    required this.solvingModel,
    required this.solvingModel2,
  }) : super(key: key);

  final SolvingModel solvingModel;
  final SolvingModel? solvingModel2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Column(
        children: [
          _DoubleSolvingItemImageRow(
              solvingModel: solvingModel, solvingModel2: solvingModel2),
          _DoubleSolvingItemAlgorithmRow(
              solvingModel: solvingModel, solvingModel2: solvingModel2),
        ],
      ),
    );
  }
}

class _DoubleSolvingItemAlgorithmRow extends StatelessWidget {
  const _DoubleSolvingItemAlgorithmRow({
    Key? key,
    required this.solvingModel,
    required this.solvingModel2,
  }) : super(key: key);

  final SolvingModel solvingModel;
  final SolvingModel? solvingModel2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  solvingModel.alghorithm,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  solvingModel2!.alghorithm,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DoubleSolvingItemImageRow extends StatelessWidget {
  const _DoubleSolvingItemImageRow({
    Key? key,
    required this.solvingModel,
    required this.solvingModel2,
  }) : super(key: key);

  final SolvingModel solvingModel;
  final SolvingModel? solvingModel2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                image: NetworkImage(
                  solvingModel.picture,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                image: NetworkImage(
                  solvingModel2!.picture,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SingleSolvingItem extends StatelessWidget {
  const _SingleSolvingItem({
    Key? key,
    required this.solvingModel,
  }) : super(key: key);

  final SolvingModel solvingModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      child: Column(
        children: [
          _SingleSolvingItemImageRow(solvingModel: solvingModel),
          _SingleSolvingItemAlghorithmRow(solvingModel: solvingModel),
        ],
      ),
    );
  }
}

class _SingleSolvingItemAlghorithmRow extends StatelessWidget {
  const _SingleSolvingItemAlghorithmRow({
    Key? key,
    required this.solvingModel,
  }) : super(key: key);

  final SolvingModel solvingModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  solvingModel.alghorithm,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SingleSolvingItemImageRow extends StatelessWidget {
  const _SingleSolvingItemImageRow({
    Key? key,
    required this.solvingModel,
  }) : super(key: key);

  final SolvingModel solvingModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(
                image: NetworkImage(
                  solvingModel.picture,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
