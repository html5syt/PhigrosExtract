# set -e
version=`python3 taptap.py`
if [ "$version" = `cat version.txt` ]
then
	echo "No update"
	# exit
fi
sudo apt-get install libvorbisenc2
pip install UnityPy~=1.10.0
pip install fsb5
# git clone --single-branch -b master https://$1@github.com/7aGiven/Phigros_Resource/
# wget -nv -O Phigros.apk `cat url.txt`
wget -nv -O Phigros.apk https://github.com/SteveZMTstudios/Phigros-history/releases/download/v1.6.11/Phigros_V1.6.11_clone.apk
java -jar PhigrosMetadata-1.2.jar Phigros.apk
dotnet Il2CppDumper.dll libil2cpp.so global-metadata.dat .
dotnet TypeTreeGeneratorCLI.dll --help
dotnet TypeTreeGeneratorCLI.dll -p DummyDll/ -a Assembly-CSharp.dll -v 2019.4.31f1c1 -c GameInformation -c GetCollectionControl -c TipsProvider -d json_min -o Phigros_Resource/typetree.json
