import React, { Component } from 'react';
import { ScrollView, Text } from 'react-native';
import NavigationExperimental from 'react-native-deprecated-custom-components';

import HomeView from './HomeView';
import ListProduct from '../ListProduct';
import ProductDetail from '../ProductDetail';

export default class Home extends Component {
	render() {
		const { types, topProducts } = this.props;
		return(
			<NavigationExperimental.Navigator 
			    initialRoute={{ name: 'HOME_VIEW' }}
			    renderScene={(route, navigator) => {
			      	switch(route.name) {
			      		case 'HOME_VIEW': return <HomeView navigator={navigator} types={types} topProducts={topProducts}/>;
			      		case 'LIST_PRODUCT': return <ListProduct navigator={navigator} category={route.category} />;
			      		default: return <ProductDetail navigator={navigator} product={route.product} />;
			      	} 
			    }}
			   
			/>
		);
	}
}