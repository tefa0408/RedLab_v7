import React from 'react';
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, TextField, 
  InputAdornment, Icon, IconButton, MenuItem } from '@material-ui/core';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import { connect } from 'react-redux'
import * as Actions from './store/actions';
import {bindActionCreators} from 'redux';
import classNames from 'classnames';
import {showMessage, fetch_end, fetch_start} from 'store/actions/fuse';
import DataTables from 'material-ui-datatables'; 
import {
  saveServiceApi,
  saveMethodApi,
  saveUnitApi,
  editExaminationApi,
  saveReferenceValueApi,
  getServicesAllApi,
  getMethodsAllApi,
  getUnitsAllApi,
  getExaminationValuesByExamId,
  editExamReferenceValueApi,
  getExaminationValues
} from "../../../api";


class DialogEditExamination extends React.Component {
  
    constructor(props) {
      super(props);
      this.state = {
        deleteFlag: false,
        success: false,
        ServiceId: "",
        examinationValue: [],
        services: [],
        methods: [],
        groups: [],
        units: [],
        unidad: null,
        nombre: null,
        metodo: null,
        grupo: null,
        data: [],
        exams: [],
        exam: null,
        examValues: [],
        examValueId: null,
        currentValueId: ""
      }
    }  

    componentDidMount() {
      this.fetchExaminationValues();
      this.setState({currentValueId: this.props.value.id,
                     nombre: this.props.value.name,
                     examValueId: this.props.value.examValue.id});
      }
    handleClose = () => {
      this.props.onClose(this.state.deleteFlag);
    }

    handleSelectChanging = (event) => {
        this.setState({examValueId: event.target.value})
    }

    fetchExaminationValues = () => {
        const { showMessage, fetch_end, fetch_start } = this.props;
        fetch_start();
        getExaminationValues()
          .then(
            (response) => {
              if (response.status) {
                this.setState({ examValues: response.data });
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


    makeEdit = () => {

        const data = {
            name: this.state.nombre,
            ExaminationValueId: this.state.examValueId
        }

        // var id = JSON.stringify(this.state.currentValueId);
        const { showMessage, fetch_end, fetch_start } = this.props;
        fetch_start();
        editExamReferenceValueApi(this.state.currentValueId, data)
          .then(
            (response) => {
              if (response.status){

                this.handleClose(); 
                this.props.reloadExaminationReferences(this.props.examinationId, this.state.currentValueId);
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

    fetchUnits = () => {
      const { showMessage, fetch_end, fetch_start } = this.props;
      fetch_start();
      getUnitsAllApi()
        .then(
          (response) => {
            if (response.status) this.setState({ units: response.data });
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
  
    fetchMethods = () => {
      const { showMessage, fetch_end, fetch_start } = this.props;

      fetch_start();
      getMethodsAllApi()
        .then(
          (response) => {
            if (response.status) {
              this.setState({ methods: response.data });

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
  
    handleChange = (event) => {
      this.setState({ [event.target.name]: event.target.value })
    }

    addExam = (exam) => {
      // const { newPatient } = this.state;
      // const { showMessage, selectedExams } = this.props;
  
      // sending the examination selected to the parent component
      this.setState({exam, success: true}, () => {
        this.props.onAddExam(exam);
        this.handleClose();
      });
    }
      
    render() {
      //const { services } = this.state;
  
      return (  
        <div>
          <Dialog
            maxWidth ="xl"
            open={this.props.dialog}
            onClose={this.handleClose}
            aria-labelledby="form-dialog-title"
          >
            <DialogTitle id="form-dialog-title">Editar valores de referencia</DialogTitle>
            <DialogContent>

            <TextField
              className="mt-8 mb-16 mr-8 ml-8"
              required
              placeholder="Nombre"
              label="Nombre"
              name="nombre"
              value={this.state.nombre}
              onChange={this.handleChange}
              id="nombre"
              variant="outlined"
              fullWidth
              onKeyPress={this.handleKeyPress}
              autoComplete="off"
            />

            <TextField
              placeholder="Examen"
              label= "Examen"
              id="standard-select-currency"
              className="mt-8 mb-16 mr-8 ml-8"
              select
              variant="outlined"
              name="exam"
              value={this.state.examValueId || ''}
              required
              fullWidth
              onChange={this.handleSelectChanging}
              InputProps={{

                startAdornment: <Icon color="primary">keyboard_arrow_down</Icon>
                 }}
               >
                {this.state.examValues.map((option) => (
                   <MenuItem key={option.id} value={option.id}>
                       {option.name}
                   </MenuItem>
                   ))}
               </TextField>
            </DialogContent>
            <DialogActions>
            <Button
              onClick={this.makeEdit}
              color="primary"
              size="small"
            >
              Editar
            </Button>
              
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
  
  export default connect(mapStateToProps, mapDispatchToProps)(DialogEditExamination);
  