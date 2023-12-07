package Agents;

import jade.core.Agent;
import jade.core.behaviours.SimpleBehaviour;
import jade.lang.acl.ACLMessage;
import jade.core.AID;
import java.util.Objects;
import java.util.Scanner;

public class QuestionInterface extends Agent {
    private MessageHandler messageHandler;

    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");

        messageHandler = new MessageHandler(this);

        addBehaviour(new ReceiveQuestionListBehaviour());
    }

    private class ReceiveQuestionListBehaviour extends SimpleBehaviour {
        private boolean done = false;
        private int count = 0;
        private int score = 0;

        @Override
        public void action() {
            ACLMessage questionMsg = receive();
            if (questionMsg != null) {
                String content = questionMsg.getContent();

                if (!"End of Questions".equals(content)) {
                    processQuestion(content);
                } else {
                    // Send score to Score agent
                    sendScore();
                    done = true;
                }
            } else {
                block();
            }
        }

        private void processQuestion(String content) {
            // Split the content into question and options
            String[] parts = content.split("#");
            String question = parts[0].trim();
            String correctAnswer = parts[parts.length - 1].trim(); // Correct answer is the last part

            // Print question and options
            System.out.println("\n" + (count + 1) + ". " + question);
            for (int i = 1; i < parts.length - 1; i++) {
                System.out.println(i + ": " + parts[i].trim());
            }

            // Get user's answer
            Scanner scanner = new Scanner(System.in);
            System.out.print("\nEnter your answer number: ");
            String selectedAns = scanner.nextLine();

            // Check answer and update score
            if (Objects.equals(correctAnswer, selectedAns)) {
                score += 10;
            }
            count++;

            // Check if quiz is complete
            if (count >= 10) {
                MessageHandler.sendInformD(score + "", "scoreAgent");
                done = true;
            }
        }

        private void sendScore() {
            ACLMessage scoreMsg = new ACLMessage(ACLMessage.INFORM);
            scoreMsg.addReceiver(new AID("scoreAgent", AID.ISLOCALNAME));
            scoreMsg.setContent(String.valueOf(score));
            send(scoreMsg);
        }

        @Override
        public boolean done() {
            return done;
        }
    }
}
