import React from 'react';
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, TextField, 
  InputAdornment, Icon, IconButton, MenuItem, withStyles } from '@material-ui/core';
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
  editExaminationValueApi
} from "../../../api";


const styles = () => ({
  root: {}
});

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
        examinationGroups: []
      }
    }  

    

    componentDidMount() {
      this.fetchMethods();
      this.fetchUnits();  
      this.setState({examinationGroups: this.props.examGroups,
                     nombre: this.props.examContent.name,
                     grupo: this.props.examContent.examGroup.id,
                     metodo: this.props.examContent.methodology.id,
                     unidad: this.props.examContent.unit.id
                     });
      }
    handleClose = () => {
      this.props.onClose(this.state.deleteFlag);
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

    makeEdit = () => {

      const data = {
          name: this.state.nombre,
          ExaminationGroupId: this.state.grupo,
          MethodId: this.state.metodo,
          UnitId: this.state.unidad,
      }

      const { showMessage, fetch_end, fetch_start } = this.props;
      fetch_start();
      editExaminationValueApi(this.props.examId, data)
        .then(
          (response) => {
            if (response.status) console.log('done');
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

      
      this.handleClose();  
      this.props.reloadValues(this.props.examId);
    }

    handleKeyPress = (event) => {
        if (event.key === "Enter" && this.state.patientQuery)
          this.handleClickSearchPatient();
      };


    
  
    render() {
      //const { services } = this.state;
      const {classes} = this.props;

      return (  
        <div>
          <Dialog
            maxWidth ="xl"
            open={this.props.dialog}
            onClose={this.handleClose}
            aria-labelledby="form-dialog-title"
          >
            <DialogTitle id="form-dialog-title">Editar valor de examen</DialogTitle>
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
              placeholder="Unidad"
              label= "Unidad"
              id="standard-select-currency"
              className="mt-8 mb-16 mr-8 ml-8"
              select
              variant="outlined"
              name="unidad"
              value={this.state.unidad || ''}
              required
              fullWidth
              onChange={this.handleChange}
              InputProps={{

                startAdornment: <Icon color="primary">keyboard_arrow_down</Icon>
                 }}
               >
                {this.state.units.map((option) => (
                   <MenuItem key={option.id} value={option.id}>
                       {option.name}
                   </MenuItem>
                   ))}
               </TextField>

               <TextField
              placeholder="Método"
              label= "Método"
              id="standard-select-currency"
              className="mt-8 mb-16 mr-8 ml-8"
              select
              variant="outlined"
              name="metodo"
              value={this.state.metodo || ''}
              required
              fullWidth
              onChange={this.handleChange}
              InputProps={{

                startAdornment: <Icon color="primary">keyboard_arrow_down</Icon>
                 }}
               >
                {this.state.methods.map((option) => (
                   <MenuItem key={option.id} value={option.id}>
                       {option.name}
                   </MenuItem>
                   ))}
               </TextField>

               <TextField
              placeholder="Grupo"
              label= "Grupo"
              id="standard-select-currency"
              className="mt-8 mb-16 mr-8 ml-8"
              select
              variant="outlined"
              name="grupo"
              value={this.state.grupo || ''}
              required
              fullWidth
              onChange={this.handleChange}
              InputProps={{

                startAdornment: <Icon color="primary">keyboard_arrow_down</Icon>
                 }}
               >
                {this.state.examinationGroups.map((option) => (
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
  
  export default withStyles(styles, {withTheme: true})(connect(mapStateToProps, mapDispatchToProps)(DialogEditExamination));
