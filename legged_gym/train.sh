TASKS=(g1_walking g1_reaching g1_squatting g1_stepping)


for TASK in ${TASKS[@]}
do
    WANDB=$TASK
    RUN_NAME=baseline
    SIM_DEVICE=cuda:0
    RL_DEVICE=cuda:0

    python legged_gym/scripts/train.py \
        --task $TASK \
        --wandb $WANDB \
        --run_name $RUN_NAME \
        --headless \
        --sim_device $SIM_DEVICE \
        --rl_device $RL_DEVICE
done