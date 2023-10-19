import React, { useContext, useEffect, useState } from "react";
// Navigator
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import { getFocusedRouteNameFromRoute } from "@react-navigation/native";
// Screens
import HomeScreen from "../screens/HomeScreen";
import CalendarScreen from "../screens/CalendarScreen";
import NotificationScreen from "../screens/NotificationScreen";

// Icons
import Ionicons from "react-native-vector-icons/Ionicons";
import Feather from "react-native-vector-icons/Feather";
import { AuthContext } from "../auth/context/AuthContext";
import { ModulesMercapp } from "../util/ModulesMercapp";

const Tab = createBottomTabNavigator();
const Stack = createNativeStackNavigator();

const HomeStack = () => {
  const { userInfo } = useContext(AuthContext);
  const { permisos } = userInfo;

  const userModules = permisos
    .map((userModule) => {
      const matchingModule = ModulesMercapp.find(
        (module) => module.name === userModule.refTabMod
      );

      return matchingModule; // Retornar el módulo correspondiente o null
    })
    .filter((module) => module !== null);

  return (
    <Stack.Navigator>
      <Stack.Screen name="Home" options={{ headerShown: true }}>
        {() => <HomeScreen userModules={userModules} />}
      </Stack.Screen>
      {userModules.map((module, index) => {
        return module ? (
          <Stack.Screen
            key={index}
            name={module.name}
            component={module.element}
            options={{ headerShown: false }}
          />
        ) : null;
      })}
    </Stack.Navigator>
  );
};

const TabNavigator = () => {
  return (
    <Tab.Navigator
      screenOptions={{
        headerShown: false,
        tabBarShowLabel: false,
        tabBarStyle: { backgroundColor: "#35572F" },
        tabBarInactiveTintColor: "#fff",
        tabBarActiveTintColor: "yellow",
      }}
    >
      <Tab.Screen
        name="Home2"
        component={HomeStack}
        options={({ route }) => ({
          tabBarStyle: {
            display: getTabBarVisibility(route),
            backgroundColor: "#35572F",
          },
          tabBarIcon: ({ color, size }) => (
            <Ionicons name="home-outline" color={color} size={size} />
          ),
        })}
      />
      <Tab.Screen
        name="Calendar"
        component={CalendarScreen}
        options={{
          tabBarBadgeStyle: { backgroundColor: "yellow" },
          tabBarIcon: ({ color, size }) => (
            <Feather name="calendar" color={color} size={size} />
          ),
        }}
      />
      <Tab.Screen
        name="Notifications"
        component={NotificationScreen}
        options={{
          tabBarBadge: 3,
          tabBarBadgeStyle: { backgroundColor: "yellow" },
          tabBarIcon: ({ color, size }) => (
            <Ionicons name="notifications" color={color} size={size} />
          ),
        }}
      />
    </Tab.Navigator>
  );
};

const getTabBarVisibility = (route) => {
  const routeName = getFocusedRouteNameFromRoute(route) ?? "Feed";

  if (routeName == "GameDetails") {
    return "none";
  }
  return "flex";
};

export default TabNavigator;
