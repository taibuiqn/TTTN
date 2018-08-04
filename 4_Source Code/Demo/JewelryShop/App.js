import React, { Component } from 'react';
import {
  Text, View
} from 'react-native';
import NavigationExperimental from 'react-native-deprecated-custom-components';
import Authentication from './src/components/Authentication/Authentication';
import Main from './src/components/Main/Main';
import ChangeInfo from './src/components/ChangeInfo';
import OrderHistory from './src/components/OrderHistory';
import refreshToken from './src/api/refreshToken';

export default class App extends Component {
  componentDidMount() {
        setInterval(refreshToken, 30000);
  }
  render() {
    return (
    	
      <NavigationExperimental.Navigator 
      	initialRoute={{ name: 'MAIN' }}
      	renderScene={(route, navigator) => {
      		switch(route.name) {
      			case 'MAIN': return <Main navigator={navigator} />;
      			case 'CHANGE_INFO': return <ChangeInfo navigator={navigator} user={route.user}/>;
      			case 'AUTHENTICATION': return <Authentication navigator={navigator} />;
      			default: return <OrderHistory navigator={navigator} />;
      		} 
      	}}
      	configureScene={route => {
      		if(route.name == 'AUTHENTICATION') return NavigationExperimental.Navigator.SceneConfigs.FloatFromRight;
      		return NavigationExperimental.Navigator.SceneConfigs.FloatFromLeft;
      	}}
      />
    );
  }
}
