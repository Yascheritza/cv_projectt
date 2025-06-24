FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    tzdata \
    texlive-base \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-science \
    cm-super \
    dvipng \
    && apt-get clean

WORKDIR /cv

COPY ./cv /cv

RUN pdflatex -interaction=nonstopmode main.tex && \
    cp main.pdf /main.pdf

CMD ["pdflatex", "-interaction=nonstopmode", "main.tex"]
