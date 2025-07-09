#!/bin/bash

random_num=$(( RANDOM % 10000 )) 
grim "screenshot_${random_num}.png"
