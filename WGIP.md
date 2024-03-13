## Issue aimed to be fixed with my proposed solution:
    The spacetime complexity of this algorithm blows up quite quickly as the absolute path length increases, and I think this could be optimized. 
    
    Below is how I belive this can be done. 


## Proposal Overview: 
    My proposal for improving the pathfinding algorithm within the context of Wikipedia would involve using an LLM or MLM, as I mentioned previously as a proposed solution. 
    
    The idea is to itemize all the links on a given Wikipedia page and use these as inputs for the AI, with a prompt that explains the task of finding the fastest path to a target Wikipedia page. 
    
    The links would be tagged by topic title with the link as well. The AI would then select and return the most relevant next link that logically brings us closer to our final destination. 
    
    This method mimics how a human might navigate by choosing links that seem to bridge the current topic with the final one. By processing only the links on the current page, this approach aims to linearly scale with the path length, avoiding the exponential computational complexity seen with traditional pathfinding algorithms in which store an ever increasing number of links. 
    
    By contrast, this would only have to store the links for the current web page, as if a human was looking only at that page in their internet brwoser. This could significantly improve the computational efficiency of this code, and could perhaps improve the runtime as well, but that remains to be seen. 