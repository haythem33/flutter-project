const router = require('express').Router()
const { StatusCode } = require('status-code-enum')
const userModel = require('../models/userModels')
const jwt = require("jsonwebtoken");

router.post('/register',async (req, res) => {
    const user = await userModel.findOne({where : {email : req.body.email}}).catch((err) => {
        console.log(err)
    })
    if(user) {
        res.status(StatusCode.ClientErrorForbidden).end()
        return
    }
    await userModel.build({
        userName : req.body.userName,
        email : req.body.email,
        password : req.body.password
    }).save();
    res.status(StatusCode.SuccessCreated).end();
})
router.post('/login',async (req, res) => {
    const user = await userModel.findOne({where : {email : req.body.email,password : req.body.password}}).catch((err) => {
        res.status(StatusCode.ServerErrorInternal).end()
    })
    if(!user) {
        res.status(StatusCode.ClientErrorUnauthorized).end()
        return;
    }
    const token = jwt.sign(user.toJSON(),'secret')
    res.status(StatusCode.SuccessAccepted).send({token : token}).end()
})

module.exports = router