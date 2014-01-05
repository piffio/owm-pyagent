# -*- coding: utf-8 -*-
'''
Execute a script and records results in har format
'''

# Import Selenium libs
from selenium import webdriver


class ScriptRunner(object):
    '''
    Run Scripts for performance measurements
    '''
    def __init__(self):
        self.driver = webdriver.PhantomJS()
        self.driver.set_window_size(1024, 768)

    def runScript(self, url):
        self.driver.get(url)
        self.logHar = self.driver.get_log('har')[0]['message']

    def getLog(self):
        return self.logHar

    def cleanup(self):
        if (self.driver):
            self.driver.quit()

if __name__ == '__main__':
    scriptRunner = ScriptRunner()
    scriptRunner.runScript('http://www.segundamano.mx')
    print(scriptRunner.getLog())
    scriptRunner.cleanup()
