import React, { Component } from 'react';
import { View, TextInput, Text, TouchableOpacity, StyleSheet, Alert } from 'react-native';
import register from '../../api/register';

export default class SignUp extends Component {
    constructor(props) {
        super(props);
        this.state = {
            name: '',
            email: '',
            address: '',
            phone: '',
            password: ''
        };
    }

    
    registerUser() {
        const { name, email, address, phone, password } = this.state;
        register(name, email, address, phone, password)
        .then(res => {
            if (res === 'THANH_CONG') return this.onSuccess();
            this.onFail();
        });
    }

    onSuccess() {
        Alert.alert(
            'Message',
            'Đăng ký thành công!',
            [
                { text: 'OK', onPress: () => this.props.gotoSignIn() }
            ],
            { cancelable: false }
        );
    }

    onFail() {
        Alert.alert(
            'Message',
            'Tài khoản email này đã được sử dụng. Vui lòng nhập lại email',
            [
                { text: 'OK', onPress: () => this.setState({ email: '' }) }
            ],
            { cancelable: false }
        );
    }
   
    render() {
        const { inputStyle, bigButton, buttonText } = styles;
        return (
            <View>
                <TextInput 
                    style={inputStyle} 
                    placeholder="Enter your name" 
                    value={this.state.name}
                    onChangeText={text => this.setState({ name: text })}
                />
                <TextInput 
                    style={inputStyle} 
                    placeholder="Enter your email" 
                    value={this.state.email}
                    onChangeText={text => this.setState({ email: text })}
                />
                <TextInput 
                    style={inputStyle} 
                    placeholder="Enter your address" 
                    value={this.state.address}
                    onChangeText={text => this.setState({ address: text })}
                />
                <TextInput 
                    style={inputStyle} 
                    placeholder="Enter your phone" 
                    value={this.state.phone}
                    onChangeText={text => this.setState({ phone: text })}
                />
                <TextInput 
                    style={inputStyle} 
                    placeholder="Enter your password" 
                    value={this.state.password}
                    secureTextEntry
                    onChangeText={text => this.setState({ password: text })}
                />
                <TouchableOpacity style={bigButton} onPress={this.registerUser.bind(this)}>
                    <Text style={buttonText}>SIGN UP NOW</Text>
                </TouchableOpacity>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    inputStyle: {
        height: 50,
        backgroundColor: '#fff',
        marginBottom: 10,
        borderRadius: 20,
        paddingLeft: 30
    },
    bigButton: {
        height: 50,
        borderRadius: 20,
        borderWidth: 1,
        borderColor: '#fff',
        alignItems: 'center',
        justifyContent: 'center'
    },
    buttonText: {
        fontFamily: 'Avenir',
        color: '#fff',
        fontWeight: '400'
    }
});
