#!/bin/bash
cd ~/Music/SinhalaMusic
youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 https://www.youtube.com/playlist\?list\=PL-85vBzyNkJlJ0GScA1omdDvS9n_--4dy --download-archive Songs.txt
