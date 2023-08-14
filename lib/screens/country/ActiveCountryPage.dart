import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:gtk_flutter/map/data/countrycodes.dart';
import 'package:gtk_flutter/screens/countryPage.dart';
import 'package:gtk_flutter/screens/regionlistpage.dart';
import 'package:provider/provider.dart';

import '../../map/data/maps/world_map.dart';
import '../../state/applicationstate.dart';
import '../../model/placehistory.dart';

class ActiveCountryPage extends StatefulWidget {
  const ActiveCountryPage({super.key});

  @override
  State<ActiveCountryPage> createState() => _ActiveCountryPageState();
}

Color returnRegionColor(Map<String, dynamic> regionrecords, String regionCode) {
  if (regionrecords.containsKey(regionCode)) {
    return Colors.blue;
  } else {
    return Colors.orangeAccent;
  }
}

Color returnCountryColor(
    Map<String, dynamic> countryrecords, String countryCode) {
  String _countryCode = countryCode.toLowerCase();
  if (countryrecords.containsKey(_countryCode)) {
    return Colors.blue;
  } else {
    return Colors.orangeAccent;
  }
}

class _ActiveCountryPageState extends State<ActiveCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, child) => Scaffold(
                // appBar: AppBar(
                //   title: const Text('Countries Visted '),
                // ),
                body: Center(
                    child: SupportedCountriesMap(
              countryColors: SMapWorldColors(
                // aD: returnCountryColor(appState.countryrecords, 'AD'),
                aD: returnCountryColor(appState.countryrecords, 'AD'),
                aE: returnCountryColor(appState.countryrecords, 'AE'),
                aF: returnCountryColor(appState.countryrecords, 'AF'),
                aG: returnCountryColor(appState.countryrecords, 'AG'),
                aI: returnCountryColor(appState.countryrecords, 'AI'),
                aL: returnCountryColor(appState.countryrecords, 'AL'),
                aM: returnCountryColor(appState.countryrecords, 'AM'),
                aN: returnCountryColor(appState.countryrecords, 'AN'),
                aO: returnCountryColor(appState.countryrecords, 'AO'),
                aQ: returnCountryColor(appState.countryrecords, 'AQ'),
                aR: returnCountryColor(appState.countryrecords, 'AR'),
                aS: returnCountryColor(appState.countryrecords, 'AS'),
                aT: returnCountryColor(appState.countryrecords, 'AT'),
                aU: returnCountryColor(appState.countryrecords, 'AU'),
                aW: returnCountryColor(appState.countryrecords, 'AW'),
                aX: returnCountryColor(appState.countryrecords, 'AX'),
                aZ: returnCountryColor(appState.countryrecords, 'AZ'),
                bA: returnCountryColor(appState.countryrecords, 'BA'),
                bB: returnCountryColor(appState.countryrecords, 'BB'),
                bD: returnCountryColor(appState.countryrecords, 'BD'),
                bE: returnCountryColor(appState.countryrecords, 'BE'),
                bF: returnCountryColor(appState.countryrecords, 'BF'),
                bG: returnCountryColor(appState.countryrecords, 'BG'),
                bH: returnCountryColor(appState.countryrecords, 'BH'),
                bI: returnCountryColor(appState.countryrecords, 'BI'),
                bJ: returnCountryColor(appState.countryrecords, 'BJ'),
                bL: returnCountryColor(appState.countryrecords, 'BL'),
                bM: returnCountryColor(appState.countryrecords, 'BM'),
                bN: returnCountryColor(appState.countryrecords, 'BN'),
                bO: returnCountryColor(appState.countryrecords, 'BO'),
                bQ: returnCountryColor(appState.countryrecords, 'BQ'),
                bR: returnCountryColor(appState.countryrecords, 'BR'),
                bS: returnCountryColor(appState.countryrecords, 'BS'),
                bT: returnCountryColor(appState.countryrecords, 'BT'),
                bV: returnCountryColor(appState.countryrecords, 'BV'),
                bW: returnCountryColor(appState.countryrecords, 'BW'),
                bY: returnCountryColor(appState.countryrecords, 'BY'),
                bZ: returnCountryColor(appState.countryrecords, 'BZ'),
                cA: returnCountryColor(appState.countryrecords, 'CA'),
                cC: returnCountryColor(appState.countryrecords, 'CC'),
                cD: returnCountryColor(appState.countryrecords, 'CD'),
                cF: returnCountryColor(appState.countryrecords, 'CF'),
                cG: returnCountryColor(appState.countryrecords, 'CG'),
                cH: returnCountryColor(appState.countryrecords, 'CH'),
                cI: returnCountryColor(appState.countryrecords, 'CI'),
                cK: returnCountryColor(appState.countryrecords, 'CK'),
                cL: returnCountryColor(appState.countryrecords, 'CL'),
                cM: returnCountryColor(appState.countryrecords, 'CM'),
                cN: returnCountryColor(appState.countryrecords, 'CN'),
                cO: returnCountryColor(appState.countryrecords, 'CO'),
                cR: returnCountryColor(appState.countryrecords, 'CR'),
                cU: returnCountryColor(appState.countryrecords, 'CU'),
                cV: returnCountryColor(appState.countryrecords, 'CV'),
                cW: returnCountryColor(appState.countryrecords, 'CW'),
                cX: returnCountryColor(appState.countryrecords, 'CX'),
                cY: returnCountryColor(appState.countryrecords, 'CY'),
                cZ: returnCountryColor(appState.countryrecords, 'CZ'),
                dE: returnCountryColor(appState.countryrecords, 'DE'),
                dJ: returnCountryColor(appState.countryrecords, 'DJ'),
                dK: returnCountryColor(appState.countryrecords, 'DK'),
                dM: returnCountryColor(appState.countryrecords, 'DM'),
                dO: returnCountryColor(appState.countryrecords, 'DO'),
                dZ: returnCountryColor(appState.countryrecords, 'DZ'),
                eC: returnCountryColor(appState.countryrecords, 'EC'),
                eE: returnCountryColor(appState.countryrecords, 'EE'),
                eG: returnCountryColor(appState.countryrecords, 'EG'),
                eH: returnCountryColor(appState.countryrecords, 'EH'),
                eR: returnCountryColor(appState.countryrecords, 'ER'),
                eS: returnCountryColor(appState.countryrecords, 'ES'),
                eT: returnCountryColor(appState.countryrecords, 'ET'),
                fI: returnCountryColor(appState.countryrecords, 'FI'),
                fJ: returnCountryColor(appState.countryrecords, 'FJ'),
                fK: returnCountryColor(appState.countryrecords, 'FK'),
                fM: returnCountryColor(appState.countryrecords, 'FM'),
                fO: returnCountryColor(appState.countryrecords, 'FO'),
                fR: returnCountryColor(appState.countryrecords, 'FR'),
                gA: returnCountryColor(appState.countryrecords, 'GA'),
                gB: returnCountryColor(appState.countryrecords, 'GB'),
                gD: returnCountryColor(appState.countryrecords, 'GD'),
                gE: returnCountryColor(appState.countryrecords, 'GE'),
                gF: returnCountryColor(appState.countryrecords, 'GF'),
                gG: returnCountryColor(appState.countryrecords, 'GG'),
                gH: returnCountryColor(appState.countryrecords, 'GH'),
                gI: returnCountryColor(appState.countryrecords, 'GI'),
                gL: returnCountryColor(appState.countryrecords, 'GL'),
                gM: returnCountryColor(appState.countryrecords, 'GM'),
                gN: returnCountryColor(appState.countryrecords, 'GN'),
                gP: returnCountryColor(appState.countryrecords, 'GP'),
                gQ: returnCountryColor(appState.countryrecords, 'GQ'),
                gR: returnCountryColor(appState.countryrecords, 'GR'),
                gS: returnCountryColor(appState.countryrecords, 'GS'),
                gT: returnCountryColor(appState.countryrecords, 'GT'),
                gU: returnCountryColor(appState.countryrecords, 'GU'),
                gW: returnCountryColor(appState.countryrecords, 'GW'),
                gY: returnCountryColor(appState.countryrecords, 'GY'),
                hK: returnCountryColor(appState.countryrecords, 'HK'),
                hM: returnCountryColor(appState.countryrecords, 'HM'),
                hN: returnCountryColor(appState.countryrecords, 'HN'),
                hR: returnCountryColor(appState.countryrecords, 'HR'),
                hT: returnCountryColor(appState.countryrecords, 'HT'),
                hU: returnCountryColor(appState.countryrecords, 'HU'),
                iD: returnCountryColor(appState.countryrecords, 'ID'),
                iE: returnCountryColor(appState.countryrecords, 'IE'),
                iL: returnCountryColor(appState.countryrecords, 'IL'),
                iM: returnCountryColor(appState.countryrecords, 'IM'),
                iN: returnCountryColor(appState.countryrecords, 'IN'),
                iO: returnCountryColor(appState.countryrecords, 'IO'),
                iQ: returnCountryColor(appState.countryrecords, 'IQ'),
                iR: returnCountryColor(appState.countryrecords, 'IR'),
                iS: returnCountryColor(appState.countryrecords, 'IS'),
                iT: returnCountryColor(appState.countryrecords, 'IT'),
                jE: returnCountryColor(appState.countryrecords, 'JE'),
                jM: returnCountryColor(appState.countryrecords, 'JM'),
                jO: returnCountryColor(appState.countryrecords, 'JO'),
                jP: returnCountryColor(appState.countryrecords, 'JP'),
                kE: returnCountryColor(appState.countryrecords, 'KE'),
                kG: returnCountryColor(appState.countryrecords, 'KG'),
                kH: returnCountryColor(appState.countryrecords, 'KH'),
                kI: returnCountryColor(appState.countryrecords, 'KI'),
                kM: returnCountryColor(appState.countryrecords, 'KM'),
                kN: returnCountryColor(appState.countryrecords, 'KN'),
                kP: returnCountryColor(appState.countryrecords, 'KP'),
                kR: returnCountryColor(appState.countryrecords, 'KR'),
                kW: returnCountryColor(appState.countryrecords, 'KW'),
                kY: returnCountryColor(appState.countryrecords, 'KY'),
                kZ: returnCountryColor(appState.countryrecords, 'KZ'),
                lA: returnCountryColor(appState.countryrecords, 'LA'),
                lB: returnCountryColor(appState.countryrecords, 'LB'),
                lC: returnCountryColor(appState.countryrecords, 'LC'),
                lI: returnCountryColor(appState.countryrecords, 'LI'),
                lK: returnCountryColor(appState.countryrecords, 'LK'),
                lR: returnCountryColor(appState.countryrecords, 'LR'),
                lS: returnCountryColor(appState.countryrecords, 'LS'),
                lT: returnCountryColor(appState.countryrecords, 'LT'),
                lU: returnCountryColor(appState.countryrecords, 'LU'),
                lV: returnCountryColor(appState.countryrecords, 'LV'),
                lY: returnCountryColor(appState.countryrecords, 'LY'),
                mA: returnCountryColor(appState.countryrecords, 'MA'),
                mC: returnCountryColor(appState.countryrecords, 'MC'),
                mD: returnCountryColor(appState.countryrecords, 'MD'),
                mE: returnCountryColor(appState.countryrecords, 'ME'),
                mF: returnCountryColor(appState.countryrecords, 'MF'),
                mG: returnCountryColor(appState.countryrecords, 'MG'),
                mH: returnCountryColor(appState.countryrecords, 'MH'),
                mK: returnCountryColor(appState.countryrecords, 'MK'),
                mL: returnCountryColor(appState.countryrecords, 'ML'),
                mM: returnCountryColor(appState.countryrecords, 'MM'),
                mN: returnCountryColor(appState.countryrecords, 'MN'),
                mO: returnCountryColor(appState.countryrecords, 'MO'),
                mP: returnCountryColor(appState.countryrecords, 'MP'),
                mQ: returnCountryColor(appState.countryrecords, 'MQ'),
                mR: returnCountryColor(appState.countryrecords, 'MR'),
                mS: returnCountryColor(appState.countryrecords, 'MS'),
                mT: returnCountryColor(appState.countryrecords, 'MT'),
                mU: returnCountryColor(appState.countryrecords, 'MU'),
                mV: returnCountryColor(appState.countryrecords, 'MV'),
                mW: returnCountryColor(appState.countryrecords, 'MW'),
                mX: returnCountryColor(appState.countryrecords, 'MX'),
                mY: returnCountryColor(appState.countryrecords, 'MY'),
                mZ: returnCountryColor(appState.countryrecords, 'MZ'),
                nA: returnCountryColor(appState.countryrecords, 'NA'),
                nC: returnCountryColor(appState.countryrecords, 'NC'),
                nE: returnCountryColor(appState.countryrecords, 'NE'),
                nF: returnCountryColor(appState.countryrecords, 'NF'),
                nG: returnCountryColor(appState.countryrecords, 'NG'),
                nI: returnCountryColor(appState.countryrecords, 'NI'),
                nL: returnCountryColor(appState.countryrecords, 'NL'),
                nO: returnCountryColor(appState.countryrecords, 'NO'),
                nP: returnCountryColor(appState.countryrecords, 'NP'),
                nR: returnCountryColor(appState.countryrecords, 'NR'),
                nU: returnCountryColor(appState.countryrecords, 'NU'),
                nZ: returnCountryColor(appState.countryrecords, 'NZ'),
                oM: returnCountryColor(appState.countryrecords, 'OM'),
                pA: returnCountryColor(appState.countryrecords, 'PA'),
                pE: returnCountryColor(appState.countryrecords, 'PE'),
                pF: returnCountryColor(appState.countryrecords, 'PF'),
                pG: returnCountryColor(appState.countryrecords, 'PG'),
                pH: returnCountryColor(appState.countryrecords, 'PH'),
                pK: returnCountryColor(appState.countryrecords, 'PK'),
                pL: returnCountryColor(appState.countryrecords, 'PL'),
                pM: returnCountryColor(appState.countryrecords, 'PM'),
                pN: returnCountryColor(appState.countryrecords, 'PN'),
                pR: returnCountryColor(appState.countryrecords, 'PR'),
                pS: returnCountryColor(appState.countryrecords, 'PS'),
                pT: returnCountryColor(appState.countryrecords, 'PT'),
                pW: returnCountryColor(appState.countryrecords, 'PW'),
                pY: returnCountryColor(appState.countryrecords, 'PY'),
                qA: returnCountryColor(appState.countryrecords, 'QA'),
                rE: returnCountryColor(appState.countryrecords, 'RE'),
                rO: returnCountryColor(appState.countryrecords, 'RO'),
                rS: returnCountryColor(appState.countryrecords, 'RS'),
                rU: returnCountryColor(appState.countryrecords, 'RU'),
                rW: returnCountryColor(appState.countryrecords, 'RW'),
                sA: returnCountryColor(appState.countryrecords, 'SA'),
                sB: returnCountryColor(appState.countryrecords, 'SB'),
                sC: returnCountryColor(appState.countryrecords, 'SC'),
                sD: returnCountryColor(appState.countryrecords, 'SD'),
                sE: returnCountryColor(appState.countryrecords, 'SE'),
                sG: returnCountryColor(appState.countryrecords, 'SG'),
                sH: returnCountryColor(appState.countryrecords, 'SH'),
                sI: returnCountryColor(appState.countryrecords, 'SI'),
                sJ: returnCountryColor(appState.countryrecords, 'SJ'),
                sK: returnCountryColor(appState.countryrecords, 'SK'),
                sL: returnCountryColor(appState.countryrecords, 'SL'),
                sM: returnCountryColor(appState.countryrecords, 'SM'),
                sN: returnCountryColor(appState.countryrecords, 'SN'),
                sO: returnCountryColor(appState.countryrecords, 'SO'),
                sR: returnCountryColor(appState.countryrecords, 'SR'),
                sS: returnCountryColor(appState.countryrecords, 'SS'),
                sT: returnCountryColor(appState.countryrecords, 'ST'),
                sV: returnCountryColor(appState.countryrecords, 'SV'),
                sX: returnCountryColor(appState.countryrecords, 'SX'),
                sY: returnCountryColor(appState.countryrecords, 'SY'),
                sZ: returnCountryColor(appState.countryrecords, 'SZ'),
                tC: returnCountryColor(appState.countryrecords, 'TC'),
                tD: returnCountryColor(appState.countryrecords, 'TD'),
                tF: returnCountryColor(appState.countryrecords, 'TF'),
                tG: returnCountryColor(appState.countryrecords, 'TG'),
                tH: returnCountryColor(appState.countryrecords, 'TH'),
                tJ: returnCountryColor(appState.countryrecords, 'TJ'),
                tK: returnCountryColor(appState.countryrecords, 'TK'),
                tL: returnCountryColor(appState.countryrecords, 'TL'),
                tM: returnCountryColor(appState.countryrecords, 'TM'),
                tN: returnCountryColor(appState.countryrecords, 'TN'),
                tO: returnCountryColor(appState.countryrecords, 'TO'),
                tR: returnCountryColor(appState.countryrecords, 'TR'),
                tT: returnCountryColor(appState.countryrecords, 'TT'),
                tV: returnCountryColor(appState.countryrecords, 'TV'),
                tW: returnCountryColor(appState.countryrecords, 'TW'),
                tZ: returnCountryColor(appState.countryrecords, 'TZ'),
                uA: returnCountryColor(appState.countryrecords, 'UA'),
                uG: returnCountryColor(appState.countryrecords, 'UG'),
                uM: returnCountryColor(appState.countryrecords, 'UM'),
                uS: returnCountryColor(appState.countryrecords, 'US'),
                uY: returnCountryColor(appState.countryrecords, 'UY'),
                uZ: returnCountryColor(appState.countryrecords, 'UZ'),
                vA: returnCountryColor(appState.countryrecords, 'VA'),
                vC: returnCountryColor(appState.countryrecords, 'VC'),
                vE: returnCountryColor(appState.countryrecords, 'VE'),
                vG: returnCountryColor(appState.countryrecords, 'VG'),
                vI: returnCountryColor(appState.countryrecords, 'VI'),
                vN: returnCountryColor(appState.countryrecords, 'VN'),
                vU: returnCountryColor(appState.countryrecords, 'VU'),
                wF: returnCountryColor(appState.countryrecords, 'WF'),
                wS: returnCountryColor(appState.countryrecords, 'WS'),
                xK: returnCountryColor(appState.countryrecords, 'XK'),
                yE: returnCountryColor(appState.countryrecords, 'YE'),
                yT: returnCountryColor(appState.countryrecords, 'YT'),
                zA: returnCountryColor(appState.countryrecords, 'ZA'),
                zM: returnCountryColor(appState.countryrecords, 'ZM'),
                zW: returnCountryColor(appState.countryrecords, 'ZW'),

                //_currentMapColors,
              ),
            ))));
  }
}

class ActiveCountrylist extends StatelessWidget {
  ActiveCountrylist();
  final CurrentCountryCollectionReference countyRef =
      currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country;

  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<CurrentCountryQuerySnapshot>(
        ref: countyRef,
        builder: (context, AsyncSnapshot<CurrentCountryQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) return Text('Something went wrong!');
          if (!snapshot.hasData) return Text('Loading user...');

          // Access the UserDocumentSnapshot
          CurrentCountryQuerySnapshot querySnapshot = snapshot.requireData;
          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              CurrentCountry currentcountry = querySnapshot.docs[index].data;

              return ListTile(
                leading: Text(CountryFlag(
                    currentcountry.countryCode)), // Image.network(src),
                title: Text('${currentcountry.countryName}'),
                subtitle: Text('${currentcountry.countryCode}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegionListPage(
                          countrycode: currentcountry.countryCode),
                    ),
                  );
                },
              );
            },
          );
        });
  }
}

String CountryFlag(String countryCode) {
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}
