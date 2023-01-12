var secure = require('./darrt/lib/api-auth.js');
app.use(secure.jwtCheck);