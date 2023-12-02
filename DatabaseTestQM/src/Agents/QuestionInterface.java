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


public class QuestionInterface extends Agent {
    private MessageHandler messageHandler;
    private Gson gson;

    @Override
    protected void setup() {
        System.out.println(getLocalName() + " is ready.");
        gson = new Gson();
        messageHandler = new MessageHandler(this);

        addBehaviour(new ReceiveQuestionListBehaviour());
    }
    //New
    private class ReceiveQuestionListBehaviour extends SimpleBehaviour {
        private boolean done = false;
        public int count = 0;
        public int score = 0;
        @Override
        public void action() {

            ACLMessage questionMsg = receive();
            if (questionMsg != null) {
                String content = questionMsg.getContent();
                String contentCA = "2"; //questionMsg.getContent();
                if (!"End of Questions".equals(content)) {
                    //System.out.println(content);
                   String question = content.split("#")[0].trim();
                    contentCA = content.split("#")[1].trim();
                    System.out.println(question);
                    System.out.println("CA:" +contentCA);
                    answerSelection(contentCA);
                } else {
                    //System.out.println("These are the available categories.");
                    //answerSelection();
                    done = true;
                }
            } else {
                block();
            }
        }

        private void answerSelection(String contentCA) {
            Scanner scanner = new Scanner(System.in);
            System.out.print("Enter your answer number: ");
            String selectedAns = scanner.nextLine();
            if(Objects.equals(contentCA, selectedAns)){
                count++;
                score++;
                System.out.println("Correct Answer");
            }else{
                count++;
                System.out.println("Wrong Answer");
            }
            if(count >=5 ){
                System.out.println("Your Points: "+score);
                done();
            }

        }

        @Override
        public boolean done() {
            return done;
        }
    }


}
