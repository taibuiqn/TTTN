import React, { Component } from 'react';
import { ScrollView, Text } from 'react-native';

import Category from './Category';
import TopProduct from './TopProduct';
export default class HomeView extends Component {
	render() {
		const { types, topProducts } = this.props;
		return(
			<ScrollView style={{ flex: 1, backgroundColor: '#ABB1BA' }} >
				<Category navigator={this.props.navigator} types={types} />
				<TopProduct navigator={this.props.navigator} topProducts={topProducts} />
			</ScrollView>
		);
	}
}