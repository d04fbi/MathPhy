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
    m = 10;
    n = 2 ^ m + 1;
    circularsectorfigure();
    circularsectorsequencefigure();
    simpleharmonicmotionfigure();
    uniformcircularmotionfigure();
    function circularsectorfigure()
        f = figure('Visible', 'off');
        ax = axes(f);
        circularsector(ax);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, 'circular_sector.tex');
        close(f);
    end
    function circularsectorsequencefigure()
        O = [0; 0];
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, ~] = circularsector(ax, O);
        plot(ax, pl(1, [1, end]), pl(2, [1, end]));
        axis(ax, 'equal', 'off');
        text(ax, -0.08, -0.0877, '$O$');
        text(ax, 0.485, 0.957, '$A$');
        t1 = text(ax, 1.0415, -0.0877, '$C_0$');
        t2 = text(ax, 0.4795, -0.0877, '$B_0$');
        print2tex(f, 'circular_sector_sequence_base_case.tex');
        mid = (1 + size(pl, 2)) / 2;
        plot(ax, [O(1), pl(1, mid)], [O(2), pl(2, mid)]);
        plot(ax, pl(1, [mid, 1]), pl(2, [mid, 1]));
        plot(ax, pl(1, [mid, end]), pl(2, [mid, end]));
        set(t1, 'string', '$C_{n-1}$');
        set(t2, 'string', '$B_{n-1}$');
        text(ax, 0.9185, 0.5506, '$C_n$');
        text(ax, 0.689, 0.3031, '$B_n$');
        print2tex(f, 'circular_sector_sequence_recursive_step.tex');
        close(f);
    end
    function simpleharmonicmotionfigure()
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [~, proj_pl_end_pl_1] = circularsector(ax);
        fillcircle(ax, proj_pl_end_pl_1);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        print2tex(f, 'simple_harmonic_motion.tex');
        close(f);
    end
    function uniformcircularmotionfigure()
        O = [0; 0];
        circleRadius = 0.03;
        circleColor = [0, 0, 0];
        f = figure('Visible', 'off');
        ax1 = axes(f, 'NextPlot', 'add');
        [pl, ~] = circularsector(ax1, O);
        fillcircle(ax1, pl(:, end), circleRadius, circleColor);
        axis(ax1, 'equal', 'off');
        text(ax1, 0.1675, 0.49, '$r$');
        text(ax1, 0.9185, 0.5506, '$s$');
        text(ax1, 0.235, -0.0877, '$x$');
        text(ax1, 0.5775, 0.431, '$y$');
        print2tex(f, 'uniform_circular_motion.tex');
        close(f);
        f = figure('Visible', 'off');
        ax1 = axes(f, 'NextPlot', 'add');
        [pl, proj_pl_end_pl_1] = circularsector(ax1, O);
        fillcircle(ax1, pl(:, end), circleRadius, circleColor);
        arrow(ax1, O, proj_pl_end_pl_1);
        arrow(ax1, proj_pl_end_pl_1, pl(:, end) - circleRadius * normalize(pl(:, end) - proj_pl_end_pl_1, "norm", 2));
        arrow(ax1, O, pl(:, end) - circleRadius * normalize(pl(:, end) - O, "norm", 2));
        axis(ax1, 'equal', 'off');
        text(ax1, 0.1675, 0.49, '$\vec{r}$');
        text(ax1, 0.235, -0.0877, '$\vec{r}_x$');
        text(ax1, 0.5775, 0.431, '$\vec{r}_y$');
        print2tex(f, 'uniform_circular_motion_position_vector_diagram.tex');
        close(f);
        function arrow(ax2, p1, p2, headWidth = 0.025, headLength = 0.075, shaftColor = [0, 0, 0], headEdgeColor = [0, 0, 0], headFaceColor = [0, 0, 0])
            nextPlot = get(ax2, 'NextPlot');
            cleanupObj = onCleanup(@() set(ax2, 'NextPlot', nextPlot));
            set(ax2, 'NextPlot', 'add');
            dp = p2 - p1;
            dpnorm = norm(dp);
            assert(dpnorm > headLength);
            R = [dp(1), -dp(2); dp(2), dp(1)] / dpnorm;
            q1 = p2 - R(:, 1) * headLength;
            plot(ax2, [p1(1), q1(1)], [p1(2), q1(2)], 'Color', shaftColor);
            q2 = p2 - R * [headLength, headLength; [headWidth, -headWidth] / 2];
            patch(ax2, 'XData', [q2(1, :), p2(1)], 'YData', [q2(2, :), p2(2)], 'EdgeColor', headEdgeColor, 'FaceColor', headFaceColor);
      end
    end
    function [pl, proj_pl_end_pl_1] = circularsector(ax, O = [0; 0], r = 1, s1 = 0, s2 = 1.0472)
        nextPlot = get(ax, 'NextPlot');
        cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
        set(ax, 'NextPlot', 'add');
        assert(r > 0);
        assert(s1 ~= s2);
        l = linspace(s1, s2, n);
        pl = O + [cos2(r, l); sin2(r, l)];
        pl_vec = pl - O;
        pl_vec_dot_pl_vec_1 = pl_vec' * pl_vec(:, 1);
        assert(all(pl_vec_dot_pl_vec_1 > 0));
        proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec_dot_pl_vec_1(end) / pl_vec_dot_pl_vec_1(1));
        plot(ax, [O(1), pl(1, 1)], [O(2), pl(2, 1)]);
        plot(ax, [O(1), pl(1, end)], [O(2), pl(2, end)]);
        plot(ax, [proj_pl_end_pl_1(1), pl(1, end)], [proj_pl_end_pl_1(2), pl(2, end)]);
        plot(ax, pl(1, :), pl(2, :));
    end
    function fillcircle(ax, p, r = 0.03, C = [0, 0, 0])
        nextPlot = get(ax, 'NextPlot');
        cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
        set(ax, 'NextPlot', 'add');
        assert(r > 0);
        l = linspace(0, 4 * Q(r));
        fill(ax, p(1) + cos2(r, l), p(2) + sin2(r, l), C);
    end
    function s = Q(r)
        assert(r > 0);
        a = 0;
        for k = 1 : m
            a = sqrt(2 + a);
        end
        s = r * 2 ^ m * sqrt(2 - a);
    end
    function x = cos2(r, s)
        assert(r > 0);
        x = r - s .^ 2 / (2 ^ (2 * m + 1) * r);
        for k = 1 : m
            x = 2 * x .^ 2 / r - r;
        end
    end
    function y = sin2(r, s)
        assert(r > 0);
        y = cos2(r, Q(r) - s);
    end
end
function print2tex(figureHandle, fileName, figureWidth = 5, figureHeight = 4, figureMargin = 0.5)
    units = get(figureHandle, 'Units');
    position = get(figureHandle, 'Position');
    paperPositionMode = get(figureHandle, 'PaperPositionMode');
    cleanupObj = onCleanup(@() set(figureHandle, 'Units', units, 'Position', position, 'PaperPositionMode', paperPositionMode));
    assert(figureWidth > 0);
    assert(figureHeight > 0);
    assert(figureMargin >= 0);
    axesHandle = get(figureHandle, 'CurrentAxes');
    left = figureMargin / figureWidth;
    bottom = figureMargin / figureHeight;
    axesWidth = 1 - 2 * left;
    axesHeight = 1 - 2 * bottom;
    set(axesHandle, 'Units', 'normalized');
    set(axesHandle, 'Position', [left, bottom, axesWidth, axesHeight]);
    set(figureHandle, 'Units', 'Inches');
    position = get(figureHandle, 'Position');
    set(figureHandle, 'Position', [position(1), position(2), figureWidth, figureHeight]);
    set(figureHandle, 'PaperPositionMode', 'auto');
    print(figureHandle, fileName, '-dtex');
end
%{
proj_pl_end_pl_1 = O + ([cos2(r, s2); sin2(r, s2)] + [cos2(r, s1 - (s2 - s1)); sin2(r, s1 - (s2 - s1))]) / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + cos2(r, s1 - (s2 - s1)); sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + cos2(r, s1 - s2 + s1); sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + cos2(r, 2 * s1 - s2); sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + (cos2(r, 2 * s1) * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((cos2(r, s1) * cos2(r, s1) - sin2(r, s1) * sin2(r, s1)) / r * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((cos2(r, s1) ^ 2 - sin2(r, s1) * sin2(r, s1)) / r * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((cos2(r, s1) ^ 2 - sin2(r, s1) ^ 2) / r * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((cos2(r, s1) ^ 2 - (r ^ 2 - cos2(r, s1) ^ 2)) / r * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((cos2(r, s1) ^ 2 - r ^ 2 + cos2(r, s1) ^ 2) / r * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((2 * cos2(r, s1) ^ 2 - r ^ 2) / r * cos2(r, s2) + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2)) / r + sin2(r, 2 * s1) * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2)) / r + (sin2(r, s1) * cos2(r, s1) + cos2(r, s1) * sin2(r, s1)) / r * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2)) / r + (sin2(r, s1) * cos2(r, s1) + sin2(r, s1) * cos2(r, s1)) / r * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2)) / r + 2 * sin2(r, s1) * cos2(r, s1) / r * sin2(r, s2)) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + ((2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2)) / r + 2 * sin2(r, s1) * cos2(r, s1) * sin2(r, s2) / r) / r; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [cos2(r, s2) + (2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [r ^ 2 * cos2(r, s2) / r ^ 2 + (2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [(2 * cos2(r, s1) ^ 2 * cos2(r, s2) - r ^ 2 * cos2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * sin2(r, s2) + r ^ 2 * cos2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [(2 * cos2(r, s1) ^ 2 * cos2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, s1 - (s2 - s1))] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, s1 - s2 + s1)] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + sin2(r, 2 * s1 - s2)] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (sin2(r, 2 * s1) * cos2(r, s2) - cos2(r, 2 * s1) * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + ((sin2(r, s1) * cos2(r, s1) + cos2(r, s1) * sin2(r, s1)) / r * cos2(r, s2) - cos2(r, 2 * s1) * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + ((sin2(r, s1) * cos2(r, s1) + sin2(r, s1) * cos2(r, s1)) / r * cos2(r, s2) - cos2(r, 2 * s1) * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) / r * cos2(r, s2) - cos2(r, 2 * s1) * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - cos2(r, 2 * s1) * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (cos2(r, s1) * cos2(r, s1) - sin2(r, s1) * sin2(r, s1)) / r * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (cos2(r, s1) ^ 2 - sin2(r, s1) * sin2(r, s1)) / r * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (cos2(r, s1) ^ 2 - sin2(r, s1) ^ 2) / r * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (r ^ 2 - sin2(r, s1) ^ 2 - sin2(r, s1) ^ 2) / r * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (r ^ 2 - 2 * sin2(r, s1) ^ 2) / r * sin2(r, s2)) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (r ^ 2 - 2 * sin2(r, s1) ^ 2) * sin2(r, s2) / r) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) / r - (r ^ 2 * sin2(r, s2) - 2 * sin2(r, s1) ^ 2 * sin2(r, s2)) / r) / r] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) - (r ^ 2 * sin2(r, s2) - 2 * sin2(r, s1) ^ 2 * sin2(r, s2))) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) - r ^ 2 * sin2(r, s2) + 2 * sin2(r, s1) ^ 2 * sin2(r, s2)) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; sin2(r, s2) + (2 * sin2(r, s1) ^ 2 * sin2(r, s2) - r ^ 2 * sin2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2)) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; r ^ 2 * sin2(r, s2) / r ^ 2 + (2 * sin2(r, s1) ^ 2 * sin2(r, s2) - r ^ 2 * sin2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2)) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; (2 * sin2(r, s1) ^ 2 * sin2(r, s2) - r ^ 2 * sin2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2) + r ^ 2 * sin2(r, s2)) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; (2 * sin2(r, s1) ^ 2 * sin2(r, s2) + 2 * sin2(r, s1) * cos2(r, s1) * cos2(r, s2)) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + [2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)) / r ^ 2; 2 * (sin2(r, s1) ^ 2 * sin2(r, s2) + sin2(r, s1) * cos2(r, s1) * cos2(r, s2)) / r ^ 2] / 2;
proj_pl_end_pl_1 = O + ([2 * (cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2)); 2 * (sin2(r, s1) ^ 2 * sin2(r, s2) + sin2(r, s1) * cos2(r, s1) * cos2(r, s2))] / r ^ 2) / 2;
proj_pl_end_pl_1 = O + (2 * [cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2); sin2(r, s1) ^ 2 * sin2(r, s2) + sin2(r, s1) * cos2(r, s1) * cos2(r, s2)] / r ^ 2) / 2;
proj_pl_end_pl_1 = O + 2 * ([cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2); sin2(r, s1) ^ 2 * sin2(r, s2) + sin2(r, s1) * cos2(r, s1) * cos2(r, s2)] / r ^ 2) / 2;
proj_pl_end_pl_1 = O + [cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2); sin2(r, s1) ^ 2 * sin2(r, s2) + sin2(r, s1) * cos2(r, s1) * cos2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + [cos2(r, s1) ^ 2 * cos2(r, s2) + sin2(r, s1) * cos2(r, s1) * sin2(r, s2); sin2(r, s1) * cos2(r, s1) * cos2(r, s2) + sin2(r, s1) ^ 2 * sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + [cos2(r, s1) ^ 2, sin2(r, s1) * cos2(r, s1); sin2(r, s1) * cos2(r, s1), sin2(r, s1) ^ 2] * [cos2(r, s2); sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + [cos2(r, s1) ^ 2, cos2(r, s1) * sin2(r, s1); sin2(r, s1) * cos2(r, s1), sin2(r, s1) ^ 2] * [cos2(r, s2); sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + [cos2(r, s1); sin2(r, s1)] * [cos2(r, s1), sin2(r, s1)] * [cos2(r, s2); sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + [cos2(r, s1); sin2(r, s1)] * [cos2(r, s1); sin2(r, s1)]' * [cos2(r, s2); sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + pl_vec(:, 1) * [cos2(r, s1); sin2(r, s1)]' * [cos2(r, s2); sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, 1)' * [cos2(r, s2); sin2(r, s2)] / r ^ 2;
proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, 1)' * pl_vec(:, end) / r ^ 2;
proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, 1)' * pl_vec(:, end) / (pl_vec(:, 1)' * pl_vec(:, 1));
proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, end)' * pl_vec(:, 1) / (pl_vec(:, 1)' * pl_vec(:, 1));
proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec(:, end)' * pl_vec(:, 1) / (pl_vec(:, 1)' * pl_vec(:, 1)));
proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec_dot_pl_vec_1(end) / (pl_vec(:, 1)' * pl_vec(:, 1)));
proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec_dot_pl_vec_1(end) / pl_vec_dot_pl_vec_1(1));
%}
