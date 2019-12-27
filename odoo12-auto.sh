#!/usr/bin/env bash
# (c) Paro, 2018
# Marmara Blockchain (odoo12) Auto setup.
# Aciklamalar :
# Gereksinimlere dikkat ediniz. aksi halde gereksinimleri karşılamayan sunucu özelliklerinde hata verebilir. Gereksinim karşılanmayan sunucularda hata ve zararlar tamamen kullanıcıya aittir.,
# Requirements:
# Min. 4 GB Free RAM
# Min. 2 CPUs
# OS : Ubuntu 16.04 LTS x86_64
# İletişim (Contact) B. Gültekin Çetiner http://twitter.com/drcetiner
EOF


sudo apt-get update
sudo apt-get -y upgrade
sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less
echo "---------------"
EOF
echo "Create Odoo user"
echo
fi
sudo useradd -m -d /opt/odoo12 -U -r -s /bin/bash odoo12
EOF
sudo apt install postgresql
EOF
sudo su - postgres -c "createuser -s odoo12"
EOF
wget https://builds.wkhtmltopdf.org/0.12.1.3/wkhtmltox_0.12.1.3-1~bionic_amd64.deb
EOF
sudo apt install ./wkhtmltox_0.12.1.3-1~bionic_amd64.deb
EOF
fi
# Installing odoo12
sudo mkdir /opt/odoo12
cd /opt/odoo12
sudo wget https://download.odoocdn.com/12.0/nightly/deb/odoo_12.0.latest_all.deb
sudo apt install ./odoo_12.0.latest_all.deb
EOF
sudo su - odoo12
cd /opt/odoo12
sudo python3 -m venv odoo-venv
source odoo-venv/bin/activate
sudo pip install --upgrade pip
sudo pip3 install --upgrade pip
sudo pip3 install wheel
sudo pip3 install -r odoo/requirements.txt
deactivate
sudo mkdir /opt/odoo12/odoo-custom-addons
exit

fi

echo -e "$STEP_START[ Step 4.Odoo12 ]$STEP_END Odoo12 conf"

sudo cp /opt/odoo12/odoo/debian/odoo.conf /etc/odoo12.conf
mkdir -p $HOME/.komodo
cat <<EOF > /etc/odoo12.conf
[options]
; This is the password that allows database operations:
admin_passwd = my_admin_passwd
db_host = False
db_port = False
db_user = odoo12
db_password = False
addons_path = /opt/odoo12/odoo/addons,/opt/odoo12/odoo-custom-addons
EOF
fi
echo -e "$STEP_START[ Step 4.odoo12.service ]$STEP_END odoo12.service conf"
cat <<EOF > /etc/systemd/system/odoo12.service
[Unit]
Description=Odoo12
Requires=postgresql.service
After=network.target postgresql.service

[Service]
Type=simple
SyslogIdentifier=odoo12
PermissionsStartOnly=true
User=odoo12
Group=odoo12
ExecStart=/opt/odoo12/odoo-venv/bin/python3 /opt/odoo12/odoo/odoo-bin -c /etc/odoo12.conf
StandardOutput=journal+console

[Install]
WantedBy=multi-user.target
EOF
fi

sudo systemctl daemon-reload
sudo systemctl start odoo12
sudo systemctl enable odoo12
EOF
sudo journalctl -u odoo12

echo -n "\n"
echo -n "Marmara Chain Kurulumu Tamamlandı.!"
echo -n "\n
