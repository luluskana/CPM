<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url value="/" var="home" />
<div class="container">
    <div class="row">
        <div class="col-sm-6">
            <div class="panel panel-primary">
                <div class="panel-heading">Barcode Master</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group" id="formGroupBarcodeMaster">
                            <label for="inputBarcodeMaster" class="col-sm-3 control-label">Barcode Master</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control input-lg" id="inputBarcodeMaster" autocomplete="off" placeholder="Barcode Master">
                            </div>
                        </div>
                        <div id="partNoGroup" class="form-group hidden">
                            <label class="col-sm-3 control-label"><h3>Part : </h3></label>
                            <div class="col-sm-9">
                                <h1 class="form-control-static" id="partNoText"></h1>
                                <input type="text" class="hidden" id="inputPartNo">
                            </div>
                        </div>
                        <div id="materialGroup" class="form-group hidden">
                            <label class="col-sm-3 control-label"><h3>Master : </h3></label>
                            <div class="col-sm-9">
                                <h1 class="form-control-static" id="materialText"></h1>
                                <input type="text" class="hidden" id="inputMaterial">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="panel panel-default" id="labelPage">
                <div class="panel-body">
                    <h2>Emphasis classes</h2>

                    <p class="text-muted">Material Compare System</p>

                    <p class="text-warning">New technology in bootstrap design</p>

                    <p class="text-danger">Not support Internet Explorer</p>

                    <p class="text-success">Open source technology</p>

                    <p class="text-info">Support by MIS</p>
                </div>
            </div>
            <div class="panel panel-success hidden" id="formBarcodeCompare">
                <div class="panel-heading">Barcode Compare</div>
                <div class="panel-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label for="inputBarcodeCompare" class="col-sm-3 control-label">Barcode Compare</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control input-lg" id="inputBarcodeCompare" autocomplete="off" placeholder="Barcode Compare">
                            </div>
                        </div>
                        <div id="materialCompareForm" class="form-group hidden">
                            <label class="col-sm-3 control-label"><h3>Material : </h3></label>
                            <div class="col-sm-9">
                                <h1 class="form-control-static" id="materialCompareText"></h1>
                                <input type="text" class="hidden" id="inputMaterialcompare">
                                <input type="text" class="hidden" id="inputBatchMaterialcompare">
                            </div>
                        </div>
                        <div id="mcpNumberForm" class="form-group hidden">
                            <label class="col-sm-3 control-label"><h3>MCP No : </h3></label>
                            <div class="col-sm-9">
                                <h1 class="form-control-static" id="mcpText"></h1>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="symbolPass" class="row hidden" align="center">
        <div class="col-sm-12">
            <spring:url var="bannerPass" value="/resources/images/pass.jpeg" />
            <img src="${bannerPass}"/>
        </div>
    </div>
    <div id="symbolFail" class="row hidden" align="center">
        <div class="col-sm-12">
            <spring:url var="bannerFail" value="/resources/images/fail.jpeg" />
            <img src="${bannerFail}"/>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $("#inputBarcodeMaster").focus();

        $("#inputBarcodeMaster").keypress(function(e) {
            if(e.which == 13) {
                var codeMaster = $("#inputBarcodeMaster").val();
                if(codeMaster.split("{").length == 2) {
                    var arrayCode = codeMaster.split("{");
                    var materialMaster = arrayCode[0];
                    var partMaster = arrayCode[1];

                    $("#materialText").text(materialMaster);
                    $("#inputMaterial").val(materialMaster);

                    $("#partNoText").text(partMaster);
                    $("#inputPartNo").val(partMaster);

                    $("#partNoGroup").removeClass("hidden");
                    $("#materialGroup").removeClass("hidden");

                    $("#formGroupBarcodeMaster").addClass("hidden");
                    $("#labelPage").addClass("hidden");
                    $("#formBarcodeCompare").removeClass("hidden");
                    $("#inputBarcodeCompare").focus();
                } else {
                    alert("Not Syntax in System");
                    $("#inputBarcodeMaster").val("");
                    $("#inputBarcodeMaster").focus();
                }
            }
        });

        $("#inputBarcodeCompare").keypress(function(e) {
            if(e.which == 13) {

                var codeCompare = $("#inputBarcodeCompare").val();
                if(codeCompare.indexOf(".") > -1) {
                    $("#materialCompareText").text(codeCompare.substring(0,15));
                    $("#inputMaterialcompare").val(codeCompare.substring(0,15));
                    $("#inputBatchMaterialcompare").val(codeCompare.substring(15,25));
                    $("#materialCompareForm").removeClass("hidden");

                    var formData = new FormData();
                    formData.append("materialMaster", $("#inputMaterial").val());
                    formData.append("partNumber", $("#inputPartNo").val());
                    formData.append("materialCompare", $("#inputMaterialcompare").val());
                    formData.append("batch", $("#inputBatchMaterialcompare").val());

                    $.ajax({
                        type: "POST",
                        headers: {
                            Accept: "application/json",
                        },
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        url: "${home}compare",
                        processData: false,
                        contentType: false,
                        data: formData,
                        async: false,
                        success: function(data){
                            console.log(data.process);
                            if(data.process == "pass") {
                                $("#mcpText").text(data.mcp);
                                $("#symbolFail").addClass("hidden");
                                $("#mcpNumberForm").removeClass("hidden");
                                $("#symbolPass").removeClass("hidden");
                            } else {
                                $("#symbolPass").addClass("hidden");
                                $("#mcpNumberForm").addClass("hidden");
                                $("#symbolFail").removeClass("hidden");
                            }
                        },
                        error: function(data){
                            alert("Error");
                            return false;
                        }
                    });

                    $("#inputBarcodeCompare").val("");
                    $("#inputBarcodeCompare").focus();
                } else {
                    alert("Not Syntax in System");
                    $("#inputBarcodeCompare").val("");
                    $("#inputBarcodeCompare").focus();
                }
                return false;
            }
        });
    });
</script>