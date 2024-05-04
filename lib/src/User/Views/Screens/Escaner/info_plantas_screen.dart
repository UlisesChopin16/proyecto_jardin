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
    
    switch (titulo) {
      case 'alimenticias_condimenticias':
        return 'Plantas alimenticias y condimenticias';
      case 'coleccion_medicinales':
        return 'Plantas medicinales';
      case 'selva_baja_caducifolia':
        return 'Selva baja caducifolia';
      default: 
        return 'Información';
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
          child: TablaPlantas(datosPlantas: datosPlantas)
        )
      ),
    );
  }
}

class TablaPlantas extends StatelessWidget {
  const TablaPlantas({
    super.key,
    required this.datosPlantas,
  });

  final Map<String, String> datosPlantas;

  @override
  Widget build(BuildContext context) {

    final List<String> columns;

    if(datosPlantas.containsKey('Datos')){
      columns = ['Datos', 'Contenido'];
    }else{
      columns = ['Nombre\ncomún', 'Nombre científico'];
    }

    return SingleChildScrollView(
      child: DataTable(
        dataRowMinHeight: 40,
        dataRowMaxHeight: 80,
        headingRowHeight: 50,
        horizontalMargin: 18,
        headingRowColor: MaterialStateProperty.all(Palette.beige2),
        border: TableBorder.all(color: Palette.beige2),
        columns: <DataColumn>[
          DataColumn(
            label: Flexible(
              child: Center(
                child: Text(
                  columns[0],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Center(
                child: Text(
                  columns[1],
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
                  Text(entry.key)
                ),
                DataCell(
                  Text(
                    entry.value,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ),
              ],
            );
          }).toList()
      ),
    );
  }
}