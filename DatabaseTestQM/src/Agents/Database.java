//package Agents;
//
//import jade.core.AID;
//import jade.core.Agent;
//import jade.core.behaviours.CyclicBehaviour;
//import jade.lang.acl.ACLMessage;
//
//public class Database extends Agent {
//
//    @Override
//    protected void setup() {
//        System.out.println(getLocalName() + " is ready.");
//        addBehaviour(new HandleQuizmasterRequestsBehaviour());
//    }
//
//    // Behaviour for handling requests from QuizmasterAgent
//    private class HandleQuizmasterRequestsBehaviour extends CyclicBehaviour {
//        public void action() {
//            ACLMessage msg = receive();
//            if (msg != null && "Send the categories to choose from ...".equals(msg.getContent())) {
//                sendCategories();
//            } else {
//                block();
//            }
//        }
//    }
//
//    private void sendCategories() {
//        String[] categories = {
//                "0. Biology",
//                "1. Chemistry",
//                "2. English",
//                "3. General Knowledge",
//                "4. Physics"
//        };
//
//        for (String category : categories) {
//            sendMessage(ACLMessage.INFORM, category, "interface");
//        }
//
//        // Send a final message indicating the end of categories
//        sendMessage(ACLMessage.INFORM, "End of Categories", "interface");
//    }
//
//    private void sendMessage(int performative, String content, String receiverName) {
//        ACLMessage msg = new ACLMessage(performative);
//        msg.addReceiver(new AID(receiverName, AID.ISLOCALNAME));
//        msg.setContent(content);
//        send(msg);
//    }
//}

package Agents;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class Database extends Agent {
    // Database connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/quizmasterUsers";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "pknbgr86A@";
    private Gson gson;

    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");
        gson = new Gson();  // Initialize Gson instance
        addBehaviour(new HandleUserInfoBehaviour());
        addBehaviour(new HandleQuizmasterRequestsBehaviour());
    }

    // Behaviour for handling requests from QuizmasterAgent
    private class HandleQuizmasterRequestsBehaviour extends CyclicBehaviour {
        public void action() {
            ACLMessage msg = receive();
            if (msg != null && "Send the categories to choose from ...".equals(msg.getContent())) {
                sendCategories();
            } else {
                block();
            }
        }
    }

    private void sendCategories() {
        String sql = "SELECT serialNumber, categoryName FROM categories ORDER BY serialNumber";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int serialNumber = rs.getInt("serialNumber");
                String categoryName = rs.getString("categoryName");
                sendMessage(ACLMessage.INFORM, serialNumber + ". " + categoryName, "interface");
            }

            sendMessage(ACLMessage.INFORM, "End of Categories", "interface");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to fetch categories");
        }
    }

    private void sendMessage(int performative, String content, String receiverName) {
        ACLMessage msg = new ACLMessage(performative);
        msg.addReceiver(new AID(receiverName, AID.ISLOCALNAME));
        msg.setContent(content);
        send(msg);
    }

    // New Behaviour to handle UserInfo messages
    private class HandleUserInfoBehaviour extends CyclicBehaviour {
        public void action() {
            ACLMessage msg = receive();
            if (msg != null && msg.getOntology().equals("UserInfo")) {
                UserInfo userInfo = gson.fromJson(msg.getContent(), UserInfo.class);
                storeUserInfoInDatabase(userInfo);
            } else {
                block();
            }
        }
    }

    private void storeUserInfoInDatabase(UserInfo userInfo) {
        String sql = "INSERT INTO user (username, email, phoneNumber, password) VALUES (?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userInfo.getUsername());
            pstmt.setString(2, userInfo.getEmail());
            pstmt.setString(3, userInfo.getPhoneNumber());
            pstmt.setString(4, userInfo.getPassword()); // Consider hashing passwords

            pstmt.executeUpdate();
            System.out.println("User info stored successfully ... The available categories are:");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Failed to store user info");


        }
    }
}
