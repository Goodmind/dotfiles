from themer import ThemeActivator
import os
import io

HOME = os.environ['HOME']

class XResourcesActivator(ThemeActivator):
    def activate(self):
        with open(os.path.join(HOME, '.Xresources'), 'a') as xresources:
            xresources.write('\n')

        os.system('xrdb -load ~/.Xresources')
