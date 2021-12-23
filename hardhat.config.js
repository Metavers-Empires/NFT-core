require("dotenv").config();

require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-waffle");
require("hardhat-gas-reporter");
require("solidity-coverage");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    localhost: {
      url: "http://127.0.0.1:8545",
      accounts:
        proccess.env.PRIVATE_KEY_HARDHAT
    },

    hardhat: {

    }
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
        enable: true,
        runs: 200
      }
    }
  },

  path: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 200000
  }

}
