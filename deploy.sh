#!/bin/bash

# -----—-----—-----—-----—-----—-----—-----—-----—-----—-----—-----—------------
# Script to deploy bam.bio to a bucket on Google Cloud Storage
# -----—-----—-----—-----—-----—-----—-----—-----—-----—-----—-----—------------

BUCKET=${1?Usage: ./deploy.sh bucket_name_without_gs_here}
GCS_ROOT=gs://${BUCKET}
GCS_NODE=${GCS_ROOT}/node_modules

# Files needed from node_modules/
FILES=(
    "jquery/dist/jquery.slim.min.js"
    "popper.js/dist/umd/popper.min.js"
    "popper.js/dist/umd/popper.min.js.map"
    "bootstrap/dist/js/bootstrap.min.js"
    "bootstrap/dist/js/bootstrap.min.js.map"
    "handsontable/dist/handsontable.full.min.js"
    
    "bootstrap/dist/css/bootstrap.min.css"
    "handsontable/dist/handsontable.full.min.css"

    "papaparse/papaparse.min.js"

    "@robertaboukhalil/aioli/aioli.js"
    "@robertaboukhalil/aioli/aioli.user.js"
    "@robertaboukhalil/aioli/aioli.worker.js"
)

# Upload node_modules/ files
for FILE in ${FILES[@]}; do
    gsutil cp web/node_modules/$FILE ${GCS_NODE}/${FILE}
done

# Upload HTML + CSS files
gsutil cp web/index.html web/dashboard.css ${GCS_ROOT}/

# Upload wasm files and set the correct content type
gsutil cp -r web/wasm ${GCS_ROOT}/
gsutil setmeta -h "Content-Type:application/wasm" ${GCS_ROOT}/wasm/samtools.worker.wasm
