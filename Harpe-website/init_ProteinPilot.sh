#!/bin/bash
python manage.py syncdb
echo "=== Atoms ==="
python manage.py import-ProteinPilot-xml ../../Harpe-sort/datas/atoms.xml 

echo "=== Aminos Acids ==="
python manage.py import-ProteinPilot-xml ../../Harpe-sort/datas/AA.xml.d/naturals.xml

echo "=== PTMs ==="
python manage.py import-ProteinPilot-xml ../../Harpe-sort/datas/mods.xml.d/mods-biological.xml

