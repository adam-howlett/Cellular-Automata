# A Cellular Automata Model for Traffic Flow
Recreating the results from Nagel &amp; Schreckenberg 

This project was completed in service of my Physics Degree some years ago, based on the work of [Kai Nagel &amp; Michael Schreckenberg](https://hal.archives-ouvertes.fr/jpa-00246697/document). It is concerned with the simulation of traffic in a 'cellular automaton' model, whereby cars on a road are reduced to single cells in an array, and evolve over time according to a simple ruleset. A full explanation can be found on its [project page](https://adam-howlett.github.io/cellularautomata.html).

The files in the project recreate the main results found in my [project report](https://adam-howlett.github.io/cellularautomata.html) from the time, and will be extended in the future.

standardflow.m is a matlab file that can be used to generate the spacetime graphs referenced in the project report - The variables p,pspeed,time  & LaneLength can be changed to investigate different systems
flowrelationship.m calls the function file traffic to generate both singular and averaged (over n samples) graphs for the flow/density relationship
traffic.m is a function utilised by flowrelationship.m 
