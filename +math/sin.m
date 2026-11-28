% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function y = sin(r, s, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(s, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    y = math.cos(r, math.Q(r, m) - s, m);
end
