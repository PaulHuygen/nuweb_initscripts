# Start a new NUWEB project.

I find it extremely tedious to set up the beginning of a new NUWEB
project. Therefore I set up this repo that creates such a beginning.

It works as follows:

1. Create a repo for a new project, e.g. on github and create a
   "working directory", eg named `my_project`.
2. Cd to the working directory and clone this project.
3. Cd to the directory of the clone.
4. Run `./install -a <author> -t <title>` with your name instead of
   `<author>` and document title instead of `<title>`. Then cd back to the working directory.
5. A file `a_<title>.w` has been created. This file will be the
   basic nuweb file for your project.
6. To compile the nuweb project and generate the output program
   files, do `make sources`.
7. To generate a PDF document, do `make PDF`.
8. To generate an HTML document in subdirectory `html`, do `make html`.
9. The subdirectory with this project is no longer needed and can be removed.


There are undocumented featured in this repo, like the use of M4
(preprocessor) and automatic processing of `fig` figures.

# To do

- Further documentation.
- Make `a_template.w` empty.
- Include nuweb itself.
- Find out which LaTeX packages are required, how it can be found out
  whether they are available and how they can be installed if not
  available.
  
  
