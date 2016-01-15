'use strict';
/**
 * 
 * 控制器
 * 
 * @author tanyw
 */
var acctItemRelMainApp = angular.module("acctItemRelMainApp", ["commonApp","costSettingServiceApp", "propertyServiceApp",'ui.event', 'ui.autocomplete']);

acctItemRelMainApp.controller("acctItemRelMainController", [ "$scope", "commonService","costSettingService",
		"propertyService", "$timeout", "$log","$compile",
		function($scope, commonService,costSettingService, propertyService, $timeout, $log,$compile) {
	
		//加载出错，弹出提示框
	    $scope.isSuccess = true;
	    $scope.$watch('isSuccess',function(nv,ov){
			if(!nv){
				$scope.isSuccess = true;
			    MESSAGE_DIALOG.error("出错了！");
			    setTimeout(function(){MESSAGE_DIALOG.close()},2000);
			}
	    });
        $scope.changeClass= function(obj){
        	var widget=obj.methods.widget();
        	widget.removeClass('ui-menu ui-corner-all ui-widget-content').addClass('dropdown-menu');
        }
        $scope.propertyCompanys = {
            options: {
                html: true,
                minLength: 1,
                onlySelectValid: true,
                outHeight: 50,
                source: function (request, response) {
	        		propertyService.queryCompany({"inParma":JSON.stringify({"companyName":request.term,"qryType":"getCompanySimple"})},
		        		function(data){
		        			data=eval("("+data+")").data;
		        			if(data.result=="fasle"){
		        				$scope.isSuccess=false;
		        				return false;
		        			}
		        			response($.map(data,function(item){
	        					return { label: item.companyName+"（"+item.regionWithSHQ+"）", value: item.companyName ,companyId:item.companyId}
	        				}));
		        		},
		        		function(){
		        			$scope.isSuccess=false;
		        		}
		        	);
                }
            },
            events: {
                change: function (event, ui) {
                    if(ffc.util.isEmpty(ui.item)){
        				$scope.propertyCompanys=null;
        			}
                },
                select: function (event, ui) {
                    console.log('select', event, ui);
                    $scope.propertyCompany=ui.item;
                    $scope.queryType="queryByCompany";
                    $scope.objId=ui.item.companyId;
                }
            }
        };
        $scope.communitys={
        	options:{
        		html:true,
        		minLength:1,
        		onlySelectValid:true,
        		outHeight:50,
        		source:function(request,response){
        			if(ffc.util.isEmpty($scope.propertyCompany)
        					||ffc.util.isEmpty($scope.propertyCompany.value)){
        				MESSAGE_DIALOG.error("请先选择物业公司！");
        				return false;
        			}
        			propertyService.queryCommunity(
        				{"inParma":JSON.stringify({"communityName":request.term,"companyId":$scope.propertyCompany.companyId,"qryType":"getCommunitySimple"})
        				},
        				function(data){
        					data=eval("("+data+")").data;
        					if(data.result=="false"){
        						$scope.isSuccess=false;
        					}
        					response($.map(data,function(item){
        						return { label: item.communityName+"（"+item.regionWithSHQ+"）", value: item.communityName,communityId:item.communityId}
        					}));
        				},
        				function(){
        					$scope.isSuccess=false;
        				}
        				
        			);
        		}
        	},
        	events:{
        		change:function(event,ui){
        			if(ffc.util.isEmpty(ui.item)){
        				$scope.community=null;
        			}
        		},
        		select:function(event,ui){
        			$scope.community=ui.item;
        			$scope.queryType="queryByCommunity";
        			$scope.objId=ui.item.communityId;
        		}
        	}
        };
        $scope.buildings={
        	options:{
        		html:true,
        		minLength:1,
        		onlySelectValid:true,
        		outHeight:50,
        		source:function(request,response){
        			if(ffc.util.isEmpty($scope.community)
        					||ffc.util.isEmpty($scope.community.companyName)){
        				MESSAGE_DIALOG.error("请先选择小区！");
        				return false;
        			}
        			propertyService.queryBuilding(
        				{"inParma": JSON.stringify({"communityName" : request.term,"communityId":$scope.community.communityId,"fuzzy":true})
        				},
        				function(data){
        					data=eval("("+data+")").data;
        					if(data.result=="false"){
        						$scope.isSuccess=false;
        					}
        					response($.map(data,function(item){
        						return { label: item.buildingName, value: item.buildingName, buildingId : item.buildingId }
        					}));
        				},
        				function(){
        					$scope.isSuccess=false;
        				}
        				
        			);
        		}
        	},
        	events:{
        		change:function(event,ui){
        			if(ffc.util.isEmpty(ui.item)){
        				$scope.building=null;
        			}
        		},
        		select:function(event,ui){
        			$scope.building=ui.item;
        			$scope.queryType="queryByBuilding";
        			$scope.objId=ui.item.buildingId;
        		}
        	}
        };
        $scope.resetCommpanyChild=function(){
        	$scope.building=null;
        	$scope.communitys=null;
        };
        $scope.resetBuildingChild=function(){
        	$scope.building=null;
        };
        $scope.queryAcctItemRels=function(){
        	costSettingService.queryAcctItemRels({
        		"inParma":JSON.stringify({"queryType":$scope.queryType,"objId":$scope.objId})
        	},
        		function(data){
        			data=eval("("+data+")");
        			if(data.result=="false"){
        				$scope.isSuccess=false;
        				return false;
        			}
        			$scope.acctItemRels=data.data;
        		},
        		function(){
        			$scope.isSuccess=false;
        		})
        };
        $scope.queryAcctItemRels();
		//查询费用大类
		$scope.queryAcctItemTypeUps=function(){
			if(!ffc.util.isEmpty($scope.acctItemTypeUps)){
				
			}else{
				costSettingService.queryAcctItemType({"inParma":JSON.stringify({"qryType":"top"})},
				function(data){
					data=eval("("+data+")");
					if(data.result=="false"){
						$scope.isSuccess=false;
						return false;
					}
					$scope.acctItemTypeUps=data.data;
					},
					function(){
						$scope.isSuccess=false;
					}
				
				);
			}
		}
		//查询物业细类
		$scope.queryAcctItemType=function(upAcctItemTypeId){
			var acctItemTypeAll="acctItemTypes";
			var acctItemTypeUp="acctItemTypesUp"+upAcctItemTypeId;
			//如果已经通过上级取过下级了就不需要去库里面再取数据，加速界面的加载
			if(!ffc.util.isEmpty($scope[acctItemTypeUp])){
				$scope[acctItemTypeAll]=$scope[acctItemTypeUp];
			}else{
				costSettingService.queryAcctItemType({"inParma":JSON.stringify(
					{"qryType":"","parentAcctItemTypeId":upAcctItemTypeId})
					},
					function(data){
						data=eval("("+data+")");
						if(data.result=="false"){
							$scope.isSuccess=false;
							return false;
						}
						$scope[acctItemTypeAll]=data.data;
						$scope[acctItemTypeUp]=data.data;
					},
					function(){
						$scope.isSuccess=false;
					}
				
				);
			}
		}
		$scope.queryCaculateMethod=function(number){
			costSettingService.queryCaculateMethod({"inParma" : JSON.stringify(
				{"attrCd" : "caculate_method",
				"qryType":"attrCd",
				"communityId" : ""
				})
				},
				function(data){
					data=eval("("+data+")");
					if(data.result=="false"){
						$scope.isSuccess=false;
						return false;
					}
					//计算方法都是一样的时候直接从缓存存取的值返回
//					var caculateMethodAll="caculateMethods"+number;
					$scope.caculateMethods=data.data;
				},
				function(){
					$scope.isSuccess=false;
				}
			);
		}
		$scope.clickOk=function(){
			$scope.acctItemType1;
			$scope.propertyCompany;
			$scope.community;
		}
//		$scope.changeBuildingQryRoom = function (buildingId) {
//			$scope.roomPage = 0;
//			$scope.rooms = [];
//			$scope.queryRoom(buildingId);
//		}
		$(function(){  
		  	$(window).scroll(function() {  
		      //当内容滚动到底部时加载新的内容  
		      if ($(this).scrollTop() + $(window).height() + 20 >= $(document).height() && $(this).scrollTop() > 20) {  
		          //当前要加载的页码 
		    	  if ($scope.buildingUnit && $scope.buildingUnit.buildingId) {
		    		  $scope.queryRoom($scope.buildingUnit.buildingId);
		    	  }
		      }  
		  });
		 $scope.mod=function(acctItemRel){
			 $scope.queryAcctItemTypeUps();
			 $scope.queryAcctItemType(acctItemRel.parentAcctTypeId);
			 $scope.queryCaculateMethod(1);
			 $scope.acctItemRel=acctItemRel;
//			 $scope.acctItemRel={acctItemRelId:acctItemRel.acctItemRelId,
//				 parentAcctTypeId:acctItemRel.parentAcctTypeId,
//				 acctItemTypeId:acctItemRel.acctItemTypeId,
//				 price:acctItemRel.price,
//				 caculateMethod:acctItemRel.caculateMethod};
			 $("#myModal").modal('show');
		 };
		 $scope.onSave = function () {
			 // 保存逻辑
			 // 服务请求
			costSettingService.saveAcctItemRel({"inParma" : JSON.stringify({
					"acctItemRels":[$scope.acctItemRel],
					"isUpdate":"TRUE"
				})},
				function(data) {
					data = eval("(" + data + ")");
					if (data.result=="false") {
						MESSAGE_DIALOG.alert(data.msg);
						return false;
					}
					// 调用成功
					$('#myModal').modal('hide');
					MESSAGE_DIALOG.alert("保存成功");
					$scope.queryAcctItemRels();
					setTimeout(function(){MESSAGE_DIALOG.close()
						},1500);
				},
				function() {
						$scope.isSuccess = false;
					}
				);
		 };
		 //删除
		 $scope.removeAcctItemRel=function(){
			 // 服务请求
			costSettingService.removeAcctItemRel({"inParma" : JSON.stringify({
					"acctItemRels":$scope.acctItemRels,
					"selectAll":$scope.selectAll
				})},
				function(data) {
					data = eval("(" + data + ")");
					if (data.result=="false") {
						MESSAGE_DIALOG.alert(data.msg);
						return false;
					}
					// 调用成功
					MESSAGE_DIALOG.alert("删除成功!");
					$scope.queryAcctItemRels();
					setTimeout(function(){MESSAGE_DIALOG.close()
					},1500);
				},
				function() {
						$scope.isSuccess = false;
					}
				);
	    };
});  
} ]);
