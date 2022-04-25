package com.ssafy.happyhouse.model.dto;

//환경정보업체 
public class EnvBuilding {

 // 업체명 
 private String buildingname;

 // 인허가번호 
 private String num;

 // 업종코드 
 private Integer code;

 // 업종명 
 private String type;

 // 지도점검일자 
 private String inspectiondate;

 // 점검기관 
 private String inspectioninstitution;

 // 점검기관타입 
 private String inspectiontype;

 // 지도점검구분 
 private String disposal;

 // 점검사항 
 private String inspeciton;

 // 점검결과 
 private String inspectionresult;

 // 소재지주소 
 private String address;

 public String getBuildingname() {
     return buildingname;
 }

 public void setBuildingname(String buildingname) {
     this.buildingname = buildingname;
 }

 public String getNum() {
     return num;
 }

 public void setNum(String num) {
     this.num = num;
 }

 public Integer getCode() {
     return code;
 }

 public void setCode(Integer code) {
     this.code = code;
 }

 public String getType() {
     return type;
 }

 public void setType(String type) {
     this.type = type;
 }

 public String getInspectiondate() {
     return inspectiondate;
 }

 public void setInspectiondate(String inspectiondate) {
     this.inspectiondate = inspectiondate;
 }

 public String getInspectioninstitution() {
     return inspectioninstitution;
 }

 public void setInspectioninstitution(String inspectioninstitution) {
     this.inspectioninstitution = inspectioninstitution;
 }

 public String getInspectiontype() {
     return inspectiontype;
 }

 public void setInspectiontype(String inspectiontype) {
     this.inspectiontype = inspectiontype;
 }

 public String getDisposal() {
     return disposal;
 }

 public void setDisposal(String disposal) {
     this.disposal = disposal;
 }

 public String getInspeciton() {
     return inspeciton;
 }

 public void setInspeciton(String inspeciton) {
     this.inspeciton = inspeciton;
 }

 public String getInspectionresult() {
     return inspectionresult;
 }

 public void setInspectionresult(String inspectionresult) {
     this.inspectionresult = inspectionresult;
 }

 public String getAddress() {
     return address;
 }

 public void setAddress(String address) {
     this.address = address;
 }

 // EnvBuilding 모델 복사
 public void CopyData(EnvBuilding param)
 {
     this.buildingname = param.getBuildingname();
     this.num = param.getNum();
     this.code = param.getCode();
     this.type = param.getType();
     this.inspectiondate = param.getInspectiondate();
     this.inspectioninstitution = param.getInspectioninstitution();
     this.inspectiontype = param.getInspectiontype();
     this.disposal = param.getDisposal();
     this.inspeciton = param.getInspeciton();
     this.inspectionresult = param.getInspectionresult();
     this.address = param.getAddress();
 }
}