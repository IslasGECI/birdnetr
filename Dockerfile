FROM islasgeci/base:1.0.0
COPY . /workdir

RUN R -e "remotes::install_github('IslasGECI/testtools', build_vignettes=FALSE, upgrade = 'always')"
RUN R -e "install.packages('plyr', repos='http://cran.rstudio.com')"


RUN make install
