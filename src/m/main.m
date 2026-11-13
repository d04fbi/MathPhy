% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function main()
    circularsectorfigure();
    circularsectorsequencem();
    simpleharmonicmotionfigure();
    cosinewavefigure();
    uniformcircularmotionm();
    function circularsectorfigure()
        f = figure('Visible', 'off');
        ax = axes(f);
        drawcircularsector(ax);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, fullfile('output/m/circular_sector.tex'));
        close(f);
    end
    function circularsectorsequencem()
        O = [0; 0];
        r = 1;
        s1 = 0;
        s2 = 1.0472;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl_O, ~] = drawcircularsector(ax, O, r, s1, s2);
        plot(ax, pl_O(1, [1, end]), pl_O(2, [1, end]));
        axis(ax, 'equal', 'off');
        text(ax, -0.08, -0.0877, '$O$');
        text(ax, 0.485, 0.957, '$A$');
        t1 = text(ax, 0.4795, -0.0877, '$B_0$');
        t2 = text(ax, 1.0415, -0.0877, '$C_0$');
        print2tex(f, fullfile('output/m/circular_sector_sequence_base_case.tex'));
        mid = (s1 + s2) / 2;
        pmid = [math.cos(r, mid); math.sin(r, mid)];
        plot(ax, [O(1), pmid(1)], [O(2), pmid(2)]);
        plot(ax, [pmid(1), pl_O(1, 1)], [pmid(2), pl_O(2, 1)]);
        plot(ax, [pmid(1), pl_O(1, end)], [pmid(2), pl_O(2, end)]);
        set(t1, 'string', '$B_{n-1}$');
        set(t2, 'string', '$C_{n-1}$');
        text(ax, 0.689, 0.3031, '$B_n$');
        text(ax, 0.9185, 0.5506, '$C_n$');
        print2tex(f, fullfile('output/m/circular_sector_sequence_recursive_step.tex'));
        close(f);
    end
    function simpleharmonicmotionfigure()
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [~, q_O] = drawcircularsector(ax);
        fillcircle(ax, q_O);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, fullfile('output/m/simple_harmonic_motion.tex'));
        close(f);
    end
    function cosinewavefigure()
        A = 1;
        w = 1;
        T = 4 * math.Q(A) / w;
        t1 = -3 * T / 4;
        t2 = T / 4;
        tmid = (t1 + t2) / 2;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        fplot(@(t) math.cos(A, w * t), [t1 t2]);
        text(ax, -3.925, 0.525, '$\omega = \lim \limits_{|\Delta t| \to 0} \frac{|\Delta x|}{|\Delta t|}$', 'FontSize', 9);
        annotation('arrow', [0.375, 0.4988], [0.65, 0.5015], 'HeadWidth', 3, 'HeadLength', 4.5);
        box(ax, 'on');
        legend(ax, 'off');
        grid on;
        set(ax, 'XTick', [t1 tmid t2]);
        set(ax, 'XTickLabel', {'$-\frac{3T}{4}$', '$-\frac{T}{4}$', '$\frac{T}{4}$'});
        set(ax, 'YTick', [-A 0 A]);
        set(ax, 'YTickLabel', {'$-A$', '$0$', '$A$'});
        xlabel('$t$');
        ylabel('$x(t) = \cos(A,\omega t)$');
        pbaspect(ax, [4 3 1]);
        print2tex(f, fullfile('output/m/cosine_wave.tex'));
        close(f);
    end
    function uniformcircularmotionm()
        O = [0; 0];
        r = 0.03;
        f = figure('Visible', 'off');
        ax = axes(f, 'NextPlot', 'add');
        [pl_O, q_O] = drawcircularsector(ax, O);
        fillcircle(ax, pl_O(:, end), r);
        axis(ax, 'equal', 'off');
        t1 = text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        t2 = text(ax, 0.235, -0.0877, '$x$');
        t3 = text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, fullfile('output/m/uniform_circular_motion_spatial_position_diagram.tex'));
        drawarrow(ax, O, q_O);
        T = @(p1, p2, d) p2 + d * normalize(p2 - p1, "norm", 2);
        drawarrow(ax, q_O, T(q_O, pl_O(:, end), -r));
        drawarrow(ax, O, T(O, pl_O(:, end), -r));
        set(t1, 'string', '$\vec{r}$');
        set(t2, 'string', '$\vec{r}_x$');
        set(t3, 'string', '$\vec{r}_y$');
        print2tex(f, fullfile('output/m/uniform_circular_motion_position_vector_diagram.tex'));
        close(f);
    end
end
function [pl_O, q_O] = circularsector(O, r, s1, s2)
    validateattributes(O, {'double'}, {'size', [2, 1]});
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    validateattributes(s1, {'double'}, {'scalar'});
    validateattributes(s2, {'double'}, {'scalar'});
    assert(s1 ~= s2);
    l = linspace(s1, s2);
    pl = [math.cos(r, l); math.sin(r, l)];
    pl_1_dot_pl = pl(:, 1)' * pl;
    assert(all(pl_1_dot_pl > 0));
    pl_O = O + pl;
    q = pl(:, 1) * (pl_1_dot_pl(end) / pl_1_dot_pl(1));
    q_O = O + q;
end
function [pl_O, q_O] = drawcircularsector(ax, O = [0; 0], r = 1, s1 = 0, s2 = 1.0472)
    validateattributes(ax, {'double'}, {'scalar'});
    assert(isgraphics(ax, 'axes'));
    nextPlot = get(ax, 'NextPlot');
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    set(ax, 'NextPlot', 'add');
    [pl_O, q_O] = circularsector(O, r, s1, s2);
    plot(ax, [O(1), pl_O(1, 1)], [O(2), pl_O(2, 1)]);
    plot(ax, [O(1), pl_O(1, end)], [O(2), pl_O(2, end)]);
    plot(ax, [q_O(1), pl_O(1, end)], [q_O(2), pl_O(2, end)]);
    plot(ax, pl_O(1, :), pl_O(2, :));
end
function pl_O = circle(O, r)
    validateattributes(O, {'double'}, {'size', [2, 1]});
    validateattributes(r, {'double'}, {'scalar', 'positive'});
    l = linspace(0, 4 * math.Q(r));
    pl = [math.cos(r, l); math.sin(r, l)];
    pl_O = O + pl;
end
function fillcircle(ax, O = [0; 0], r = 0.03, edgeColor = [0, 0, 0], faceColor = [0, 0, 0])
    validateattributes(ax, {'double'}, {'scalar'});
    validateattributes(edgeColor, {'double'}, {'size', [1, 3]});
    validateattributes(faceColor, {'double'}, {'size', [1, 3]});
    assert(isgraphics(ax, 'axes'));
    nextPlot = get(ax, 'NextPlot');
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    set(ax, 'NextPlot', 'add');
    pl_O = circle(O, r);
    pl_O_length = length(pl_O);
    for k = 1 : pl_O_length
        triangle = [O, pl_O(:, [k, mod(k, pl_O_length) + 1])];
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
    dp_norm = norm(dp);
    assert(dp_norm > headLength);
    dp_hat = dp / dp_norm;
    q = dp_hat .* [headWidth / 2, headLength];
    shaftEndPoint = p2 - q(:, 2);
    shaft = [p1, shaftEndPoint];
    headWingPoints = shaftEndPoint + [q(2, 1) -q(2, 1); -q(1, 1) q(1, 1)];
    head = [headWingPoints(1, :), p2(1); headWingPoints(2, :), p2(2)];
end
function drawarrow(ax, p1, p2, headWidth = 0.025, headLength = 0.075, shaftColor = [0, 0, 0], headEdgeColor = [0, 0, 0], headFaceColor = [0, 0, 0])
    validateattributes(ax, {'double'}, {'scalar'});
    validateattributes(shaftColor, {'double'}, {'size', [1, 3]});
    validateattributes(headEdgeColor, {'double'}, {'size', [1, 3]});
    validateattributes(headFaceColor, {'double'}, {'size', [1, 3]});
    assert(isgraphics(ax, 'axes'));
    nextPlot = get(ax, 'NextPlot');
    cleanupObj = onCleanup(@() set(ax, 'NextPlot', nextPlot));
    set(ax, 'NextPlot', 'add');
    [shaft, head] = arrow(p1, p2, headWidth, headLength);
    plot(ax, shaft(1, :), shaft(2, :), 'Color', shaftColor);
    patch(ax, head(1, :), head(2, :), 'EdgeColor', headEdgeColor, 'FaceColor', headFaceColor);
end
