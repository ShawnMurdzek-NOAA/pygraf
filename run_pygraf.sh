#!/bin/sh

#SBATCH -A wrfruc
#SBATCH -t 02:00:00
#SBATCH --ntasks=4

date

cd /scratch1/BMC/wrfruc/murdzek/pygraf/

source ./pre.sh

python create_graphics.py \
         maps \
         --all_leads \
         -d /scratch1/BMC/wrfruc/murdzek/nature_run_3km/WRF/run \
         -f 0 \
         --file_tmpl "wrfnat_hrconus_{FCST_TIME:02d}.grib2" \
         --file_type nat \
         --images ./image_lists/wrfnat.yml hourly \
         -m "Nature Run" \
         -n 4 \
         -o /scratch1/BMC/wrfruc/murdzek/nature_run_3km/graphics \
         -s 2021072423 \
         --tiles full

python create_graphics.py \
         maps \
         --all_leads \
         -d /scratch1/BMC/wrfruc/murdzek/nature_run_3km/WRF/run \
         -f 0 \
         --file_tmpl "wrfprs_hrconus_{FCST_TIME:02d}.grib2" \
         --file_type prs \
         --images ./image_lists/wrfprs.yml hourly \
         -m "Nature Run" \
         -n 4 \
         -o /scratch1/BMC/wrfruc/murdzek/nature_run_3km/graphics \
         -s 2021072423 \
         --tiles full

python create_graphics.py \
         skewts \
         --all_leads \
         -d /scratch1/BMC/wrfruc/murdzek/nature_run_3km/WRF/run \
         -f 0 \
         --file_tmpl "wrfnat_hrconus_{FCST_TIME:02d}.grib2" \
         --file_type nat \
         --max_plev 100 \
         -m "Nature Run" \
         -n 4 \
         -o /scratch1/BMC/wrfruc/murdzek/nature_run_3km/graphics \
         -s 2021072423 \
         --sites ./static/sites.txt

report-mem
date
