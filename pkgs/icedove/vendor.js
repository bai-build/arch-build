// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Disable Social API for content
pref("social.remote-install.enabled", false);
pref("social.toast-notifications.enabled", false);

// Make sure that whitelisted and directory installs are empty
pref("social.whitelist", "");
pref("social.directories", "");

// Disable the GeoLocation API for content
pref("geo.enabled", false);

// Pointing the "Help -> What's new" menu entry to mozilla.debian.net
pref("mailnews.start_page.override_url", "http://wiki.debian.org/Icedove/WhatsNew45");
