% Copyright © 2026 Fredrik Bierich
% SPDX-License-Identifier: MIT
% Licensed under the MIT License. See the root LICENSE file for details.
function exportvectorgraphics(varargin)
    arguments (Repeating)
        varargin
    end
    exportgraphics(varargin{:}, 'ContentType', 'vector');
end
