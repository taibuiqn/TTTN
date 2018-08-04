import React, { Component } from 'react';
import { StyleSheet, Text, TouchableOpacity, ListView, View, Image, Dimensions } from 'react-native';

import dh1 from '../../../../images/imageJewelry/dh1.png';
import vt3 from '../../../../images/imageJewelry/vt3.png';
import global from '../../../global';

const url = 'http://192.168.1.106:8080/JewelryShop/images/product/';

function toTitleCase(str) {
    return str.replace(/\w\S*/g, txt => txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase());
}

export default class SearchView extends Component {
    constructor(props) {
        super(props);
        const ds = new ListView.DataSource({ rowHasChanged: (r1, r2) => r1 !== r2 });
        this.state = {
                listProduct: ds
        };
        global.setArraySearch = this.setSearchArray.bind(this);
    }
    setSearchArray(arrProduct) {
        this.setState({ listProduct: this.state.listProduct.cloneWithRows(arrProduct) });
    }

    gotoDetail(product) {
        const { navigator } = this.props;
        navigator.push({ name: 'PRODUCT_DETAIL', product });
    }

    render() {
        const {
            product, mainRight, txtMaterial, txtColor,
            txtName, txtPrice, productImage,
            txtShowDetail, showDetailContainer, wrapper
        } = styles;
        return (
            <View style={wrapper}>
                <ListView
                    dataSource={this.state.listProduct}
                    renderRow={productItem => (
                        <View style={product}>
                            <Image source={{ uri: `${url}${productItem.image[0]}`}} style={productImage} />
                            <View style={mainRight}>
                                <Text style={txtName}>{productItem.name}</Text>
                                <Text style={txtPrice}>{productItem.price} VND</Text>
                                <TouchableOpacity style={showDetailContainer} onPress={() => this.gotoDetail(productItem)}>
                                    <Text style={txtShowDetail}>SHOW DETAILS</Text>
                                </TouchableOpacity>
                            </View>
                        </View>
                    )}
                />
            </View>
            
        );
    }
}

const { width } = Dimensions.get('window');
const imageWidth = width / 4;
const imageHeight = (imageWidth * 452) / 361;

const styles = StyleSheet.create({
    wrapper: {
        backgroundColor: '#F6F6F6',
        flex: 1
    },
    product: {
        flexDirection: 'row',
        margin: 10,
        padding: 10,
        backgroundColor: '#FFFFFF',
        borderRadius: 2,
        shadowColor: '#3B5458',
        shadowOffset: { width: 0, height: 3 },
        shadowOpacity: 0.2
    },
    productImage: {
        width: imageWidth,
        height: imageHeight,
        flex: 1,
        resizeMode: 'center'
    },
    mainRight: {
        flex: 3,
        justifyContent: 'space-between'
    },
    productController: {
        flexDirection: 'row'
    },
    numberOfProduct: {
        flex: 1,
        flexDirection: 'row',
        justifyContent: 'space-around'
    },
    txtName: {
        paddingLeft: 20,
        color: '#A7A7A7',
        fontSize: 20,
        fontWeight: '400',
        fontFamily: 'Avenir'
    },
    txtPrice: {
        paddingLeft: 20,
        color: '#C21C70',
        fontSize: 15,
        fontWeight: '400',
        fontFamily: 'Avenir'
    },
    txtColor: {
        paddingLeft: 20,
        color: 'black',
        fontSize: 15,
        fontWeight: '400',
        fontFamily: 'Avenir'
    },
    txtMaterial: {
        paddingLeft: 20,
        color: 'black',
        fontSize: 15,
        fontWeight: '400',
        fontFamily: 'Avenir'
    },
    txtShowDetail: {
        color: '#C21C70',
        fontSize: 10,
        fontWeight: '400',
        fontFamily: 'Avenir',
        textAlign: 'right',
    },
    showDetailContainer: {
        flexDirection: 'row',
        position: 'absolute',
        alignSelf: 'flex-end',
        marginTop: 100
    }
});