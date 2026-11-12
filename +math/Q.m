% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function s = Q(r, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    a = 0;
    for k = 1 : m
        a = sqrt(2 + a);
    end
    s = r * 2 ^ m * sqrt(2 - a);
end
