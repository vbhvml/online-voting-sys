module VotingSystem::BlockchainVoting {
    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Voting has store, key {
        option_a_votes: u64,
        option_b_votes: u64,
        reward: u64,
        is_active: bool,
    }

    // Mock function to get the age of the voter
    fun get_age(voter: address): u8 {
        // In a real implementation, this function would fetch the age from a trusted source
        18 // Assuming all voters are 18 for this example
    }

    public entry fun create_voting(owner: &signer, reward: u64) {
        let voting = Voting {
            option_a_votes: 0,
            option_b_votes: 0,
            reward,
            is_active: true,
        };
        move_to(owner, voting);
    }

    public entry fun submit_vote(voter: &signer, voting_owner: address, option: u8) acquires Voting {
        let voting = borrow_global_mut<Voting>(voting_owner);
        assert!(voting.is_active, 1);

        // Check if the voter is underage
        let voter_age = get_age(signer::address_of(voter));
        assert!(voter_age >= 18, 2); // Assuming the legal voting age is 18

        if (option == 0) {
            voting.option_a_votes = voting.option_a_votes + 1;
        } else if (option == 1) {
            voting.option_b_votes = voting.option_b_votes + 1;
        } else {
            return;
        }

        let reward_amount = voting.reward;
        let reward = coin::withdraw<AptosCoin>(voting_owner, reward_amount);
        coin::deposit<AptosCoin>(signer::address_of(voter), reward);
    }

    public entry fun end_voting(owner: &signer) acquires Voting {
        let voting = borrow_global_mut<Voting>(signer::address_of(owner));
        voting.is_active = false;
    }

    public fun get_results(voting_owner: address): (u64, u64) acquires Voting {
        let voting = borrow_global<Voting>(voting_owner);
        (voting.option_a_votes, voting.option_b_votes)
    }
}
