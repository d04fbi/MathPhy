% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function s = asin(r, y, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(y, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    assert(all(abs(y) <= r));
    s = (utilities.acos(r, -y, m) - utilities.acos(r, y, m)) / 2;
end
