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
function main()
    m = 10;
    n = 2 ^ m + 1;
    cos = @(r, s) r .* builtin('cos', s ./ r);
    acos = @(r, x) r .* builtin('acos', x ./ r);
    sin = @(r, s) r .* builtin('sin', s ./ r);
    circularsectorfigure();
    circularsectorsequencefigure();
    simpleharmonicmotionfigure();
    uniformcircularmotionfigure();
    function circularsectorfigure()
        f = figure('Visible', 'off');
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
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
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
    function simpleharmonicmotionfigure()
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [~, proj_pl_end_pl_1] = circularsector(ax, [0; 0], 1, 0, 1.0472, 'LineStyle', '--');
        fillcircle(ax, proj_pl_end_pl_1, 0.03);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s = \omega t$');
        text(ax, 0.235, -0.0877, '$x$');
        print2tex(f, 'simple_harmonic_motion.tex');
        close(f);
    end
    function uniformcircularmotionfigure()
        O = [0; 0];
        r = 1;
        s1 = 0;
        s2 = 1.0472;
        circleRadius = 0.03;
        arrowHeadWidth = 0.025;
        arrowHeadLength = 3 * arrowHeadWidth;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, ~] = circularsector(ax, O, r, s1, s2);
        fillcircle(ax, pl(:, end), circleRadius);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, 'uniform_circular_motion.tex');
        close(f);
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl, proj_pl_end_pl_1] = circularsector(ax, O, r, s1, s2);
        fillcircle(ax, pl(:, end), circleRadius);
        arrow(O, proj_pl_end_pl_1);
        arrow(proj_pl_end_pl_1, pl(:, end) - circleRadius * normalize(pl(:, end) - proj_pl_end_pl_1, "norm", 2));
        arrow(O, pl(:, end) - circleRadius * normalize(pl(:, end) - O, "norm", 2));
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$\vec{r}$');
        text(ax, 0.235, -0.0877, '$\vec{r}_x$');
        text(ax, 0.5775, 0.431, '$\vec{r}_y$');
        print2tex(f, 'uniform_circular_motion_position_vector_diagram.tex');
        close(f);
        function arrow(p1, p2, varargin)
            ip = inputParser();
            addOptional(ip, 'Color', [0, 0, 0]);
            parse(ip, varargin{:});
            color = ip.Results.Color;
            nextPlot = get(ax, 'NextPlot');
            cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
            set(ax, 'NextPlot', 'add');
            dp = p2 - p1;
            dpnorm = norm(dp);
            assert(dpnorm > arrowHeadLength);
            R = [dp(1), -dp(2); dp(2), dp(1)] / dpnorm;
            q1 = p2 - R(:, 1) * arrowHeadLength;
            plot(ax, [p1(1), q1(1)], [p1(2), q1(2)], 'Color', color);
            q2 = p2 - R * [arrowHeadLength, arrowHeadLength; [arrowHeadWidth, -arrowHeadWidth] / 2];
            patch(ax, 'XData', [q2(1, :), p2(1)], 'YData', [q2(2, :), p2(2)], 'EdgeColor', color, 'FaceColor', color);
      end
    end
    function [pl, proj_pl_end_pl_1] = circularsector(ax, O, r, s1, s2, varargin)
        nextPlot = get(ax, 'NextPlot');
        cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
        set(ax, 'NextPlot', 'add');
        ip = inputParser();
        addParameter(ip, 'LineStyle', '-');
        parse(ip, varargin{:});
        lineStyle = ip.Results.LineStyle;
        l = linspace(s1, s2, n);
        pl = O + [cos(r, l); sin(r, l)];
        pl_vec = pl - O;
        pl_vec_dot_pl_vec_1 = pl_vec' * pl_vec(:, 1);
        assert(all(pl_vec_dot_pl_vec_1 > 0));
        proj_pl_end_pl_1 = O + pl_vec(:, 1) * (pl_vec_dot_pl_vec_1(end) / pl_vec_dot_pl_vec_1(1));
        plot(ax, [O(1), pl(1, 1)], [O(2), pl(2, 1)]);
        plot(ax, [O(1), pl(1, end)], [O(2), pl(2, end)]);
        plot(ax, [proj_pl_end_pl_1(1), pl(1, end)], [proj_pl_end_pl_1(2), pl(2, end)], lineStyle);
        plot(ax, pl(1, :), pl(2, :));
    end
    function fillcircle(ax, p, r, varargin)
        ip = inputParser();
        addOptional(ip, 'Color', 'k');
        parse(ip, varargin{:});
        color = ip.Results.Color;
        l = linspace(0, 2 * acos(r, -r), n);
        fill(ax, p(1) + cos(r, l), p(2) + sin(r, l), color);
    end
end
