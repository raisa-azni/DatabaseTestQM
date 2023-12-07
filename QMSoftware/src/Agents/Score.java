package Agents;

import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;
import jade.lang.acl.ACLMessage;

public class Score extends Agent {

    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");
        addBehaviour(new PublishScoreBehaviour());
    }

    private class PublishScoreBehaviour extends SimpleBehaviour {
        private boolean done = false;

        @Override
        public void action() {
            ACLMessage scoreMsg = receive();
            if (scoreMsg != null) {
                String content = scoreMsg.getContent();
                System.out.println("\nYour Score is " + content + " out of 100\n");
                System.out.println("The quiz session has ended.\n");
                done = true;
            } else {
                block();
            }
        }

        @Override
        public boolean done() {
            return done;
        }
    }
}
