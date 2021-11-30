const { DataTypes} = require('sequelize')
const config = require('./../config/connect_Database')

const User = config.database.define('User', {
    userName : {
        type : DataTypes.STRING,
        allowNull : false
    },
    email : {
        type : DataTypes.STRING,
        allowNull : false
    },
    password : {
        type : DataTypes.STRING,
        allowNull : false
    }
},{
    freezeTableName: true
})
module.exports = User;