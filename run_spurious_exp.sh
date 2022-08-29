CUDA_VISIBLE_DEVICES=$1
root_images_dir=/hdd2/dyah/coloredmnist_synthetic_spurious
# for dir in $root_images_dir/*
# do
#     feat_path=$(basename $dir)
#     image_path=$dir
#     python generate_candidate_sets.py -c configs/spur_exp/Synthetic_ColoredMNIST.yaml -feat_path $feat_path -img_path $image_path
# done
for dir in $root_images_dir/*
do
    feat_path=$(basename $dir)
    image_path=$dir
    load_path=./artifacts/extracted_features/Synthetic_ColoredMNIST/$(basename $dir)
    python get_spurious_samples.py -c configs/spur_exp/Synthetic_ColoredMNIST.yaml --log_path $feat_path  -img_path $image_path -feat_path $load_path
done