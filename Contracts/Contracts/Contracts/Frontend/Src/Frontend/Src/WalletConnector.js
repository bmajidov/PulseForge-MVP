import React, { useState } from 'react';

const WalletConnector = () => {
  const [account, setAccount] = useState('');
  const [kycVerified, setKycVerified] = useState(false);

  const connectWallet = async () => {
    if (window.ethereum) {
      try {
        const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
        setAccount(accounts[0]);
      } catch (error) {
        console.error(error);
      }
    } else {
      alert('Please install MetaMask!');
    }
  };

  const verifyKYC = async () => {
    if (!account) {
      alert('Connect wallet first');
      return;
    }
    alert('KYC Verified! (Demo mode)');
    setKycVerified(true);
  };

  return (
    <div>
      {!account ? (
        <button onClick={connectWallet}>Connect Wallet</button>
      ) : (
        <div>
          <p>Connected: {account}</p>
          <button onClick={verifyKYC} disabled={kycVerified}>
            {kycVerified ? 'KYC Verified' : 'Verify KYC'}
          </button>
        </div>
      )}
    </div>
  );
};

export default WalletConnector;
