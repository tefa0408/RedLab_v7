import React from "react";
import { withStyles } from "@material-ui/core/styles";
import { Grid } from "@material-ui/core";
import { mergeExaminations, renderImage } from "../../../Utils";
//Reporte de resultados
const redlabImage = require("../../assets/images/redlabbg.png");
const redlabLogo = require("../../assets/images/redlabLogo.png");

const styles = (theme) => ({
  info: {
    position: "relative",
    borderRadius: "25px",
    border: "2px solid #b2beb5",
    padding: "1em 4em",
  },
  service: {
    border: "1px solid #000000",
    padding: "5px",
    marginLeft: "2em",
    marginRight: "2em",
    marginBottom: "0.8em",
    textAlign: "center",
  },
  examination: {
    marginLeft: "2em",
    textDecoration: "underline",
  },
  group: {
    marginLeft: "2em",
    paddingTop: "1em",
    textDecoration: "underline",
    fontStyle: "italic",
  },
  spaceLeft: {
    marginLeft: "2em",
  },
  footer: {
    marginTop: "2em",
    marginLeft: "2em",
  },
  td1: {
    fontSize: "10px",
    fontWeight: "bold",
    height: "5px",
    textAlign: "center",
  },
  td2: {
    height: "15px",
    textAlign: "right",
    fontSize: "10px",
  },

  td3: {
    height: "10px",
    textAlign: "center",
    fontSize: "10px",
  },
  a4: {
    backgoundColor: "white",
    position: "relative",
    height: "100vh",
    maxHeight: "100vh",
    width: "95%",
    backgroundImage: `url(${redlabImage})`,
    backgroundRepeat: "no-repeat",
    backgroundPosition: "40% 60%",
    backgroundSize: "90%",
    margin: "auto",
  },

  bottom: {
    display: "none",
    position: "absolute",
    bottom: "44px",
    width: "100%",
    fontWeight: "bolder",
    fontSize: "15px",
  },
  bottom1: {
    position: "absolute",
    bottom: "40px",
    // right: "30px",
    // border: "3px solid #8AC007",
  },
  bottom2: {
    position: "absolute",
    bottom: "40px",
    right: "30px",
    // border: "3px solid #8AC007",
  },
  tdSpan: {
    border: "1px solid black",
    padding: "2px 5px",
  },
  bottomImg: {
    position: "absolute",
    right: "20px",
    bottom: "60px",
  },
  info_div: {
    float: "right",
    // marginRight: "50px",
  },
});

class AppointmentTemplate extends React.Component {
  state = {
    appointment: this.props.appointment,

    loading: true,
  };
  handleClose = () => {
    this.props.onClose();
  };
  
  formatValues = (e) => {

    if(e == 'N/A' || e == 'n/a'){
      return ' ';
    }

    return e;

  };

  render() {
    const { classes } = this.props;
    const { appointment = {} } = this.state;
    console.log(appointment.digitalSignatureUrl);
    const exams = mergeExaminations(appointment.services);
    return (
      <div id="print">
        {appointment.services.map((serv, serviceIndex) => (
          <div className={classes.a4}>
            <div
              className="doc"
              // style={{ display: "none" }}
            >
              <Grid container justify="space-around">
                <Grid item xs={6} />
                <Grid item xs={6}>
                  <img
                    src={redlabLogo}
                    height="100"
                    style={{ float: "right" }}
                  />
                </Grid>
              </Grid>
              <Grid
                container
                className={classes.info}
                style={{ width: "100%", marginTop: "10px" }}
                justify="center"
              >
                <Grid item xs={6} justify="center">
                  <div>
                    <div>
                      <b>Paciente: </b>
                      {appointment.client.name} {appointment.client.lastNameP}{" "}
                      {appointment.client.lastNameM}
                    </div>
                    <div>
                      <b>Edad: </b>
                      {appointment.client.years}
                    </div>
                    
                    <div>
                      <b>DNI: </b>
                      {appointment.client.dni}
                    </div>

                    <div>
                      <b>Sexo: </b>
                      {appointment.client.gender}
                    </div>
                  </div>
                </Grid>
                <Grid item xs={6} justify="right">
                  <div
                    style={{
                      float: "right",
                    }}
                  >
                    <div>
                      <b> Codigo: </b>
                      {appointment.code}
                    </div>

                    {/*<div>
                      <b> Cod_refe: </b>
                      {}
                  </div>*/}
                    <div>
                      <b>Fecha: </b>
                      {appointment.dateAppointmentEU}
                    </div>
                    <div>
                      <b>Pagina: </b>
                      {serviceIndex + 1} de {appointment.services.length}
                    </div>

                    <div>
                      <b>Sede: </b>
                      {appointment.headquarter.name}
                    </div>
                    
                  </div>
                </Grid>
              </Grid>

              <Grid
                container
                justify="center"
                style={{
                  marginBottom: "40px",
                }}
              >
                <table
                  key={serviceIndex}
                  style={{
                    width: "100%",
                    marginTop: "10px",
                    marginBottom: "220px",
                    // position: "absolute",
                    // bottom: "50px",
                    zIndex: 10,
                    maxHeight: "50%",
                  }}
                >
                  <thead>
                    <td
                      colSpan="5"
                      style={{
                        textAlign: "center",
                        fontWeight: "bold",
                        border: "1px solid #b2beb5",
                      }}
                    >
                      {serv.name}
                    </td>
                    <td />
                    <td />
                    <td />
                  </thead>
                  <tbody className={classes.asd}>
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td />
                      <td className={classes.td1}>
                        <span className={classes.tdSpan}>RESULTADOS</span>
                      </td>
                      <td className={classes.td1}>
                        <span className={classes.tdSpan}>UNIDADES</span>
                      </td>
                      <td className={classes.td1}>
                        <span className={classes.tdSpan}>
                          RANGOS_REFERENCIALES
                        </span>
                      </td>
                      <td className={classes.td1}>
                        <span className={classes.tdSpan}>METODOLOGIA</span>
                      </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>

                    {serv.result.map(({ examGroup, dataRows }, i) => (
                      <>
                        <tr>
                          <td
                            className={classes.td2}
                            style={{
                              textDecoration: "underline",
                              fontStyle: "italic",
                              fontFamily: "sans-serif",
                              fontWeight: "600",
                            }}
                          >
                            {examGroup.toUpperCase() === "RESULTADO"
                              ? ""
                              : examGroup}
                          </td>
                          <td />
                          <td />
                          <td />
                        </tr>
                        {dataRows.map((data, j) => (
                          <tr key={j}>
                            <td className={classes.td2}>{data.examValue} :</td>
                            <td className={classes.td3}>
                              <b>{data.result}</b>
                            </td>
                            <td className={classes.td3}>{this.formatValues(data.unit)}</td>
                            <td className={classes.td3} style={{fontSize: "7px"}}>
                              {data.refValue.split(/\r?\n/g).map((val) => (
                                <>
                                  {val}
                                  <br />
                                </>
                              ))}
                            </td>
                            <td className={classes.td3}>{this.formatValues(data.method)}</td>
                          </tr>
                        ))}

                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                      </>
                    ))}
                  </tbody>
                </table>
              </Grid>
              <div
                style={{
                  display: "none",
                  position: "absolute",
                  width: "100%",
                  fontWeight: "bolder",
                }}
                className="display-info"
              >
                {serviceIndex + 1 === appointment.services.length && (
                  <div
                    style={{
                      fontWeight: "bold",
                      position: "absolute",
                      bottom: "80px",
                      paddingRight: "50px",
                      paddingLeft: "30px",
                    }}
                  >
                    Observaciones: {appointment.result}
                  </div>
                )}
               
                {<div className={classes.bottomImg}>
                  <img
                    src={renderImage(appointment.digitalSignatureUrl)}
                    height="70"
                  />
                </div>}

                <div
                  style={{
                    display: "flex",
                    flexDirection: "row",
                    justifyContent: "space-between",
                    paddingRight: "30px",
                    paddingLeft: "30px",
                  }}
                >
                  <div>
                    {appointment.headquarter.name + ": " + appointment.headquarter.address} 
                  </div>
                  <div>EMAIL: {appointment.headquarter.email}</div>
                </div>
                <div
                  style={{
                    display: "flex",
                    flexDirection: "row",
                    justifyContent: "space-between",
                    paddingRight: "30px",
                    paddingLeft: "30px",
                  }}
                >
                  <div>Tel.: {appointment.headquarter.tlfNumber}</div>
                  <div>www.redlabperu.com</div>
                </div>
              </div>
            </div>
          </div>
        ))}
      </div>
    );
  }
}

export default withStyles(styles)(AppointmentTemplate);
