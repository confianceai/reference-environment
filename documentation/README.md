# Documentation

The documentation is built using [Docusaurus](https://docusaurus.io/), a modern static website generator.

## Installation

Run the following command in the `documentation/` directory.

```bash
npm install
```

## Local Development

```bash
npm run start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

## Build

```bash
npm run build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

:::warning
Please never commit changes without running a local build before in order to verify broken links and Docusaurus configuration.
:::

## Search bar configuration

Local Search for Docusaurus is used to enable search indexation for the documentation. Full [documentation](https://github.com/easyops-cn/docusaurus-search-local).

```sh
npm install @easyops-cn/docusaurus-search-local
```

## Mermaid support

To enable [Mermaid](https://mermaid.js.org/) diagrams support, see [official documentation].

## Update dependencies

Update project's dependencies with the following command. Be careful, it can break everything:

```sh
npm install @docusaurus/core@latest @docusaurus/preset-classic@latest @easyops-cn/docusaurus-search-local@latest
```
