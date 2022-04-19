import React from "react";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
} from "@material-ui/core";
import { getAppointmentsResultsApi } from "../../../api";
import { showMessage, fetch_end, fetch_start } from "store/actions/fuse";
import { bindActionCreators } from "redux";
import connect from "react-redux/es/connect/connect";
import ReactToPrint from "react-to-print";
import AppointmentTemplate from "./AppointmentTemplate";
import { mergeExaminations } from "../../../Utils";
import ReactToPdf from "react-to-pdf";

const classes = {
  info_div: {
    float: "right",
    // marginRight: "50px",
  },
};

class DialogPrintAppointment extends React.Component {
  state = {
    loaded: false,
    services: [],
  };

  componentDidMount() {
    this.fetchExaminations();
  }

  fetchExaminations = () => {
    const { showMessage, fetch_end, fetch_start, appointment } = this.props;
    fetch_start();
    getAppointmentsResultsApi(appointment.id)
      .then(
        (response) => {
          console.log(response);
          if (response.status) {
            appointment.services = response.data.services;
            appointment.digitalSignatureUrl = response.data.digitalSignatureUrl;
            appointment.result = response.data.result;
            console.log(response);
            this.setState({ loaded: true, services: response.data.services });
          }
        },
        (err) => {
          console.log(err);
          showMessage({
            message: "Error de conexión. Recargue por favor.",
            variant: "error",
          });
        }
      )
      .finally(fetch_end);
  };

  handleClose = () => {
    this.props.onClose();
  };

  render() {
    const { appointment = {}, isLoadingRequest } = this.props;
    const { loaded } = this.state;
    const exams = mergeExaminations(this.state.services);

    return (
      <div>
        <Dialog
          fullWidth
          scroll="paper"
          maxWidth="sm"
          open={this.props.dialog}
          onClose={this.handleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title" color="primary">
            Imprimir Resultados
          </DialogTitle>
          <DialogContent>
            {/* <div className="print-info" style={{ margin: "25px" }}>
              <div>
                <b>Paciente: </b>
                <span className={classes.info_div}>
                  {appointment.client.name} {appointment.client.lastNameP}{" "}
                  {appointment.client.lastNameM}
                </span>
              </div>
              <div>
                <b>Edad: </b>
                <span className={classes.info_div}>
                  {appointment.client.years}
                </span>
              </div>
              <div>
                <b>Sexo: </b>
                <span className={classes.info_div}>
                  {appointment.client.genderStr}
                </span>
              </div>
              <div>
                <b>Dirección de Sede: </b>
                <span className={classes.info_div}>
                  {appointment.headquarter.address}
                </span>
              </div>
              <div>
                <b> Codigo: </b>
                <span className={classes.info_div}>{appointment.code}</span>
              </div>
              <div>
                <b>Sede: </b>
                <span className={classes.info_div}>
                  {appointment.headquarter.name}
                </span>
              </div>
              <div>
                <b>Fecha: </b>
                <span className={classes.info_div}>
                  {appointment.dateAppointmentEU}
                </span>
              </div>
              <br />

              <hr />
              <div>
                <b>Examenes: </b>
                <div style={{ marginLeft: "100px" }}>
                  {exams.map((exam) => (
                    <div>{exam.name}</div>
                  ))}
                </div>
              </div>
              <hr />
            </div> */}

            <div id="printPage">
              {loaded &&
                !isLoadingRequest && (
                  <AppointmentTemplate
                    appointment={appointment}
                    ref={(el) => (this.componentRef = el)}
                  />
                )}
            </div>
          </DialogContent>
          <DialogActions>
            <Button onClick={this.handleClose} color="primary">
              Cancelar
            </Button>
            <ReactToPrint
              trigger={() => (
                <Button disabled={!loaded} color="primary">
                  Imprimir
                </Button>
              )}
              content={() => this.componentRef}
              onAfterPrint={() => this.handleClose()}
            />
          </DialogActions>
        </Dialog>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      showMessage,
      fetch_end,
      fetch_start,
    },
    dispatch
  );
}

function mapStateToProps({ fuse }) {
  return {
    isLoadingRequest: fuse.request.loading > 0,
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(DialogPrintAppointment);
