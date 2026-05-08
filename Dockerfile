FROM islasgeci/base:22.04
COPY . /workdir

RUN R -e "remotes::install_github(c('IslasGECI/testtools', 'IslasGECI/geci_optparse'), build_vignettes=FALSE, upgrade = 'always')"
RUN R -e "install.packages(c('optparse', 'plyr'), repos='http://cran.rstudio.com')"


RUN make install
