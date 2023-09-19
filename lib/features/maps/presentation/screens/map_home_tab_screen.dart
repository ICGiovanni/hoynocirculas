import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hoy_no_circulas/config/config.dart';
import 'package:hoy_no_circulas/features/main/presentation/widgets/widgets.dart';

class MapHomeTabScreen extends StatelessWidget {
  const MapHomeTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: MyCarsList(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: const GoogleMapWidget(),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  late Position currentPosition;
  var geoLocator = Geolocator();
  late GoogleMapController newGoogleMapController;
  late Set<Marker> markers = {};
  late BitmapDescriptor customIcon;
  bool showVerificentros = false;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    currentPosition = position;

    LatLng latLngPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    markers.add(
      Marker(
        markerId: const MarkerId('marker1'),
        icon: customIcon,
        position:
            const LatLng(9.670850, -63.237054), // Coordenadas del marcador
        infoWindow: const InfoWindow(
          title: 'Vericentro 1',
          snippet: 'Verificentro',
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('marker2'),
        icon: customIcon,
        position:
            const LatLng(9.676283, -63.241907), // Coordenadas del marcador
        infoWindow: const InfoWindow(
          title: 'Vericentro 2',
          snippet: 'Verificentro',
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('marker3'),
        icon: customIcon,
        position:
            const LatLng(9.681116, -63.230243), // Coordenadas del marcador
        infoWindow: const InfoWindow(
          title: 'Vericentro 3',
          snippet: 'Verificentro',
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('marker4'),
        icon: customIcon,
        position:
            const LatLng(9.657805, -63.225387), // Coordenadas del marcador
        infoWindow: const InfoWindow(
          title: 'Vericentro 4',
          snippet: 'Verificentro',
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('marker5'),
        icon: customIcon,
        position:
            const LatLng(9.656487, -63.260140), // Coordenadas del marcador
        infoWindow: const InfoWindow(
          title: 'Vericentro 5',
          snippet: 'Verificentro',
        ),
      ),
    );

    if (mounted) {
      setState(() {
        // Actualizar el estado del widget aquí
      });
    }
  }

  static CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(double.parse(Environment.countryCodeLatitud),
        double.parse(Environment.countryCodeLongitud)),
    zoom: 14.4746,
  );

  Future<void> setCustomMarkerIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 2.5,
        //size: Size(5, 5),
      ),
      'assets/images/pin.png', // Ruta de tu archivo .png
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
    return Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            initialCameraPosition: kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              newGoogleMapController = controller;
              setCustomMarkerIcon();
              _setCustomMapStyle();
              locatePosition();
            },
            markers: showVerificentros ? markers : {},
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          right: 10,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 2.3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Buscar',
                    hintStyle: const TextStyle(fontSize: 17),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: border,
                    focusedBorder: border,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: MaterialButton(
                  color: Theme.of(context).primaryColor,
                  shape: const StadiumBorder(),
                  elevation: 0,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  child: InkWell(
                    onTap: () {
                      showVerificentros = !showVerificentros;
                      setState(() {});
                    },
                    child: Text(
                      !showVerificentros
                          ? 'Mostrar verificentros'
                          : 'Ocultar verificentros',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'QuicksandBold',
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _setCustomMapStyle() async {
    String customMapStyle = '''
    [
      {
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#CFF9D0"
          }
        ]
      },
      {
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#523735"
          }
        ]
      },
      {
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#f5f1e6"
          }
        ]
      },
     
    ]
  ''';

    await newGoogleMapController.setMapStyle(customMapStyle);
  }
}
