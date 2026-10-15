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
function print2tex(figureHandle, fileName, figureWidth, figureHeight, figureMargin)
    if nargin < 5
        figureMargin = 0.5;
    end
    units = get(figureHandle, 'Units');
    position = get(figureHandle, 'Position');
    paperPositionMode = get(figureHandle, 'PaperPositionMode');
    cleanupObj = onCleanup(@() set(figureHandle, 'Units', units, 'Position', position, 'PaperPositionMode', paperPositionMode));
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
