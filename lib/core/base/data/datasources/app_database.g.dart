// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  KeycapGroupDao? _keycapGroupDaoInstance;

  KeycapSetDao? _keycapSetDaoInstance;

  KeycapCatDao? _keycapCatDaoInstance;

  KeycapDao? _keycapDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `KeycapSet` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `isComplete` INTEGER NOT NULL, `description` TEXT, `imagePath` TEXT, `groupId` TEXT NOT NULL, FOREIGN KEY (`groupId`) REFERENCES `KeycapGroup` (`id`) ON UPDATE CASCADE ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `KeycapGroup` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `description` TEXT, `total` INTEGER NOT NULL, `totalComplete` INTEGER NOT NULL, `timeCreate` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `KeyCap` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `isFinish` INTEGER NOT NULL, `catId` TEXT NOT NULL, FOREIGN KEY (`catId`) REFERENCES `KeycapCat` (`id`) ON UPDATE CASCADE ON DELETE CASCADE, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `KeycapCat` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `timeCreate` INTEGER NOT NULL, `setId` TEXT NOT NULL, FOREIGN KEY (`setId`) REFERENCES `KeycapSet` (`id`) ON UPDATE CASCADE ON DELETE CASCADE, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  KeycapGroupDao get keycapGroupDao {
    return _keycapGroupDaoInstance ??=
        _$KeycapGroupDao(database, changeListener);
  }

  @override
  KeycapSetDao get keycapSetDao {
    return _keycapSetDaoInstance ??= _$KeycapSetDao(database, changeListener);
  }

  @override
  KeycapCatDao get keycapCatDao {
    return _keycapCatDaoInstance ??= _$KeycapCatDao(database, changeListener);
  }

  @override
  KeycapDao get keycapDao {
    return _keycapDaoInstance ??= _$KeycapDao(database, changeListener);
  }
}

class _$KeycapGroupDao extends KeycapGroupDao {
  _$KeycapGroupDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _keycapGroupInsertionAdapter = InsertionAdapter(
            database,
            'KeycapGroup',
            (KeycapGroup item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'total': item.total,
                  'totalComplete': item.totalComplete,
                  'timeCreate': item.timeCreate
                }),
        _keycapGroupUpdateAdapter = UpdateAdapter(
            database,
            'KeycapGroup',
            ['id'],
            (KeycapGroup item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'total': item.total,
                  'totalComplete': item.totalComplete,
                  'timeCreate': item.timeCreate
                }),
        _keycapGroupDeletionAdapter = DeletionAdapter(
            database,
            'KeycapGroup',
            ['id'],
            (KeycapGroup item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'total': item.total,
                  'totalComplete': item.totalComplete,
                  'timeCreate': item.timeCreate
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<KeycapGroup> _keycapGroupInsertionAdapter;

  final UpdateAdapter<KeycapGroup> _keycapGroupUpdateAdapter;

  final DeletionAdapter<KeycapGroup> _keycapGroupDeletionAdapter;

  @override
  Future<List<KeycapGroup>> getAllGroup() async {
    return _queryAdapter.queryList(
        'SELECT * FROM KeycapGroup ORDER BY timeCreate DESC',
        mapper: (Map<String, Object?> row) => KeycapGroup(
            name: row['name'] as String,
            description: row['description'] as String?,
            total: row['total'] as int,
            totalComplete: row['totalComplete'] as int,
            timeCreate: row['timeCreate'] as int,
            id: row['id'] as String));
  }

  @override
  Future<void> insertNewGroup(KeycapGroup keycapGroup) async {
    await _keycapGroupInsertionAdapter.insert(
        keycapGroup, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateGroup(KeycapGroup keycapGroup) async {
    await _keycapGroupUpdateAdapter.update(
        keycapGroup, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteGroup(KeycapGroup keycapGroup) async {
    await _keycapGroupDeletionAdapter.delete(keycapGroup);
  }
}

class _$KeycapSetDao extends KeycapSetDao {
  _$KeycapSetDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _keycapSetInsertionAdapter = InsertionAdapter(
            database,
            'KeycapSet',
            (KeycapSet item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isComplete': item.isComplete ? 1 : 0,
                  'description': item.description,
                  'imagePath': item.imagePath,
                  'groupId': item.groupId
                }),
        _keycapSetUpdateAdapter = UpdateAdapter(
            database,
            'KeycapSet',
            ['id'],
            (KeycapSet item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isComplete': item.isComplete ? 1 : 0,
                  'description': item.description,
                  'imagePath': item.imagePath,
                  'groupId': item.groupId
                }),
        _keycapSetDeletionAdapter = DeletionAdapter(
            database,
            'KeycapSet',
            ['id'],
            (KeycapSet item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isComplete': item.isComplete ? 1 : 0,
                  'description': item.description,
                  'imagePath': item.imagePath,
                  'groupId': item.groupId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<KeycapSet> _keycapSetInsertionAdapter;

  final UpdateAdapter<KeycapSet> _keycapSetUpdateAdapter;

  final DeletionAdapter<KeycapSet> _keycapSetDeletionAdapter;

  @override
  Future<List<KeycapSet>> getAllSetFromGroup(String groupId) async {
    return _queryAdapter.queryList('SELECT * FROM KeycapSet WHERE groupId= ?1',
        mapper: (Map<String, Object?> row) => KeycapSet(
            name: row['name'] as String,
            isComplete: (row['isComplete'] as int) != 0,
            groupId: row['groupId'] as String,
            imagePath: row['imagePath'] as String?,
            description: row['description'] as String?,
            id: row['id'] as String),
        arguments: [groupId]);
  }

  @override
  Future<void> insertNewSet(KeycapSet keycapSet) async {
    await _keycapSetInsertionAdapter.insert(
        keycapSet, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSet(KeycapSet keycapSet) async {
    await _keycapSetUpdateAdapter.update(keycapSet, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSet(KeycapSet keycapSet) async {
    await _keycapSetDeletionAdapter.delete(keycapSet);
  }
}

class _$KeycapCatDao extends KeycapCatDao {
  _$KeycapCatDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _keycapCatInsertionAdapter = InsertionAdapter(
            database,
            'KeycapCat',
            (KeycapCat item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'timeCreate': item.timeCreate,
                  'setId': item.setId
                }),
        _keycapCatUpdateAdapter = UpdateAdapter(
            database,
            'KeycapCat',
            ['id'],
            (KeycapCat item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'timeCreate': item.timeCreate,
                  'setId': item.setId
                }),
        _keycapCatDeletionAdapter = DeletionAdapter(
            database,
            'KeycapCat',
            ['id'],
            (KeycapCat item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'timeCreate': item.timeCreate,
                  'setId': item.setId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<KeycapCat> _keycapCatInsertionAdapter;

  final UpdateAdapter<KeycapCat> _keycapCatUpdateAdapter;

  final DeletionAdapter<KeycapCat> _keycapCatDeletionAdapter;

  @override
  Future<List<KeycapCat>> getAllCat(String setId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM KeycapCat WHERE setId=?1 ORDER BY timeCreate DESC',
        mapper: (Map<String, Object?> row) => KeycapCat(
            name: row['name'] as String,
            setId: row['setId'] as String,
            timeCreate: row['timeCreate'] as int,
            id: row['id'] as String),
        arguments: [setId]);
  }

  @override
  Future<void> insertNewCat(KeycapCat keycapCat) async {
    await _keycapCatInsertionAdapter.insert(
        keycapCat, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCat(KeycapCat keycapCat) async {
    await _keycapCatUpdateAdapter.update(keycapCat, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCat(KeycapCat keycapCat) async {
    await _keycapCatDeletionAdapter.delete(keycapCat);
  }
}

class _$KeycapDao extends KeycapDao {
  _$KeycapDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _keyCapInsertionAdapter = InsertionAdapter(
            database,
            'KeyCap',
            (KeyCap item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isFinish': item.isFinish ? 1 : 0,
                  'catId': item.catId
                }),
        _keyCapUpdateAdapter = UpdateAdapter(
            database,
            'KeyCap',
            ['id'],
            (KeyCap item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isFinish': item.isFinish ? 1 : 0,
                  'catId': item.catId
                }),
        _keyCapDeletionAdapter = DeletionAdapter(
            database,
            'KeyCap',
            ['id'],
            (KeyCap item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isFinish': item.isFinish ? 1 : 0,
                  'catId': item.catId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<KeyCap> _keyCapInsertionAdapter;

  final UpdateAdapter<KeyCap> _keyCapUpdateAdapter;

  final DeletionAdapter<KeyCap> _keyCapDeletionAdapter;

  @override
  Future<List<KeyCap>> getAllKeyCap(String catID) async {
    return _queryAdapter.queryList('SELECT * FROM KeyCap WHERE catID = ?1',
        mapper: (Map<String, Object?> row) => KeyCap(
            name: row['name'] as String,
            isFinish: (row['isFinish'] as int) != 0,
            catId: row['catId'] as String,
            id: row['id'] as String),
        arguments: [catID]);
  }

  @override
  Future<void> insertNewKeyCap(KeyCap keyCap) async {
    await _keyCapInsertionAdapter.insert(keyCap, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertNewKeyCaps(List<KeyCap> keyCaps) async {
    await _keyCapInsertionAdapter.insertList(keyCaps, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateKeyCap(KeyCap keyCap) async {
    await _keyCapUpdateAdapter.update(keyCap, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateKeyCaps(List<KeyCap> keycaps) async {
    await _keyCapUpdateAdapter.updateList(keycaps, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteKeyCap(KeyCap keyCap) async {
    await _keyCapDeletionAdapter.delete(keyCap);
  }
}
