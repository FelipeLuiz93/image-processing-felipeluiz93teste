@echo off
echo === Limpando arquivos antigos...
rmdir /s /q dist
rmdir /s /q build
for /D %%i in (*.egg-info) do rmdir /s /q "%%i"

echo === Gerando arquivos de distribuicao...
python setup.py sdist bdist_wheel

echo === Enviando para TestPyPI...
python -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*
