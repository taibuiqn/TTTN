const searchProduct = (key) => {
    const url = `http://192.168.1.101:8080/JewelryShop/search.php?key=${key}`;
    return fetch(url)
    .then(res => res.json());
};

export default searchProduct;
