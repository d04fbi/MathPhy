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
function y = sin(r, s, m = 10)
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(s, {'double'}, {});
    validateattributes(m, {'double'}, {'scalar', 'integer', 'nonnegative', '<=', 25});
    y = lib.cos(r, lib.Q(r, m) - s, m);
end
