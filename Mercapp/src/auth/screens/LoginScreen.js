import React, { useContext, useState } from "react";
import { SafeAreaView, View, Text, Image } from "react-native";

import AntDesign from "react-native-vector-icons/AntDesign";
import Ionicons from "react-native-vector-icons/Ionicons";

import CustomButton from "../../components/CustomButton";
import InputField from "../../components/InputField";
import { AuthContext } from "../context/AuthContext";

const LoginScreen = () => {
  const { login } = useContext(AuthContext);
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  return (
    <SafeAreaView style={{ flex: 1, justifyContent: "center" }}>
      <View style={{ paddingHorizontal: 25 }}>
        <View style={{ alignItems: "center" }}>
          <Image
            source={require("../../assets/images/logo-batan.png")}
            style={{ width: 250, height: 200 }}
          />
        </View>

        <Text
          style={{
            // fontFamily: "Roboto-Medium",
            fontSize: 28,
            fontWeight: "500",
            color: "#333",
            marginBottom: 30,
          }}
        >
          Login
        </Text>

        <InputField
          label={"Usuario"}
          icon={
            <AntDesign
              name="user"
              size={20}
              color="#666"
              style={{ marginRight: 5 }}
            />
          }
          value={username}
          onChangeText={(text) => setUsername(text)}
        />

        <InputField
          label={"Contraseña"}
          icon={
            <Ionicons
              name="ios-lock-closed-outline"
              size={20}
              color="#666"
              style={{ marginRight: 5 }}
            />
          }
          inputType="password"
          fieldButtonFunction={() => {}}
          value={password}
          onChangeText={(text) => setPassword(text)}
        />

        <CustomButton
          label={"Login"}
          onPress={() => {
            login(username, password);
          }}
        />
      </View>
    </SafeAreaView>
  );
};

export default LoginScreen;
