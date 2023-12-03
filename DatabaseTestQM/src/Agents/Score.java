package Agents;

import jade.core.AID;
import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;
import jade.lang.acl.ACLMessage;

import java.util.Objects;
import java.util.Scanner;
import com.google.gson.Gson;
import java.util.HashSet;
import java.util.Set;

public class Score extends Agent {
    private MessageHandler messageHandler;
    private Gson gson;

    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");
        gson = new Gson();
        messageHandler = new MessageHandler(this);

        addBehaviour(new Score.publishScoreBehaviour());
    }

    private class publishScoreBehaviour extends SimpleBehaviour {
        private boolean done = false;

        @Override
        public void action() {

            ACLMessage scoreMsg = receive();
            if (scoreMsg != null) {
                String content = scoreMsg.getContent();
                System.out.println("\nYour Score is " + content + " out of 50\n");
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
