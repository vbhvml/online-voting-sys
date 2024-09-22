module QuizModule::BlockchainQuiz {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct to store quiz details.
    struct Quiz has store, key {
        correct_answer: u64,  // Correct answer for the quiz
        reward: u64,          // Reward tokens for a correct answer
    }

    /// Initialize a new quiz with a correct answer and reward.
    public entry fun create_quiz(owner: &signer, correct_answer: u64, reward: u64) {
        let quiz = Quiz {
            correct_answer,
            reward,
        };
        move_to(owner, quiz);
    }

    /// Submit an answer and get rewarded if correct.
    public entry fun submit_answer(player: &signer, quiz_owner: address, answer: u64) acquires Quiz {
        let quiz = borrow_global<Quiz>(quiz_owner);

        // Check if the answer is correct
        if (answer == quiz.correct_answer) {
            // Reward the player with tokens
            let reward_amount = quiz.reward;
            let reward = coin::withdraw<AptosCoin>(player, reward_amount);
            coin::deposit<AptosCoin>(signer::address_of(player), reward);
        };
    }
}
