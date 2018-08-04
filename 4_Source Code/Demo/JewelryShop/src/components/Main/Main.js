import React, { Component } from 'react';
import {
  Text, View, TouchableOpacity
} from 'react-native';
import Drawer from 'react-native-drawer';

import Menu from './Menu';
import Shop from './Shop/Shop';
import checkLogin from '../../api/checkLogin';
import getToken from '../../api/getToken';
import global from '../global';

export default class Main extends Component{
  componentDidMount() {
        getToken()
        .then(token => checkLogin(token))
        .then(res => global.onSignIn(res.user))
        .catch(err => console.log('LOI CHECK LOGIN', err));
  }

  goToAuthentication(){
  		const {navigator} = this.props;
  		navigator.push({ name: 'AUTHENTICATION'});
  }
  goToOrderHistory(){
  		const {navigator} = this.props;
  		navigator.push({ name: 'ORDER_HISTORY'});
  }
  goToChangeInfo(){
  		const {navigator} = this.props;
  		navigator.push({ name: 'CHANGE_INFO'});
  }
  closeControlPanel = () => {
    this.drawer.close();
  }
  openControlPanel = () => {
    this.drawer.open();
  }
  render() {
    const {navigator} = this.props;
    return (
      <Drawer
        ref={(ref) => { this.drawer = ref; }}
        content={<Menu navigator={navigator} />}
        tapToClose={true}
        openDrawerOffset={0.4}
      >
        <Shop open={this.openControlPanel.bind(this)} />
      </Drawer>
      
    );
  }
}