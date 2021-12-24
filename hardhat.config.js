require("dotenv").config();

require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require("solidity-coverage");


module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      accounts: 
            process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
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
