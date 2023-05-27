import 'package:flutter/material.dart';
import 'package:tpm_prak_responsi/api/data_source.dart';
import 'package:tpm_prak_responsi/pages/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piala Dunia 2022'),
      ),
      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: DataSource.instance.getMatchList(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.hasError) {
                return const Center(
                  child: Text('Error in fetching data'),
                );
              }
              else if(snapshot.hasData) {
                final matchList = snapshot.data!;
                return ListView.builder(
                  itemCount: matchList.length,
                  itemBuilder: (context, index) {
                    final matchId = matchList[index]["id"];
                    final homeTeam = matchList[index]["homeTeam"]["name"];
                    final awayTeam = matchList[index]["awayTeam"]["name"];

                    final homeTeamCode = matchList[index]["homeTeam"]["country"].toLowerCase();
                    final awayTeamCode = matchList[index]["awayTeam"]["country"].toLowerCase();
                    //int goalHomeTeam = matchList[index]["homeTeam"]["penalties"];
                    //int goalAwayTeam = matchList[index]["AwayTeam"]["penalties"];
                    return Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DetailPage(matchId: matchId)),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Image.network(
                                      'https://flagcdn.com/256x192/' + homeTeamCode.substring(0, homeTeamCode.length - 1) + '.png',
                                    width: 100,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  Text(homeTeam),
                                ],
                              ),
                              SizedBox(width: 20,),
                              //Text(goalHomeTeam.toString()),
                              SizedBox(width: 20,),
                              //Text(goalAwayTeam.toString()),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Image.network(
                                      'https://flagcdn.com/256x192/' + awayTeamCode.substring(0, awayTeamCode.length - 1) + '.png',
                                    width: 100,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  Text(awayTeam),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
