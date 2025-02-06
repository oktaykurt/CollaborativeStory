// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

/**
 * @title CollaborativeStory
 * @notice This contract allows multiple authors to collectively write chapters of a story
 * and share any funds deposited into the contract based on the number of chapters each
 * contributor has authored.
 */
contract CollaborativeStory {

    struct Chapter {
        address author;
        string text;
        uint256 timestamp;
    }

    Chapter[] public chapters;
    mapping(address => uint256) public contributions;
    mapping(address => uint256) public claimedBalance;
    uint256 public totalChapters;

    /**
     * @dev Emitted when a new chapter is added.
     */
    event ChapterAdded(address indexed author, uint256 chapterIndex, string text);

    /**
     * @dev Emitted when an author withdraws their share of the contract's funds.
     */
    event FundsWithdrawn(address indexed author, uint256 amount);

    /**
     * @dev Adds a new chapter to the story.
     * @param _text The content of the chapter.
     */
    function addChapter(string calldata _text) external {
        chapters.push(Chapter({
            author: msg.sender,
            text: _text,
            timestamp: block.timestamp
        }));

        contributions[msg.sender] += 1;
        totalChapters += 1;

        emit ChapterAdded(msg.sender, chapters.length - 1, _text);
    }

    /**
     * @dev Returns the total number of chapters in the story.
     */
    function getChapterCount() external view returns (uint256) {
        return chapters.length;
    }

    /**
     * @dev Allows anyone to deposit funds into the contract.
     */
    function depositFunds() external payable {
        // Funds are added to the contract balance.
    }

    /**
     * @dev Withdraws the caller's proportional share of the contract balance.
     * The share is based on the ratio of chapters authored by the caller
     * to the total number of chapters.
     */
    function withdrawFunds() external {
        require(totalChapters > 0, "No chapters contributed yet");
        require(contributions[msg.sender] > 0, "Caller has not contributed any chapters");

        uint256 contractBalance = address(this).balance;
        uint256 totalPreviouslyClaimed = totalClaimedByAll();
        uint256 fraction = contributions[msg.sender];
        uint256 totalShare = (contractBalance + totalPreviouslyClaimed) * fraction / totalChapters;

        uint256 alreadyClaimed = claimedBalance[msg.sender];
        require(totalShare > alreadyClaimed, "Nothing to withdraw at this time");

        uint256 amountOwed = totalShare - alreadyClaimed;
        claimedBalance[msg.sender] += amountOwed;

        payable(msg.sender).transfer(amountOwed);
        emit FundsWithdrawn(msg.sender, amountOwed);
    }

    /**
     * @dev Returns the total amount of ETH claimed by all contributors.
     */
    function totalClaimedByAll() public view returns (uint256) {
        uint256 length = chapters.length;
        address[] memory uniqueAuthors = new address[](length);
        uint256 uniqueCount = 0;
        uint256 totalClaimed;

        for (uint256 i = 0; i < length; i++) {
            address author = chapters[i].author;
            bool seen = false;
            for (uint256 j = 0; j < uniqueCount; j++) {
                if (uniqueAuthors[j] == author) {
                    seen = true;
                    break;
                }
            }
            if (!seen) {
                uniqueAuthors[uniqueCount] = author;
                uniqueCount++;
            }
        }

        for (uint256 k = 0; k < uniqueCount; k++) {
            totalClaimed += claimedBalance[uniqueAuthors[k]];
        }

        return totalClaimed;
    }

    /**
     * @dev Fallback function to receive ETH directly.
     */
    receive() external payable {}

    /**
     * @dev Fallback function for calls without data.
     */
    fallback() external payable {}
}