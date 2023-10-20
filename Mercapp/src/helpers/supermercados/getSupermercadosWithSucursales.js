import axios from "axios";
import { BASE_URL } from "../../config";

export const getSupermercadosWithSucursales = async () => {
  const URL = `${BASE_URL}/api/supermercado/getSupermercadosWithSucursales`;
  const { data } = await axios.get(URL);
  return data;
};
