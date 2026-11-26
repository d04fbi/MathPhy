% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function s = Q(r, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    s = math.acos(r, 0, m);
end
