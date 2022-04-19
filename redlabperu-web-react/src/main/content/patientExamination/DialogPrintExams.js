import React from "react";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
} from "@material-ui/core";
import { reportPdfResult, getAgreementsListPriceApi } from "../../../api";
import { showMessage, fetch_end, fetch_start } from "store/actions/fuse";
import { bindActionCreators } from "redux";
import connect from "react-redux/es/connect/connect";
import ReactToPrint from "react-to-print";
import TemplateToPrint from "./TemplateToPrint";

class DialogPrintExams extends React.Component {
  state = {
    loaded: false,
  };

  componentDidMount() {
    this.fetchExaminations();
  }

  fetchExaminations = () => {
    const { showMessage, fetch_end, fetch_start, appointment } = this.props;
    fetch_start();
    reportPdfResult(appointment.id)
      .then(
        (response) => {
          if (response.status) {
            getAgreementsListPriceApi(response.data.AgreementId).then(
              (res) => {
                const priceList = res.data[0].examinations;
                const examinationIds = response.data.examinationIds;
                appointment.services = response.data.services;
                appointment.result = response.data.result;
                appointment.responsible = response.data.responsible;
                appointment.specialityName = response.data.specialityName;
                appointment.examinations = priceList.filter((n) =>
                  examinationIds.includes(n.id)
                );
                console.log(appointment, "Sdfwsdfsdfsdf232332");
                this.setState({ loaded: true });
              },
              (err) => {
                console.log(err);
                showMessage({
                  message: "Error de conexión. Recargue por favor.",
                  variant: "error",
                });
              }
            );
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

    return (
      <div>
        <Dialog
          fullWidth
          scroll="paper"
          open={this.props.dialog}
          onClose={this.handleClose}
          aria-labelledby="form-dialog-title"
        >
          <DialogTitle id="form-dialog-title" color="primary">
            Imprimir Cita
          </DialogTitle>
          <DialogContent>
            <div id="printPage">
              {loaded &&
                !isLoadingRequest && (
                  <TemplateToPrint
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

function mapStateToProps({ patientExamsReducer, fuse }) {
  return {
    isLoadingRequest: fuse.request.loading > 0,
  };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(DialogPrintExams);
