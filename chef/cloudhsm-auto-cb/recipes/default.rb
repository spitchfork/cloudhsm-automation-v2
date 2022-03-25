#
# Cookbook:: cloudhsm-auto-cb
# Recipe:: default
# Description:: Orchestrates the recipes
# Author:: Stephen Pitchfork (s.pitchfork@googlemail.com)
#
# Copyright:: 2022, The Authors, All Rights Reserved.
include_recipe "cloudhsm-auto-cb::package-setup"
include_recipe "cloudhsm-auto-cb::env-setup"
include_recipe "cloudhsm-auto-cb::provision-cluster"