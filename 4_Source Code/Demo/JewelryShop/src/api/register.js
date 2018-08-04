const register = (name, email, address, phone, password) => (
    fetch('http://192.168.1.106:8080/JewelryShop/register.php',
    {   
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            Accept: 'application/json'
        },
        body: JSON.stringify({ name, email, address, phone, password })
    })
    .then(res => res.text())
);

module.exports = register;
