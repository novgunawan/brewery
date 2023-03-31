import 'package:brewery/bloc/breweries/breweries_bloc.dart';
import 'package:brewery/presentation/breweries/components/card/breweries_card.dart';
import 'package:brewery/presentation/reusables/appbar/appbar.dart';
import 'package:brewery/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brewery/presentation/pages.dart';

class BreweriesListPage extends StatefulWidget {
  static const String routeName = '/breweries';
  const BreweriesListPage({super.key});

  @override
  State<BreweriesListPage> createState() => _BreweriesListPageState();
}

class _BreweriesListPageState extends State<BreweriesListPage> {
  @override
  void initState() {
    super.initState();
    context.read<BreweriesBloc>().add(GetListBreweriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
          isBackButtonShown: false,
          appBarTitle: 'Brewery Browse',
          callBack: () => Navigator.of(context).pop()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    minHeight: constraints.maxHeight),
                child: BlocBuilder<BreweriesBloc, BreweriesState>(
                  builder: (context, state) {
                    if (state is BreweriesLoading) {
                      showLoading();
                    } else if (state is BreweriesError) {
                      return ErrorPage(message: state.message);
                    } else if (state is BreweriesSuccess) {
                      hideLoading();

                      return SizedBox(
                        height: constraints.maxHeight,
                        child: GridView.builder(
                          itemCount: state.breweries.length,
                          itemBuilder: (context, index) =>
                              BeerCard(data: state.breweries[index]),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
