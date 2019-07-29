import React from "react";
import ContForm from "./utils/ContForm";
import { Header, Icon, Divider } from 'semantic-ui-react'
import AData from "./utils/AData";

export default ({ accounts }) => (
  <div className="App">
    <div>
    <Header as='h2' icon textAlign='center'>
    <Icon name='coffee' circular />
    <Header.Content>Using blockchain to track the coffee supply chain</Header.Content>
  </Header>
 
  <div className="section">
        <Header>Active Account</Header>
        <AData  accountIndex={0} units="ether" precision={3} />
        
      </div>
      <div className="section">
      <Header as='h4'>Harvest Item()</Header>
     <ContForm contract="SupplyChain" method="harvestItem" button="harvest" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="processItem" button="process Item" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="sellItem" button="Sell Item" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="buyItem" button="Buy Item" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="shipItem" button="Ship Item" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="receiveItem" button="receive Item" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="purchaseItem" button="purchase Item" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="fetchItemBufferOne" button="fetchItemBufferOne" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="fetchItemBufferTwo" button="fetchItemBufferTwo" color="green"/>
     <Divider/>
     <ContForm contract="SupplyChain" method="kill" button="kill contract" color="red"/>
     </div>

     
 
    </div>
  </div>
);
