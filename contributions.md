## What I did
Since this was a solo project, I developed everything on my own.

## Glaring issue with the project
I have addressed this issue in my readme as well: This project worked very with gpt4 (although expensive at ~20 cents per full 5 node path). However, recent new usage limits (during finals week) on OpenAI's server mean both gpt4 and gpt4o are limited to just 1-2 quick queries when taking into account the size of the context window being passed in this project specifically (as can be seen in AIRequest.txt). This means only gpt3.5 tubro can be used to generate links, which unfortunately causes hallucaintion beyond our control, ultimately meaning I have not been able to reproduce complete paths since this change on OpenAIs side. I was at least lucky to document progress and working versions with gpt4 in the pngs: Examples/originalOutput.png, Examples/Online1.0.png, and Examples/Online2.0.png.

## How to test (what little can be tested)
On top of the sample outputs I was lucky enough to have saved along the process (because at each step I told myself that it was good enough to submit, but I wanted to make it look cleaner to show off to friends), this can be tested using the gpt3.5 drop down on the webpage. This will not produce a entire valid, or super logical path, because gpt3.5 cannot seem to identify the vaid next logical path for some reason (so it will halt the path finding at some point along the process). You can also test with gpt4, but it will halt after the first path is returned because with the new server limitations I cannot do more than 2 requests within a short amount fo time. 

## Update With Fix
Although not a very sexy fix that does not always work, I figured that we could increase the spacing in time between requests, by forcing a sleeping call between requests. This means that gpt4 can be used for testing (although please be conservative on number of times it is tested as this is paid on my account). Furthermore, the time to find a path may seem super long, but this is becasue I am manually forcing my program to sleep in order to avoid hitting usage rates. 

## Final Notes
Overall, I think it is important to note that despite last minute changes on OpenAIs side, I was still able to fix this program and that it (even with this stupid change) has improved on the spacetime complexity of the original pathfinding algorithm, and when using gpt4 it does outperfom the runtime of the original pathfinding alrogithm for longer links (when the exponential blowup was very significant for the A* algorithm). It is important to remember the algorithm was at 5x as fast before this sleep had to be added, but that it is still an improvement. Moreover, having AIs reasoning for path selection makes this very easy to follow along, and provides a cool addition that makes this feel very optimized in terms of selecting the shortest possible path. I think I did a good job on this project all things considered. 