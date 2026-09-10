% Copyright © 2026 Fredrik Bierich
% SPDX-License-Identifier: MIT
% Licensed under the MIT License. See the root LICENSE file for details.
function main()
    circularsectorfigure();
    circularsectorsequencefigure();
    simpleharmonicmotionfigure();
    uniformcircularmotionfigure();
    function circularsectorfigure()
        O = [0; 0];
        f = figure('Visible', 'off');
        ax = axes(f);
        circularsector(ax, O, 1, 0, 1.0472);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        exportvectorgraphics(f, 'circular sector.pdf');
        close(f);
    end
    function circularsectorsequencefigure()
        O = [0; 0];
        r = 1;
        s1 = 0;
        s2 = 1.0472;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, ~] = circularsector(ax, O, r, s1, s2, 'VerticalProjectionLineStyle', '-');
        plot(ax, pl(1, [1, end]), pl(2, [1, end]));
        text(ax, -0.08, -0.0877, '$O$');
        text(ax, 0.4858, 0.947, '$R$');
        t1 = text(ax, 1.0415, -0.0877, '$S_0$');
        t2 = text(ax, 0.4795, -0.0877, '$X_0$');
        axis(ax, 'equal', 'off');
        exportvectorgraphics(f, 'circular sector sequence (base case).pdf');
        mid = (s1 + s2) / 2;
        pmid = O + [cos(r, mid); sin(r, mid)];
        plot(ax, [O(1), pmid(1)], [O(2), pmid(2)]);
        plot(ax, [pmid(1), pl(1, 1)], [pmid(2), pl(2, 1)]);
        plot(ax, [pmid(1), pl(1, end)], [pmid(2), pl(2, end)]);
        t1.String = '$S_{n-1}$';
        t2.String = '$X_{n-1}$';
        text(ax, 0.9185, 0.5506, '$S_n$');
        text(ax, 0.689, 0.3031, '$X_n$');
        exportvectorgraphics(f, 'circular sector sequence (recursive step).pdf');
        close(f);
    end
    function simpleharmonicmotionfigure()
        f = figure('Visible', 'off');
        ax = axes(f);
        fplot(ax, @(t)cos(1, t), [-4.7124, 1.5708]);
        pbaspect(ax, [4, 3, 1]);
        grid on;
        xlabel(ax, '$t$');
        ylabel(ax, '$x(t) = \cos(r,\omega t)$');
        set(ax, 'XTick', 0);
        set(ax, 'XTickLabel', {'$0$'});
        set(ax, 'YTick', [-1, 0, 1]);
        set(ax, 'YTickLabel', {'$-r$', '$0$', '$r$'});
        annotation('textarrow', [0.417, 0.517], [0.668, 0.5183], 'String', '$\omega = \lim \limits_{\Delta t \to 0} \frac{\Delta x}{\Delta t}$');
        exportvectorgraphics(f, 'simple harmonic motion.pdf');
        close(f);
    end
    function uniformcircularmotionfigure()
        O = [0; 0];
        circleRadius = 0.03;
        circleDiameter = 2 * circleRadius;
        arrowHeadWidth = 0.025;
        arrowHeadLength = 3 * arrowHeadWidth;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, proj_pl_end_pl_1] = circularsector(ax, O, 1, 0, 1.0472, 'VerticalProjectionLineStyle', '-');
        rectangle(ax, 'position', [pl(1, end) - circleRadius, pl(2, end) - circleRadius, circleDiameter, circleDiameter]);
        arrow(O, proj_pl_end_pl_1);
        arrow(proj_pl_end_pl_1, pl(:, end) - circleRadius * normalize(pl(:, end) - proj_pl_end_pl_1, "norm", 2));
        arrow(O, pl(:, end) - circleRadius * normalize(pl(:, end) - O, "norm", 2));
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$\vec{r}$');
        text(ax, 0.9185, 0.5506, '$\Delta s$');
        text(ax, 0.235, -0.0877, '$\vec{r}_x$');
        text(ax, 0.5775, 0.431, '$\vec{r}_y$');
        exportvectorgraphics(f, 'uniform circular motion.pdf');
        close(f);
        function arrow(p1, p2)
            nextPlot = ax.NextPlot;
            cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
            ax.NextPlot = 'add';
            dp = p2 - p1;
            dpnorm = norm(dp);
            assert(dpnorm > arrowHeadLength);
            R = [dp(1), -dp(2); dp(2), dp(1)] / dpnorm;
            q1 = p2 - R(:, 1) * arrowHeadLength;
            plot(ax, [p1(1), q1(1)], [p1(2), q1(2)]);
            q2 = p2 - R * [arrowHeadLength, arrowHeadLength; [arrowHeadWidth, -arrowHeadWidth] / 2];
            patch(ax, 'XData', [q2(1, :), p2(1)], 'YData', [q2(2, :), p2(2)]);
        end
    end
end
function x = cos(r, s)
    arguments
        r (1,1) double {mustBeReal, mustBePositive}
        s double
    end
    x = r .* builtin('cos', s ./ r);
end
function y = sin(r, s)
    arguments
        r (1,1) double {mustBeReal, mustBePositive}
        s double
    end
    y = r .* builtin('sin', s ./ r);
end
function [pl, proj_pl_end_pl_1] = circularsector(ax, O, r, s1, s2, n, options)
    arguments
        ax (1,1) matlab.graphics.axis.Axes
        O (2,1) double {mustBeReal}
        r (1,1) double {mustBeReal, mustBePositive}
        s1 (1,1) double {mustBeReal}
        s2 (1,1) double {mustBeReal}
        n (1,1) double {mustBeReal, mustBeInteger, mustBeNonnegative} = 10
        options.VerticalProjectionLineStyle (1,1) string = '--'
    end
    nextPlot = ax.NextPlot;
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    ax.NextPlot = 'add';
    l = linspace(s1, s2, 2 ^ n + 1);
    pl = O + [cos(r, l); sin(r, l)];
    pl_vec = pl - O;
    pl_vec_dot_pl_vec_1 = pl_vec' * pl_vec(:, 1);
    assert(all(pl_vec_dot_pl_vec_1 > 0));
    %{
    proj_pl_end_pl_1 = O + ([cos(r, s1 - (s2 - s1)); sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([cos(r, s1 - s2 + s1); sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([cos(r, 2 * s1 - s2); sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([(cos(r, 2 * s1) * cos(r, s2) + sin(r, 2 * s1) * sin(r, s2)) / r; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([((cos(r, s1) ^ 2 - sin(r, s1) ^ 2) / r * cos(r, s2) + sin(r, 2 * s1) * sin(r, s2)) / r; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([((cos(r, s1) ^ 2 - sin(r, s1) ^ 2) / r * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) / r * sin(r, s2)) / r; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([((cos(r, s1) ^ 2 - sin(r, s1) ^ 2) * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([((cos(r, s1) ^ 2 + r ^ 2 - sin(r, s1) ^ 2 - r ^ 2) * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([((cos(r, s1) ^ 2 + cos(r, s1) ^ 2 - r ^ 2) * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([((2 * cos(r, s1) ^ 2 - r ^ 2) * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([(2 * cos(r, s1) ^ 2 * cos(r, s2) - r ^ 2 * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([(2 * cos(r, s1) ^ 2 * cos(r, s2) + 2 * sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - r ^ 2 * cos(r, s2) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - r ^ 2 * cos(r, s2) / r ^ 2; sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); sin(r, s1 - (s2 - s1))] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); sin(r, s1 - s2 + s1)] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); sin(r, 2 * s1 - s2)] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (sin(r, 2 * s1) * cos(r, s2) - cos(r, 2 * s1) * sin(r, s2)) / r] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) / r * cos(r, s2) - cos(r, 2 * s1) * sin(r, s2)) / r] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) / r * cos(r, s2) - (cos(r, s1) ^ 2 - sin(r, s1) ^ 2) / r * sin(r, s2)) / r] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) * cos(r, s2) - (cos(r, s1) ^ 2 - sin(r, s1) ^ 2) * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) * cos(r, s2) + (- cos(r, s1) ^ 2 + sin(r, s1) ^ 2) * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) * cos(r, s2) + (r ^ 2 - cos(r, s1) ^ 2 + sin(r, s1) ^ 2 - r ^ 2) * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) * cos(r, s2) + (sin(r, s1) ^ 2 + sin(r, s1) ^ 2 - r ^ 2) * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) * cos(r, s2) + (2 * sin(r, s1) ^ 2 - r ^ 2) * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * sin(r, s1) * cos(r, s1) * cos(r, s2) + 2 * sin(r, s1) ^ 2 * sin(r, s2) - r ^ 2 * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); (2 * (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) - r ^ 2 * sin(r, s2)) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); 2 * (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) / r ^ 2 - r ^ 2 * sin(r, s2) / r ^ 2] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2 - cos(r, s2); 2 * (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) / r ^ 2 - sin(r, s2)] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + ([2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; 2 * (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) / r ^ 2] - [cos(r, s2); sin(r, s2)] + [cos(r, s2); sin(r, s2)]) / 2;
    proj_pl_end_pl_1 = O + [2 * (cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; 2 * (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) / r ^ 2] / 2;
    proj_pl_end_pl_1 = O + 2 * [(cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) / r ^ 2] / 2;
    proj_pl_end_pl_1 = O + [(cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2)) / r ^ 2; (sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)) / r ^ 2];
    proj_pl_end_pl_1 = O + [cos(r, s1) ^ 2 * cos(r, s2) + sin(r, s1) * cos(r, s1) * sin(r, s2); sin(r, s1) * cos(r, s1) * cos(r, s2) + sin(r, s1) ^ 2 * sin(r, s2)] / r ^ 2;
    proj_pl_end_pl_1 = O + [cos(r, s1) ^ 2, sin(r, s1) * cos(r, s1); sin(r, s1) * cos(r, s1), sin(r, s1) ^ 2] * [cos(r, s2); sin(r, s2)] / r ^ 2;
    proj_pl_end_pl_1 = O + [cos(r, s1); sin(r, s1)] * [cos(r, s1), sin(r, s1)] * [cos(r, s2); sin(r, s2)] / r ^ 2;
    proj_pl_end_pl_1 = O + [cos(r, s1); sin(r, s1)] * [cos(r, s1); sin(r, s1)]' * [cos(r, s2); sin(r, s2)] / r ^ 2;
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, 1)' * [cos(r, s2); sin(r, s2)] / r ^ 2;
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, 1)' * pl_vec(:, end) / r ^ 2;
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec(:, 1)' * pl_vec(:, end) / (pl_vec(:, 1)' * pl_vec(:, 1));
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec_dot_pl_vec_1(end) / (pl_vec(:, 1)' * pl_vec(:, 1));
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * pl_vec_dot_pl_vec_1(end) / pl_vec_dot_pl_vec_1(1);
    %}
    proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec_dot_pl_vec_1(end) / pl_vec_dot_pl_vec_1(1));
    plot(ax, [O(1), pl(1, 1)], [O(2), pl(2, 1)]);
    plot(ax, [O(1), pl(1, end)], [O(2), pl(2, end)]);
    plot(ax, [proj_pl_end_pl_1(1), pl(1, end)], [proj_pl_end_pl_1(2), pl(2, end)], 'LineStyle', options.VerticalProjectionLineStyle);
    plot(ax, pl(1, :), pl(2, :));
end
