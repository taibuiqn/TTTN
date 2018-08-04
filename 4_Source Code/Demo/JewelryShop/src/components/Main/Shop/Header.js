import React, {Component} from 'react';
import { View, Text, Dimensions, TouchableOpacity, Image, TextInput, StyleSheet } from 'react-native';
import icLogo from '../../../images/appIcon/ic_logo_Jewelry.png';
import icMenu from '../../../images/appIcon/ic_menu.png';
import global from '../../global';
import searchProduct from '../../../api/searchProduct';

const { height } = Dimensions.get('window');

export default class Header extends Component {
	constructor(props) {
        super(props);
        this.state = {
            txtSearch: ''
        };
    }
    onSearch() {
        const { txtSearch } = this.state;
        this.setState({ txtSearch: '' });
        searchProduct(txtSearch)
        .then(arrProduct => global.setArraySearch(arrProduct))
        .catch(err => console.log(err));
    }
	render() {
		const { wrapper, row1, textInput, iconStyle, titleStyle } = styles;
		return (
			<View style={wrapper}>
				<View style={row1}>
					<TouchableOpacity onPress={this.props.onOpen}>
						<Image source={icMenu} style={iconStyle} />
					</TouchableOpacity>
					<Text style={titleStyle}>Jewelry Shop</Text>
					<Image source={icLogo} style={iconStyle} />
				</View>
				<TextInput 
					style={textInput}
					placeholder="Search..."
					underlineColorAndroid = 'transparent'
					value = {this.state.txtSearch}
					onChangeText={text => this.setState({ txtSearch: text })}
                    onFocus={() => global.gotoSearch()} 
                    onSubmitEditing={this.onSearch.bind(this)}
				/>
			</View>
		);
	}
}

const styles = StyleSheet.create({
    wrapper: { 
        height: height / 8, 
        backgroundColor: '#F7751E', 
        padding: 10, 
        justifyContent: 'space-around' 
    },
    row1: { flexDirection: 'row', justifyContent: 'space-between' },
    textInput: { 
        height: height / 25, 
        backgroundColor: '#FFF', 
        paddingLeft: 10,
        paddingVertical: 0 
    },
    titleStyle: { color: '#FFF', fontFamily: 'Raleway-Bold', fontSize: 20 },
    iconStyle: { width: 25, height: 25 }
});
