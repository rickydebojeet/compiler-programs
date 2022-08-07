export default {
  // These are app level configs.
  lang: "en-US",
  title: "Compiler Design",
  description: "Vite & Vue powered static site",
  base: "/compiler-programs/",
  lastUpdated: true,
  markdown: {
    theme: "material-palenight",
    lineNumbers: true,
  },
  themeConfig: {
    logo: "/logo.svg",
    sidebar: {
      "/guide/": sidebarGuide(),
    },
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
function sidebarGuide() {
  return [
    {
      text: "Introduction",
      collapsible: true,
      items: [{ text: "Getting Started", link: "/guide/getting-started" }],
    },
    {
      text: "Contents",
      collapsible: true,
      items: [
        { text: "C", link: "/guide/c" },
        { text: "Lex", link: "/guide/lex" },
        { text: "Yacc", link: "/guide/yacc" },
      ],
    },
  ];
}
