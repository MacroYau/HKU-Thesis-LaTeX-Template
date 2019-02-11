# LaTeX Template for HKU MPhil and PhD Thesis

Unofficial LaTeX template for typesetting a thesis according to the recommendations stipulated in [*Preparing and Submitting Your Thesis: A Guide for MPhil and PhD Students*](https://intraweb.hku.hk/reserved_1/gradsch/preparing_thesis2.pdf) published by the [Graduate School, The University of Hong Kong](https://www.gradsch.hku.hk) (the "guide") in July 2017. **You should always refer to the latest version of the guide and [relevant official documents](https://www.gradsch.hku.hk/gradsch/current-students/thesis-submission/guidelines-on-thesis-submission) when preparing your thesis.**

## Usage

You should be able to produce the [sample PDF](sample.pdf) with the following instructions:

1. Clone this repository to your working directory. (For non-Git users, you can press the "Clone or download" button, then follow the "Download ZIP" link.)

2. Open `main.tex` to edit the metadata and structure of your thesis.

3. The `hkuthesis` class inherits from the standard LaTeX `book` class, and provides all the required formatting. Specify your degree type (`mphil` for Master of Philosophy, or `phd` for Doctor of Philosophy) and font size (`10pt` to `12pt` recommended) in the document class options.

   ```latex
   \documentclass[mphil,12pt]{hkuthesis}
   ```

   If you need to compile your thesis for examination (i.e., printing the words "Temporary Binding for Examination Purposes" on the abstract and title pages), include the `exam` option.

4. The metadata of the thesis and its author is specified in the preamble. The information provided will be used to generate the necessary front matter pages. Previous degrees and professional qualifications of the author (if applicable) should be put inside the `\qualifications` block.
   
   ```latex
   \title{Insert the Title of Your Thesis Here}
   \author{Insert Your Name Here}
   \qualifications{B.Sc. \emph{H.K.}; M.A. \emph{C.U.H.K.}}
   \date{August 2018}
   ```

5. The order of front matter pages is defined in the `frontmatter` environment. The content of front matter pages can be edited in the corresponding files in the `contents/frontmatter/` directory. You can also add or remove the optional pages to suit your needs.

   ```latex
   % Front matter
   \begin{frontmatter}
   	\abstract[200]		% Word count as optional argument
   	\titlepage
   	\dedication 		% Optional
   	\declaration
   	\acknowledgements	% Optional
   	\tableofcontents
   	\listoffigures		% Optional
   	\listoftables		% Optional
   \end{frontmatter}
   ```

   It is non-trivial to automate the abstract word counting in the compilation process. Alternatively, you can utilise [TeXcount](https://ctan.org/pkg/texcount) to count words of your abstract by running the command below, then insert the result into the argument of `\abstract`.

   ```bash
   texcount contents/frontmatter/abstract.tex -sum -1
   ```

   Additional content for the declaration page, for example, a list of previously published work, can be appended to the standard template via creating a `contents/frontmatter/declaration.tex` file.

6. Write your thesis chapters and appendices, then load the `.tex` files into the `chapters` and `appendices` environments, respectively, using the `\input` command (`\include` might cause pagination glitches). If there is no appendix in your thesis, you can remove the entire `appendices` environment from `main.tex`.

   ```latex
   % Chapters
   \begin{chapters}
   	\input{contents/chapters/introduction}
   	\input{contents/chapters/background}
   	\input{contents/chapters/more-to-follow}
   \end{chapters}
   
   % Appendices
   \begin{appendices}
   	\input{contents/appendices/just-an-appendix}
   	\input{contents/appendices/yet-another-appendix}
   \end{appendices}
   ```

7. Include the back matter pages (e.g., references and list of your publications) inside the `backmatter` environment. You can adopt any bibliography package ([BibLaTeX](https://ctan.org/pkg/biblatex) is used in the example).

8. Build your thesis with your preferred LaTeX toolchain.

## Customisation

The typesetting styles of this template are defined in `hkuthesis.cls` class file. You can customise the layout according to its documentation.

## Licence

The LaTeX template implementation is under [MIT License](LICENSE.md), which means that you can freely use and modify it to produce your own thesis. As long as you are not redistributing this work or any of its modified versions, attribution is not strictly necessary. However, the use of the University of Hong Kong's name and identity is subject to the University's [policies](https://www.hku.hk/about/uid/policies/details.html).

Placeholder images in this repository are ["not copyrighted"](https://www.nasa.gov/multimedia/guidelines/index.html) and public domain work from [NASA](https://images.nasa.gov) and [SpaceX](https://www.flickr.com/photos/spacex), respectively.
