var pool;

exports.setConnectionPool = (connectionPool)=> {
    pool = connectionPool;
    
};

exports.list = (pageNo = 1, pageSize =3,handler)=>{
    var startIndex = (pageNo -1 )* pageSize;
    
     pool.query(`select name, sdt, edt, max_qty from pms2_team
             order by name asc limit ?, ?`,
             [startIndex, pageSize],
             function(err,results){
     handler(err,results);             
  });

};

exports.add =(data,handler) => {
   pool.query(
           `INSERT INTO pms2_team( name, dscrt, max_qty, sdt, edt) VALUES (?,?,?,?,?)`,
               [data.name, data.dscrt, data.max, data.sdt, data.edt],
               function(err, result){
                   handler(err,result);
   });    
};