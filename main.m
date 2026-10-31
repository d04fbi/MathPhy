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
function main()
    circularsectorfigure();
    circularsectorsequencefigure();
    simpleharmonicmotionfigure();
    uniformcircularmotionfigure();
    uniformcircularmotionvectordiagramfigure();
    function circularsectorfigure()
        f = figure('Visible', 'off');
        ax = axes(f);
        drawcircularsector(ax);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, fullfile('graphics/circular_sector.tex'));
        close(f);
    end
    function circularsectorsequencefigure()
        O = [0; 0];
        r = 1;
        s1 = 0;
        s2 = 1.0472;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, ~] = drawcircularsector(ax, O, r, s1, s2);
        plot(ax, pl(1, [1, end]), pl(2, [1, end]));
        axis(ax, 'equal', 'off');
        text(ax, -0.08, -0.0877, '$O$');
        text(ax, 0.485, 0.957, '$A$');
        t1 = text(ax, 0.4795, -0.0877, '$B_0$');
        t2 = text(ax, 1.0415, -0.0877, '$C_0$');
        print2tex(f, fullfile('graphics/circular_sector_sequence_base_case.tex'));
        mid = (s1 + s2) / 2;
        pmid = [lib.cos(r, mid); lib.sin(r, mid)];
        plot(ax, [O(1), pmid(1)], [O(2), pmid(2)]);
        plot(ax, [pmid(1), pl(1, 1)], [pmid(2), pl(2, 1)]);
        plot(ax, [pmid(1), pl(1, end)], [pmid(2), pl(2, end)]);
        set(t1, 'string', '$B_{n-1}$');
        set(t2, 'string', '$C_{n-1}$');
        text(ax, 0.689, 0.3031, '$B_n$');
        text(ax, 0.9185, 0.5506, '$C_n$');
        print2tex(f, fullfile('graphics/circular_sector_sequence_recursive_step.tex'));
        close(f);
    end
    function simpleharmonicmotionfigure()
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [~, q] = drawcircularsector(ax);
        fillcircle(ax, q);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        print2tex(f, fullfile('graphics/simple_harmonic_motion.tex'));
        close(f);
    end
    function uniformcircularmotionfigure()
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, ~] = drawcircularsector(ax);
        fillcircle(ax, pl(:, end));
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, fullfile('graphics/uniform_circular_motion.tex'));
        close(f);
    end
    function uniformcircularmotionvectordiagramfigure()
        O = [0; 0];
        r = 0.03;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, q] = drawcircularsector(ax, O);
        fillcircle(ax, pl(:, end), r);
        axis(ax, 'equal', 'off');
        drawarrow(ax, O, q);
        T = @(p1, p2, d) p2 + d * normalize(p2 - p1, "norm", 2);
        drawarrow(ax, q, T(q, pl(:, end), -r));
        drawarrow(ax, O, T(O, pl(:, end), -r));
        text(ax, 0.1675, 0.49, '$\vec{r}$');
        text(ax, 0.235, -0.0877, '$\vec{r}_x$');
        text(ax, 0.5775, 0.431, '$\vec{r}_y$');
        print2tex(f, fullfile('graphics/uniform_circular_motion_position_vector_diagram.tex'));
        close(f);
    end
end
function [pl, q] = circularsector(O, r, s1, s2)
    validateattributes(O, {'double'}, {'size', [2, 1]});
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(s1, {'double'}, {'scalar'});
    validateattributes(s2, {'double'}, {'scalar'});
    assert(s1 ~= s2);
    l = linspace(s1, s2);
    t1 = [lib.cos(r, l); lib.sin(r, l)];
    t2 = t1(:, 1)' * t1;
    assert(all(t2 > 0));
    pl = O + t1;
    q = O + t1(:, 1) * (t2(end) / t2(1));
end
function [pl, q] = drawcircularsector(ax, O = [0; 0], r = 1, s1 = 0, s2 = 1.0472)
    validateattributes(ax, {'double'}, {'scalar'});
    assert(isgraphics(ax, 'axes'));
    nextPlot = get(ax, 'NextPlot');
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    set(ax, 'NextPlot', 'add');
    [pl, q] = circularsector(O, r, s1, s2);
    plot(ax, [O(1), pl(1, 1)], [O(2), pl(2, 1)]);
    plot(ax, [O(1), pl(1, end)], [O(2), pl(2, end)]);
    plot(ax, [q(1), pl(1, end)], [q(2), pl(2, end)]);
    plot(ax, pl(1, :), pl(2, :));
end
function pl = circle(O, r)
    validateattributes(O, {'double'}, {'size', [2, 1]});
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    l = linspace(0, 4 * lib.Q(r));
    pl = O + [lib.cos(r, l); lib.sin(r, l)];
end
function fillcircle(ax, O = [0; 0], r = 0.03, edgeColor = [0, 0, 0], faceColor = [0, 0, 0])
    validateattributes(ax, {'double'}, {'scalar'});
    validateattributes(edgeColor, {'double'}, {'size', [1, 3]});
    validateattributes(faceColor, {'double'}, {'size', [1, 3]});
    assert(isgraphics(ax, 'axes'));
    nextPlot = get(ax, 'NextPlot');
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    set(ax, 'NextPlot', 'add');
    pl = circle(O, r);
    pl_length = length(pl);
    for k = 1 : pl_length
        triangle = [O, pl(:, [k, mod(k, pl_length) + 1])];
        patch(ax, triangle(1, :), triangle(2, :), 'EdgeColor', edgeColor, 'FaceColor', faceColor);
    end
end
function [shaft, head] = arrow(p1, p2, headWidth, headLength)
    validateattributes(p1, {'double'}, {'size', [2, 1]});
    validateattributes(p2, {'double'}, {'size', [2, 1]});
    validateattributes(headWidth, {'double'}, {'scalar', 'positive'});
    validateattributes(headLength, {'double'}, {'scalar', 'positive'});
    assert(~isequal(p1, p2));
    dp = p2 - p1;
    dpnorm = norm(dp);
    assert(dpnorm > headLength);
    t1 = dp / dpnorm .* [headLength, headWidth / 2];
    t2 = p2 - t1(:, 1);
    shaft = [p1, t2];
    head = [t2(1) + t1(2, 2), p2(1), t2(1) - t1(2, 2); t2(2) - t1(1, 2), p2(2), t2(2) + t1(1, 2)];
end
function drawarrow(ax, p1, p2, headWidth = 0.025, headLength = 0.075, shaftColor = [0, 0, 0], headEdgeColor = [0, 0, 0], headFaceColor = [0, 0, 0])
    validateattributes(ax, {'double'}, {'scalar'});
    assert(isgraphics(ax, 'axes'));
    nextPlot = get(ax, 'NextPlot');
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    set(ax, 'NextPlot', 'add');
    [shaft, head] = arrow(p1, p2, headWidth, headLength);
    plot(ax, shaft(1, :), shaft(2, :), 'Color', shaftColor);
    patch(ax, head(1, :), head(2, :), 'EdgeColor', headEdgeColor, 'FaceColor', headFaceColor);
end
