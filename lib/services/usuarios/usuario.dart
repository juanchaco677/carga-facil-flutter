import 'package:cargafacilapp/model/usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/**
 * servicio crud usuario
 */
class UsuarioService {
//  DocumentSnapshot snapshot
  final db = Firestore.instance;

  Future <void> create(Usuario usuario) async {
    checkUserExist(usuario).then((registro){
        if(registro){
          print("USUARIO REGISTRADO ${usuario.nombre_completo}");
        }else{
          return db.collection('usuario').document(usuario.id).setData(usuario.json);   
        }
    });      
  }

  Future <void> update(Usuario usuario)async {
    return await db.collection('usuario').document(usuario.id).updateData(usuario.json);
  }

  Future <void> delete (Usuario usuario)async{
    return await db.collection('usuario').document(usuario.id).delete();
  }

  Future<DocumentSnapshot> readData(Usuario usuario) async {
    return await db.collection('usuario').document(usuario.id).get();
  }

  Future <Usuario> getUser(String id) async {
    return await db.collection('usuario').document(id).get().then((doc) {
        if (doc.exists)
           return new Usuario(doc.data);
        else
           return = null;
      });
  }


 Future<bool> checkUserExist(Usuario usuario) async {
    bool exists = false;
    try {
      await readData(usuario).then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }
}
