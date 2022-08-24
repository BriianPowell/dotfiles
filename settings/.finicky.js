// ~/.finicky.js

module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      // Open apple.com urls in Safari
      match: ["apple.com/*", "apple.com", "*.apple.com/*", "*.apple.com"],
      browser: "Safari",
    },
    {
      // Open *.google.com urls in Google Chrome
      match: [
        "meet.google.com/*", // match google.com subdomains
        "meet.google.com",
      ],
      browser: "Google Chrome",
    },
  ],
};
