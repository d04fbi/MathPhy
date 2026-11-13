<a href="https://doi.org/10.5281/zenodo.22690420"><img src="https://zenodo.org/badge/1363725615.svg" alt="DOI"></a>
# MathPhy
Mathematical Physics
## Abstract
Designed as a seed for a mathematical corpus, this research artifact attempts to bridge the abstraction gap between mathematics and physics by redefining the arcus functions and the circular functions from the geometric quantities of a circular sector. The utility of this framework is then demonstrated by modeling simple harmonic motion and uniform circular motion, providing an exploratory foundation for evaluating formal reasoning and improving dimensional consistency in computational models.
## Prerequisites
GNU Octave 11.3.0  
MiKTeX 24.1
## Compilation
@echo off  
set "output_directory=output"  
set "output_m_directory=%output_directory%\m"  
if not exist "%output_m_directory%" mkdir "%output_m_directory%"  
octave --path src/m src/m/main.m  
set "output_tex_directory=%output_directory%\tex"  
if not exist "%output_tex_directory%" mkdir "%output_tex_directory%"  
pdflatex -aux-directory="%output_tex_directory%" src/tex/report.tex  
exit /b
## Licensing
*   GNU Octave source code (`.m` and `.octaverc` files): Licensed under the [MIT License](licenses/MIT.txt).
*   LaTeX source code and documentation (`.tex`, `.eps`, and `.pdf` files): Licensed under [CC BY 4.0](licenses/CC-BY-4.0.txt).
