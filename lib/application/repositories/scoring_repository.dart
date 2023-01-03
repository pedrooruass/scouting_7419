import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsheets/gsheets.dart';
import 'package:scoring_7419/application/models/scoring_model.dart';

class ScoringRepository {
  final _credentials = r'''
{
  "type": "service_account",
  "project_id": "scoring-50753",
  "private_key_id": "03c4509e58f9f87770411e28f64929885e270ac3",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCLR72lC7ewUanm\nQyo/+VgOMTQ2uGHJqoSePcJvl6inGT1hODOE6OfXpMNtUofnE/iypMvIz2JJBDFj\nEgaU1/OD6odPejlzHhuTNS/vWf7bkt28jVlIeq6RLV5LtJOloO8oBNFlawaLJ9Sw\ngBX0nmDupf3cBCuRG0E9/f77bK5s7cKMgyfyHNETE0shQJlc4ZFcVf3HrUXZYCC8\nQ+KhYBL/tNYdzwDwiwo5nCcTEAn7c7o+FVOUEM8SCL2FgFEgrANTGtePzfYUdlDL\na2x/4T+eD01pzuN2xj5LE51Obju4/lWHeohJ2A1OmBJ2c7A1ayKfGCH0yVnZqyCM\na6znHTF9AgMBAAECggEAQftHjVPCvoXBbjMtZccy/u4yZSXuNYJRd0Gcxg7bt+WO\nHWtphLJtesw0RKsPdNoSPFczrzsHvb19xAg7E/JGC51kYrNtWerOd2t//OzufojS\nAMwZmut7nY0Xmde/Bnz6L0QxCtGr9Op2qPLU8+C/3O7IF53mIcT+oGaej++JplI9\npwXJUTi20BiokKGchhtoX8G4Zls4HVwgxD6EdWW4vrsaK+wrBA4GbueiLdTZ/2SP\nEemDN8WKtEek6r0uGIAQEriwYn1L2/EjcI9E0OOUXiPiDGtbx8G2xiLlktSeztjz\nfkI3LfwaU0m2N5MNTrzjVKj0prGSPVCs0RRd8lAIBQKBgQC/D4ebvAjGF7kRz6M5\n4OK8IEIPEWeEZombT3R1v6FdXzNL7jzKZktLbI9hu7ZqeJ1kUDlK6ETZ3HMarlV9\nPOj5Ta0rjHlOKauAFwEWBPGe8izkqzj8OTrvPWtQbVS5G4pwnTBuEw3qykCWqFE3\nF/Uo4rBp+1NLaO7+l2ZgaKShFwKBgQC6nrhHEFrF5u66spKnCI7hBCfaOrle/eW7\ns9frswQPzhJ/Yklr9hFRmwYEXdB53jn6vu3gToRCPadvx+MxDPrqIywPpIac6Eke\nHdh2Y6W2V9O7AgoGHnzAQgcX/HtH5QBe/TDRYRp+WDYPaBwuxlpkwCeOrv5fY1QM\nPYW9XsRWiwKBgQCUq0zmTea13ffQeDWW7/r+UEuW1gAq8m7ZP3ZruXWi5lVQHE2J\nYRft1MetURecucYfLJ2oQBxzOisG8+jpzt+qPlslq+UogRxGS6A4thgdimyMcv+g\npBfL2YsLxkdK0rdi8a2huYn2zPJ9SPQJXscRzXNgxIQIBdsSmFS9aC/SeQKBgFrL\nT+KbLV6tfSZuLPWBL2qAiBcfjQKPSo8o73soDGjYHJ3HJuuUu1ZVsva64ev414KM\nE9WWvbgwoN68hGdf5k+1rwEpTajXRoOVh7QJxRzS3BtW4aOaf51WQndECoKvAqA0\nVOT5dldT+XFDeLq1HFN6PYSo1O95tvGBmSjKC4IDAoGAR9g0RRAj68SxMjTa/ZHO\n009qD4jNvZR1qhlbW4Vcy6ihW1ERxyXk2S9kjNqoFd9OpZhdsKy9Hpi6vcVl0Os7\nrr0zdbMHmyrtAt/Y2uhXDiqMhN2NR24BHlQiWoVO4WaFjug3msmlbvvnhFVpIrw5\nM6x5sx/fSa0HLCC76YNnWqA=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@scoring-50753.iam.gserviceaccount.com",
  "client_id": "101963075226417863111",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40scoring-50753.iam.gserviceaccount.com"
}
''';

  final _spreadSheetId = "1R0Il5LIjUnzXalyPzP2nz6uzG502k1iqacdwDc7sXjw";

  Future<bool> submitScoring(ScoringModel scoring) async {
    return _put(scoring.id, scoring.toJson(), scoring.tournamentKey);
  }

  Future<bool> _put(String id, Map<String, dynamic> map, String tournamentKey) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('scoring');
    WriteBatch batch = FirebaseFirestore.instance.batch();
    batch.set(collectionReference.doc(id), map);
    await batch.commit();
    // submit google sheets
    //Init Gsheets
    final gsheets = GSheets(_credentials);
    final ss = await gsheets.spreadsheet(_spreadSheetId);
    final sheet = ss.worksheetByTitle(tournamentKey);
    //update a cell
    await sheet!.values.appendRow(map.values.toList());
    return true;
  }
}
