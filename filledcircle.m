% =============================================================================
% Copyright © 2026 Fredrik Bierich
%
% This file is licensed under the Creative Commons Attribution-NonCommercial-
% ShareAlike 4.0 International License (CC BY-NC-SA 4.0).
%
% You are free to share and adapt this material for non-commercial purposes,
% provided you give appropriate credit and distribute your contributions under
% the same license. Commercial use and sale are strictly prohibited.
%
% For commercial licensing inquiries, please contact: fredrik.bierich@gmail.com
% =============================================================================
function filledcircle(ax, p, r)
    d = 2 * r;
    position = [p(1) - r, p(2) - r, d, d];
    rectangle(ax, 'Position', position, 'Curvature', [1, 1], 'EdgeColor', [0, 0, 0], 'FaceColor', [0, 0, 0]);
    % Duplicate line added due to rendering issues
    rectangle(ax, 'Position', position, 'Curvature', [1, 1], 'EdgeColor', [0, 0, 0], 'FaceColor', [0, 0, 0]);
end
