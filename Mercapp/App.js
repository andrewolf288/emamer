import { AuthProvider } from "./src/auth/context/AuthContext";
import AppNav from "./src/navigation/AppNav";

export default function App() {
  return (
    <AuthProvider>
      <AppNav />
    </AuthProvider>
  );
}
