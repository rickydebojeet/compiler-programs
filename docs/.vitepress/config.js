export default {
  // These are app level configs.
  lang: "en-US",
  title: "Compiler Design",
  description: "Vite & Vue powered static site",
  base: "/compiler-programs/",
  lastUpdated: true,
  markdown: {
    theme: "material-palenight",
    // lineNumbers: true,
  },
  themeConfig: {
    logo: "/logo.svg",
    nav: [
      { text: "Guide", link: "/guide" },
      {
        text: "Dropdown Menu",
        items: [
          { text: "Item A", link: "/item-1" },
          { text: "Item B", link: "/item-2" },
          { text: "Item C", link: "/item-3" },
        ],
      },
    ],
    sidebar: [
      {
        text: "Guide",
        items: [
          { text: "Introduction", link: "/introduction" },
          { text: "Getting Started", link: "/getting-started" },
        ],
      },
    ],
    socialLinks: [
      { icon: "github", link: "https://github.com/swaubhik/compiler-programs" },
      { icon: "twitter", link: "https://twitter.com/SwaubhikC" },
    ],
    footer: {
      message: "Released under the MIT License.",
      copyright: "Copyright © 2021-present Swaubhik Chakraborty",
    },
    editLink: {
      pattern:
        "https://github.com/swaubhik/compiler-programs/edit/website/docs/:path",
      text: "Edit this page on GitHub",
    },
  },
};
