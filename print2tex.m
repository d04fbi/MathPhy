% =============================================================================
% Copyright © 2026 Fredrik Bierich
% 
% This file is licensed under the MIT License.
%
% Permission is hereby granted to use, copy, modify, merge, and distribute 
% this software for any purpose, provided that the above copyright notice 
% and this permission notice are included in all copies.
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
