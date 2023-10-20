import axios from "axios";
import { BASE_URL } from "../../config";

export const getProductosBySupermercadoSucursal = async (idSupMerSuc) => {
  const URL = `${BASE_URL}/api/supermercado/getProductosBySupermercadoSucursal/${idSupMerSuc}`;
  const { data } = await axios.get(URL);
  return data;
};
