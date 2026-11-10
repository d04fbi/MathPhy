% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function main()
    circularsectorfigure();
    circularsectorsequencefigure();
    function circularsectorfigure()
        f = figure('Visible', 'off');
        ax = axes(f);
        drawcircularsector(ax);
        axis(ax, 'equal', 'off');
        text(ax, 0.1675, 0.49, '$r$');
        text(ax, 0.9185, 0.5506, '$s$');
        text(ax, 0.235, -0.0877, '$x$');
        text(ax, 0.5775, 0.431, '$y$');
        print2tex(f, fullfile('figures/circular_sector.tex'));
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
        print2tex(f, fullfile('figures/circular_sector_sequence_base_case.tex'));
        mid = (s1 + s2) / 2;
        pmid = [math.cos(r, mid); math.sin(r, mid)];
        plot(ax, [O(1), pmid(1)], [O(2), pmid(2)]);
        plot(ax, [pmid(1), pl(1, 1)], [pmid(2), pl(2, 1)]);
        plot(ax, [pmid(1), pl(1, end)], [pmid(2), pl(2, end)]);
        set(t1, 'string', '$B_{n-1}$');
        set(t2, 'string', '$C_{n-1}$');
        text(ax, 0.689, 0.3031, '$B_n$');
        text(ax, 0.9185, 0.5506, '$C_n$');
        print2tex(f, fullfile('figures/circular_sector_sequence_recursive_step.tex'));
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
