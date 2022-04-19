import React from 'react';
import { withStyles, Button, Dialog, DialogActions, DialogContent, DialogTitle, TextField, 
  InputAdornment, Icon, IconButton, MenuItem } from '@material-ui/core';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { connect } from 'react-redux'
import * as Actions from './store/actions';
import {bindActionCreators} from 'redux';
import { getPatientByNameApi, getServicesAllApi } from '../../../api';
import {showMessage, fetch_end, fetch_start} from 'store/actions/fuse';
import DataTables from 'material-ui-datatables'; 
import classNames from 'classnames';



const styles = () => ({
  root: {},
  pacienteInput: {
    color: '#424242',
    backgroundColor: '#fff',
    border: '1px solid #3498db',
    borderRadius: '3px',
    '&.Mui-focused fieldset': {
      border: '0px solid white'
    }
  }
});

class DialogPatients extends React.Component {
  
    constructor(props) {
      super(props);
      this.state = {
        deleteFlag: false,
        success: false,
        noPacients: false,
        patientQuery: "",
        ServiceId: "",
        newPatient: null,
        newPatients: [],
        services: []
      }
    }
  
    componentDidMount() {
      this.fetchServices();
    }
  
    fetchServices = () => {
      const {showMessage, fetch_start, fetch_end} = this.props;
      fetch_start()
      getServicesAllApi().then(response => {
          if (response.status) {
            this.setState({services: response.data});
          }
          }, err => {
          console.log(err)
          showMessage({ message: 'Error de conexión. Recargue por favor.', variant:"error" })
      }).finally(fetch_end)
    }

    
  
    handleClickSearchPatient = () => {
    const {showMessage, fetch_start, fetch_end} = this.props;


      var name = this.state.patientQuery;

      var newName = name.substr(0,name.indexOf(' ')); // "Joan"
      var newName = newName.charAt(0).toUpperCase() + newName.slice(1).toLowerCase();
      var lastName = name.substr(name.indexOf(' ')+1); // "Rosendo"
      var lastName = lastName.charAt(0).toUpperCase() + lastName.slice(1).toLowerCase();

      if(newName == "" && lastName != ""){

        var newName = lastName;
        var lastName = "";
        
      }else if(newName == "" && lastName == ""){
          var newName = " ";
          var lastName = " ";
      } 
      // else {
      //   console.log('Nombre: ' + newName);
      //   console.log('Apellido: ' + lastName);
      // }
      
      fetch_start()
        getPatientByNameApi("name", newName, "lastNameP", lastName)
          .then(
            (response) => {
              if (response.status) {
               
                if(response.data.length != 0){
                 
                  this.state.noPacients = false;
                  this.state.success = true;
                }else{
                  this.state.success = false;
                  this.state.noPacients =  true;
                  
                }
                
                
                this.setState({newPatients: response.data});
                
                console.log(this.state.newPatients);
         
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
  
   
    addPatient = (patient) => {
      const { newPatient } = this.state;
      const { showMessage, selectedExams } = this.props;
  
    
     
    
  
      // sending the examination selected to the parent component
      this.setState({patient, success: true}, () => {
        this.props.onAddPatient(patient);
        this.handleClose();
      });
    }
  
    handleClose = () => {
      this.props.onClose(this.state.deleteFlag);
    }
  
    closeMessage = () => {
      setTimeout(() => { this.setState({success: false}) }, 2000);
    }
  
    handleChange = (event) => {
      
      this.setState({ [event.target.name]: event.target.value });
      console.log(event.target.value);
      
    }
  
    renderSuccesMsg = () => {
      const {success} = this.state;
      return (
        <span style={{color: '#5cb85c', textAlign: 'right'}}>
          {success && 'Paciente(s) encontrado'}
        </span>
      )
    }

    renderNoPacientsMsg = () => {
      const {noPacients} = this.state;
      return (
        <span style={{color: '#e17055', textAlign: 'right'}}>
          {noPacients && 'No se encontraron coincidencias'}
        </span>
      )
    }

    handleKeyPress = (event) => {
        if (event.key === "Enter" && this.state.patientQuery)
          this.handleClickSearchPatient();
          console.log('hey');
      };

  
    renderExaminations = () => {
  
      
      const TABLE_COLUMNS = [
        {
            
          key: "person",
          render: (val,row) => (
              <p>{val.code}</p>
          ),
          label: "Código"
        },
        {
          key: "person",
          render: (val,row) => (
            <p>{val.name}</p>
        ),
          label: "Nombre"
        },
        {
          key: "person",
          render: (val,row) => (
            <p>{val.lastNameP}</p>
        ),
          label: "Apellido Paterno",
        //    render: (val, row) => (
        //      <p>{val.name}</p>
        //    )
        },
        {
          key: "person",
          render: (val,row) => (
            <p>{val.lastNameM}</p>
        ),
          label:    "Apellido Materno",
        },
        {
          key: "options",
          label: "Opciones",
          render: (row, rows) => (
            <Button
              onClick={() => this.addPatient(rows)}
              color="primary"
              size="small"
            >
              Agregar
            </Button>
          )
        }
    ];
    
    return (
        <MuiThemeProvider>
          <DataTables
            height={'auto'}
            
            selectable={false}
            showRowHover={true}
            columns={TABLE_COLUMNS}
            data={this.state.newPatients}
            showCheckboxes={false}
            showFooterToolbar={false}
          />
        </MuiThemeProvider>
    );
    }
  
    render() {
      //const { services } = this.state;
      const {classes} = this.props;
      return (  
        <div>
          <Dialog
            maxWidth ="lg"
            open={this.props.dialog}
            onClose={this.handleClose}
            aria-labelledby="form-dialog-title"
            PaperProps={{
              style: {
                  backgroundColor: "#fff",
              },
           }}
          >
            <DialogTitle id="form-dialog-title"><h2 style={{color: "#424242"}}>Buscar paciente</h2> { this.renderSuccesMsg() } { this.renderNoPacientsMsg() }</DialogTitle>
            <DialogContent>
              <div style={{display:"flex", justifyContent:"left"}}>
                <TextField
                  className="mt-8 mb-16 mr-8 ml-8"
                  required
                  placeholder="Buscar paciente"
                  name="patientQuery"
                  value={this.state.patientQuery}
                  onChange={this.handleChange}
                  id="name"
                  className={classNames(classes.pacienteInput), "mt-8 mb-16 mr-8 ml-8"}
                  variant="outlined"
                  fullWidth
                  onKeyPress={this.handleKeyPress}
                  autoComplete="off"
                  InputProps={{
                      className: classes.pacienteInput,
                      endAdornment: (
                        <InputAdornment position="end">
                          <IconButton
                            aria-label="Toggle password visibility"
                            //disabled={!this.canSearch()}
                            onClick={this.handleClickSearchPatient}
                          >
                            <Icon className="mr-4 text-20" style={{color: '#3498db'}}>search</Icon>
                          </IconButton>
                        </InputAdornment>
                      ),
                  }}
                />
               
              </div>
              <h5>Pacientes encontrados</h5>
              { this.renderExaminations() }
            </DialogContent>
            <DialogActions>
              <Button onClick={this.handleClose} disabled={this.props.isLoadingRequest} color="primary">
                Cerrar
              </Button>
            </DialogActions>
          </Dialog>
        </div>
      );
    }
  }
  
  
  function mapDispatchToProps(dispatch)
  {
    return bindActionCreators({
        deleteAppointment: Actions.deleteAppointment,
        showMessage,
        fetch_start,
        fetch_end
    }, dispatch);
  }
  
  function mapStateToProps({appointmentReducer, fuse})
  {
    return {
      isLoadingRequest: fuse.request.loading > 0
    }
  }
  export default withStyles(styles, {withTheme: true})(connect(null, mapDispatchToProps)(DialogPatients));
