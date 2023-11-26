FILE=$1
if [[ $FILE != "images" && $FILE != "images2" ]]; then
    echo "Available datasets are:images , images2"
    exit 1
fi
if [[ $FILE == "cityscapes" ]]; then
    echo "Due to license issue, we cannot provide the Cityscapes dataset from our repository. Please download the Cityscapes dataset from https://cityscapes-dataset.com, and use the script ./datasets/prepare_cityscapes_dataset.py."
    echo "You need to download gtFine_trainvaltest.zip and leftImg8bit_trainvaltest.zip. For further instruction, please read ./datasets/prepare_cityscapes_dataset.py"
    exit 1
fi
echo "Specified [$FILE]"
URL=https://cs.stanford.edu/people/rak248/VG_100K_2/$FILE.zip
ZIP_FILE=./data/stanford_filtered/$FILE.zip
TARGET_DIR=./data/stanford_filtered/$FILE/
wget -N $URL -O $ZIP_FILE
mkdir $TARGET_DIR
unzip $ZIP_FILE -d ./data/stanford_filtered/
rm $ZIP_FILE

