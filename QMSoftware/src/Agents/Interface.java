package Agents;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;
import jade.lang.acl.ACLMessage;
import java.util.Scanner;
import com.google.gson.Gson;
import java.util.HashSet;
import java.util.Set;

// Data Model for User Information
class UserInfo {
    private String email;
    private String password;
    private String username;

    public UserInfo(String email, String password,String username) {
        this.email = email;
        this.password = password;
        this.username = username;
    }

    // Getters and Setters
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
}

// Data Model for Quiz Category
class QuizCategory {
    private String category;

    public QuizCategory(String category) {
        this.category = category;
    }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}

// A utility class for handling messages
class MessageHandler {
    private static Agent agent;

    public MessageHandler(Agent agent) {
        this.agent = agent;
    }

    public void sendInform(String content, String receiverName, String ontology) {
        ACLMessage msg = new ACLMessage(ACLMessage.INFORM);
        msg.addReceiver(new AID(receiverName, AID.ISLOCALNAME));
        msg.setContent(content);
        msg.setOntology(ontology);
        agent.send(msg);
    }

    public static void sendInformD(String content, String receiverName) {
        ACLMessage msg = new ACLMessage(ACLMessage.INFORM);
        msg.addReceiver(new AID(receiverName, AID.ISLOCALNAME));
        msg.setContent(content);
        agent.send(msg);
    }
}

// Main Interface Agent Class
public class Interface extends Agent {
    private UserInfo userInfo;
    private MessageHandler messageHandler;
    private Gson gson;
    private Set<String> availableCategories;


    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");
        gson = new Gson();
        messageHandler = new MessageHandler(this);
        availableCategories = new HashSet<>();
        addBehaviour(new UserInputBehaviour());
        addBehaviour(new ReceiveCategoryBehaviour());
    }

    // Behavior class for user input
    private class UserInputBehaviour extends SimpleBehaviour {
        private boolean done = false;

        @Override
        public void action() {
            Scanner scanner = new Scanner(System.in);

            System.out.print("Enter email: ");
            String email = scanner.nextLine();

            System.out.print("Enter password: ");
            String password = scanner.nextLine();

            System.out.print("Enter username: ");
            String username = scanner.nextLine();

            userInfo = new UserInfo(email, password, username);
            System.out.println("Received Data of: " + userInfo.getUsername());

            String userInfoJson = gson.toJson(userInfo);
            messageHandler.sendInform(userInfoJson, "databaseAgent", "UserInfo");

            MessageHandler.sendInformD("Start the quiz ...", "quizmasterAgent");

            done = true;
        }

        @Override
        public boolean done() {
            return done;
        }
    }

    // New Behavior class for receiving categories
    private class ReceiveCategoryBehaviour extends SimpleBehaviour {
        private boolean done = false;

        @Override
        public void action() {
            ACLMessage categoryMsg = receive();
            if (categoryMsg != null) {
                String content = categoryMsg.getContent();
                if (!"No Categories Available".equals(content)) {
                    System.out.println("Category: " + content);
                    availableCategories.add(content.split("\\.")[0].trim());  // Extract and store category serial number

                } else {
                    requestCategorySelection();
                    done = true;
                }
            } else {
                block();
            }
        }

        private void requestCategorySelection() {
            Scanner scanner = new Scanner(System.in);
            System.out.print("\nEnter your desired category number: ");
            String selectedCategory = scanner.nextLine();

            if (availableCategories.contains(selectedCategory)) {
                System.out.println("\nYou selected category: " + selectedCategory);
                MessageHandler.sendInformD(selectedCategory, "quizmasterAgent");
            } else {
                System.out.println("Choose from the available categories.");
                requestCategorySelection();
            }
        }

        @Override
        public boolean done() {
            return done;
        }
    }

}

