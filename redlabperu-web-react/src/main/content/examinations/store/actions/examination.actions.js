import { showMessage, fetch_start, fetch_end } from "store/actions/fuse";
import {
  saveExaminationApi,
  editExaminationApi,
  deleteExaminationApi,
  getExaminationApi,
} from "../../../../../api";
import history from "history.js";
import { FuseUtils } from "@fuse";
import { method } from "lodash";

export const GET_EXAMINATION = "GET EXAMINATION";
export const SAVE_EXAMINATION = "SAVE EXAMINATION";
export const CLOSE_DIALOG = "CLOSE DIALOG";
export const DELETE_EXAMINATION = "DELETE EXAMINATION";

export function deleteExamination(examinationId) {
  return (dispatch) => {
    dispatch(fetch_start());
    deleteExaminationApi(examinationId)
      .then(
        (response) => {
          if (response.status) {
            dispatch(
              showMessage({
                message: response.message.text,
                variant: "success",
              })
            );
            dispatch({
              type: DELETE_EXAMINATION,
              payload: examinationId,
            });
          } else
            dispatch(
              showMessage({ message: response.message.text, variant: "error" })
            );
        },
        (err) => {
          console.log(err);
          dispatch(
            showMessage({ message: "Error de conexión", variant: "error" })
          );
        }
      )
      .finally(() => dispatch(fetch_end()));
  };
}

export function setExamination(examination) {
  console.log(examination)
  return {
    type: GET_EXAMINATION,
    payload: prepareExaminationForEdit(examination),
  };
  
}

export function getExamination(id) {
  return (dispatch) => {
    dispatch(fetch_start());
    getExaminationApi(id)
      .then(
        (response) => {
          if (response.status) {
            dispatch({
              type: GET_EXAMINATION,
              payload: prepareExaminationForEdit(response.data),
            });
          } else
            dispatch(
              showMessage({ message: response.message.text, variant: "error" })
            );
        },
        (err) => {
          console.log(err);
          dispatch(
            showMessage({ message: "Error de conexión", variant: "error" })
          );
        }
      )
      .finally(() => dispatch(fetch_end()));
  };
}

export function saveExamination(
  examination,
  examGroups,
  examValues,
  referenceValues
) 

{
  return (dispatch) => {
    dispatch(fetch_start());
    const data = processDataforSave(
      examination,
      examGroups,
      examValues,
      referenceValues
    );
      console.log(data.examValue)
      console.log(data)
    saveExaminationApi(data)
      .then(
        (response) => {
          if (response.status) {
            dispatch(
              showMessage({
                message: response.message.text,
                variant: "success",
              })
            );
            history.push({
              pathname: "/apps/examinations",
            });
          } else
            dispatch(
              showMessage({ message: response.message.text, variant: "error" })
            );
        },
        (err) => {
          console.log(err);
          dispatch(
            showMessage({ message: "Error de conexión", variant: "error" })
          );
        }
      )
      .finally(() => dispatch(fetch_end()));
    // dispatch(
    //   showMessage({ message: "Examination created", variant: "success" })
    // );
    // history.push({
    //   pathname: "/apps/examinations",
    // });
    // dispatch(fetch_end());
  };
}

export function editExamination(
  metaData,
  data,
  examinationId
  // examGroups,
  // examValues,
  // referenceValues
) {
  return (dispatch) => {
    dispatch(fetch_start());

    return editExaminationApi({ metaData, data }, examinationId)
      .then(
        (response) => {
          if (response.status) {
            dispatch(
              showMessage({
                message: response.text,
                variant: "success",
              })
            );

            if (metaData.modelName === "base")
              return history.push({
                pathname: "/apps/examinations",
              });

            return response.data;
          } else
            dispatch(
              showMessage({ message: response.message.text, variant: "error" })
            );
        },
        (err) => {
          console.log(err);
          dispatch(
            showMessage({ message: "Error de conexión", variant: "error" })
          );
        }
      )
      .finally(() => dispatch(fetch_end()));
  };
}

export function closeDialog() {
  return {
    type: CLOSE_DIALOG,
  };
}

export function newExamination() {
  const data = {
    name: "",
    indications: "",
    ServiceId: "",
    //"AgreementId": "",
    typeSample: "",
    volume: "",
    supplies: "",
    storageTemperature: "",
    fastingConditions: "",
    runFrequency: "",
    processTime: "",
    reportTime: "",
    examinationGroups: [],
  };
  return {
    type: GET_EXAMINATION,
    payload: data,
  };
}

const prepareExaminationForEdit = (examination) => ({
  name: examination.name,
  indications: examination.indications,
  ServiceId: examination.service.id,
  typeSample: examination.typeSample,
  volume: examination.volume,
  supplies: examination.supplies,
  storageTemperature: examination.storageTemperature,
  fastingConditions: examination.fastingConditions,
  runFrequency: examination.runFrequency,
  processTime: examination.processTime,
  reportTime: examination.reportTime,
  examinationGroups: examination.examinationGroups,
  //     "AgreementId": examination.agreement.id
});

const newExam = (form) => ({
  name: form.name,
  indications: form.indications,
  ServiceId: form.ServiceId,
  typeSample: form.typeSample,
  volume: form.volume,
  supplies: form.supplies,
  storageTemperature: form.storageTemperature,
  fastingConditions: form.fastingConditions,
  runFrequency: form.runFrequency,
  processTime: form.processTime,
  reportTime: form.reportTime,
});

const processDataforSave = (form, examGroups, examValues, referenceValues) => {
  const examinationGroups = [];

  examGroups.forEach((examGroup) => {
    let examinationValue = [];
    const examinationValues = examValues.filter(
      (examValue) => examValue.examGroup.id == examGroup.id
    );

    examinationValues.forEach((examValue) => {
      const examRefs = referenceValues.filter(
        (refVal) =>
        refVal.examGroup.id == examGroup.id &&
        refVal.examValue.id == examValue.id
      );
      console.log(examRefs)
      examinationValue.push({
        ...examValue,
        examinationReferences: examRefs.map((ref) => ({
          name: ref.name,
        })),
      });
    });

    const examinationGroup = {
      name: examGroup.name,
      countEV: examinationValue.length,
      examinationValues: examinationValue.map((val) => ({
        name: val.name,
        UnitId: val.unit.id,
        MethodId: val.methodology.id,
        countVR: val.examinationReferences.length,
        examinationReferenceValues: val.examinationReferences,
      })),
    };
    examinationGroups.push(examinationGroup);
  });
  return {
    ...newExam(form),
    countEG: examinationGroups.length,
    examinationGroups,
  };
};

const processDataforEdit = (form, examGroups, examValues, referenceValues) => {
  const examinationGroups = [];
  examGroups.forEach((examGroup) => {
    let examinationValue = [];
    const examinationValues = examValues.filter(
      (examValue) => examValue.examGroup.id == examGroup.id
    );

    examinationValues.forEach((examValue) => {
      const examRefs = referenceValues.filter(
        (refVal) =>
          refVal.examValue.id == examValue.id &&
          refVal.examGroup.id == examGroup.id
      );
      examinationValue.push({
        // id: examValue.id,
        ...examValue,
        examinationReferences: examRefs.map((ref) => ({
          // id: ref.id,
          name: ref.name,
        })),
      });
    });

    const examinationGroup = {
      // id: examGroup.id,
      name: examGroup.name,
      countEV: examinationValue.length,
      examinationValues: examinationValue.map((val) => ({
        // id: val.id,
        name: val.name,
        UnitId: val.unit.id,
        MethodId: val.methodology.id,
        countVR: val.examinationReferences.length,
        examinationReferenceValues: val.examinationReferences,
      })),
    };
    examinationGroups.push(examinationGroup);
  });
  return {
    ...newExam(form),
    countEG: examinationGroups.length,
    examinationGroups,
  };
};

// editExaminationApi(data, examinationId)
// .then(
//   (response) => {
//     if (response.status) {
//       dispatch(
//         showMessage({
//           message: response.message.text,
//           variant: "success",
//         })
//       );
//       history.push({
//         pathname: "/apps/examinations",
//       });
//     } else
//       dispatch(
//         showMessage({ message: response.message.text, variant: "error" })
//       );
//   },
//   (err) => {
//     console.log(err);
//     dispatch(
//       showMessage({ message: "Error de conexión", variant: "error" })
//     );
//   }
// )
// .finally(() => dispatch(fetch_end()));
