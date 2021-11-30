const express = require('express');
const cors = require('cors');
const config = require('./config/connect_Database');
const authRouter = require('./auth/auth');
const app = express();
app.use(cors())
app.use(express.json())
app.use('/auth',authRouter)
app.listen(3000, async () => {
    await config.connect()
    await config.database.sync()
    console.log("Server listening at 3000")
})