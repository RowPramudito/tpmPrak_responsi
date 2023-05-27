import 'package:tpm_prak_responsi/api/base_network.dart';

class DataSource {
  static DataSource instance = DataSource();

  Future<List<dynamic>> getMatchList() {
    return BaseNetwork.getList('matches');
  }
}