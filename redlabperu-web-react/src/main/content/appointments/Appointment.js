/*---------------------------------------
-----------------------------------------
Nuevas Citas 
------------------------------------------
*/ 

import React, { Component, useState,useEffect} from "react";
import {
  Button,
  Tab,
  Tabs,
  TextField,
  Icon,
  Typography,
  MenuItem,
  IconButton,
  InputAdornment,
  Grid,
} from "@material-ui/core";
import MuiThemeProvider from "material-ui/styles/MuiThemeProvider";
import { FuseAnimate, FusePageCarded } from "@fuse";
import { Link, withRouter } from "react-router-dom";
import { bindActionCreators } from "redux";
import connect from "react-redux/es/connect/connect";
import * as Actions from "./store/actions";
import _ from "@lodash";
import NumberFormat from "react-number-format";
import withReducer from "store/withReducer";
import reducer from "./store/reducers";
import { showMessage, fetch_end, fetch_start } from "store/actions/fuse";
import { hasEmptyField, mergeExaminations } from "Utils";
import {
  addRefererApi,
  addDoctorApi,
  getRefererApi,
  getDoctorApi,
  getAgreementsAllApi,
  getPatienByDOCApi,
  getPatientByNameApi,
  getAppointmentsResultsApi,
  getHeadquartersAllApi,
  getAgreementsListPriceApi,
  addAppointmentApi,
} from "../../../api";
import DialogConfirm from "../global/DialogConfirm";
import DialogAddExaminations from "./DialogAddExaminations";
import DialogPatients from "./DialogPatients";
import DataTables from "material-ui-datatables";
import DialogCreateMaster from "../global/DialogCreateMaster";

const patientInitialState = {
  person: {
    code: "",
    dni: "",
    name: "",
    lastNameP: "",
  },
};

function NumberFormatCustom(props) {
  const { inputRef, onChange, ...other } = props;

  return (
    <NumberFormat
      {...other}
      name="totalPrice"
      getInputRef={inputRef}
      onValueChange={(values) => {
        onChange({
          target: {
            value: values.floatValue,
            name: "totalPrice",
          },
        });
      }}
      thousandSeparator="."
      decimalSeparator=","
      prefix="S/. "
    />
  );
}



const fieldsNewReferer = [
  {
    name: "refererName",
    label: "Nombre del referente",
  },
];

const fieldsNewDoctor = [
  {
    name: "doctorName",
    label: "Nombre del Médico",
  },
];


//valueCriteria =
class Appointment extends Component {
  state = {
    tabValue: 0,
    form: null,
    open: false,
    openAlert: false,
    dialog: false,
    openPatientsDialog: false,
    showPatientsButton: false,
    showPatientSearchBox: true,
    openRefererDialog: false,
    openDoctorDialog: false,
    patientSearch: true,
    disabledSelects: true,
    totalPrice: "",
    discount: 0,
    finalPrice: "",
    doctorName: "",
    patientDoc: "",
    patientCriteria: "dni",
    refererName: "",
    patient: patientInitialState,
    referer: [],
    doctor: [],
    agreements: [],
    exams: [],
    selectedExams: [],
    priceListExams: [],
    headquarters: [],
    priceLists: [],
  };
  
  

  componentDidMount() {
    const params = this.props.match.params;
    const { appointmentId, appointmentHandle } = params;

    if (appointmentId === "new" && appointmentHandle !== "continue") {
      this.props.newAppointment();
    } else if (appointmentHandle === "continue") {
      this.setState({ form: this.props.appointment });

      if (this.props.appointment.PriceListId !== "") {
        this.fetchPriceLists(this.props.appointment.AgreementId);
      }
    } else {
      this.props.getAppointment(appointmentId);
      this.setState({ patientSearch: false });
      this.fetchExaminations(appointmentId);
    }

    this.fetchAgreements();
    this.fetchHeadquarters();
    this.fetchReferer();
    this.fetchDoctor();
  }

  componentDidUpdate(prevProps, prevState, snapshot) {
    const { appointment, match } = this.props;
    if (appointment && !this.state.form && !this.props.isLoadingRequest) {
      this.setState({ form: appointment });

      if (match.params.appointmentId !== "new") {
        this.setState({ patient: { person: appointment.client } });
        this.setState({ totalPrice: appointment.totalPrice });
        this.fetchPriceLists(appointment.AgreementId);
      }
    }
  }

  fetchAgreements = () => {
    const { showMessage, fetch_end, fetch_start } = this.props;
    fetch_start();
    getAgreementsAllApi()
      .then(
        (response) => {
          if (response.status) this.setState({ agreements: response.data });
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

  fetchReferer = () => {
    const { showMessage, fetch_end, fetch_start } = this.props;
    fetch_start();
    getRefererApi()
      .then(
        (response) => {
          if (response.status) this.setState({ referer: response.data });
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

  fetchDoctor =  () => {
    const { showMessage, fetch_end, fetch_start } = this.props;
    fetch_start();
    getDoctorApi()
      .then(
        (response) => {
          if (response.status) this.setState({ doctor: response.data });
          console.log(response)
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

  fetchExaminations = (appointmentId) => {
    const { showMessage, fetch_end, fetch_start } = this.props;
    fetch_start();
    getAppointmentsResultsApi(appointmentId)
      .then(
        (response) => {
          if (response.status) {
            this.setState({
              selectedExams: mergeExaminations(response.data.services),
            });
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

  fetchHeadquarters = () => {
    const { showMessage, fetch_end, fetch_start } = this.props;
    fetch_start();
    getHeadquartersAllApi()
      .then(
        (response) => {
          if (response.status) {
            this.setState({ headquarters: response.data });
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

  fetchPriceLists = (agreementId) => {
    const { showMessage, fetch_end, fetch_start } = this.props;
    fetch_start();
    getAgreementsListPriceApi(agreementId)
      .then(
        (response) => {
          if (response.status) {
            this.setState({ priceLists: response.data });
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

  openDialog = () => {
    this.setState({ dialog: true });
  };

  closeDialog = () => {
    this.setState({ dialog: false });
  };

  openPatientsDialog = () => {
    this.setState({openPatientsDialog: true});
  };

  closePatientsDialog = () => {
    this.setState({ openPatientsDialog: false});
  };

  openDialogDoctor = () => {
    this.setState({openDoctorDialog: true});
  };

  closeDialogDoctor = (response) => {
    this.setState({ openDoctorDialog: false});
    if (response)
      //Si se añade una nueva referencia, se actualiza la lista de doctors.
      this.fetchDoctor();
  };

  openDialogReferer = () => {
    this.setState({ openRefererDialog: true});
  };

  closeDialogReferer = (response) => {
    this.setState({ openRefererDialog: false});

    this.setState({ dialogReferenceValue: false });
    if (response)
      //Si se añade una nueva referencia, se actualiza la lista de referers.
      this.fetchReferer();
  };

  handleChangeTab = (event, tabValue) => {
    this.setState({ tabValue });
    if (tabValue === 1) this.getExamsFromPriceList();
  };

  handleChangeAgreement = (event) => {
    let formCopy = { ...this.state.form };
    formCopy.AgreementId = event.target.value;
    formCopy.PriceListId = "";
    this.setState({ form: formCopy, priceLists: [] });
    this.fetchPriceLists(event.target.value);
  };

  /*handleChangeReferer = (event) => {

    this.setState({ appointmentReferer: event.target.value});
  };*/

  handleChange = (event) => {
    this.setState({
      form: _.set(
        { ...this.state.form },
        event.target.name,
        event.target.type === "checkbox"
          ? event.target.checked
          : event.target.value
      ),
    });
  };

  handleChangeGeneral = (event) => {
    this.setState({ [event.target.name]: event.target.value });
    if(event.target.name == "patientCriteria" && event.target.value == "name"){
      this.setState({showPatientSearchBox: false});
      this.setState({ showPatientsButton: true});
      this.setState({ openPatientsDialog: true});
    }else if(event.target.name == "patientCriteria" && event.target.value != "name"){
      this.setState({ showPatientsButton: false});
      this.setState({showPatientSearchBox: true});
    }
    //console.log(event.target.value);
  };


  updateFinalPrice = (event) => {
    
    this.state.totalPrice = event.target.value;

    
    if(this.state.discount === 0){
      let newFinalPrice = event.target.value;
      this.setState({finalPrice: newFinalPrice});
    }else{
      let newFinalPrice = event.target.value - this.state.discount;
      this.setState({finalPrice: newFinalPrice});
    }
    
  };


  makeDiscount = (event) => {

    if(event.target.value < 0){
      event.target.value = 0;
    }

    if(event.target.value > this.state.totalPrice){
        event.target.value = this.state.totalPrice;
    }

    let newFinalPrice = this.state.totalPrice - event.target.value;
    // console.log(newFinalPrice);
    this.state.discount = event.target.value;
    this.setState({finalPrice: newFinalPrice});
  };
  handleAlertResponse = (response) => {
    this.setState({ openAlert: false });

    if (response) {
      this.props.currentAppointment(this.state.form);
      this.props.history.push("/apps/patients/new/continue");
    }
  };

  handleAddExaminations = (exam) => {
    const { selectedExams } = this.state;
    const updateArray = selectedExams;
    console.log(exam.price);
    updateArray.push(exam);

    this.setState({ selectedExams: updateArray }, () =>
      this.updateTotalPrice()
    );
  };

  handleAddPatientByName = (newPatient) => {
    const { patient } = this.state;
    const updatePatient = newPatient;
    

    this.setState({ patient: updatePatient});
  };

  handleClickSearch = () => {
    const { showMessage, fetch_start, fetch_end } = this.props;
    const { patientCriteria, patientDoc } = this.state;
    if (!patientCriteria || !patientDoc)
      return showMessage({
        message: "Search information not complete.",
        variant: "error",
      });

      if(patientCriteria == "name") {

          this.setState({ openPatientsDialog: true});
      }else{
        
        
        fetch_start();
        getPatienByDOCApi(patientCriteria, patientDoc)
          .then(
            (response) => {
              if (response.status) {
                showMessage({ message: "Paciente encontrado", variant: "success" });
                this.setState({ patient: response.data });
                this.setState({ disabledSelects: false });
              } else {
                this.setState({ openAlert: true });
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
      }

  };

  handleKeyPress = (event) => {
    if (event.key === "Enter" && this.state.patientSearch)
      this.handleClickSearch();
  };

  removeExaminations = (exam) => {
    const { selectedExams } = this.state;
    let index = selectedExams.indexOf(exam);
    if (index > -1) {
      selectedExams.splice(index, 1);
      this.setState({ selectedExams: selectedExams }, () =>
        this.updateTotalPrice()
      );
    }
  };

  updateTotalPrice = () => {
    const { selectedExams, priceListExams } = this.state;
    const { showMessage } = this.props;
    let total = 0;

    for (let exam of selectedExams) {
      const ex = priceListExams.find((x) => {
        return x.id === exam.id;
      });
      if (ex) {
        if(exam.price <= 0){
          showMessage({
            message: "El examen no tiene un valor agregado, no se añadirá.",
            variant: "error",
          });
          return;
        }
        exam.price = ex.price;
        total += ex.price;
      } else {
        showMessage({
          message: "El examen que se está intentando añadir no tiene un valor agregado. No se añadirá.",
          variant: "error",
        });

        let index = selectedExams.indexOf(exam);
        selectedExams.splice(index, 1);
      }
    }

    this.setState({ totalPrice: total });
    this.setState({finalPrice: total});
  };

  getExamsFromPriceList = () => {
    const { form, priceLists } = this.state;
    const priceList = priceLists.find((pl) => {
      return pl.id === form.PriceListId;
    });
    if (priceList)
      this.setState({ priceListExams: priceList.examinations }, () =>
        this.updateTotalPrice()
      );
  };

  canBeSubmitted() {
    const { patient, selectedExams, totalPrice, form } = this.state;
    const { isLoadingRequest, match } = this.props;

    return (
      !isLoadingRequest &&
      match.params &&
      match.params.appointmentHandle !== "show" &&
      patient &&
      patient.person &&
      patient.person.id > 0 &&
      selectedExams.length > 0 &&
      totalPrice >= 0 &&
      !hasEmptyField(form)
    );
  }

  getExaminationIds = (examinations = []) => {
    let ids = [];
    for (let exam of examinations) {
      ids.push(exam.id);
    }
    return ids;
  };

  handePriceChanging = event => console.log(event.target.value);

  submit = () => {
    const { form, patient, totalPrice, discount, finalPrice, selectedExams } = this.state;
  
    const params = this.props.match.params;
    const { appointmentId } = params;
    const examinations_ids = this.getExaminationIds(selectedExams);
    const data = {
      ClientId: patient.person.id,
      PriceListId: form.PriceListId,
      HeadquarterId: form.HeadquarterId,
      dateAppointment: form.dateAppointment,
      time: form.time,
      RefererId: form.RefererId,
      DoctorId: form.DoctorId,
      refererCode: form.refererCode,
      examinations: examinations_ids,
      totalPrice,
      discount,
      finalPrice,
      
    };

    if (appointmentId === "new") {
      this.props.saveAppointment(data);
    } else {
      delete data.ClientId;
      this.props.editAppointment(data, appointmentId);
    }
  };

  renderTableSelected = () => {
    const TABLE_COLUMNS = [
      {
        key: "code",
        label: "Codigo",
      },
      {
        key: "name",
        label: "Nombre",
      },
      {
        key: "price",
        label: "Precio",
      },
      {
        key: "options",
        label: "opciones",
        render: (row, rows) => (
          <Button
            color="primary"
            onClick={() => this.removeExaminations(rows)}
            disabled={this.props.match.params.appointmentHandle === "show"}
          >
            eliminar
          </Button>
        ),
      },
    ];

    return (
      <MuiThemeProvider>
        <DataTables
          height={"auto"}
          selectable={false}
          showRowHover={true}
          columns={TABLE_COLUMNS}
          data={this.state.selectedExams}
          showCheckboxes={false}
          showFooterToolbar={false}
        />
      </MuiThemeProvider>
    );
  };

  

  render() {
    const {
      form,
      tabValue,
      disabled,
      patientDoc,
      agreements,
      referer,
      headquarters,
      patient,
      totalPrice,
      discount,
      finalPrice,
      doctor,
      priceLists,
    } = this.state;
    const params = this.props.match.params;
    console.log(referer)
    console.log(doctor)

    return (
      <div style={{ width: "100%" }}>
        <FusePageCarded
          classes={{
            toolbar: "p-0",
            header: "min-h-72 h-72 sm:h-136 sm:min-h-136",
          }}
          header={
            form && (
              <div className="flex flex-1 w-full items-center justify-between">
                <div className="flex flex-col items-start max-w-full">
                  <FuseAnimate animation="transition.slideRightIn" delay={300}>
                    <Typography
                      className="normal-case flex items-center sm:mb-12"
                      component={Link}
                      role="button"
                      to="/apps/appointments"
                    >
                      <Icon className="mr-4 text-20">arrow_back</Icon>
                      Citas
                    </Typography>
                  </FuseAnimate>

                  <div className="flex items-center max-w-full">
                    <div className="flex flex-col min-w-0">
                      <FuseAnimate
                        animation="transition.slideLeftIn"
                        delay={300}
                      >
                        <Typography className="text-16 sm:text-20 truncate">
                          {params.appointmentId === "new"
                            ? "Asignar Cita"
                            : "Editar Cita"}
                        </Typography>
                      </FuseAnimate>
                      <FuseAnimate
                        animation="transition.slideLeftIn"
                        delay={300}
                      >
                        <Typography variant="caption">
                          Detalle de la cita
                        </Typography>
                      </FuseAnimate>
                    </div>
                  </div>
                </div>
                {form.typeView !== "show" && (
                  <FuseAnimate animation="transition.slideRightIn" delay={300}>
                    <Button
                      className="whitespace-no-wrap"
                      variant="contained"
                      disabled={!this.canBeSubmitted()}
                      onClick={this.submit}
                    >
                      Guardar
                    </Button>
                  </FuseAnimate>
                )}
              </div>
            )
          }
          contentToolbar={
            <Tabs
              value={tabValue}
              onChange={this.handleChangeTab}
              indicatorColor="primary"
              textColor="primary"
              //scrollable
              //scrollButtons="auto"
              centered
              variant="fullWidth"
              classes={{ root: "w-full h-64" }}
            >
              <Tab className="h-64 normal-case" label="Datos de la Cita" />
              <Tab className="h-64 normal-case" label="Exámenes" />
              <Tab className="h-64 normal-case" label="Fecha y hora" />
            </Tabs>
          }
          content={
            form && (
              <div className="p-16 sm:p-24">
                {tabValue === 0 && (
                  <div>
                    <div style={{ display: "flex", justifyContent: "left" }}>
                      <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 ml-8"
                        select
                        name="patientCriteria"
                        value={this.state.patientCriteria}
                        required
                        onChange={this.handleChangeGeneral}
                        variant="outlined"
                        disabled={!this.state.patientSearch}
                      >
                        <MenuItem value={"dni"}>DNI</MenuItem>
                        <MenuItem value={"passport"}>Pasaporte</MenuItem>
                        <MenuItem value={"name"}>Nombre y apellido</MenuItem>

                      </TextField>

                      {this.state.showPatientsButton && (
                        <Button
                          onClick={this.openPatientsDialog}
                          className="mt-8 mb-16 ml-8"
                          color="primary"
                          variant="contained"
                        >
                        Buscar paciente por nombre
                        </Button>
                      )}

                      {this.state.showPatientSearchBox && (
                        <TextField
                          className="mt-8 mb-16 mr-8 ml-8"
                          required
                          disabled={!this.state.patientSearch}
                          label="Buscar paciente"
                          name="patientDoc"
                          value={patientDoc}
                          onChange={this.handleChangeGeneral}
                          id="name"
                          variant="outlined"
                          autoComplete="off"
                          onKeyPress={this.handleKeyPress}
                          InputProps={{
                            endAdornment: (
                              <InputAdornment position="end">
                                <IconButton
                                  aria-label="Toggle password visibility"
                                  disabled={!this.state.patientSearch}
                                  onClick={this.handleClickSearch}
                                >
                                  <Icon className="mr-4 text-20">search</Icon>
                                </IconButton>
                              </InputAdornment>
                            ),
                          }}
                        />
                      )}

                    </div>

                    <div style={{ display: "flex", justifyContent: "center" }}>
                      <TextField
                        className="mt-8 mb-16 mr-8 ml-8"
                        label="Nombre"
                        value={patient.person.name}
                        id="ClientId"
                        variant="outlined"
                        InputProps={{
                          readOnly: true,
                        }}
                        fullWidth
                      />
                      <TextField
                        className="mt-8 mb-16 mr-8 ml-8"
                        label="Apellido paterno"
                        value={patient.person.lastNameP}
                        id="ClientDNI"
                        variant="outlined"
                        margin="normal"
                        InputProps={{
                          readOnly: true,
                        }}
                        fullWidth
                      />
                      <TextField
                        className="mt-8 mb-16 mr-8 ml-8"
                        label="Apellido materno"
                        value={patient.person.lastNameM || ''}
                        id="ClientName"
                        variant="outlined"
                        margin="normal"
                        InputProps={{
                          readOnly: true,
                        }}
                        fullWidth
                      />
                    </div>

                    <div style={{ display: "flex", justifyContent: "center" }}>
                      <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        select
                        label="Sede"
                        name="HeadquarterId"
                        value={form.HeadquarterId}
                        error={form.HeadquarterId === ""}
                        required
                        onChange={this.handleChange}
                        helperText="Por favor seleccione uno"
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                        InputProps={{
                          readOnly: params.appointmentHandle === "show",
                        }}
                      >
                        {headquarters.map((option) => (
                          <MenuItem key={option.id} value={option.id}>
                            {option.name}
                          </MenuItem>
                        ))}
                      </TextField>

                      <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        select
                        label="Convenio"
                        name="AgreementId"
                        value={form.AgreementId}
                        error={form.AgreementId === ""}
                        required
                        onChange={this.handleChangeAgreement}
                        helperText="Por favor seleccione uno"
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                        InputProps={{
                          readOnly: params.appointmentHandle === "show",
                        }}
                      >
                        <MenuItem value="">
                          <Button
                            color="primary"
                            onClick={() =>
                              this.props.history.push("/apps/agreements/new")
                            }
                            fullWidth
                            variant="contained"
                          >
                            Nuevo convenio
                          </Button>
                        </MenuItem>
                        {agreements.map((option) => (
                          <MenuItem key={option.id} value={option.id}>
                            {option.name}
                          </MenuItem>
                        ))}
                      </TextField>

                      <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        select
                        label="Lista de precios"
                        name="PriceListId"
                        value={form.PriceListId}
                        error={form.PriceListId === ""}
                        required
                        onChange={this.handleChange}
                        helperText="Por favor seleccione uno"
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                        InputProps={{
                          readOnly: params.appointmentHandle === "show",
                        }}
                      >
                        {priceLists.map((option) => (
                          <MenuItem key={option.id} value={option.id}>
                            {option.name}
                          </MenuItem>
                        ))}
                      </TextField>

                      <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        select
                        label="Referencia"
                        name="RefererId"
                        value={form.RefererId || ''}
                        error={form.RefererId === ""}
                        required
                        onChange={this.handleChange}
                        helperText="Por favor seleccione uno"
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                        InputProps={{
                          readOnly: params.appointmentHandle === "show",
                        }}
                      >
                        <MenuItem value="">
                          <Button
                            color="primary"
                            onClick={() =>
                              this.openDialogReferer()
                            }
                            fullWidth
                            variant="contained"
                          >
                            Nueva referencia
                          </Button>
                        </MenuItem>
                        {referer.map((option) => (
                          <MenuItem key={option.id} value={option.id}>
                            {option.refererName}
                          </MenuItem>
                        ))}
                      </TextField>
                      <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        label="Código referencia"
                        name="refererCode"
                        value={form.refererCode}
                        error={form.refererCode === ""}
                        required
                        onChange={this.handleChange}
                        helperText="Por favor escriba un código"
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                      />
                    </div>
                        {/*{@RSV01 add doctor and observations of doctor, you
                          have to change this part */}
                    <div style={{ display: "flex", justifyContent: "center" }}>
                    <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        label="Observaciones del referente"
                        name="refererCode"
                        value={form.refererCode}
                        error={form.refererCode === ""}
                        
                        onChange={this.handleChange}
                        helperText="Por favor escriba una obs."
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                      />                       
                    <TextField
                        id="standard-select-currency"
                        className="mt-8 mb-16 mr-8 ml-8"
                        select
                        label="Médico que indica"
                        name="DoctorId"
                        value={form.DoctorId || ''}
                        error={form.DoctorId === ""}
                        required
                        onChange={this.handleChange}
                        helperText="Por favor seleccione uno"
                        variant="outlined"
                        fullWidth
                        disabled={disabled}
                        InputProps={{
                          readOnly: params.appointmentHandle === "show",
                        }}
                      >
                        <MenuItem value="">
                          <Button
                            color="primary"
                            onClick={() =>
                              this.openDialogDoctor()
                            }
                            fullWidth
                            variant="contained"
                          >
                            Nuevo Médico
                          </Button>
                        </MenuItem>  
                        {doctor.map((option) => (
                          <MenuItem key={option.id} value={option.id}>
                            {option.doctorName}
                          </MenuItem>
                        ))}
                      </TextField>

                     
                    </div>
{/*}@RSV01  */}
                  </div>
                )}
                {tabValue === 1 && (
                  <div>
                    <Grid container>
                      <Grid item xs={6}>
                        <Button
                          onClick={this.openDialog}
                          disabled={
                            form.PriceListId === "" ||
                            params.appointmentHandle === "show"
                          }
                          color="primary"
                          variant="contained"
                        >
                          Agregar examenes
                        </Button>
                      </Grid>
                      <Grid item xs={6}>
                        <div
                          style={{ display: "flex", justifyContent: "center" }}
                        >

                          <TextField
                            className="mt-8 mb-16 mr-8 ml-8"
                            required
                            label="Precio total"
                            name="totalPrice"
                            value={totalPrice}
                            id="totalPrice"
                            variant="outlined"
                            onChange={this.updateFinalPrice}
                             InputProps={{
                              inputComponent: NumberFormatCustom,
                              readOnly: true,
                            }}
                          />

                          <TextField
                            className="mt-8 mb-16 mr-8 ml-8"
                            required
                            label="Descuento"
                            name="discount"
                            value={discount}
                            id="discount"
                            variant="outlined"
                            onChange={this.makeDiscount}
                             InputProps={{
                              inputComponent: NumberFormatCustom,
                              readOnly: false,
                            }}
                          />

                          <TextField
                            className="mt-8 mb-16 mr-8 ml-8"
                            label="Precio final"
                            name="finalPrice"
                            value={finalPrice}
                            id="finalPrice"
                            variant="outlined"
                            onChange={this.setFinalPrice}
                             InputProps={{
                              inputComponent: NumberFormatCustom,
                              readOnly: true,
                              // endAdornment: (
                              //   <InputAdornment position="end">
                              //     <IconButton
                              //       aria-label="Toggle password visibility"
                                    
                              //       onClick={this.handleChangeGeneral}
                              //     >
                              //       <Icon className="mr-4 text-20">search</Icon>
                              //     </IconButton>
                              //   </InputAdornment>
                              // ),
                            }}
                          />
                        </div>
                      </Grid>
                    </Grid>
                    <h5>Exámenes agregados</h5>
                    {this.renderTableSelected()}
                  </div>
                )}
                {tabValue === 2 && (
                  <div style={{ display: "flex", justifyContent: "center" }}>
                    <TextField
                      className="mt-8 mb-16 mr-8 ml-8"
                      required
                      type="date"
                      label="Fecha"
                      name="dateAppointment"
                      value={form.dateAppointment}
                      onChange={this.handleChange}
                      id="dateAppointment"
                      variant="outlined"
                      InputProps={{
                        readOnly: params.appointmentHandle === "show",
                      }}
                      InputLabelProps={{
                        shrink: true,
                      }}
                      fullWidth
                    />
                    <TextField
                      className="mt-8 mb-16 mr-8 ml-8"
                      required
                      type="time"
                      label="Hora"
                      name="time"
                      defaultValue="10:00"
                      value={form.time}
                      onChange={this.handleChange}
                      id="time"
                      variant="outlined"
                      InputLabelProps={{
                        shrink: true,
                      }}
                      InputProps={{
                        readOnly: params.appointmentHandle === "show",
                        step: 300, // 5min
                      }}
                      fullWidth
                    />
                    {params.appointmentId !== "new" && (
                      <TextField
                        className="mt-8 mb-16 mr-8 ml-8"
                        required
                        readOnly
                        type="date"
                        label="Fecha de creacion"
                        name="createdDate"
                        value={form.createdDate}
                        id="createdDate"
                        variant="outlined"
                        InputLabelProps={{
                          shrink: true,
                        }}
                        InputProps={{
                          readOnly: true,
                        }}
                        fullWidth
                      />
                    )}
                  </div>
                )}
              </div>
            )
          }
          innerScroll
        />
        <DialogConfirm
          open={this.state.openAlert}
          onResponse={this.handleAlertResponse}
          title="Paciente no encontrado"
          description="¿Desea registrar un nuevo paciente?"
        />
        {this.state.dialog && (
          <DialogAddExaminations
            dialog={this.state.dialog}
            selectedExams={this.state.selectedExams}
            onAddExamination={this.handleAddExaminations}
            onClose={this.closeDialog}
          />
        )}


        {this.state.openPatientsDialog && (
          <DialogPatients
            dialog= {this.state.openPatientsDialog}
            onAddPatient= {this.handleAddPatientByName}
            onClose = {this.closePatientsDialog}
            />
        )
          
        }

        {this.state.openRefererDialog && (
          <DialogCreateMaster
            dialog={this.state.openRefererDialog}
            onResponse={this.closeDialogReferer}
            fields={fieldsNewReferer}
            title="Agregar nueva referencia"
            onFetchApi={addRefererApi}
          />
        )}

        {this.state.openDoctorDialog && (
          <DialogCreateMaster
            dialog={this.state.openDoctorDialog}
            onResponse={this.closeDialogDoctor}
            fields={fieldsNewDoctor}
            title="Agregar nuevo médico"
            onFetchApi={addDoctorApi}
          />
        )}
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      getAppointment: Actions.getAppointment,
      newAppointment: Actions.newAppointment,
      saveAppointment: Actions.saveAppointment,
      editAppointment: Actions.editAppointment,
      currentAppointment: Actions.currentAppointment,
      showMessage,
      fetch_end,
      fetch_start,
    },
    dispatch
  );
}

function mapStateToProps({ appointmentsReducer, fuse }) {
  return {
    appointment: appointmentsReducer.appointment.data,
    appointments: appointmentsReducer.appointments.data,
    actions: fuse.menulink.data,
    navigation: fuse.navigation,
    isLoadingRequest: fuse.request.loading > 0,
  };
}

export default withReducer("appointmentsReducer", reducer)(
  withRouter(
    connect(
      mapStateToProps,
      mapDispatchToProps
    )(Appointment)
  )
);
