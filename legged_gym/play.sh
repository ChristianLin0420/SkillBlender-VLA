#!/bin/bash

# Script to run play.py for all available pretrained models in logs/
# This will generate videos for all tasks and model variants

# Common settings
SIM_DEVICE=cuda:0
RL_DEVICE=cuda:0

# Function to run play script for a given task and run
run_play() {
    local task=$1
    local run_name=$2
    local experiment_name=$3
    
    echo "=========================================="
    echo "Running: $task with $run_name"
    echo "=========================================="
    
    python legged_gym/scripts/play.py \
        --task $task \
        --experiment_name $experiment_name \
        --load_run $run_name \
        --checkpoint -1 \
        --sim_device $SIM_DEVICE \
        --rl_device $RL_DEVICE
}

# Low-level skills (primitive behaviors)
echo "Running low-level skills..."

# H1 Skills
run_play "h1_walking" "0000_best" "h1_walking"
run_play "h1_reaching" "0000_best" "h1_reaching" 
run_play "h1_squatting" "0000_best" "h1_squatting"
run_play "h1_stepping" "0000_best" "h1_stepping"

# High-level tasks (SkillBlender vs PPO comparison)
echo "Running high-level tasks..."

# H1 Task Policies - SkillBlender (0000_best) vs PPO (1000_ppo)
run_play "h1_task_ball" "0000_best" "h1_task_ball"
run_play "h1_task_ball" "1000_ppo" "h1_task_ball"

run_play "h1_task_box" "0000_best" "h1_task_box"
run_play "h1_task_box" "1000_ppo" "h1_task_box"

run_play "h1_task_button" "0000_best" "h1_task_button"
run_play "h1_task_button" "1000_ppo" "h1_task_button"

run_play "h1_task_cabinet" "0000_best" "h1_task_cabinet"
run_play "h1_task_cabinet" "1000_ppo" "h1_task_cabinet"

run_play "h1_task_carry" "0000_best" "h1_task_carry"
run_play "h1_task_carry" "1000_ppo" "h1_task_carry"

run_play "h1_task_lift" "0000_best" "h1_task_lift"
run_play "h1_task_lift" "1000_ppo" "h1_task_lift"

run_play "h1_task_reach" "0000_best" "h1_task_reach"
run_play "h1_task_reach" "1000_ppo" "h1_task_reach"

run_play "h1_task_transfer" "0000_best" "h1_task_transfer"
run_play "h1_task_transfer" "1000_ppo" "h1_task_transfer"

echo "=========================================="
echo "All videos generated successfully!"
echo "Check logs/*/exported/frames/ for video files"
echo "=========================================="