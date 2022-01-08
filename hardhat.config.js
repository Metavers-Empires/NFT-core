require("dotenv").config();

require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require("solidity-coverage");

const PRIVATE_KEY = process.env.PRIVATE_KEY;
const INFURA_RINKEBY_KEY = process.env.INFURA_RINKEBY_KEY;

module.exports = {
  defaultNetwork: "testnet",
  networks: {
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${INFURA_RINKEBY_KEY}`,
      accounts: 
            [PRIVATE_KEY],
    },
  },


    /* mainnet: {
      url: process.env.POLYGON_MAINNET || "",
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
    }, 
    rinkeby: {
      url: process.env.RINKEBY_TESTNET,
      accounts:
        process.env.PRIVATE_KEY1,
      }
  },
    /*
    local: {
      url: process.env.LOCAL_TESTNET || "",
      accounts:
        process.env.PRIVATE_KEY2 !== undefined ? [process.env.PRIVATE_KEY2] : [],
    },
  }, */
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },

  /*
  path: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  }
  */
}
