% SPDX-License-Identifier: MIT
% Copyright (c) 2026 Fredrik Bierich
function print2tex(f, fileName, figureWidth = 5, figureHeight = 4, figureMargin = 0.5)
    validateattributes(f, {'double'}, {'scalar'});
    validateattributes(fileName, {'char', 'string'}, {'nonempty'});
    validateattributes(figureWidth, {'double'}, {'scalar', 'positive'});
    validateattributes(figureHeight, {'double'}, {'scalar', 'positive'});
    validateattributes(figureMargin, {'double'}, {'scalar', 'nonnegative'});
    assert(isgraphics(f, 'figure'));
    assert(endsWith(fileName, '.tex', 'IgnoreCase', true));
    units = get(f, 'Units');
    position = get(f, 'Position');
    paperPositionMode = get(f, 'PaperPositionMode');
    cleanupObj = onCleanup(@() set(f, 'Units', units, 'Position', position, 'PaperPositionMode', paperPositionMode));
    ax = get(f, 'CurrentAxes');
    set(ax, 'Units', 'normalized');
    left = figureMargin / figureWidth;
    bottom = figureMargin / figureHeight;
    axesWidth = 1 - 2 * left;
    axesHeight = 1 - 2 * bottom;
    assert(axesWidth > 0);
    assert(axesHeight > 0);
    set(ax, 'Position', [left, bottom, axesWidth, axesHeight]);
    set(f, 'Units', 'Inches');
    position = get(f, 'Position');
    set(f, 'Position', [position(1), position(2), figureWidth, figureHeight]);
    set(f, 'PaperPositionMode', 'auto');
    print(f, fileName, '-depslatex');
end
