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
function s = acos2(r, x, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(x, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'nonnegative', 'integer'});
    assert(all(abs(x) <= r, 'all'));
    d_r = 2 * r;
    d_rr = d_r * r;
    a = x;
    for k = 1 : m
        a = sqrt(d_rr + d_r .* a) / 2;
    end
    s = 2 ^ m * sqrt(d_rr - d_r .* a);
end
