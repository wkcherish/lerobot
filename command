// 查找端口
lerobot-find-port

//主臂舵机配置ID
lerobot-setup-motors \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0

//从臂配置舵机ID
lerobot-setup-motors \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1  

// 主臂校准
lerobot-calibrate \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm

// 从臂校准
lerobot-calibrate \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm

// 端口授权
sudo chmod 666 /dev/ttyACM0
sudo chmod 666 /dev/ttyACM1

// 遥操作命令
lerobot-teleoperate \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm

// 带相机遥操作
lerobot-teleoperate \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ camera1: {type: opencv, index_or_path: /dev/video2, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true

// 查找相机
lerobot-find-cameras opencv # or realsense for Intel Realsense cameras

// 相机参数, ID数字(2,4)为index_or_path的值
{ up: {type: opencv, index_or_path: /dev/video4, width: 640, height: 480, fps: 30}, side: {type: intelrealsense, serial_number_or_name: 233522074606, width: 640, height: 480, fps: 30}}
--- Detected Cameras ---
Camera #0:
  Name: OpenCV Camera @ /dev/video2
  Type: OpenCV
  Id: /dev/video2
  Backend api: V4L2
  Default stream profile:
    Format: 0.0
    Width: 640
    Height: 480
    Fps: 30.0
--------------------
Camera #1:
  Name: OpenCV Camera @ /dev/video4
  Type: OpenCV
  Id: /dev/video4
  Backend api: V4L2
  Default stream profile:
    Format: 0.0
    Width: 640
    Height: 480
    Fps: 30.0
--------------------

# huggingface command
hf auth login --token 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 --add-to-git-credential

(lerobot-office) lwc@Robot:~/python_script/Lerobot-github/lerobot$ huggingface-cli login --token $HUGGINGFACE_TOKEN --add-to-git-credential
⚠️  Warning: 'huggingface-cli login' is precated. Use 'hf auth login' instead.

HF_USER=$(hf auth whoami | head -n 1)

# dataset
lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.num_episodes=20 \
    --dataset.single_task="Grab the green cube" \
    --resume=true # 在现有数据集中添加数据时使用

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.num_episodes=20 \
    --dataset.single_task="Grab the red cube" \
    --resume=true # 在现有数据集中添加数据时使用

#luoshuan
lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.num_episodes=3 \
    --dataset.single_task="pick up the bolt" \
    --resume=true # 在现有数据集中添加数据时使用

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.num_episodes=3 \
    --dataset.single_task="pick up the nut" \
    --resume=true # 在现有数据集中添加数据时使用

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.num_episodes=5 \
    --dataset.single_task="pick up the screwdriver" \
    --resume=true # 在现有数据集中添加数据时使用

lerobot-record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1 \
    --robot.id=my_awesome_follower_arm \
    --robot.cameras="{ front: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 30}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0 \
    --teleop.id=my_awesome_leader_arm \
    --display_data=true\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.num_episodes=20 \
    --dataset.single_task="pick up the allen key" \
    --resume=true # 在现有数据集中添加数据时使用
esc: 提前结束录制
左箭头: 取消当前单集并重新录制
右箭头: 提前停止当前单集或重置时间并移至下一集

# dataset_filepath
rm -rf /home/cherish/.cache/huggingface/lerobot/Embodied-AI-6/pi0.5

# replay
lerobot-replay \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM1\ti jiao
    --robot.id=my_awesome_follower_arm \
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --dataset.episode=0 # choose the episode you want to replay

#归一化
python src/lerobot/datasets/v30/augment_dataset_quantile_stats.py \
    --repo-id=Embodied-AI-6/pi0.5

# train
python src/lerobot/scripts/lerobot_train.py\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --policy.type=pi05 \
    --output_dir=./outputs/pi05_training \
    --job_name=pi05_training \
    --policy.repo_id="Embodied-AI-6/lerobot_pi0.5" \
    --policy.pretrained_path=lerobot/pi05_base \
    --policy.compile_model=false \
    --policy.gradient_checkpointing=true \
    --wandb.enable=false \
    --policy.dtype=bfloat16 \
    --policy.freeze_vision_encoder=true \
    --policy.train_expert_only=true \
    --steps=3000 \
    --policy.device=cuda \
    --batch_size=1

accelerate launch --num_processes 2 src/lerobot/scripts/lerobot_train.py\
    --dataset.repo_id="Embodied-AI-6/pi0.5" \
    --policy.type=pi05 \
    --output_dir=./outputs/pi05_training \
    --job_name=pi05_training \
    --policy.repo_id="Embodied-AI-6/lerobot_pi0.5" \
    --policy.pretrained_path=lerobot/pi05_base \
    --policy.compile_model=false \
    --policy.gradient_checkpointing=true \
    --wandb.enable=false \
    --policy.dtype=bfloat16 \
    --policy.freeze_vision_encoder=true \
    --policy.train_expert_only=true \
    --steps=3000 \
    --policy.device=cuda \
    --batch_size=1

#shanchu
rm -rf ./outputs/pi05_training    
#play
rm -rf /home/cherish/.cache/huggingface/lerobot/Embodied-AI-6/eval_smolvla
lerobot-record \
  --robot.type=so101_follower \
  --robot.port=/dev/ttyACM1 \
  --robot.id=my_awesome_follower_arm \
  --robot.cameras="{ camera1: {type: opencv, index_or_path: /dev/video2, width: 640, height: 480, fps: 30}}" \
  --display_data=true \
  --dataset.repo_id="Embodied-AI-6/eval_smolvla" \
  --dataset.single_task="pick up the bolt" \
  --dataset.push_to_hub=false \
  --policy.path="Embodied-AI-6/smolvla"

CUDA_VISIBLE_DEVICES="" lerobot-record \
  --robot.type=so101_follower \
  --robot.port=/dev/ttyACM1 \
  --robot.id=my_awesome_follower_arm \
  --robot.cameras="{ camera1: {type: opencv, index_or_path: /dev/video2, width: 640, height: 480, fps: 30}}" \
  --display_data=true \
  --dataset.repo_id="Embodied-AI-6/eval_pi0.5" \
  --dataset.single_task="pick up the green cube" \
  --dataset.push_to_hub=false \
  --dataset.num_episodes=1 \
  --dataset.episode_time_s=5 \
  --dataset.reset_time_s=1 \
  --policy.path="Embodied-AI-6/pi0.5" \
  --policy.device=cpu \
  --policy.use_amp=false
