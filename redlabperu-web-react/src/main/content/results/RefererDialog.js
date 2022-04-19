import React from 'react';
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, TextField, 
  InputAdornment, Icon, IconButton, MenuItem } from '@material-ui/core';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { connect } from 'react-redux'
import * as Actions from './store/actions';
import {bindActionCreators} from 'redux';
import { getPatientByNameApi, getServicesAllApi } from '../../../api';
import {showMessage, fetch_end, fetch_start} from 'store/actions/fuse';
import DataTables from 'material-ui-datatables'; 


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

    handleClickSearchPatient = () => {
      
      fetch_start();
        getRefererApi()
          .then(
            (response) => {
              if (response.status) this.setState({ referers: response.data });

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
  
   
    addReferer = (referer) => {
      const { referer } = this.state;
      const { showMessage, selectedExams } = this.props;
  
      // sending the examination selected to the parent component
      this.setState({patient, success: true}, () => {
        this.props.onAddReferer(referer);
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
          this.handleClickSearchReferer();
      };

  
    renderExaminations = () => {
  
      
      const TABLE_COLUMNS = [
        {
            
          key: "name",
          render: (val,row) => (
              <p>{val.refererName}</p>
          ),
          label: "Referencia"
        },
        {
          key: "options",
          label: "Opciones",
          render: (row, rows) => (
            <Button
              onClick={() => this.addReferer(rows)}
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
            data={this.state.referers}
            showCheckboxes={false}
            showFooterToolbar={false}
          />
        </MuiThemeProvider>
    );
    }
  
    render() {
      //const { services } = this.state;
  
      return (  
        <div>
          <Dialog
            maxWidth ="lg"
            open={this.props.dialog}
            onClose={this.handleClose}
            aria-labelledby="form-dialog-title"
          >
            <DialogTitle id="form-dialog-title">Buscar pacientes { this.renderSuccesMsg() } { this.renderNoPacientsMsg() }</DialogTitle>
            <DialogContent>
              <div style={{display:"flex", justifyContent:"left"}}>
                <TextField
                  className="mt-8 mb-16 mr-8 ml-8"
                  required
                  label="Buscar paciente"
                  name="patientQuery"
                  value={this.state.patientQuery}
                  onChange={this.handleChange}
                  id="name"
                  variant="outlined"
                  fullWidth
                  onKeyPress={this.handleKeyPress}
                  autoComplete="off"
                  InputProps={{
                      endAdornment: (
                        <InputAdornment position="end">
                          <IconButton
                            aria-label="Toggle password visibility"
                            //disabled={!this.canSearch()}
                            onClick={this.handleClickSearchPatient}
                          >
                            <Icon className="mr-4 text-20">search</Icon>
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
  
  export default connect(mapStateToProps, mapDispatchToProps)(DialogPatients);
  