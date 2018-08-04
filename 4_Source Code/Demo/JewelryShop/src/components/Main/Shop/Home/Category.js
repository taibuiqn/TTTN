import React, { Component } from 'react';
import { View, Text, Image, ImageBackground, StyleSheet, Dimensions, TouchableOpacity } from 'react-native';
import Swiper from 'react-native-swiper';

const { width, height } = Dimensions.get('window');
const url= 'http://192.168.1.106:8080/JewelryShop/images/type/';

export default class Category extends Component {

	gotoListProduct(category) {
		const {navigator} = this.props;
		navigator.push({ name:'LIST_PRODUCT', category });
	}

	render() {
		const { types } = this.props;
		const { wrapper, textStyle, imageStyle, categoryTitle } = styles;
		const swiper = (
            <Swiper showsPagination width={imageWidth} height={imageHeight}>
				{ types.map(e =>(
					<TouchableOpacity onPress={() => this.gotoListProduct(e)} key={e.id_type}>
						<ImageBackground source={{ uri: `${url}${e.image}` }} style={imageStyle}>
							<Text style={categoryTitle}>{e.name}</Text>
						</ImageBackground>
					</TouchableOpacity>
				))}						
			</Swiper>
        );
		return(
			<View style={wrapper} >
				<View style={{flex: 1}}>
					<Text style={textStyle}>CATEGORY</Text>
				</View>
				<View style={{flex: 4}}>
					{ types.length ? swiper : null }
				</View>
			</View>
		);
	}
}

const imageWidth = width - 40;
const imageHeight = imageWidth / 2;
const styles = StyleSheet.create({
    wrapper: {
        width: width - 20,
        backgroundColor: '#FFF',
        margin: 10,
        shadowColor: '#2E272B',
        shadowOffset: { width: 0, height: 3 },
        shadowOpacity: 0.2,
        padding: 5,
        paddingTop: 0
    },
    textStyle: {
        fontSize: 20,
        color: '#AFAEAF'
    },
    imageStyle: {
        height: imageHeight, 
        width: imageWidth,
        justifyContent: 'center',
        alignItems: 'center'
    },
    categoryTitle: {
        fontSize: 20,
        fontFamily: 'Raleway-Bold',
        color: '#9A9A9A'
    }
});