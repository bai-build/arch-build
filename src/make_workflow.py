#!/usr/bin/env python
# coding=utf-8
import os
import json
import yaml
from tqdm import tqdm

def main():
    pkgs_path = "../pkgs"
    pkgs = os.listdir(pkgs_path)
    pkgs = [x for x in pkgs if os.path.isdir(os.path.join(pkgs_path, x))]

    workflow_config_template = yaml.safe_load(open("./build.yml.template"))
    shard_size = 256 # https://docs.github.com/en/actions/learn-github-actions/usage-limits-billing-and-administration

    total = len(pkgs) // shard_size + 1
    for i in tqdm(range(total), total=total):
        workflow_config = workflow_config_template
        pkgs_shard = pkgs[i * shard_size: (i+1) * shard_size]
        if i == 0:
            workflow_config['on'] = {'push': {'branches': ['**']}}
        else:
            workflow_config['on'] = {'workflow_run': {'workflows': [f"BUILD-{i-1}"], 'types': ['completed']}}
        workflow_config['name'] = f"BUILD-{i}"
        workflow_config['jobs']['buildPKGBUILD']['strategy']['matrix']['PKGBUILDs'] = pkgs_shard
        with open(f"../.github/workflows/build-{i}.yml", 'w') as fp:
            yaml.dump(workflow_config, fp)

if __name__ == "__main__":
    main()