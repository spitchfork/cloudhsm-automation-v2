#
# Cookbook:: cloudhsm-auto-cb
# Recipe:: default
# Description:: Orchestrates the recipes
# Author:: Stephen Pitchfork
#
# Copyright:: 2022, The Authors, All Rights Reserved.
include_recipe "cloudhsm-auto-cb::package-setup"
include_recipe "cloudhsm-auto-cb::env-setup"
