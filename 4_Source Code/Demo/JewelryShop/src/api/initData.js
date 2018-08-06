const initData = () => (
    fetch('http://192.168.1.101:8080/JewelryShop/')
    .then(res => res.json())
);

export default initData;
