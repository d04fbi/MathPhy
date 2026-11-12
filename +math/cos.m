% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function x = cos(r, s, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(s, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    a = 1 - (s / (2 ^ m * r)) .^ 2 / 2;
    for k = 1 : m
        a = 2 * a .^ 2 - 1;
    end
    x = r * a;
end
