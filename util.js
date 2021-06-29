const conn = require('./mySqlHelp');
module.exports = {
    getAllPlans: function () {
        return new Promise((resolve, reject) => {
            conn.query('SELECT * FROM allActivePlans').then(plans => {
                //process data
                resolve(plans);
            }).catch(err => {
                //process err
                reject(err);
            });
        });
    },
    getAllServices: function () {
        return new Promise((resolve, reject) => {
            conn.query('SELECT * FROM allActiveServices').then(plans => {
                //process data
                resolve(plans);
            }).catch(err => {
                //process err
                reject(err);
            });
        });
    }
}