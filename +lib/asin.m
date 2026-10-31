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
function s = asin(r, y, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(y, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    assert(all(abs(y) <= r));
    s = (lib.acos(r, -y, m) - lib.acos(r, y, m)) / 2;
end
