# This dockerfile just uses the geospatial rocker image, 
# installs the qbgabaExtraData and the qbgbaApp packages 
# which are then used for the analysis, and starts the 
# shiny app...

FROM rocker/geospatial:4.1.1

RUN Rscript -e 'install.packages(c("htmltools","attempt","shiny","config","leaflet","golem","DT"))'

RUN R -e 'remotes::install_gitlab("klinik-db/qbgbaExtraData")'
RUN R -e 'remotes::install_gitlab("klinik-db/qbgbaApp")'

EXPOSE 80

CMD R -e "options('shiny.port'=80,shiny.host='0.0.0.0');qbgbaApp::run_app()"
