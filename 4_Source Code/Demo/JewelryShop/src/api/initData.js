const initData = () => (
    fetch('http://192.168.1.106:8080/JewelryShop/')
    .then(res => res.json())
);

export default initData;
