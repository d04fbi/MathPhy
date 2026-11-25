<a href="https://doi.org/10.5281/zenodo.22690420"><img src="https://zenodo.org/badge/1363725615.svg" alt="DOI"></a>
# MathPhy
Mathematical Physics
## Abstract
Designed as a seed for a mathematical corpus tailored for machine learning, this research artifact attempts to bridge the abstraction gap between mathematics and physics by redefining the circular and arcus (inverse circular) functions from the geometric quantities of a circular sector. The utility of this framework is then demonstrated by modeling simple harmonic motion and uniform circular motion, providing an exploratory foundation for evaluating formal reasoning and improving dimensional consistency in computational models.
## Prerequisites
GNU Octave 11.3.0  
MiKTeX 24.1
## Compilation
octave main.m  
for %%i in (*.tex) do pdflatex "%%i"
