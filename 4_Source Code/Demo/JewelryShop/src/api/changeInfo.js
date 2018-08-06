const changeInfo = (token, name, phone, address) => (
    fetch('http://192.168.1.101:8080/JewelryShop/change_info.php',
    {   
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json'
        },
        body: JSON.stringify({ token, name, phone, address })
    })
    .then(res => res.json())
);

module.exports = changeInfo;
