# mouseStructuralConnectivity
Code for estimating interareal axonal connectivity in mouse

Example usage:

**Add path to Data***:
```matlab
startup
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
