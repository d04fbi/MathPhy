% =============================================================================
% Copyright © 2026 Fredrik Bierich
% 
% This file is licensed under the MIT License.
%
% Permission is hereby granted to use, copy, modify, merge, and distribute 
% this software for any purpose, provided that the above copyright notice 
% and this permission notice are included in all copies.
%
% For commercial licensing inquiries, please contact: fredrik.bierich@gmail.com
% =============================================================================
function s = acos(r, x, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(x, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    assert(all(abs(x) <= r));
    a = x / r;
    for k = 1 : m
        a = sqrt((1 + a) / 2);
    end
    s = r * 2 ^ m * sqrt(2 - 2 * a);
end
