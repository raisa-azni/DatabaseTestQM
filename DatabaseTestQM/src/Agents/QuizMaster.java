package Agents;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.CyclicBehaviour;
import jade.lang.acl.ACLMessage;

public class QuizMaster extends Agent {
    private MessageHandler messageHandler;

    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");
        messageHandler = new MessageHandler(this);
        addBehaviour(new InitiateQuizBehaviour());
        addBehaviour(new ReceiveCategorySelectionBehaviour());
    }

    // Behaviour for initiating the quiz
    private class InitiateQuizBehaviour extends CyclicBehaviour {
        public void action() {
            ACLMessage msg = receive();
            if (msg != null && "Start the quiz ...".equals(msg.getContent())) {
                messageHandler.sendRequest("Send the categories to choose from ...", "databaseAgent");
            } else {
                block();
            }
        }
    }

    // New Behaviour for receiving category selection from Interface agent
    private class ReceiveCategorySelectionBehaviour extends CyclicBehaviour {
        public void action() {
            ACLMessage msg = receive();
            if (msg != null && msg.getPerformative() == ACLMessage.INFORM) {
                // Process the received category serial number
                String categorySerialNumber = msg.getContent();
                System.out.println("Generating Questions of the desired category: " + categorySerialNumber);
                // Send the serial number to the databaseAgent to retrieve information
                messageHandler.sendRequest(categorySerialNumber, "databaseAgent");
            } else {
                block();
            }
        }
    }

    // MessageHandler class to encapsulate message sending logic
    private class MessageHandler {
        private Agent agent;

        public MessageHandler(Agent agent) {
            this.agent = agent;
        }

        public void sendRequest(String content, String receiverName) {
            ACLMessage msg = new ACLMessage(ACLMessage.REQUEST);
            msg.addReceiver(new AID(receiverName, AID.ISLOCALNAME));
            msg.setContent(content);
            agent.send(msg);
        }
    }
}

