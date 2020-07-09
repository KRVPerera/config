'''
    Download organizer
'''

from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

from pathlib import Path

import os
import time


def createDir(directory):
    if not os.path.exists(directory):
        os.makedirs(directory)

class Catagory:

    def __init__(self, name):
        self.catagory_name = name
        self.extentions = []


    def addExtention(self, extention):
        self.extentions.append(extention)


    def getCatagoryPath(self, rootPath):
        return rootPath + "/" + self.catagory_name


    def __str__(self):
        str = self.catagory_name + " {"
        for ext in self.extentions:
            str = str + ext + " "
        str = str + "}"
        return str


class FolderOrganizer(FileSystemEventHandler):

    trackingFolder = "/Users/rukshanp/Downloads"
    jpgFolder = "/Users/rukshanp/Downloads/Pictures"
    jarFolder = "/Users/rukshanp/Downloads/jars"
    setupFolder = "/Users/rukshanp/Downloads/SDKs"
    documentFolder = "/Users/rukshanp/Downloads/docs"
    videosFolder = "/Users/rukshanp/Downloads/Movies" 
    xmlFolder = "/Users/rukshanp/Downloads/docs/xml"

    catagories = dict()

    def __init__(self, trackingFolder):
        self.trackingFolder = trackingFolder
        # Pictures
        self.createCatagory("Pictures", "jpg")
        self.addCatagoryExt("Pictures", "png")

        # SDKs
        self.createCatagory("SDKs", "iso")
        self.addCatagoryExt("SDKs", "dmg")
        self.addCatagoryExt("SDKs", "zip")
        self.addCatagoryExt("SDKs", "tar.bz2")
        self.addCatagoryExt("SDKs", "deb")

        # jars
        self.createCatagory("jars", "jar")

        # Documents
        self.createCatagory("docs", "txt")
        self.addCatagoryExt("docs", "pdf")
        self.addCatagoryExt("docs", "xml")
        self.addCatagoryExt("docs", "html")

        # Movies
        self.createCatagory("Movies", "mp4")

        print("Created")

    def createCatagory(self, catagory, ext):
        if catagory not in self.catagories:
            self.catagories[catagory] = Catagory(catagory)

        cat = self.catagories[catagory]    
        cat.addExtention(ext)

        catPath = cat.getCatagoryPath(self.trackingFolder)
        createDir(catPath)

    def addCatagoryExt(self, catagory, ext):
        if catagory not in self.catagories:
            self.catagories[catagory] = Catagory(catagory)

        cat = self.catagories[catagory]    
        cat.addExtention(ext)

    def on_modified(self, event):
        for file in os.listdir(self.trackingFolder):
            srcPath = self.trackingFolder + "/" + file
            if os.path.isdir(srcPath):
                continue
            if file.startswith("."):
                continue
            print(file)

            for cat in self.catagories.values():
                catPath = cat.getCatagoryPath(self.trackingFolder)
                extention = None
                for ext in cat.extentions:
                    pFile = file.lower()
                    if pFile.endswith(ext):
                        extention = ext
                        break
                
                if extention is not None:
                    newDestination = catPath + "/" + file
                    os.rename(srcPath, newDestination)
                    print("Moving {} to {}".format(srcPath, newDestination))
                else:
                    continue


def main():
    downLoadsFolder = "/Users/rukshanp/Downloads"
    folderEventHandler = FolderOrganizer(downLoadsFolder)
    observer = Observer()
    observer.schedule(folderEventHandler, downLoadsFolder, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()

    observer.join()


if __name__ == "__main__":
    main()
