library store;

// 1- importing the driver:
import 'package:oracledart/oracledart.dart';
import 'job.dart';
//
///****
// * A class to manage a list of jobs in memory
// * and Oracle storage.
// */
class JobStore {
  final List<Job> jobs = new List();
  Job job;
  OracleConnection conn; // connection object
  OracleResultset resultset;
  OracleStatement stmt;
  var connStr = ' "(DESCRIPTION=" "(ADDRESS=(PROTOCOL=TCP)(HOST=oracledb)(PORT=1521))"'
            ' "(CONNECT_DATA=(SERVICE_NAME=XE)(SERVER=DEDICATED)))"';

  // 2- opening a connection to the database:
  openAndStore() {
    connect("SYS", "avalon", connStr).then((oracleconnection) {
      conn = oracleconnection;
      print('connected with Oracle!');
      storeData();
    }).catchError(print);
  }

  storeData() {
    for (job in jobs) {
      insert(job);
    }
  }

  // 3- inserting a record in a table:
  insert(Job job) {
    var jobMap = job.toMap();
    var insertSql = 'insert into jobs values (:1, :2, :3, :4, :5, :6)';
    stmt = conn.createStatement(insertSql);
    stmt.setInt(1, jobMap['dbKey']);
    stmt.setString(2, jobMap['type']);
    stmt.setInt(3, jobMap['salary']);
    stmt.setString(4, jobMap['company']);
    stmt.setString(5, jobMap['posted']);
    stmt.setString(6, jobMap['open']);
    stmt.executeQuery();
  }

  openAndRead() {
    connect("SYS", "avalon", connStr).then((oracleconnection) {
        conn = oracleconnection;
        readData();
    }).catchError(print);
  }

  // 8- reading records from a table:
  readData() {
    resultset = conn.select("select * from jobs");
    processJob(resultset);
  }

  // 9- working with record data:
  processJob(results) {
     while (resultset.next()) {
       print('dbKey: ${resultset.getInt(0)}');
       print('type:  ${resultset.getString(1)}');
       print('salary: ${resultset.getInt(2)}');
       print('company:  ${resultset.getString(3)}');
       print('posted: ${resultset.getString(4)}');
       print('open: ${resultset.getString(5)}');
     }
  }
}