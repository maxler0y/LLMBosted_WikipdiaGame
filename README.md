# Project README

## What This Project Provides

This project improves the pathfinding algorithm within the context of Wikipedia by integrating a Language Model (LLM or MLM) to navigate through Wikipedia pages efficiently. The core idea involves itemizing all the links on a given Wikipedia page and using these as inputs for the AI, along with a prompt that directs the task of finding the fastest path to a target Wikipedia page. Each link is tagged by its topic title, allowing the AI to select and return the most relevant next link that logically brings us closer to our final destination. This method mimics human navigation through link selection that seems to bridge the current topic with the final one. By processing only the links on the current page, this approach aims to linearly scale with the path length, thus avoiding the exponential computational complexity typical of traditional pathfinding algorithms. This could significantly enhance the computational efficiency and potentially improve the runtime.

## Installation Instructions

To run this project, you will need to install several Python libraries and set up an environment file. Follow these steps:

1. Install the required libraries using pip:
    ```bash
    pip install Flask BeautifulSoup4 requests regex json os openai python-dotenv case-insensitive time
    ```

2. Create a `.env` file in the same directory as your Python script and configure it as needed.
    content should look like: OPENAI_API_KEY=sk-1234XXXXX

3. Run the Python script:
    ```bash
    python AIpathfinder.py
    ```

4. Open the link provided in your browser to interact with the application.

## Testing

This project was tested on both GPT-3.5 Turbo and GPT-4. While GPT-4 provides much better results (usually close to perfect), it is also more expensive. Most of the testing was done on GPT-3.5 Turbo, but GPT-4 is recommended for better and more accurate results.

## Ongoing Improvements

A few known issues have been identified and are planned for resolution. One significant issue is that Wikipedia pages for the same article can sometimes have different titles, which the current implementation does not account for. This will be addressed in future updates to improve the accuracy and reliability of the pathfinding algorithm.
