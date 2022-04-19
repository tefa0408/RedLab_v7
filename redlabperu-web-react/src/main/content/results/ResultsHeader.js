import React, {Component} from 'react';
import {withStyles, Icon, Button, IconButton, Typography, TextField, Paper, Input, Grid, MenuItem} from '@material-ui/core';
import {FuseAnimate} from '@fuse';
import * as Actions from '../appointments/store/actions';
import {bindActionCreators} from 'redux';
import {connect} from 'react-redux';
import DialogPatients from "../appointments/DialogPatients";
import classNames from 'classnames';
import { BrowserView } from "react-device-detect";
import { getRefererApi} from "../../../api";
import { showMessage, fetch_end, fetch_start } from "store/actions/fuse";

const styles = () => ({
    root: {
        backgroundColor: '#ffffff'
    },
    input: {
        color: '#000000',
        fill: '#000000'
    },
    select: {
        color: '#000000',
        fill: '#fff',
    }

});

class ResultsHeader extends Component {
    state = {
        searchText: "",
        criteria: "code",
        type: "string",
        startInput: "hidden",
        endInput: "hidden",
        openPatientsDialog: false,
        nombre: null,
        apellido: null,
        start: null,
        referer: null,
        referers: [],
        end: null,
        searchBox: true,
        searchRefererMode: false,
        refererId: "",
        
    }
    componentDidMount() {
        this.fetchReferer()
        console.log(this.props.appointmentStatus);
    }
    fetchReferer = () => {
        const { showMessage, fetch_end, fetch_start } = this.props;
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
      };

    
   

    openPatientsDialog = () => {
        this.setState({openPatientsDialog: true});
      };
    
    closePatientsDialog = () => {
        this.setState({ openPatientsDialog: false});
    };

    handleChange = (event) => {
        this.setState({[event.target.name]: event.target.value});
    }

    handleAddPatientByName = (newPatient) => {
        const { patient } = this.state;

        this.props.searchAppointmentsByName(newPatient.person.id, this.props.appointmentStatus);
      };
    
      handleChangeReferer = (event) => {
        this.setState({refererId: event.target.value})
        this.state.refererId = event.target.value;
        this.handleClick();
      };

    handleChangeSelect = (event) => {
        this.setState({[event.target.name]: event.target.value});
        if (event.target.value === 'date')
            this.setState({type: "date",
                            startInput: "hidden",
                            endInput: "hidden",
                            start: null,
                            end: null,
                            nombre: null,
                            apellido: null,
                            searchRefererMode: false,});
        else if(event.target.value === 'pacient'){
            this.setState({type: "hidden",
                           startInput: "hidden",
                           endInput: "hidden",
                           openPatientsDialog: true,
                           searchRefererMode: false,
                           start: null,
                           end: null})
        }
        else if(event.target.value === 'referer'){
            this.setState({type: 'hidden',
                         searchBox: true,
                           startInput: "hidden",
                           endInput: "hidden",
                           searchRefererMode: true,
                           openPatientsDialog: false,
                           start: null,
                           end: null})
           
        }
        else
            this.setState({type: "string",
                            startInput: "hidden",
                            endInput: "hidden",
                            start: null,
                            end: null,
                            nombre: null,
                            apellido: null,
                            searchRefererMode: false});

        if(event.target.value === 'dates'){
            this.setState({type: "hidden", startInput: "date", endInput: "date"});
        }
    }

   
    handleClick = () => {
        const { appointmentStatus = '' } = this.props 
        //If parent doesn't assign this prop, it'll be empty so get all status

        switch(this.state.criteria){
        
            case 'refererCode':
                this.props.searchAppointmentsByReferer(this.state.criteria, this.state.searchText, this.props.appointmentStatus);
                break;
            case 'referer':
                this.props.searchAppointmentsByReferer('refererId', this.state.refererId, this.props.appointmentStatus);
                break;
            case 'dates':
                this.props.searchAppointmentsByDates(this.state.start, this.state.end, this.props.appointmentStatus);
               break;
            case 'pacient':
                this.openPatientsDialog();
                break;
            
            default:
                this.props.searchAppointments(this.state.criteria, this.state.searchText, appointmentStatus);
                break;
        }

        
    }

    handleKeyPress = (event) => {
        if (event.key === 'Enter' && this.state.searchText !== '' || this.state.start !== null)
            this.handleClick();
    }

    render()
    {   
        const { searchText } = this.state;
        const {classes, showResults  = false} = this.props;
        return (
            <div className="flex flex-1 w-full items-center justify-between">

                <div className="flex items-center">
                </div>

                <div className="flex flex-1 items-center justify-center px-12">
                    <Grid container>
                        <Grid item xs={4}>
                            <div style={{display:"flex", justifyContent:"center"}}>
                            <FuseAnimate animation="transition.expandIn" delay={300}>
                                <img src="assets/images/backgrounds/citas_lab_11.png" alt="icon" />
                            </FuseAnimate>
                            <FuseAnimate animation="transition.slideLeftIn" delay={300}>
                                <Typography className="" variant="h6">
                                    {showResults ? 'Resultados de examenes' : "Citas de Laboratorio"}
                                </Typography>
                            </FuseAnimate>
                            </div>
                        </Grid>
                        <Grid item xs={5}>
                            <BrowserView>
                            <FuseAnimate animation="transition.slideDownIn" delay={300}>
                                <Paper className={classNames(classes.root, "flex items-center px-8 py-2 rounded-8")} elevation={1}>
                                    <TextField
                                      id="standard-select-currency"
                                    //   className={classNames(classes.select)}
                                      select
                                      variant="outlined"
                                      name="criteria"
                                      value={this.state.criteria}
                                      required
                                      onChange={this.handleChangeSelect}
                                      InputProps={{
                                        className: classes.input,
                                        startAdornment: <Icon color="primary">keyboard_arrow_down</Icon>
                                      }}
                                    >
                                        <MenuItem value={"code"}>Codigo</MenuItem>
                                        <MenuItem value={"date"}>Fecha</MenuItem>
                                        <MenuItem value={"dni"}>DNI</MenuItem>
                                        <MenuItem value={"passport"}>Pasaporte</MenuItem>
                                        <MenuItem value={"pacient"}>Paciente</MenuItem>
                                        <MenuItem value={"referer"}>Referencia</MenuItem>
                                        {/*<MenuItem value={"refererCode"}>Cod. Ref.</MenuItem>*/}
                                        <MenuItem value={"dates"}>Fechas</MenuItem>
                                    </TextField>
                                    <IconButton onClick={this.handleClick}>
                                        <Icon className="mr-8" color="primary">search</Icon>
                                    </IconButton>

                                    {this.state.searchBox && (
                                            <Input
                                            placeholder="Buscar"
                                            className={classNames(classes.input)}
                                            disableUnderline
                                            type={this.state.type}
                                            name="searchText"
                                            value={searchText}
                                            autoComplete="off"
                                            inputProps={{
                                                'aria-label': 'Search'
                                            }}
                                            onChange={this.handleChange}
                                            onKeyPress={this.handleKeyPress}
                                        />
                                    )
                                            
                                    }
                                    
                                    


                                        <Input
                                        label="Fecha inicial"
                                        className={classNames(classes.input)}
                                        disableUnderline
                                        type={this.state.startInput}
                                        name="start"
                                        value={this.state.start || ''}
                                        autoComplete="off"
                                        inputProps={{
                                            'aria-label': 'Search'
                                        }}
                                        onChange={this.handleChange}
                                        onKeyPress={this.handleKeyPress}
                                    />
                                        <Input
                                        placeholder="Fin"
                                        label="Fecha final"
                                        className={classNames(classes.input)}
                                        disableUnderline
                                        type={this.state.endInput}
                                        name="end"
                                        value={this.state.end || ''}
                                        autoComplete="off"
                                        inputProps={{
                                            'aria-label': 'Search'
                                        }}
                                        onChange={this.handleChange}
                                        onKeyPress={this.handleKeyPress}
                                    />

                                    {this.state.searchRefererMode && (
                                           <TextField
                                           placeholder="Seleccione uno"
                                           id="standard-select-currency"
                                           className={classNames(classes.select)}
                                           select
                                           variant="outlined"
                                           name="refererId"
                                           value={this.state.refererId || ''}
                                           required
                                           fullWidth
                                           onChange={this.handleChangeReferer}
                                           InputProps={{
                                             className: classes.input,
                                             startAdornment: <Icon color="primary">keyboard_arrow_down</Icon>
                                           }}
                                         >
                                          {this.state.referers.map((option) => (
                                             <MenuItem key={option.id} value={option.id}>
                                                 {option.refererName}
                                             </MenuItem>
                                             ))}
                                         </TextField>
                                                                          
                                    )}
                                       


                                    
                                        

                                    
                                </Paper>
                            </FuseAnimate>
                            </BrowserView>
                        </Grid>
                        <Grid item xs={1} />
                    </Grid>
                </div>
                {this.state.openPatientsDialog && (
                <DialogPatients
                    dialog= {this.state.openPatientsDialog}
                    onAddPatient= {this.handleAddPatientByName}
                    className="patientDialog"
                    onClose = {this.closePatientsDialog}
                    status={this.props.appointmentStatus}
                    />
                )
                
                }
            </div>


        );
    }
}

function mapDispatchToProps(dispatch)
{
    return bindActionCreators({
        searchAppointments: Actions.searchAppointments,
        searchAppointmentsByReferer: Actions.searchAppointmentsByReferer,
        searchAppointmentsByDates: Actions.searchAppointmentsByDates,
        searchAppointmentsByName: Actions.searchAppointmentsByName,
        showMessage,
        fetch_start,
        fetch_end
    }, dispatch);
}

export default withStyles(styles, {withTheme: true})(connect(null, mapDispatchToProps)(ResultsHeader));
