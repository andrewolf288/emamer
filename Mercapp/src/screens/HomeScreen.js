import { View, Text, StyleSheet, TouchableOpacity, Image } from "react-native";
import React from "react";
import { useNavigation } from "@react-navigation/native";

const HomeScreen = ({ userModules }) => {
  const navigation = useNavigation();

  return (
    <View style={styles.container}>
      <View style={styles.buttonContainer}>
        {userModules.map((userModule, index) => (
          <View key={index} style={styles.buttonWrapper}>
            <TouchableOpacity
              style={styles.button}
              onPress={() => navigation.navigate(userModule.name)}
            >
              <Image source={userModule.image} style={styles.buttonImage} />
              <Text style={styles.buttonText}>{userModule.nameLabel}</Text>
            </TouchableOpacity>
          </View>
        ))}
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
  },
  header: {
    fontSize: 20,
    fontWeight: "bold",
  },
  buttonContainer: {
    flex: 1,
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent: "space-between",
  },
  buttonWrapper: {
    width: "48%", // Dos columnas en una fila
    marginBottom: 16,
  },
  button: {
    height: 160, // Altura fija del botón
    backgroundColor: "#ABB82D",
    justifyContent: "center",
    alignItems: "center",
    borderRadius: 8,
  },
  buttonImage: {
    width: 80, // Ancho fijo de la imagen
    height: 80, // Alto fijo de la imagen
  },
  buttonText: {
    fontSize: 16,
    fontWeight: "bold",
    marginTop: 8, // Espacio entre la imagen y el texto
  },
});

export default HomeScreen;
