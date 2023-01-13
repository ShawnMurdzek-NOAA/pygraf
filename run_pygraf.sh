#!/bin/sh

#SBATCH -A wrfruc
#SBATCH -t 02:00:00
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=8

date

cd /scratch1/BMC/wrfruc/murdzek/pygraf/

source ./pre.sh

python create_graphics.py \
         maps \
         --all_leads \
         -d /scratch1/BMC/wrfruc/murdzek/nature_run_1km_3hr/output/202107250100/UPP \
         -f 00 \
         --file_tmpl "wrfnat_202107250200.grib2" \
         --file_type nat \
         --images ./image_lists/wrfnat.yml hourly \
         -m "Nature Run" \
         -n 16 \
         -o /scratch1/BMC/wrfruc/murdzek/nature_run_1km_3hr/output/202107250100/graphics \
         -s 202107250200 \
         --tiles full

#python create_graphics.py \
#         maps \
#         --all_leads \
#         -d /scratch1/BMC/wrfruc/murdzek/nature_run_1km_CONUS/UPP \
#         -f 0 \
#         --file_tmpl "wrfprs_202107242300.grib2" \
#         --file_type prs \
#         --images ./image_lists/wrfprs.yml hourly \
#         -m "Nature Run" \
#         -n 4 \
#         -o /scratch1/BMC/wrfruc/murdzek/nature_run_1km_CONUS/graphics \
#         -s 2021072423 \
#         --tiles full

#python create_graphics.py \
#         skewts \
#         --all_leads \
#         -d /scratch1/BMC/wrfruc/murdzek/nature_run_1km_CONUS/UPP \
#         -f 0 \
#         --file_tmpl "wrfnat_202107242300.grib2" \
#         --file_type nat \
#         --max_plev 100 \
#         -m "Nature Run" \
#         -n 4 \
#         -o /scratch1/BMC/wrfruc/murdzek/nature_run_1km_CONUS/graphics \
#         -s 2021072423 \
#         --sites ./static/sites.txt

report-mem
date
