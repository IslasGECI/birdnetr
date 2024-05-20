FROM islasgeci/base:1.0.0
COPY . /workdir

RUN R -e "remotes::install_github(c('IslasGECI/testtools', 'IslasGECI/optparse'), build_vignettes=FALSE, upgrade = 'always')"
RUN R -e "install.packages(c('optparse', 'plyr'), repos='http://cran.rstudio.com')"


RUN make install
