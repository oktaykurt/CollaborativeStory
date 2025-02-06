# CollaborativeStory

CollaborativeStory is a smart contract that enables multiple authors to co-write chapters of a narrative while automatically splitting any deposited funds based on each contributor’s total number of chapters. It includes a built-in first chapter to kickstart the story and can be used on any EVM-compatible network (for example, the Odyssey Testnet).

---

## Features

1. **Automatic First Chapter**  
   The contract creates an inaugural chapter upon deployment, setting the stage for collaborative storytelling.

2. **Multi-Author Collaboration**  
   Anyone can call the `addChapter` function to contribute new chapters to the story.

3. **Revenue Sharing**  
   When ETH is deposited into the contract, contributors can call `withdrawFunds` to claim their share, proportional to the number of chapters they have authored.

4. **Transparent Accounting**  
   The contract keeps track of how much each user has already withdrawn, preventing double payouts.

---

## Deployment & Interaction

### 1. Add the Contract to Your Project
Place the `CollaborativeStory.sol` file into your project. If you prefer an online IDE like [Remix](https://remix.ethereum.org/), simply upload or drag the file there.

### 2. Compile
Use **Solidity 0.8.17** or higher to ensure compatibility. In Remix, select the appropriate compiler version in the **Solidity Compiler** panel.

### 3. Deploy
Switch your wallet (e.g., MetaMask) to an EVM-compatible test network (such as the **Odyssey Testnet**). Deploy the contract from Remix or your chosen framework and confirm the transaction in your wallet.

### 4. Interact with the Contract

- `addChapter("Your chapter text...")`: Adds a new chapter to the story.  
- `depositFunds()`: Send test ETH to the contract. You can also transfer ETH directly to the contract address.  
- `withdrawFunds()`: Claims the caller’s share of the total funds, based on chapters contributed.  
- `getChapterCount()`: Returns the total number of chapters.  
- `totalClaimedByAll()`: Provides a sum of all ETH claimed by contributors so far.

---

## Example Usage

1. **Add a Chapter**  
   Call the `addChapter` function with your desired text to continue the story.

2. **Deposit Funds**  
   Specify an amount of ETH when you call `depositFunds` or send ETH directly to the contract address.

3. **Withdraw Your Share**  
   If you've contributed at least one chapter, you can call `withdrawFunds` to receive your proportional share of the contract balance.

---

## Interacting with the Deployed Contract on Odyssey

A live version of CollaborativeStory is deployed at:
[0x231388537b785233Fd8686b327fC546086BB48db](https://odyssey.storyscan.xyz/address/0x231388537b785233Fd8686b327fC546086BB48db?tab=read_write_contract)

To read the story or add new chapters:

1. **Visit the Contract Page**  
   Go to the [odyssey.storyscan.xyz link](https://odyssey.storyscan.xyz/address/0x231388537b785233Fd8686b327fC546086BB48db?tab=read_write_contract).

2. **Connect Your Wallet**  
   In the "Write Contract" section, connect your wallet (e.g., MetaMask) to the Odyssey network.

3. **Add a Chapter**  
   - Find the `addChapter` function.
   - Enter your new chapter text in the input field.
   - Click **Write** and confirm the transaction in your wallet.
   - Once the transaction is confirmed, your chapter will appear on-chain.

4. **Deposit Funds**  
   - Either use the `depositFunds` function (enter the amount in the "Value" field if the explorer/portal supports it) **or**  
   - Send ETH directly to the contract address (copy the contract address, go to your wallet, and perform a transfer).

5. **Withdraw Your Share**  
   - If you have contributed at least one chapter, call the `withdrawFunds` function from the "Write Contract" tab.
   - Confirm the transaction in your wallet.
   - You will receive your proportional share of any ETH in the contract.

6. **Read Contract Data**  
   - The "Read Contract" tab lets you check the number of chapters, total claimed funds, and other information.

---

## Security Considerations

1. **Production Readiness**  
   While this contract is functional, consider audits or thorough testing before using it with real funds.

2. **Gas Optimization**  
   The `totalClaimedByAll` function is written for clarity but can be expensive with a large number of chapters. A more efficient approach may be necessary for large-scale usage.

3. **Storage of Large Text**  
   Storing large strings on-chain can be costly. For longer chapters, consider storing data in IPFS or similar decentralized storage.

---

## License

This project is licensed under the **MIT License**. Refer to the [LICENSE](LICENSE) file in this repository for more information.

---

## Contribute

Feel free to open issues or submit pull requests to enhance the story mechanics, optimize performance, or add new features such as NFTs, governance, or integration with other decentralized applications.

---

## Happy Storytelling

With CollaborativeStory, the world of on-chain literature expands with each block. Get creative, gather co-authors, and forge a tale—securely and transparently—on the blockchain.
