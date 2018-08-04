import React, {Component} from 'react';
import { View, Text, Dimensions, TouchableOpacity, Image, StyleSheet } from 'react-native';
import TabNavigator from 'react-native-tab-navigator';

import Home from './Home/Home';
import Contact from './Contact/Contact';
import Cart from './Cart/Cart';
import Search from './Search/Search';
import Header from './Header';
import global from '../../global';

import initData from '../../../api/initData';
import saveCart from '../../../api/saveCart';
import getCart from '../../../api/getCart';

import homeIconS from '../../../images/appIcon/home.png';
import homeIcon from '../../../images/appIcon/home0.png';
import cartIconS from '../../../images/appIcon/cart.png';
import cartIcon from '../../../images/appIcon/cart0.png';
import searchIconS from '../../../images/appIcon/search.png';
import searchIcon from '../../../images/appIcon/search0.png';
import contactIconS from '../../../images/appIcon/contact.png';
import contactIcon from '../../../images/appIcon/contact0.png';

const { height } = Dimensions.get('window');

export default class Shop extends Component {

	constructor(props) {
	  super(props);
	
	  this.state = { 
	  	selectedTab: 'home',
	  	types: [],
	  	topProducts: [],
	  	cartArray: [],
	  };
	  global.addProductToCart = this.addProductToCart.bind(this);
	  global.increaseQuantity = this.increaseQuantity.bind(this);
	  global.decreaseQuantity = this.decreaseQuantity.bind(this);
	  global.removeProduct = this.removeProduct.bind(this);
	  global.gotoSearch = this.gotoSearch.bind(this);
	}

	addProductToCart(product) {
		const isExist = this.state.cartArray.some(e => e.product.id_product === product.id_product);
        if (isExist) return false;
        this.setState(
        	{ cartArray: this.state.cartArray.concat({ product, quantity: 1 })},
        	() => saveCart(this.state.cartArray));       
    }

    increaseQuantity(productId) {
        const newCart = this.state.cartArray.map(e => {
            if (e.product.id_product !== productId) return e;
            return { product: e.product, quantity: e.quantity + 1 };
        });
        this.setState({ cartArray: newCart }, 
            () => saveCart(this.state.cartArray)
        );
    }

    decreaseQuantity(productId) {
        const newCart = this.state.cartArray.map(e => {
            if (e.product.id_product !== productId) return e;
            return { product: e.product, quantity: e.quantity - 1 };
        });
        this.setState({ cartArray: newCart }, 
            () => saveCart(this.state.cartArray)
        );
    }

    removeProduct(productId) {
        const newCart = this.state.cartArray.filter(e => e.product.id_product !== productId);
        this.setState({ cartArray: newCart }, 
            () => saveCart(this.state.cartArray)
        );
    }

	componentDidMount() {
	  initData()
	  .then(resJSON => {
	  	const { type, product } = resJSON;
	  	this.setState({ types: type, topProducts: product });
	  });
	  getCart()
      .then(cartArray => this.setState({ cartArray }));
	}

	openMenu(){
		const { open } = this.props;
		open();
	}
	gotoSearch() {
        this.setState({ selectedTab: 'search' });
    }


	render() {
		const { iconStyle } = styles;
		const { types, selectedTab, topProducts, cartArray } = this.state;
		return(
			<View style={{ flex: 1, }}>
				<Header onOpen={this.openMenu.bind(this)} />
				<TabNavigator>
					<TabNavigator.Item
						selected={selectedTab === 'home'}
						title="Home"
						onPress={() => this.setState({ selectedTab: 'home' })}
						renderIcon={() => <Image source={homeIcon} style={iconStyle} />}
                        renderSelectedIcon={() => <Image source={homeIconS} style={iconStyle} />}
                        selectedTitleStyle={{ color: '#F7751E', fontFamily: 'Raleway-Bold' }}
						>
						<Home types={types} topProducts={topProducts}/>
					</TabNavigator.Item>
						<TabNavigator.Item
						selected={selectedTab === 'search'}
						title="Search"
						onPress={() => this.setState({ selectedTab: 'search' })}
						renderIcon={() => <Image source={searchIcon} style={iconStyle} />}
                        renderSelectedIcon={() => <Image source={searchIconS} style={iconStyle} />}
                        selectedTitleStyle={{ color: '#F7751E', fontFamily: 'Raleway-Bold' }}
						>
						<Search />
					</TabNavigator.Item>
						<TabNavigator.Item
						selected={selectedTab === 'cart'}
						title="Cart"
						onPress={() => this.setState({ selectedTab: 'cart' })}
						renderIcon={() => <Image source={cartIcon} style={iconStyle} />}
						renderSelectedIcon={() => <Image source={cartIconS} style={iconStyle} />}
						badgeText={cartArray.length}
                        selectedTitleStyle={{ color: '#F7751E', fontFamily: 'Raleway-Bold' }}
						>
						<Cart cartArray={cartArray} />
					</TabNavigator.Item>
						<TabNavigator.Item
						selected={selectedTab === 'contact'}
						title="Contact"
						onPress={() => this.setState({ selectedTab: 'contact' })}
						renderIcon={() => <Image source={contactIcon} style={iconStyle} />}
                        renderSelectedIcon={() => <Image source={contactIconS} style={iconStyle} />}
                        selectedTitleStyle={{ color: '#F7751E', fontFamily: 'Raleway-Bold' }}
						>
						<Contact />
					</TabNavigator.Item>

				</TabNavigator>
			</View>
			);
	}
}

const styles = StyleSheet.create({
    iconStyle: {
        width: 20, height: 20
    }
});