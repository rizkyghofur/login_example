import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'sqliteModel.g.dart';

const penggunaTable = SqfEntityTable(tableName: 'pengguna', fields: [
  SqfEntityField('id', DbType.integer, isPrimaryKeyField: true),
  SqfEntityField('id_pengguna', DbType.text),
  SqfEntityField('nama_pengguna', DbType.text),
  SqfEntityField('role', DbType.text),
]);

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
    modelName: 'AppDBModel',
    dbVersion: 9,
    databaseName: 'app.db',
    databaseTables: [
      penggunaTable
    ],
    sequences: [seqIdentity],
    bundledDatabasePath: null);
