% Copyright © 2026 Fredrik Bierich
% SPDX-License-Identifier: MIT
function main()
    circularsectorfigure();
    circularsectorsequencefigure();
    uniformcircularmotionfigure();
    function circularsectorfigure()
        f = figure('visible', 'off');
        ax = axes(f);
        circularsector(ax, [0; 0], 1, 0, 1.0472);
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
        r = 1;
        s1 = 0;
        s2 = 1.0472;
        f = figure('visible', 'off');
        ax = axes(f, 'nextplot', 'add');
        [pl, ~] = circularsector(ax, O, r, s1, s2);
        plot(ax, pl(1, [1, end]), pl(2, [1, end]));
        axis(ax, 'equal', 'off');
        text(ax, -0.08, -0.0877, '$O$');
        text(ax, 0.489, 0.947, '$R$');
        t1 = text(ax, 1.0415, -0.0877, '$S_0$');
        t2 = text(ax, 0.4835, -0.0877, '$X_0$');
        print2tex(f, 'circular_sector_sequence_base_case.tex');
        mid = (1 + size(pl, 2)) / 2;
        plot(ax, [O(1), pl(1, mid)], [O(2), pl(2, mid)]);
        plot(ax, pl(1, [mid, 1]), pl(2, [mid, 1]));
        plot(ax, pl(1, [mid, end]), pl(2, [mid, end]));
        set(t1, 'string', '$S_{n-1}$');
        set(t2, 'string', '$X_{n-1}$');
        text(ax, 0.9185, 0.5506, '$S_n$');
        text(ax, 0.689, 0.3031, '$X_n$');
        print2tex(f, 'circular_sector_sequence_recursive_step.tex');
        close(f);
    end
    function uniformcircularmotionfigure()
        O = [0; 0];
        circleRadius = 0.03;
        circleDiameter = 2 * circleRadius;
        arrowHeadWidth = 0.025;
        arrowHeadLength = 3 * arrowHeadWidth;
        f = figure('visible', 'off');
        ax = axes(f, 'nextplot', 'add');
        [pl, proj_pl_end_pl_1] = circularsector(ax, O, 1, 0, 1.0472);
        rectangle(ax, 'position', [pl(1, end) - circleRadius, pl(2, end) - circleRadius, circleDiameter, circleDiameter], 'Curvature', [1, 1], 'EdgeColor', [0, 0, 0], 'FaceColor', [0, 0, 0]);
        arrow(O, proj_pl_end_pl_1);
        arrow(proj_pl_end_pl_1, pl(:, end) - circleRadius * normalize(pl(:, end) - proj_pl_end_pl_1, "norm", 2));
        arrow(O, pl(:, end) - circleRadius * normalize(pl(:, end) - O, "norm", 2));
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$\vec{r}$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$\vec{r}_x$');
        text(ax, 0.5775, 0.431, '$\vec{r}_y$');
        print2tex(f, 'uniform_circular_motion.tex');
        close(f);
        function arrow(p1, p2)
            nextPlot = get(ax, 'nextplot');
            cleanupObj = onCleanup(@() set(ax, 'nextplot', nextPlot));
            set(ax, 'nextplot', 'add');
            dp = p2 - p1;
            dpnorm = norm(dp);
            assert(dpnorm > arrowHeadLength);
            R = [dp(1), -dp(2); dp(2), dp(1)] / dpnorm;
            q1 = p2 - R(:, 1) * arrowHeadLength;
            plot(ax, [p1(1), q1(1)], [p1(2), q1(2)]);
            q2 = p2 - R * [arrowHeadLength, arrowHeadLength; [arrowHeadWidth, -arrowHeadWidth] / 2];
            patch(ax, 'XData', [q2(1, :), p2(1)], 'YData', [q2(2, :), p2(2)], 'EdgeColor', [0, 0, 0], 'FaceColor', [0, 0, 0]);
      end
    end
end
function x = cos(r, s)
    x = r .* builtin('cos', s ./ r);
end
function y = sin(r, s)
    y = r .* builtin('sin', s ./ r);
end
function [pl, proj_pl_end_pl_1] = circularsector(ax, O, r, s1, s2, n = 10)
    nextPlot = get(ax, 'nextplot');
    cleanupObj = onCleanup(@() set(ax, 'nextplot', nextPlot));
    set(ax, 'nextplot', 'add');
    l = linspace(s1, s2, 2 ^ n + 1);
    pl = O + [cos(r, l); sin(r, l)];
    pl_vec = pl - O;
    pl_vec_dot_pl_vec_1 = pl_vec' * pl_vec(:, 1);
    assert(all(pl_vec_dot_pl_vec_1 > 0));
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec_dot_pl_vec_1(end) / pl_vec_dot_pl_vec_1(1));
    plot(ax, [O(1), pl(1, 1)], [O(2), pl(2, 1)]);
    plot(ax, [O(1), pl(1, end)], [O(2), pl(2, end)]);
    plot(ax, [proj_pl_end_pl_1(1), pl(1, end)], [proj_pl_end_pl_1(2), pl(2, end)]);
    plot(ax, pl(1, :), pl(2, :));
end

