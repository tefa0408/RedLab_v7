module.exports = {
  port: process.env.PORT || 5000,
  db: process.env.DB || "dcr9b841s6g3dp",
  url: process.env.URL || "https://redlab-peru.herokuapp.com/",
  urlFront: process.env.URL_FRONT || "localhost",
  portFront: process.env.PORT_FRONT || 3000,
  secret_key: process.env.SECRET_KEY || "712386210123",
  pathRootStaticFiles: process.env.PATH_ROOT_STATIC_FILES || "public",
};

