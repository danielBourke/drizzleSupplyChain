
import SupplyChain from "./contracts/SupplyChain.json"
const options = {
  web3: {
    block: false,
    fallback: {
      type: "ws",
      url: "ws://127.0.0.1:8545",
    },
  },
  contracts: [SupplyChain],
  // events: {
  //   SimpleStorage: ["StorageSet"],
  // },
  polls: {
    accounts: 1500,
  },
};

export default options;
