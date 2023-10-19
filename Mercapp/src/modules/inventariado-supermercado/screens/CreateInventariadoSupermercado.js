import {
  View,
  Text,
  ActivityIndicator,
  TouchableOpacity,
  StyleSheet,
  Modal,
  FlatList,
} from "react-native";
import React, { useState } from "react";
import Icon from "react-native-vector-icons/MaterialIcons";
import { useNavigation } from "@react-navigation/native";

const supermarkets = [
  {
    nombre: "SAGA FALABELLA",
    sucursales: [
      {
        nombre: "SAGA FALABELLA CANTERAS",
      },
      {
        nombre: "SAGA FALABELLA MOLINA",
      },
    ],
  },
  {
    nombre: "METRO",
    sucursales: [
      {
        nombre: "METRO AV. LIMA",
      },
      {
        nombre: "METRO SAN ISIDRO",
      },
    ],
  },
];
const CreateInventariadoSupermercado = () => {
  // estado 0: seleccion supermercado sucursal
  // estado 1: estado de carga
  // estado 2: screen create inventariado supermercado
  const [stateScreen, setStateScreen] = useState(0);

  const [selectedSupermercado, setSelectedSupermercado] = useState(null);
  const [selectedSupermercadoSucursal, setSelectedSupermercadoSucursal] =
    useState(null);

  const navigation = useNavigation();

  const handleSupermercadoSelect = (value) => {
    console.log(value);
    setSelectedSupermercado(value);
    setSelectedSupermercadoSucursal(null); // Resetea la sucursal seleccionada
  };

  const handleSucursal = (value) => {
    setSelectedSupermercadoSucursal(value);
    setStateScreen(1);
    setTimeout(() => {
      setStateScreen(2);
    }, 2000);
  };

  const onCloseModalSupermercadoSelect = () => {
    console.log("regresamos al home");
    setSelectedSupermercado(null);
    setSelectedSupermercadoSucursal(null);
    navigation.navigate("Home");
  };

  const onCloseModalSupermercadoSucursal = () => {
    setSelectedSupermercadoSucursal(null);
    setSelectedSupermercado(null);
  };

  switch (stateScreen) {
    case 0:
      return (
        <View style={styles.container}>
          {!selectedSupermercado && !selectedSupermercadoSucursal && (
            <Modal transparent animationType="slide">
              <View style={styles.modalBackground}>
                <View style={styles.modalContainer}>
                  <TouchableOpacity
                    onPress={() => onCloseModalSupermercadoSelect()}
                    style={styles.closeButton}
                  >
                    <Icon name="close" size={40} color="red" />
                  </TouchableOpacity>
                  <Text style={styles.heading}>
                    Seleccione un supermercado:
                  </Text>
                  <FlatList
                    data={supermarkets}
                    keyExtractor={(item) => item.nombre}
                    renderItem={({ item }) => (
                      <TouchableOpacity
                        onPress={() => handleSupermercadoSelect(item)}
                        style={styles.item}
                      >
                        <Text>{item.nombre}</Text>
                      </TouchableOpacity>
                    )}
                  />
                </View>
              </View>
            </Modal>
          )}
          {selectedSupermercado && (
            <Modal transparent animationType="slide">
              <View style={styles.modalBackground}>
                <View style={styles.modalContainer}>
                  <TouchableOpacity
                    onPress={() => onCloseModalSupermercadoSucursal()}
                    style={styles.closeButton}
                  >
                    <Icon name="close" size={40} color="red" />
                  </TouchableOpacity>
                  <Text style={styles.heading}>Seleccione una sucursal:</Text>
                  <FlatList
                    data={selectedSupermercado.sucursales}
                    keyExtractor={(item, index) => {
                      `${item.nombre} - ${index}`;
                    }}
                    renderItem={({ item }) => (
                      <TouchableOpacity
                        onPress={() => handleSucursal(item)}
                        style={styles.item}
                      >
                        <Text>{item.nombre}</Text>
                      </TouchableOpacity>
                    )}
                  />
                </View>
              </View>
            </Modal>
          )}
        </View>
      );
    case 1:
      return (
        <View style={{ flex: 1, justifyContent: "center" }}>
          <ActivityIndicator size={"large"} />
        </View>
      );
    case 2:
      return (
        <View>
          <Text>Screen create</Text>
        </View>
      );
  }
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  modalBackground: {
    flex: 1,
    backgroundColor: "rgba(0, 0, 0, 0.5)", // Fondo gris semitransparente
    justifyContent: "center",
    alignItems: "center",
  },
  modalContainer: {
    width: "80%", // Ancho del modal
    backgroundColor: "white",
    padding: 20,
    borderRadius: 8,
  },
  heading: {
    fontSize: 16,
    fontWeight: "bold",
    marginBottom: 8,
  },
  item: {
    padding: 16,
    borderBottomWidth: 1,
    borderBottomColor: "lightgrey",
  },
  closeButton: {
    position: "absolute",
    top: 10,
    right: 10,
    padding: 5,
    backgroundColor: "transparent",
    zIndex: 999,
  },
});

export default CreateInventariadoSupermercado;
