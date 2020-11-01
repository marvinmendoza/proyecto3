
package edu.umg.dao;

import edu.umg.modelo.Carrera;
import edu.umg.modelo.Producto;
import edu.umg.utils.VariablesGlobales;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
public class ProductoDAO {
    /**
     * Método para obtener todos los registros de la base de datos como objetos
     * @return List de Carrera
     */
    public List<Producto> getDBProductos(){
        List<Producto> productos = new ArrayList<Producto>();
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String consulta = " SELECT codigo, descripcion, precio"+
                              "  FROM producto";
            ResultSet rs = statement.executeQuery(consulta);
            while(rs.next()){
                productos.add(new Producto(rs.getInt("codigo"), rs.getString("descripcion"), rs.getInt("precio")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return productos;
    }

  
    public void saveProducto(Producto producto){
        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String dml = "INSERT INTO producto(codigo,descripcion, precio) VALUES("+
                        producto.getCodigo() + ",'" + producto.getDescripcion() + ",'"+ producto.getPrecio()+ "')";
            System.out.println("dml = " + dml);
            statement.executeUpdate(dml);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    
}
