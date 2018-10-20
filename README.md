# mouseStructuralConnectivity
Code for estimating interareal axonal connectivity in mouse.

Data are from (and any work using this should cite):

Oh, S. W. et al. A mesoscale connectome of the mouse brain. Nature **508**, 207–214 (2014).

And for the re-analysis of these data by Ypma and Bullmore:

Ypma, R. J. F. & Bullmore, E. T. Statistical Analysis of Tract-Tracing Experiments Demonstrates a Dense, Complex Cortical Network in the Mouse. PLoS Comp. Biol. **12**, e1005104–22 (2016).

Example usage:

**Add path to Data**:
```matlab
startup
```

**Process supplementary data from Oh et al.**:
```matlab
ImportConnectomeData()
```

**Get normalized connection density estimates for the right hemisphere with data taken from the statistical model of Oh et al.**:

```matlab
whatData = 'Oh';
doBinarize = false;
pThreshold = 0.05;
whatWeightMeasure = 'NCD';
whatHemispheres = 'right';

[Adj,regionAcronyms,adjPVals] = GiveMeAdj(whatData,pThreshold,doBinarize,...
                                    whatWeightMeasure,whatHemispheres);
```


**Construct weighted Ypma connectome**

```matlab
whatData = 'Ypma';
doBinarize = false;

[Adj,regionAcronyms] = GiveMeAdj(whatData,[],doBinarize);
```
