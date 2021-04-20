class Patient {
  int id;
  String nompatient;
  int typedebillant;
  double valeur;
  Patient({this.nompatient, this.id, this.typedebillant, this.valeur});
}

List<Patient> listedespatient = [];

List<String> listdebillant = ['clairance rénale', 'bilirubine', 'tgo/tgp'];
