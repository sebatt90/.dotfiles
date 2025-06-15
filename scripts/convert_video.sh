#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 [operation] [input] [output]"
   echo -e "\t-[operation] trancode-video/transcode-video-audio"
   echo -e "\t- input video"
   echo -e "\t- output video"
   exit 1 # Exit script after printing help
}

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
	helpFunction
fi

if [ "$1" = "transcode-video" ]; then
	ffmpeg -i "$2" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a copy "$3"
elif [ "$1" = "transcode-video-audio" ]; then
	ffmpeg -i "$2" -c:v dnxhd -profile:v dnxhr_hq -pix_fmt yuv422p -c:a alac "$3"
fi

