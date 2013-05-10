% Metapost TeX macro
% Title: /home/lijianying/Desktop/2013Apr2/article/figures/Diagram1.dia
% Creator: Dia v0.96.1
% CreationDate: Sun Apr 28 12:54:16 2013
% For: lijianying


beginfig(1);
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
% Define macro for horizontal centering.
vardef hcentered primary P =
  P shifted -(xpart center P, 0)
enddef;
% Define macro for right justification.
vardef rjust primary P =
  P shifted -(xpart (lrcorner P - llcorner P), 0)
enddef;
  % picture(6.450000,-12.550000)(20.500000,-6.550000)
  x = 1.000000cm; y = -1.000000cm;

  t = 1.000000;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
  path p;
  p = (10.500000x,6.600000y)--(10.500000x,8.400000y)--(15.750000x,8.400000y)--(15.750000x,6.600000y)--cycle;
  fill p withcolor (1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (10.500000x,6.600000y)--(10.500000x,8.400000y)--(15.750000x,8.400000y)--(15.750000x,6.600000y)--cycle
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw hcentered btex {\usefont{OT1}{cmtt}{m}{n} ProgramCore} etex scaled 1.84t shifted (13.125000x,7.642500y);
  path p;
  p = (6.500000x,10.700000y)--(6.500000x,12.500000y)--(9.300000x,12.500000y)--(9.300000x,10.700000y)--cycle;
  fill p withcolor (1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (6.500000x,10.700000y)--(6.500000x,12.500000y)--(9.300000x,12.500000y)--(9.300000x,10.700000y)--cycle
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw hcentered btex {\usefont{OT1}{cmtt}{m}{n} Root} etex scaled 1.84t shifted (7.900000x,11.742500y);
  path p;
  p = (11.700000x,10.650000y)--(11.700000x,12.450000y)--(14.500000x,12.450000y)--(14.500000x,10.650000y)--cycle;
  fill p withcolor (1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (11.700000x,10.650000y)--(11.700000x,12.450000y)--(14.500000x,12.450000y)--(14.500000x,10.650000y)--cycle
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw hcentered btex {\usefont{OT1}{cmtt}{m}{n} FFTW} etex scaled 1.84t shifted (13.100000x,11.692500y);
  path p;
  p = (16.600000x,10.600000y)--(16.600000x,12.400000y)--(20.450000x,12.400000y)--(20.450000x,10.600000y)--cycle;
  fill p withcolor (1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (16.600000x,10.600000y)--(16.600000x,12.400000y)--(20.450000x,12.400000y)--(20.450000x,10.600000y)--cycle
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw hcentered btex {\usefont{OT1}{cmtt}{m}{n} selfLib} etex scaled 1.84t shifted (18.525000x,11.642500y);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (13.125000x,8.400000y)--(18.525000x,10.600000y)
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (7.900000x,10.700000y)--(13.125000x,8.400000y)
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (13.100000x,10.650000y)--(13.125000x,8.400000y)
    withpen pencircle scaled 0.1000x;
endfig;
end;
