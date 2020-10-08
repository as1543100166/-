#!/bin/bash
systemctl stop firewalld.service
systemctl disable firewalld.service
echo "完毕"
