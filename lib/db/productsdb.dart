import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/product.dart';

class ProductsDatabase {
  static final ProductsDatabase instance = ProductsDatabase._init();

  static Database? _database;

  //ProductDatabase class constructor
  ProductsDatabase._init();

  //get the database
  Future<Database> get database async {
    if (_database != null) return _database!;

    //call database initialization method
    _database = await _initDB('ProductDB.db');
    return _database!;
  }

  //init the database and return
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDBTable);
  }

  Future _createDBTable(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    print('Creating Product Table');

    await db.execute('''
                CREATE TABLE $ProductsTable ( 
                  ${ProductFields.PID} $idType, 
                  ${ProductFields.Name} $textType,
                  ${ProductFields.Condition} $textType,
                  ${ProductFields.Weight} $integerType,
                  ${ProductFields.Brand} $textType,
                  ${ProductFields.Color} $textType,
                  ${ProductFields.Rating} $textType,
                  ${ProductFields.P_Category} $textType,
                  ${ProductFields.Img_Url} $textType,
                  ${ProductFields.ProductLink} $textType
                  )
                ''');
    //add user and user settings table;
  }

  //INSERT PRODUCT
  Future<Product> createAndInsert(Product Product) async {
    final db = await instance.database;

    final id = await db.insert(ProductsTable, Product.toJson());
    print('Inserted Product with id: $id');
    return Product.copyWith(PID: id);
  }

  Future<Product> readProduct(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      ProductsTable,
      columns: ProductFields.values,
      where: '${ProductFields.PID} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Product.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Product>> readAllProducts() async {
    final db = await instance.database;

    final orderBy = '${ProductFields.Name} ASC';
    // print('here 1');
    // await db.execute("DROP TABLE IF EXISTS $ProductsTable");
    // print('here 2');
    final result = await db.query(ProductsTable, orderBy: orderBy);

    return result.map((json) => Product.fromJson(json)).toList();
  }

  Future<int> update(Product Product) async {
    final db = await instance.database;

    return db.update(
      ProductsTable,
      Product.toJson(),
      where: '${ProductFields.PID} = ?',
      whereArgs: [Product.PID],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      ProductsTable,
      where: '${ProductFields.PID} = ?',
      whereArgs: [id],
    );
  }

  deleteAllProducts() async {
    final db = await instance.database;

    await db.delete(ProductsTable);
    print('Deleted all products from ProductsTable');
    await db.delete('sqlite_sequence',
        where: 'name = ? ', whereArgs: [ProductsTable]);
  }

  dropDatabase() async {
    //Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Products1.db');

    // Delete the database
    await deleteDatabase(path);
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
