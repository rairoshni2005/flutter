const jwt = require('jsonwebtoken');

const authMiddleware = (request, response, next) => {
    try {
        const token = request.headers.token;
        if (!token) {
            return response.status(401).json({ message: 'Access denied: No token provided' });
        }
        const decodedToken = jwt.verify(token, 'itm');

        if (!decodedToken) {
            return response.status(401).json({ message: 'Invalid token' });
        }
        request.user = decodedToken;
        next();

    } catch (error) {
        response.status(500).json({ message: error.message });
    }
};

module.exports = authMiddleware;