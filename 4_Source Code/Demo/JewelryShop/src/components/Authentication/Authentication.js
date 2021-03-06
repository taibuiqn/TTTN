import React, { Component } from 'react';
import {
  Text, View, TouchableOpacity, Image, StyleSheet,
} from 'react-native';

import icBack from '../../images/appIcon/back_white.png';
import SignIn from './SignIn';
import SignUp from './SignUp';
export default class Authentication extends Component{
  constructor(props) {
        super(props);
        this.state = { isSignIn: true };
  }

  gotoSignIn(){
    this.setState({ isSignIn: true });
  }

  signIn() {
        this.setState({ isSignIn: true });
  }

  signUp() {
        this.setState({ isSignIn: false });
  }
	goBackToMain(){
  		const {navigator} = this.props;
  		navigator.pop();
  }

  render() {
    const {
            row1, iconStyle, titleStyle,
            container, controlStyle,
            signInStyle, signUpStyle,
            activeStyle, inactiveStyle,
            inputStyle, bigButton, buttonText
        } = styles;
    const { isSignIn } = this.state;
    const checkSignInJSX = isSignIn ? <SignIn goBackToMain={this.goBackToMain.bind(this)} /> : <SignUp gotoSignIn={ this.gotoSignIn.bind(this)} />;
    return (
      <View style={container}>
        <View style={row1}>
          <TouchableOpacity onPress={this.goBackToMain.bind(this)}>
            <Image source={icBack} style={iconStyle} />
          </TouchableOpacity>
            <Text style={titleStyle}>Wellcome to Jewelry Shop</Text>
        </View>
        {checkSignInJSX}
        <View style={controlStyle}>
          <TouchableOpacity style={signInStyle} onPress={this.signIn.bind(this)}>
              <Text style={isSignIn ? activeStyle : inactiveStyle}>SIGN IN</Text>
            </TouchableOpacity>
            <TouchableOpacity style={signUpStyle} onPress={this.signUp.bind(this)}>
              <Text style={!isSignIn ? activeStyle : inactiveStyle}>SIGN UP</Text>
            </TouchableOpacity>
        </View>
      </View>
    );
  }
}


const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#FFE793',
        padding: 20,
        justifyContent: 'space-between'
    },
    row1: { flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center' },
    titleStyle: { color: '#FFF', fontFamily: 'Avenir', fontSize: 25 },
    iconStyle: { width: 30, height: 30 },
    controlStyle: {
        flexDirection: 'row',
        alignSelf: 'stretch'
    },
    inactiveStyle: {
        color: '#D7D7D7',
    },
    activeStyle: {
        color: '#3EBA77',
    },
    signInStyle: {
        backgroundColor: '#fff',
        alignItems: 'center',
        paddingVertical: 15,
        flex: 1,
        borderBottomLeftRadius: 20,
        borderTopLeftRadius: 20,
        marginRight: 1
    },
    signUpStyle: {
        backgroundColor: '#fff',
        paddingVertical: 15,
        alignItems: 'center',
        flex: 1,
        marginLeft: 1,
        borderBottomRightRadius: 20,
        borderTopRightRadius: 20
    }   
});

