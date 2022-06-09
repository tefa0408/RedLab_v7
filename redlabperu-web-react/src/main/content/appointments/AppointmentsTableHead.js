import React from 'react';
import {
    TableHead,
    TableSortLabel,
    TableCell,
    TableRow,
    Tooltip,
    withStyles
} from '@material-ui/core';

const rows = [
    {
        id            : 'code',
        numeric       : false,
        disablePadding: false,
        label         : 'Codigo',
        sort          : true
    },
    {
        id            : 'dateAppointment',
        numeric       : false,
        disablePadding: false,
        label         : 'Fecha',
        sort          : true
    },
    {
        id            : 'time',
        numeric       : false,
        disablePadding: false,
        label         : 'Hora',
        sort          : true
    },
    {
        id            : 'refererCode',
        numeric       : false,
        disablePadding: false,
        label         : 'Código Ref.',
        sort          : true
    },
    {
        id            : 'refererName',
        numeric       : false,
        disablePadding: false,
        label         : 'Referencia',
        sort          : true
    },
    {
        id            : 'client',
        numeric       : false,
        disablePadding: false,
        label         : 'Paciente',
        sort          : true
    },
    {
        id            : 'finalPrice',
        numeric       : false,
        disablePadding: false,
        label         : 'Precio final',
        sort          : true
    },
    {
        id            : 'options',
        numeric       : false,
        disablePadding: false,
        label         : 'Opciones',
        sort          : true
    },
];

const styles = theme => ({
    root                : {},
    actionsButtonWrapper: {
        position      : 'absolute',
        top           : 0,
        left          : 64,
        width         : 64,
        height        : 63,
        zIndex        : 10,
        background    : theme.palette.background.paper,
        alignItems    : 'center',
        display       : 'flex',
        justifyContent: 'center'
    }
});

class AppointmentsTableHead extends React.Component {
    state = {
        selectedRefillsMenu: null
    };

    createSortHandler = property => event => {
        this.props.onRequestSort(event, property);
    };

    render()
    {
        const {order, orderBy} = this.props;

        return (
            <TableHead>
                <TableRow className="h-64">
                    {rows.map(row => {
                        return (
                            <TableCell
                                key={row.id}
                                numeric={row.numeric}
                                padding={row.disablePadding ? 'none' : 'default'}
                                sortDirection={orderBy === row.id ? order : false}
                            >
                                {row.sort && (
                                    <Tooltip
                                        title="Sort"
                                        placement={row.numeric ? 'bottom-end' : 'bottom-start'}
                                        enterDelay={300}
                                    >
                                        <TableSortLabel
                                            active={orderBy === row.id}
                                            direction={order}
                                            onClick={this.createSortHandler(row.id)}
                                        >
                                            {row.label}
                                        </TableSortLabel>
                                    </Tooltip>
                                )}
                            </TableCell>
                        );
                    }, this)}
                </TableRow>
            </TableHead>
        );
    }
}

export default withStyles(styles, {withTheme: true})(AppointmentsTableHead);
