# Blockchain Filter for Subrion

Subrion frontend plugin for listing, filtering, viewing and comparing blockchain projects. The plugin reads blockchain metadata from database tables and exposes a user-facing comparison experience for up to four selected blockchains.

## Overview

This plugin adds a blockchain directory to a Subrion CMS installation. Visitors can browse blockchain entries, filter them by category, open detailed profile pages and compare selected blockchains side by side.

The plugin is designed for a curated database of blockchain information, for example the top 50 blockchain projects. It does not fetch blockchain data from external APIs; all displayed information is loaded from the Subrion database.

## Features

- Frontend blockchain listing page
- Category-based filtering
- Detail pages for individual blockchain profiles
- Side-by-side comparison of up to four blockchains
- Responsive comparison templates for two, three and four selected blockchains
- Related data support for categories, protocols, hash functions, signature algorithms and social media records
- Subrion page/action registration through `install.xml`
- Smarty templates and module-specific CSS/JavaScript assets

## Requirements

- Subrion CMS `4.1.0` or compatible version
- PHP version supported by the target Subrion installation
- MySQL/MariaDB database used by Subrion
- A Subrion frontend theme that provides the expected Bootstrap/Font Awesome styling conventions

## Installation

1. Copy the plugin directory to the Subrion modules/plugins location as `blockchain`.
2. Install or enable the plugin from the Subrion admin panel.
3. Make sure the database tables listed in `install.xml` exist and contain valid blockchain data.
4. Add blockchain logo files to the active template image directory if the templates should display project logos.
5. Clear the Subrion cache after installation or template changes.

## Registered Frontend Pages

The plugin registers the following frontend pages:

| Page | URL | Controller | Purpose |
| --- | --- | --- | --- |
| Blockchain | `/blockchain` | `index.php` | Lists all blockchain records and handles category filtering |
| Blockchain Details | `/blockchain-detail` | `detail.php` | Displays a detailed blockchain profile |
| Blockchain Compare | `/compare` | `compare.php` | Compares selected blockchain records |

Example detail URL:

```text
/blockchain-detail?detail=Bitcoin
```

Example compare URL:

```text
/compare?compare=Bitcoin,Ethereum,Solana
```

## Project Structure

```text
.
├── index.php                         # Frontend listing and category filtering
├── detail.php                        # Blockchain detail page
├── compare.php                       # Comparison page
├── categoryfilter.php                # Category filter helper page/template data
├── install.xml                       # Subrion plugin metadata, pages and phrases
├── includes/classes/
│   ├── ia.front.blockchain.php       # Main frontend module class
│   ├── ia.front.blockchaincategory.php
│   ├── ia.front.blockchainprotocol.php
│   ├── ia.front.blockchainhash.php
│   ├── ia.front.blockchainsignatur.php
│   └── ...                           # Related frontend item classes
├── templates/front/
│   ├── index.tpl                     # Listing/filter UI
│   ├── detail.tpl                    # Detail UI
│   ├── compare.tpl                   # Compare wrapper
│   ├── compare-2.tpl                 # Two-column comparison layout
│   ├── compare-3.tpl                 # Three-column comparison layout
│   ├── compare-4.tpl                 # Four-column comparison layout
│   └── css/style.css                 # Plugin frontend styles
├── js/addTocompaire.js               # Add-to-compare frontend behavior
├── logos/                            # Blockchain logo assets
└── docs/
    ├── description.html
    ├── installation.html
    └── img/filter.jpg
```

## Database Tables

The plugin expects the following Subrion-prefixed tables:

| Table | Purpose |
| --- | --- |
| `blockchain` | Main blockchain records and comparison attributes |
| `blockchaincategory` | Available blockchain categories |
| `blockchain_category` | Relation between blockchains and categories |
| `blockchainprotocol` | Protocol records |
| `blockchainsignatur` | Signature algorithm records |
| `blockchainhash` | Hash function records |
| `blockchain_hash` | Relation between blockchains and hash functions |
| `blockchainsocialmedia` | Social media platform records |
| `blockchain_socialmedia` | Relation between blockchains and social media platforms |

The active database prefix is resolved through Subrion's database layer.

## Main Blockchain Fields

The comparison and detail views can display fields such as:

- Name, website, exchange symbol, color and description
- Runtime, API support, block time and block rewards
- Atomic swap, side chain, privacy and token availability flags
- Mainnet launch, latest release and transaction cost
- Transaction performance, scalability and security ratings
- Permission model, modularity, ecosystem and production readiness
- Energy consumption, wallet support, licensing and pricing
- Developer team size, maturity, storage capacity, partnerships and links

Related fields such as protocol, hash functions, signature algorithm, categories and social media are loaded through joined lookup tables.

## Usage

### Browse and Filter

Open the blockchain page:

```text
/blockchain
```

The listing page loads all blockchains with at least one category relation. Visitors can select one or more category checkboxes and submit the filter form. Matching blockchain entries are shown with their logo, website link, categories, short description and detail link.

### View Details

Open a detail page with the `detail` query parameter:

```text
/blockchain-detail?detail=Ethereum
```

The detail page loads the selected blockchain and enriches it with protocol, hash, signature, category and social media data.

### Compare Blockchains

Visitors can use the "Add to Compare" action on the listing page. The JavaScript summary box collects selected blockchains and forwards the visitor to the comparison page.

The comparison page accepts a comma-separated `compare` parameter:

```text
/compare?compare=Bitcoin,Ethereum,Cardano,Solana
```

The UI supports up to four blockchain records. Requests with more than four loaded records are rejected in the template.

## Logo Assets

This plugin includes blockchain logo files in:

```text
logos/
```

Logo filenames follow the blockchain slug/name pattern used by the frontend templates:

```text
logos/bitcoin-logo.png
logos/ethereum-logo.png
logos/cardano-logo.png
logos/monero-logo-150x150.png
```

Several logos are available in multiple sizes, for example the original file and a `150x150` thumbnail variant.

The current frontend templates reference logo images by blockchain name. If your Subrion installation serves plugin assets directly from the module directory, point the image paths to:

```text
_IA_URL_modules/blockchain/logos/{lowercase-blockchain-name}-logo.png
```

If your theme copies or serves plugin images from another location, keep that path consistent in:

- `templates/front/index.tpl`
- `templates/front/compare.tpl`
- `templates/front/compare-2.tpl`
- `templates/front/compare-3.tpl`
- `templates/front/compare-4.tpl`

## Development Notes

- The main data access logic lives in `includes/classes/ia.front.blockchain.php`.
- Frontend controllers only render HTML requests.
- Category filters are submitted through `POST` as `category_filter[]`.
- Compare requests accept either an array or comma-separated string and normalize the selected blockchain names internally.
- Subrion page URLs are resolved through `iaCore->factory('page', iaCore::FRONT)->getUrlByName(...)`.
- The listing form includes `{preventCsrf}` in the Smarty template.

## Security Notes

The plugin uses Subrion's database abstraction and table-prefix formatting. User-provided filter and compare values are normalized before SQL conditions are built. When extending the plugin, prefer parameterized database helpers or Subrion-safe formatting APIs for new queries, and escape frontend output in Smarty where user-controlled content may appear.

## Compatibility

Plugin metadata:

- Name: `blockchain`
- Title: `Blockchain Filter`
- Version: `1.0.0`
- Author: `Abdo El Hage`
- Declared Subrion compatibility: `4.1.0`

## License

No license file is included in this repository. Add a license before distributing the plugin publicly.
