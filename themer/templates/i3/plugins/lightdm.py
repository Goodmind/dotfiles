from themer import ThemeActivator
import dbus
import os

HOME = os.environ['HOME']
USER = os.environ['USER']

bus = dbus.SystemBus()

def get_user_account_path(user):
    account_path = ""
    accounts = bus.get_object('org.freedesktop.Accounts', '/org/freedesktop/Accounts')
    accounts_iface = dbus.Interface(accounts, dbus_interface='org.freedesktop.Accounts')

    if type(user) == str:
        account_path = accounts_iface.FindUserByName(user)
    elif type(user) == int:
        account_path = accounts_iface.FindUserById(dbus.Int64(user))

    return account_path

def set_background_file(account_path, image_path):
    user = bus.get_object('org.freedesktop.Accounts', account_path)
    user.SetBackgroundFile(image_path, dbus_interface='org.freedesktop.Accounts.User')

class LightDMActivator(ThemeActivator):
    def activate(self):
        set_background_file(get_user_account_path(USER), os.path.join(HOME, '.wallpaper.png'))
