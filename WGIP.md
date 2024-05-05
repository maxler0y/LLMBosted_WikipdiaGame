## Project Members
    Max Leroy

## Issue aimed to be fixed with my (just me) proposed solution:
    The spacetime complexity of this algorithm blows up quite quickly as the absolute path length increases, and I think this could be optimized. 
    
    Below is how I belive this can be done. 


## Proposal Overview: 
    My proposal for improving the pathfinding algorithm within the context of Wikipedia would involve using an LLM or MLM, as I mentioned previously as a proposed solution. 
    
    The idea is to itemize all the links on a given Wikipedia page and use these as inputs for the AI, with a prompt that explains the task of finding the fastest path to a target Wikipedia page. 
    
    The links would be tagged by topic title with the link as well. The AI would then select and return the most relevant next link that logically brings us closer to our final destination. 
    
    This method mimics how a human might navigate by choosing links that seem to bridge the current topic with the final one. By processing only the links on the current page, this approach aims to linearly scale with the path length, avoiding the exponential computational complexity seen with traditional pathfinding algorithms in which store an ever increasing number of links. 
    
    By contrast, this would only have to store the links for the current web page, as if a human was looking only at that page in their internet brwoser. This could significantly improve the computational efficiency of this code, and could perhaps improve the runtime as well, but that remains to be seen. 


## Psuedocode for this: 
    
    APIs

    Function ExtractTitle(url):
    Fetch the page content from url
    Parse the page content to find the main article title
    Return the article title

    Function ExtractLinks(url):
        Fetch the page content from url
        Parse the page content to find all hyperlinks within the main content area
        Filter out irrelevant links (e.g., special pages, files, help pages)
        For each valid link:
            Extract the link title and construct the full URL
        Return a dictionary of link titles and their URLs

    Function StoreLinks(url):
        title = ExtractTitle(url)
        links = ExtractLinks(url)
        Convert links dictionary to JSON format
        Return the JSON string of links

    Function GetBestNextLink(startUrl, endUrl, startTitle, endTitle, linksJson):
        Construct a prompt explaining the task, including start and end information, and the links
        Send the prompt to the LLM/MLM API
        Receive the model's response, ideally as a JSON object indicating the best next title
        Map title to link
        Return the best next link

    Main:
        startUrl = Get user input for the start URL
        endUrl = Get user input for the end URL
        currentUrl = startUrl
        endTitle = ExtractTitle(endUrl)
        Prepare system message for AI explaining the objective and constraints

        While currentUrl is not equal to endUrl:
            currentLinksJson = StoreLinks(currentUrl)
            nextLink = GetBestNextLink(currentUrl, endUrl, ExtractTitle(currentUrl), endTitle, currentLinksJson)
            Update currentUrl to the URL from nextLink

## Milestones

### DUE: WEEK Mar 28
- [x] 1: Accept start and end URL. Extract titles.                                
    - APIs: `beautifulSoup`, `requests`
    - Keep track of these variables
    ### DUE: WEEK Mar 28
- [x] 2: Have all Wikipedia links from the current page in a title:URL dictionary   
    - APIs: `beautifulSoup`, `requests`, `re`
    - Custom dictionary case insensitive (`caseInsensitive.py`)
    ### DUE: WEEK Mar 28
- [x] 3: Successfully pass scene info 1x to LLM                                    
    - APIs: `json`, `os`, `openai`, `dotenv`
    - Have it return a JSON payload with `"title"` and `"actual_title_here"` as key:pair
    - Map this title to the actual link in the dictionary
    - Keep track of all visited links to avoid repeats
    - Create env variables for authentication
    ### DUE: WEEK April 4
- [ ] 4: Repetitively send new scene info to LLM                                    
    - Keep sending new scene info from the selected link 
    - stop when returned linked = final link
    - Problem: LLM not always returning perfect JSON
        - Format mode is available for GPT-4, but 10x more expensive...
    ### DUE: WEEK April 18
- [ ] 5: Have successfully tracked path                                             
    - Fully functional with no errors in generating responses
    - Short path with a reasonable flow of evolution
    ### DUE: WEEK May 6
- [ ] 6: Provide this service on a web server through an HTML page                 
    - APIs: `webbrowser`, `flask`, `threading`,
    - create an html page that accepts a starting and ending link and then prints in between links once final path is found
    - also accepts a timing incrememnt and a cost value (in cents)
    - if no path is found after a determinable amount of time or we reach cash threshold, we cancel


## Class Discussion Takeaways
- add previous links to eliminate reproducing links
- extract reasoning to help next LLM continue chain of thought
- 

## Requirements
- .env file located in this repo
    - containing openai dev key details (organization should not be necessary)
    - should look like: "OPENAI_API_KEY=sk-xxx123XXXX"
                        "OPENAI_ORGANIZATION=org-xxxx123XXXX"

