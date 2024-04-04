import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;

public class database {
    public static void main(String[] var0){
    }
    public static void terminate(int employee_id) {
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.addBatch("DELETE FROM Employee WHERE employee_id = "+employee_id);
            st.executeBatch();
            System.out.println("Employee "+Integer.toString(employee_id)+" has been deleted from the database.");
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static void removeCustomer(String ssn_sin){
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.addBatch("DELETE FROM Customer WHERE ssn_sin = '"+ssn_sin+"'");
            st.executeBatch();
            st.close();
            db.close();
            System.out.println("Customer "+ssn_sin+" has been deleted from the database.");
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static void updateEmployee(String column, String input, int employee_id) {
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.addBatch("UPDATE Employee SET "+column+" = '"+input+"' WHERE employee_id = '"+employee_id+"'");
            st.executeBatch();
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static void updatePosition(int role_id, String position_title, int employee_id) {
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.execute("UPDATE works_as SET  role_id = '"+role_id+"' , position_title = '"+position_title+ "' WHERE employee_id = '"+employee_id+"'");
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static void updateCustomer(String column, int customer_id, String input){
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.execute("UPDATE Customer SET "+column+" = '"+input+"' WHERE customer_id = '"+customer_id+"'");
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static void addEmployee(String ssn_sin, String name, String address, int hotel_id, int role_id, String position_title){

        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Employee WHERE ssn_sin = '"+ssn_sin+"'");
            rs.next();
            if(rs.getString(1).equals(ssn_sin)){
                System.out.println("There already exists an Employee with this SSN/SIN");
                return;
            }
            /**employee_id, name, address, ssn_sin, hotel_id**/
            else{
                st.execute("INSERT INTO Employee (employee_id, name, address, ssn_sin, hotel_id) VALUES (DEFAULT,'"+name+"','"+address+"','"+ssn_sin+"','"+hotel_id+"');");
                ResultSet emp_id = st.executeQuery("SELECT employee_id FROM Employee WHERE ssn_sin = '"+ssn_sin+"'");
                emp_id.next();
                st.execute("INSERT INTO works_as(employee_id, role_id, position_title) VALUES ("+emp_id.getInt(1)+",'"+role_id+"','"+position_title+"')");
                st.execute("INSERT INTO works_for(employee_id, hotel_id) VALUES ("+emp_id.getInt(1)+",'"+hotel_id+"')");}
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static void addCustomer(String ssn_sin, String name, String address){
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT ssn_sin FROM Customer WHERE ssn_sin = '"+ssn_sin+"'");
            Date registration = new java.sql.Date(Calendar.getInstance().getTime().getTime());
            if(rs.next() == true){
                System.out.println("There already exists an account rergistered with this SSN/SIN");
                return;
            }
            /**name, address, ssn_sin, date_of_registration, cutomer_id**/
            else{
                st.execute("INSERT INTO Customer(name, address, ssn_sin, date_of_registration, cutomer_id) VALUES ('"+name+"','"+address+"','"+ssn_sin+"','"+registration+"',DEFAULT)");
                System.out.println("Thank you for registering an account!");
            }
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static ArrayList<String> searchBookings(int booking_id){
        ArrayList<String> info = new ArrayList<String>();
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Booking WHERE booking_id ='"+booking_id+"')))");
            rs.next();
            info.add(rs.getString(1));
            if (rs.next()) {
                int room_id = rs.getInt("room_id");
                int customer_id = rs.getInt("customer_id");
                Date bookingDate = rs.getDate("booking_date");
                Date checkInDate = rs.getDate("check_in_date");
                Date checkOutDate = rs.getDate("check_out_date");
                String bookingInfo = String.format("Booking ID: %d, Room ID: %d, Customer ID: %d, Booking Date: %s, Check-in Date: %s, Check-out Date: %s",
                        booking_id, room_id, customer_id, bookingDate, checkInDate, checkOutDate);
                info.add(bookingInfo);} else {
                    System.out.println("Booking with ID " + booking_id + " not found.");
                }
            st.close();
            db.close();
            return info;
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
        return info;
    }

    public static void approveBookings(int customer_id, String payment){
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.execute("UPDATE Booking SET approved = 'true', payment = '"+payment+"' WHERE customer_id = '"+customer_id+"'");
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }

    public static ArrayList<String> roomSearch(String check_in_date, String check_out_date, String RoomCapacity, String city, int Price, String Sea_view, String Mountain_view, String Extendable){
        ArrayList<String> roomids = new ArrayList<String>();
        String entry;
        int i = 0;
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            ResultSet rs = st.executeQuery("SELECT category,room_id,price,amenities,damages,hotel_id,address FROM Room CROSS JOIN Hotel WHERE room_id NOT in (SELECT room_id from Renting where (CAST('"+check_in_date+"' AS DATE) not between check_in_date AND check_out_date) AND (CAST('"+check_out_date+"' AS DATE) not between check_in_date AND check_out_date) AND room_id in (Select room_id from Room where sea_view = "+Sea_view+" and mountain_view = "+Mountain_view+" and extendable = "+Extendable+" and capacity = '"+RoomCapacity+"' and price <= "+Price+" and room_id in (select room_id from has where hotel_id in (select hotel_id from hotels where city = '"+city+"'))))");
            while (rs.next() && i < 15){
                entry = rs.getString(1)+", "+rs.getString(2)+", "+rs.getString(3)+", "+rs.getString(4)+", "+rs.getString(5)+", "+rs.getString(6)+", "+rs.getString(7);
                roomids.add(entry);
                i++;
            }
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
        return roomids;
    }

    public static void bookRoom(int customer_id, int room_id, String check_in_date, String check_out_date){
        try {
            Connection db = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hotel+Management", "postgres", "richa123");
            Statement st = db.createStatement();
            st.execute("INSERT INTO Booking(booking_id, room_id, customer_id,check_in_date,check_out_date, payment, approved) VALUES (DEFAULT,'"+room_id+"', '"+customer_id+"',"+check_in_date+",'"+check_out_date+"',Null,Null)");
            st.close();
            db.close();
        } catch (SQLException exception) {
            System.out.println("Exception has been thrown:" + exception.getMessage());
        }
    }
}
