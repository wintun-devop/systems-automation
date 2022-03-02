#!/bin/bash

#https://github.com/wintun-devop(My github repo)

#https://www.youtube.com/channel/UCz9ebjc-_3t3p49gGpwyAKA (Please subscribe my channel.Thank You!)

#Assign correct nfs mount target id from server(Please make sure to correct mount target id)
nsf_server_share_point="10.100.0.240:/mnt/dataf"

#Define mount point directory as your desired
nsf_client_mount_point=/mnt/nsf-mount-data

#create mount point directory
mkdir -p "${nsf_client_mount_point}"

#mounting nsf on your desired mount point
mount -vvv -t nfs "${nsf_server_share_point}" "${nsf_client_mount_point}"

#checking the efs mounting status
mount | grep -i nfs