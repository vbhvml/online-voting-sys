# Blockchain-based Voting System

## Overview

This project aims to build a secure blockchain-based voting system using the Move programming language on the Aptos blockchain. Traditional electronic voting machines (EVMs) are prone to hacking and security breaches. This blockchain-based system leverages the immutable and decentralized nature of blockchain technology to ensure the integrity, transparency, and security of the voting process.

## Key Features

- **Security:** Votes are stored on the blockchain, making it nearly impossible to tamper with the results.
- **Transparency:** All votes are publicly auditable, ensuring accountability.
- **Rewards:** Voters receive reward tokens for participating in the voting process, incentivizing voter turnout.
- **Decentralized:** The system is trustless and decentralized, reducing the reliance on central authorities.

## Voting System Module

The `VotingSystem::BlockchainVoting` module is designed to handle voting on two options (Option A and Option B). Voters can submit their vote, and they will be rewarded with AptosCoin tokens.

### Voting Struct

The `Voting` struct stores the following data:

- `option_a_votes`: Number of votes for option A
- `option_b_votes`: Number of votes for option B
- `reward`: The amount of reward (in tokens) given to voters

### Functions

1. **`create_voting`**: 
   - Initializes a new voting instance with a reward for participants.
   - **Parameters:**
     - `owner`: The signer who creates the voting instance.
     - `reward`: Amount of reward tokens to be distributed to voters.

   ```move
   public entry fun create_voting(owner: &signer, reward: u64)
   ```

2. **`submit_vote`**:
   - Allows a voter to submit their vote for either Option A or Option B.
   - **Parameters:**
     - `voter`: The signer submitting the vote.
     - `voting_owner`: The address of the voting owner.
     - `option`: A vote for option A (`0`) or option B (`1`).
   - **Reward Distribution**:
     - The voter is rewarded with AptosCoin tokens after submitting their vote.

   ```move
   public entry fun submit_vote(voter: &signer, voting_owner: address, option: u8) acquires Voting
   ```

## Messaging Contract

The `send_message::sup` module provides a simple message storage and update mechanism on the blockchain. Users can send and update messages associated with their account.

### Message Struct

- `my_msg`: A string to store the message.

### Functions

1. **`msg`**:
   - Sends or updates a message for the signer.
   - **Parameters:**
     - `account`: The signer's account reference.
     - `msg`: The message to store or update.

   ```move
   public entry fun msg(account: &signer, msg: String) acquires Message
   ```

## Prerequisites

To deploy and interact with this blockchain-based voting system, you will need:

1. **Aptos CLI and Aptos Account**: Set up an Aptos account and environment.
2. **AptosCoin (APT)**: Make sure you have enough APT tokens to cover transaction fees.

## Deployment and Usage

### Step 1: Deploy the Voting Module

Deploy the `VotingSystem::BlockchainVoting` module on your Aptos account.

### Step 2: Create a Voting Instance

To create a new voting instance, call the `create_voting` function with the reward amount in tokens.

### Step 3: Submit a Vote

Voters can call the `submit_vote` function, passing in the voting option and the voting owner's address.

### Step 4: Message Contract

Users can call the `msg` function in the `send_message::sup` module to store or update messages on the blockchain.

## Conclusion

This blockchain-based voting system enhances the security and transparency of the voting process by utilizing the decentralized nature of blockchain. Additionally, voters are incentivized with rewards, promoting higher participation rates. The messaging contract adds a supplementary feature for users to store and update messages on the blockchain.