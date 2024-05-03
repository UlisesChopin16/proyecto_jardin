import 'package:flutter/material.dart';
import 'package:proyecto_jardin/src/Constants/colors.dart';

class InfoPlantasScreen extends StatefulWidget {

  const InfoPlantasScreen({ 
    super.key,
  });

  @override
  State<InfoPlantasScreen> createState() => _InfoPlantasScreenState();
}

class _InfoPlantasScreenState extends State<InfoPlantasScreen> {

  String obtenerTitulo(String titulo) {
    

    if(titulo == 'alimenticias_condimenticias') {
      return 'Alimenticias y condimenticias';
    }

    switch (titulo) {
      case 'alimenticias_condimenticias':
        return 'Plantas alimenticias y condimenticias';
      case 'coleccion_medicinales':
        return 'Plantas medicinales';
      case 'selva_baja_caducifolia':
        return 'Selva baja caducifolia';
      default: 
        return 'Plantas';
    }
  }


  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String tituloTabla = obtenerTitulo(routeArgs['titulo']);

    Map<String,String> datosPlantas = routeArgs['datos'];

    return Scaffold(
      appBar: AppBar(
        title: Text(tituloTabla),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: DataTable(
              dataRowMinHeight: 40,
              dataRowMaxHeight: 80,
              headingRowHeight: 50,
              horizontalMargin: 18,
              headingRowColor: MaterialStateProperty.all(Palette.beige2),
              border: TableBorder.all(color: Palette.beige2),
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        'Nombre común',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        'Nombre científico',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
              rows: datosPlantas.entries.map((entry) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(entry.key),
                        )
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            entry.value,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ),
                    ],
                  );
                }).toList()
            ),
          )
        )
      ),
    );
  }
}