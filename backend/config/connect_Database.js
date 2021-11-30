const { Sequelize } = require("sequelize")
const sequelize = new Sequelize('kbr','haythem','haythembenjbara', {
    dialect: 'sqlite',
    storage: '../database/kbrDatabase.sqlite'
});
module.exports = {
    database : sequelize,
    connect : async () => {
        try {
            await sequelize.authenticate()
            console.log("Success Connection with dataBase")
            return true;
        } catch (e) {
            console.log(e)
            return false;
        }
    },
    close : () => sequelize.close()
}