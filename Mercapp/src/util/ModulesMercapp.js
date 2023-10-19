import React from "react";
// stack navigation
import { createNativeStackNavigator } from "@react-navigation/native-stack";

// modules
import CreateInventariadoSupermercado from "../modules/inventariado-supermercado/screens/CreateInventariadoSupermercado";
import CreatePedidoSupermercado from "../modules/pedido-supermercado/screens/CreatePedidoSupermercado";
import CreateReportePrecios from "../modules/reporte-precios/screens/CreateReportePrecios";
import CreateCobranza from "../modules/cobranza/screens/CreateCobranza";
import CreateAsistencia from "../modules/asistencia/screens/CreateAsistencia";

// Images
import InventariadoImage from "../assets/images/inventariado-supermercado.png";
import PedidoImage from "../assets/images/pedido-supermercado.png";
import AsistenciaImage from "../assets/images/asistencia.png";

const Stack = createNativeStackNavigator();

// modules
export const ModulesMercapp = [
  {
    name: "inventariado_supermercado",
    element: CreateInventariadoSupermercado,
    nameLabel: "Inventariado",
    image: InventariadoImage,
  },
  {
    name: "pedido_supermercado",
    element: CreatePedidoSupermercado,
    nameLabel: "Pedidos",
    image: PedidoImage,
  },
  {
    name: "reporte_precios",
    element: CreateReportePrecios,
    nameLabel: "Reporte precios",
    image: "",
  },
  {
    name: "cobranza",
    element: CreateCobranza,
    nameLabel: "Cobranza",
    image: "",
  },
  {
    name: "asistencia",
    element: CreateAsistencia,
    nameLabel: "Asistencia",
    image: AsistenciaImage,
  },
];
