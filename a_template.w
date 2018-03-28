m4_include(inst.m4)m4_dnl
\documentclass[twoside]{artikel3}
\newcommand{\theTitle}{m4_doctitle}
\newcommand{\theAuthor}{m4_author}
\input{thelatexheader.tex}
\begin{document}
\maketitle
This is not yet a template, but a test whether it really works.

For instance, when we open a file and write something in it:

@o test.wrt @{@%
  Let's jot something down.
  Define a variable soep.
  Use it in a macro e.g. in this one:
  @< a macro @>
@| soep @}

We can include a figure (figure~\ref{fig:eenplaatje})
\begin{figure}[hbtp]
  \includegraphics[width=5cm]{fileschema.fig}
  \caption{A figure}
  \label{fig:eenplaatje}
\end{figure}
too.



@d a macro @{@%
  wij eten vandaag geen soep.
@| @}

That's all for now.

\section{Indexes}
\label{sec:indexes}

\subsection{Filenames}
\label{sec:filenames}

@f

\subsection{Macro's}
\label{sec:macros}

@m

\subsection{Variables}
\label{sec:veriables}

@u

@% \subsection{General index}
@% \label{sec:genindex}

\printindex

\end{document}
