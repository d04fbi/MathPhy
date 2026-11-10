% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function s = asin(r, y, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(y, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    assert(all(abs(y) <= r));
    s = (math.acos(r, -y, m) - math.acos(r, y, m)) / 2;
end
