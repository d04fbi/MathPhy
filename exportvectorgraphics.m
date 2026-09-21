% Copyright © 2026 Fredrik Bierich
% SPDX-License-Identifier: MIT
function exportvectorgraphics(varargin)
    arguments (Repeating)
        varargin
    end
    exportgraphics(varargin{:}, 'ContentType', 'vector');
end
