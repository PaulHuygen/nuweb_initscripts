# Start a new NUWEB project.

I find it extremely tedious to set up the beginning of a new NUWEB
project. Therefore I set up this repo that creates such a beginning.

It works as follows:

1. Create a repo for a new project, e.g. on github and create a
   "working directory", eg named `my_project`
2. Download the *zip* representation of this repo in it.
3. Run `install -a <author> -t <title>` with your name instead of
   `<author>` and document title instead of `<title>`.
4. A file `a_my_project.w` has been created. This file will be the
   basic nuweb file for your project.
5. To compile the nuwebn project and generate the output program
   files, do `make sources`.
6. To generate a PDF file, do `make PDF`.
7. Replace this `README.md` for a one that describes your project.

There are undocumented featured in this repo, like the use of M4
(preprocessor) and automatic processing of `fig` figures.

# To do

- Enable generation of html.
- Further documentation.
- Make `a_template.w` empty.
- Include nuweb itself.
- Find out which LaTeX packages are required, how it can be found out
  whether they are available and how they can be installed if not
  available.
  
  
