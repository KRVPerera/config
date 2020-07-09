'''
    Download organizer
'''

from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

from pathlib import Path

import os
import time


class FolderOrganizer(FileSystemEventHandler):
    trackingFolder = "/Users/rukshanp/Downloads"
    jpgFolder = "/Users/rukshanp/Pictures/downloaded"
    jarFolder = "/Users/rukshanp/Downloads/jars"
    setupFolder = "/Users/rukshanp/Downloads/SDKs"
    videosFolder = "/Users/rukshanp/Movies/downloaded"

    def __init__(self, trackingFolder):
        self.trackingFolder = trackingFolder
        Path(self.jpgFolder).mkdir(parents=True, exist_ok=True)
        Path(self.jarFolder).mkdir(parents=True, exist_ok=True)
        Path(self.setupFolder).mkdir(parents=True, exist_ok=True)
        Path(self.videosFolder).mkdir(parents=True, exist_ok=True)
        print("Created")

    def on_modified(self, event):
        for file in os.listdir(self.trackingFolder):
            if self.isImageFile(file):
                srcPath = self.trackingFolder + "/" + file
                newDestination = self.jpgFolder + "/" + file
                i = 0
                while os.path.isfile(newDestination):
                    newDestination = self.jpgFolder + \
                        "/new_file_" + str(i) + "__" + file
                    i = i + 1

                print("Moving {} to {}".format(srcPath, newDestination))

            elif self.isJarFile(file):
                srcPath = self.trackingFolder + "/" + file
                newDestination = self.jarFolder + "/" + file
                i = 0
                while os.path.isfile(newDestination):
                    newDestination = self.jarFolder + \
                        "/new_file_" + str(i) + "__" + file
                    i = i + 1

                print("Moving {} to {}".format(srcPath, newDestination))

            elif self.isSetupFile(file):
                srcPath = self.trackingFolder + "/" + file
                newDestination = self.setupFolder + "/" + file
                i = 0
                while os.path.isfile(newDestination):
                    newDestination = self.setupFolder + \
                        "/new_file_" + str(i) + "__" + file
                    i = i + 1

                print("Moving {} to {}".format(srcPath, newDestination))

            elif self.isVideoFile(file):
                srcPath = self.trackingFolder + "/" + file
                newDestination = self.videosFolder + "/" + file
                i = 0
                while os.path.isfile(newDestination):
                    newDestination = self.videosFolder + \
                        "/new_file_" + str(i) + "__" + file
                    i = i + 1

                print("Moving {} to {}".format(srcPath, newDestination))
            else:
                continue
            
            os.rename(srcPath, newDestination)

    def isImageFile(self, fileName):
        fileName = fileName.lower()
        if fileName.endswith(".jpg"):
            return True
        if fileName.endswith(".png"):
            return True
        return False

    def isJarFile(self, fileName):
        if fileName.endswith(".jar"):
            return True
        return False

    def isSetupFile(self, fileName):
        if fileName.endswith(".dmg"):
            return True
        if fileName.endswith(".iso"):
            return True
        if fileName.endswith(".app"):
            return True
        return False
    
    def isVideoFile(self, fileName):
        if fileName.endswith(".mp4"):
            return True
        return False


def main():
    downLoadsFolder = "/Users/rukshanp/Downloads"
    folderEventHandler = FolderOrganizer(downLoadsFolder)
    observer = Observer()
    observer.schedule(folderEventHandler, downLoadsFolder, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(10)
    except KeyboardInterrupt:
        observer.stop()

    observer.join()


if __name__ == "__main__":
    main()
