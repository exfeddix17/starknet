#!/bin/bash

echo "Начинаем обновление репрозитория "
echo "-----------------------------------------------------------------------------"
cd ~/pathfinder/py
git fetch &>/dev/null
git checkout v0.1.10-alpha &>/dev/null
echo "Ваш репозиторий успешно обновлен, начинаем билд"
echo "-----------------------------------------------------------------------------"
python3 -m venv .venv &>/dev/null
source .venv/bin/activate &>/dev/null
PIP_REQUIRE_VIRTUALENV=true pip install --upgrade pip &>/dev/null
PIP_REQUIRE_VIRTUALENV=true pip install -r requirements-dev.txt &>/dev/null
cargo build --release --bin pathfinder &>/dev/null
sleep 2
source $HOME/.bash_profile &>/dev/null
echo "Билд завершен успешно"
echo "-----------------------------------------------------------------------------"
systemctl restart starknet
echo "Ваша нода обновлена и запущена"
echo "-----------------------------------------------------------------------------"
