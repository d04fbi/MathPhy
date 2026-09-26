% Copyright © 2026 Fredrik Bierich
% SPDX-License-Identifier: MIT
function print2tex(figureHandle, fileName)
    set(figureHandle, 'PaperType', 'a4');
    set(figureHandle, 'PaperPositionMode', 'manual');
    set(figureHandle, 'PaperUnits', 'normalized');
    set(figureHandle, 'PaperPosition', [0, 0, 1, 1]);
    print(figureHandle, fileName, '-dtex');
end

