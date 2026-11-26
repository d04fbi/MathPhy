% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function s = acos(r, x, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(x, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    assert(all(abs(x) <= r));
    a = (2 * x) / r;
    for k = 1 : m
        a = sqrt(2 + a);
    end
    s = r * 2 ^ m * sqrt(2 - a);
end
