import {
  View,
  Text,
  ActivityIndicator,
  TouchableOpacity,
  StyleSheet,
  Modal,
  FlatList,
} from "react-native";
import React, { useEffect, useState } from "react";
import Icon from "react-native-vector-icons/MaterialIcons";
import { useNavigation } from "@react-navigation/native";
import { getSupermercadosWithSucursales } from "../../../helpers/supermercados/getSupermercadosWithSucursales";
import { getProductosBySupermercadoSucursal } from "../../../helpers/supermercados/getProductosBySupermercadoSucursal";

const CreateInventariadoSupermercado = () => {
  // estado de la pantalla
  const [stateScreen, setStateScreen] = useState(0);
  // datos de supermercados con sus sucursales
  const [dataSupermercados, setDataSupermercados] = useState([]);
  //datos de productos por supermercado sucursal
  const [
    dataProductosSupermercadoSucursal,
    setDataProductosSupermercadoSucursal,
  ] = useState([]);

  // supermercado seleccionado
  const [selectedSupermercado, setSelectedSupermercado] = useState(null);
  // supermercado sucursal seleccionado
  const [selectedSupermercadoSucursal, setSelectedSupermercadoSucursal] =
    useState(null);

  // manejador de navegacion
  const navigation = useNavigation();

  // manejador de seleccion de supermercado
  const handleSupermercadoSelect = (value) => {
    setSelectedSupermercado(value);
    // reset supermercado sucursal
    setSelectedSupermercadoSucursal(null);
  };

  // manejador de seleccion de supermercado sucursal
  const handleSucursal = (value) => {
    setSelectedSupermercadoSucursal(value);
    // hacemos un llamado al backend para traer informacion de productos por supermercado sucursal
    traerProductosBySupermercadoSucursal();
    // cambiamos de estado de pantalla y mostramos el formulario
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

  const traerProductosBySupermercadoSucursal = async (idSupMerSuc) => {
    try {
      const result = await getProductosBySupermercadoSucursal(idSupMerSuc);
      setDataProductosSupermercadoSucursal(result);
    } catch (error) {
      console.log(error);
    }
  };

  const traerSupermercadosWithSucursales = async () => {
    try {
      const result = await getSupermercadosWithSucursales();
      setDataSupermercados(result);
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => {
    traerSupermercadosWithSucursales();
  }, []);

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
                    data={dataSupermercados}
                    keyExtractor={(item) => item.codSupMer}
                    renderItem={({ item }) => (
                      <TouchableOpacity
                        onPress={() => handleSupermercadoSelect(item)}
                        style={styles.item}
                      >
                        <Text>{item.nomSupMer}</Text>
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
                    keyExtractor={(item) => item.codSupMerSuc}
                    renderItem={({ item }) => (
                      <TouchableOpacity
                        onPress={() => handleSucursal(item)}
                        style={styles.item}
                      >
                        <Text>{item.nomSupMerSuc}</Text>
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
