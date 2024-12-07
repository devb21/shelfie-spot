const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const path = require('path');
const session = require('express-session');
require('dotenv').config();
const authRouter = require('./routes/auth'); // Import the auth router
const db = require('./db'); // Ensure this file correctly initializes your database connection

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Initialize session middleware
app.use(session({
    secret: 'your_secret_key', // Replace with a secure key
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false } // Set to true if using HTTPS
}));

// Set EJS as the view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Serve static files
app.use('/public', express.static(path.join(__dirname, 'public')));

// Use auth routes for authentication (includes login and register)
app.use('/', authRouter);

// Homepage Route
app.get('/', (req, res) => {
    res.render('index', { 
        title: 'Home - Shelfie Spot',
        user: req.session.user // Pass session user data to the template
    });
});

// Redirect 'Account' to the Register Page
app.get('/account', (req, res) => {
    res.redirect('/register');
});

// Render Registration Page
app.get('/register', (req, res) => {
    res.render('register', { 
        title: 'Register - Shelfie Spot', 
        message: null, 
        username: '', 
        firstname: '', 
        lastname: '', 
        email: '' 
    });
});


app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            return res.redirect('/');
        }
        res.redirect('/'); // Redirect to home page after logging out
    });
});


// Use auth routes for registration and login
app.use('/auth', authRouter);




// Start Server
const PORT = 8000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
