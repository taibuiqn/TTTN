const sendOrder = (token, arrayDetail) => {
    const data = { token, arrayDetail };
    console.log(data);
    return fetch('http://192.168.1.101:8080/JewelryShop/cart.php',
    {   
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(res => res.text())
};

module.exports = sendOrder;
