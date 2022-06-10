import Debug "mo:base/Debug";
import Lis "mo:base/List";
import List "mo:base/List";


actor DKeeper {
  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> =List.nil<Note>();

  public func createNote(titleText: Text,contentText: Text){
    let newNote:Note = {
      title = titleText;
      content = contentText;
    };

    notes:=List.push<Note>(newNote, notes);
    Debug.print(debug_show(notes));
  };

  public query func readNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func removeNote(id:Nat){
    //var size=List.size<Note>(notes);
    let listFront=List.take(notes,id);
    let listBack=List.drop(notes,id+1);
    notes := List.append(listFront,listBack);
  }
}
