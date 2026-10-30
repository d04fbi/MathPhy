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
function y = sin2(r, s, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(s, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'nonnegative', 'integer'});
    y = cos2(r, Q(r, m) - s, m);
end
