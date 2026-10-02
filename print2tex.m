% =============================================================================
% Copyright © 2026 Fredrik Bierich
% 
% This file is licensed under the Creative Commons Attribution-NonCommercial-
% ShareAlike 4.0 International License (CC BY-NC-SA 4.0).
%
% You are free to share and adapt this material for non-commercial purposes,
% provided you give appropriate credit and distribute your contributions under 
% the same license. Commercial use and sale are strictly prohibited.
%
% For commercial licensing inquiries, please contact: fredrik.bierich@gmail.com
% =============================================================================
function print2tex(figureHandle, fileName)
    paperUnits = get(figureHandle, 'PaperUnits');
    paperPosition = get(figureHandle, 'PaperPosition');
    paperPositionMode = get(figureHandle, 'PaperPositionMode');
    cleanupObj = onCleanup(@() set(figureHandle, 'PaperUnits', paperUnits, 'PaperPosition', paperPosition, 'PaperPositionMode', paperPositionMode));
    set(figureHandle, 'PaperUnits', 'normalized');
    set(figureHandle, 'PaperPosition', [0, 0, 1, 1]);
    print(figureHandle, fileName, '-dtex');
end
