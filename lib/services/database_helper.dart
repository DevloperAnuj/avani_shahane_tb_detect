import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PatientRecord {
  final int? id;
  final String patientId;
  final String patientName;
  final int patientAge;
  final String patientGender;
  final bool coughOver2Weeks;
  final bool hemoptysis;
  final bool fever;
  final bool nightSweats;
  final bool chestPain;
  final bool fatigue;
  final bool anorexia;
  final bool dyspnea;
  final bool weightLoss;
  final bool previousTB;
  final bool tbContact;
  final bool hivStatus;
  final bool diabetic;
  final bool smoker;
  final String? xrayFileName;
  final double probability;
  final int fusionGain;
  final bool isPositive;
  final String dateTime;

  PatientRecord({
    this.id,
    required this.patientId,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.coughOver2Weeks,
    required this.hemoptysis,
    required this.fever,
    required this.nightSweats,
    required this.chestPain,
    required this.fatigue,
    required this.anorexia,
    required this.dyspnea,
    required this.weightLoss,
    required this.previousTB,
    required this.tbContact,
    required this.hivStatus,
    required this.diabetic,
    required this.smoker,
    this.xrayFileName,
    required this.probability,
    required this.fusionGain,
    required this.isPositive,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patientId': patientId,
      'patientName': patientName,
      'patientAge': patientAge,
      'patientGender': patientGender,
      'coughOver2Weeks': coughOver2Weeks ? 1 : 0,
      'hemoptysis': hemoptysis ? 1 : 0,
      'fever': fever ? 1 : 0,
      'nightSweats': nightSweats ? 1 : 0,
      'chestPain': chestPain ? 1 : 0,
      'fatigue': fatigue ? 1 : 0,
      'anorexia': anorexia ? 1 : 0,
      'dyspnea': dyspnea ? 1 : 0,
      'weightLoss': weightLoss ? 1 : 0,
      'previousTB': previousTB ? 1 : 0,
      'tbContact': tbContact ? 1 : 0,
      'hivStatus': hivStatus ? 1 : 0,
      'diabetic': diabetic ? 1 : 0,
      'smoker': smoker ? 1 : 0,
      'xrayFileName': xrayFileName,
      'probability': probability,
      'fusionGain': fusionGain,
      'isPositive': isPositive ? 1 : 0,
      'dateTime': dateTime,
    };
  }

  factory PatientRecord.fromMap(Map<String, dynamic> map) {
    return PatientRecord(
      id: map['id'],
      patientId: map['patientId'],
      patientName: map['patientName'],
      patientAge: map['patientAge'],
      patientGender: map['patientGender'],
      coughOver2Weeks: map['coughOver2Weeks'] == 1,
      hemoptysis: map['hemoptysis'] == 1,
      fever: map['fever'] == 1,
      nightSweats: map['nightSweats'] == 1,
      chestPain: map['chestPain'] == 1,
      fatigue: map['fatigue'] == 1,
      anorexia: map['anorexia'] == 1,
      dyspnea: map['dyspnea'] == 1,
      weightLoss: map['weightLoss'] == 1,
      previousTB: map['previousTB'] == 1,
      tbContact: map['tbContact'] == 1,
      hivStatus: map['hivStatus'] == 1,
      diabetic: map['diabetic'] == 1,
      smoker: map['smoker'] == 1,
      xrayFileName: map['xrayFileName'],
      probability: map['probability'],
      fusionGain: map['fusionGain'],
      isPositive: map['isPositive'] == 1,
      dateTime: map['dateTime'],
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('tb_patients.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    // Initialize FFI for Windows
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.path, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';
    const realType = 'REAL NOT NULL';

    await db.execute('''
      CREATE TABLE patients (
        id $idType,
        patientId $textType,
        patientName $textType,
        patientAge $intType,
        patientGender $textType,
        coughOver2Weeks $intType,
        hemoptysis $intType,
        fever $intType,
        nightSweats $intType,
        chestPain $intType,
        fatigue $intType,
        anorexia $intType,
        dyspnea $intType,
        weightLoss $intType,
        previousTB $intType,
        tbContact $intType,
        hivStatus $intType,
        diabetic $intType,
        smoker $intType,
        xrayFileName TEXT,
        probability $realType,
        fusionGain $intType,
        isPositive $intType,
        dateTime $textType
      )
    ''');
  }

  Future<int> insertPatient(PatientRecord patient) async {
    final db = await instance.database;
    return await db.insert('patients', patient.toMap());
  }

  Future<List<PatientRecord>> getAllPatients() async {
    final db = await instance.database;
    final result = await db.query('patients', orderBy: 'id DESC');
    return result.map((map) => PatientRecord.fromMap(map)).toList();
  }

  Future<List<PatientRecord>> searchPatients(String query) async {
    final db = await instance.database;
    final result = await db.query(
      'patients',
      where: 'patientId LIKE ? OR patientName LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
      orderBy: 'id DESC',
    );
    return result.map((map) => PatientRecord.fromMap(map)).toList();
  }

  Future<PatientRecord?> getPatientById(String patientId) async {
    final db = await instance.database;
    final result = await db.query(
      'patients',
      where: 'patientId = ?',
      whereArgs: [patientId],
    );
    if (result.isNotEmpty) {
      return PatientRecord.fromMap(result.first);
    }
    return null;
  }

  Future<int> deletePatient(int id) async {
    final db = await instance.database;
    return await db.delete(
      'patients',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
