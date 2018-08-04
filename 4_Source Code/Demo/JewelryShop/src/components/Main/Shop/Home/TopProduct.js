import React, { Component } from 'react';
import { View, Text, StyleSheet, Dimensions, Image, TouchableOpacity, ListView } from 'react-native';

const url= 'http://192.168.1.106:8080/JewelryShop/images/product/';

export default class TopProduct extends Component {

    gotoProductDetail(product) {
        const {navigator} = this.props;
        navigator.push({ name: 'PRODUCT_DETAIL', product });
    }
	render() {
        const { topProducts} = this.props;
		const { 
            container, titleContainer, title, 
            body, productContainer, productImage,
            produceName, producePrice 
        } = styles;
		return (
			<View style={container}>
				<View style={titleContainer}>
					<Text style={title}>TOP PRODUCT</Text>
				</View>
				
                <ListView 
                    contentContainerStyle={body}
                    enableEmptySections
                    dataSource={new ListView.DataSource({ rowHasChanged: (r1, r2) => r1 !== r2 }).cloneWithRows(topProducts)}
                    renderRow={product => (
                        <TouchableOpacity style={productContainer} onPress={() => this.gotoProductDetail(product)}>
                            <Image source={{ uri: `${url}${product.image[0]}` }} style={productImage} />
                            <Text style={produceName}>{product.name.toUpperCase()}</Text>
                            <Text style={producePrice}>{product.price} VND</Text>
                        </TouchableOpacity>
                    )}
                    renderSeparator={(sectionId, rowId) => {
                        if (rowId % 2 === 1) return <View style={{ width, height: 10 }} />;
                        return null;
                    }}
                />
			</View>
		);
	}
}

const { width } = Dimensions.get('window');
const productWidth = (width - 60) / 2;
const productImageHeight = productWidth;
const styles = StyleSheet.create({
    container: {
        backgroundColor: '#fff',
        margin: 10,
        shadowColor: '#2E272B',
        shadowOffset: { width: 0, height: 3 },
        shadowOpacity: 0.2
    },
    titleContainer: {
        height: 50,
        justifyContent: 'center',
        paddingLeft: 10
    },
    title: {
        color: '#D3D3CF',
        fontSize: 20
    },
    body: {
        flexDirection: 'row',
        justifyContent: 'space-around',
        flexWrap: 'wrap',
        paddingBottom: 10
    },
    productContainer: {
        width: productWidth,
        shadowColor: '#2E272B',
        shadowOffset: { width: 0, height: 3 },
        shadowOpacity: 0.2
    },
    productImage: {
        width: productWidth,
        height: productImageHeight
    },
    produceName: {
        marginVertical: 5,
        paddingLeft: 10,
        fontFamily: 'Raleway-Bold',
        color: '#662F90',
        fontWeight: '500'
    },
    producePrice: {
        marginBottom: 5,
        paddingLeft: 10,
        fontFamily: 'Raleway-Bold',
        color: '#662F90'
    }
});
