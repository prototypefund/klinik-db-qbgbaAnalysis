# This dockerfile just uses the geospatial rocker image, 
# then adds shiny on top of it and lastly installs the 
# qbgabaExtraData and the qbgbaApp packages which are 
# then used for the analysis...

FROM rocker/geospatial:4.1.1

RUN /rocker_scripts/install_shiny_server.sh

RUN R -e 'remotes::install_gitlab("klinik-db/qbgbaExtraData")'

