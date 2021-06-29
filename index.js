var util = require("./util"),
    Koa = require('koa'),
    webSite = new Koa();

webSite.use(async (ctx) => {
    if (ctx.path === '/backend/getAllPlans') {
        let queryParams = parseQueryStr(ctx.search.substr(1)),
            data = {
                plans: await util.getAllPlans(),
                services: await util.getAllServices()
            }
        ctx.body = `${queryParams.callback}(${JSON.stringify(data)})`;
    } else {
        ctx.body = 'node';
    }
});
function parseQueryStr(queryStr) {
    let queryData = {};
    let queryList = queryStr.split('&');
    for (let [index, queryStr] of queryList.entries()) {
        let itemArr = queryStr.split("=");
        queryData[itemArr[0]] = decodeURIComponent(itemArr[1]);
    }
    return queryData;
}
webSite.listen(3721, err => {
    if (err) throw err;
    console.log('runing...');
});