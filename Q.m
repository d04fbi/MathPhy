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
function Qr = Q(r, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(m, {'double'}, {'scalar', 'nonnegative', 'integer'});
    a = 0;
    for k = 1 : m
        a = sqrt(2 + a);
    end
    Qr = r * 2 ^ m * sqrt(2 - a);
end
