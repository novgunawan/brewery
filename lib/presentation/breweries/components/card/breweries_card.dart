import 'package:brewery/asset/assets.dart';
import 'package:brewery/data/model/breweries/response/breweries_response.dart';
import 'package:brewery/extension/extension.dart';
import 'package:brewery/presentation/breweries/detail/breweries_detail_page.dart';
import 'package:brewery/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BeerCard extends StatelessWidget {
  final BreweriesResponse data;
  const BeerCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(BreweriesDetail.routeName, arguments: data),
      child: Flexible(
        fit: FlexFit.loose,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Image.asset(
                  alcoholImage,
                  fit: BoxFit.contain,
                ),
              ),
              10.0.height,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name ?? 'Default name for beer',
                        style: bodyStyleBlack,
                      ),
                      10.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. 50.000',
                            style: subtitleThreeStyleBlack,
                          ),
                          Text(
                            '5%',
                            style: subtitleThreeStylePurple,
                          )
                        ],
                      ),
                      8.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.location_on, size: 20),
                          Text(
                            data.city ?? 'Default City',
                            style: smallStyleGravelLight,
                          ),
                          const Text(' | '),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.amber,
                              ),
                              Text(
                                '5.0',
                                style: smallStyleBlack,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
