/*
 * 
 */

//정규식
let regId 		= /^[a-zA-Z0-9]{4,12}$/; 
let regPass 	= /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$/;
let regName		= /^[가-힣a-zA-Z]{2,18}$/;
let regHp 		= /^\d{3}-\d{3,4}-\d{4}$/;
let regCompany 	= /([(]주[)])/;
let regCorpReg 	= /^\d{3}-\d{2}-\d{5}$/;
let regTelFax 	= /^\d{2,3}-\d{3}-\d{4}$/;

// 폼 데이터 검증 결과 상태변수
let checkUid = false;
let checkPass = false;
let checkName = false;
let checkHp = false;
let checkCeo = false;
let checkTel = false;
let checkFax = false;
let checkManager = false;


//이메일
let checkEmail = false;
let receivedCode = 0;

$(function(){
	
	/*****************
		필수 정보 입력
	****************/
	//ID
	$('#btnCheckUid').click(function(){
		checkUid = false;
		let uid = $('input[name=km_uid]').val();
		if(!uid.match(regId)){
			$('.uidResult').css('color','red').text('영문, 숫자로 4~12자까지 설정해주세요.');
			return;
		}
		$.ajax({
			url: '/Kmarket1/member/checkUid.do',
			method: 'POST',
			data: {"uid": uid},
			dataType: 'json',
			success: function(data){
				if(data.result > 0){
					$('.uidResult').css('color','red').text('이미 사용중인 아이디입니다.');
				}else{
					$('.uidResult').css('color','green').text('사용 가능한 아이디입니다.');
					checkUid = true;
				}
			}
		});
	});
	$('input[name=km_uid]').keydown(function(){
		checkUid = false;
	});
	
	//Password
	$('.checkPass').focusout(function(){
		checkPass = false;
		let pass1 = $('input[name=km_pass1]').val();
		let pass2 = $('input[name=km_pass2]').val();
		
		if(pass1 == pass2){
			if(pass1.match(regPass)){
				$('.passResult').css('color','green').text('비밀번호가 일치합니다.');
				checkPass = true;
			}else{
				$('.passResult').css('color','red').text('영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해주세요.');
			}
		}else{
			$('.passResult').css('color','red').text('비밀번호가 일치하지 않습니다.');
		}
	});
	
	
	/*****************
		기본 정보 입력
	****************/
	//name
	$('input[name=km_name]').focusout(function(){
		checkName = false;
		let name = $('input[name=km_name]').val();
		
		if(name.match(regName)){
			$('.nameResult').css('color','green').text('');
			checkName = true;
		}else{
			$('.nameResult').css('color','red').text('한글, 영문으로 2~18자까지 입력 가능합니다.');
		}
	});
	$('input[name=km_name]').keydown(function(){
		checkName = false;
	});
	
	//hp
	$('input[name=km_hp]').focusout(function(){
		checkHp = false;
		let hp = $('input[name=km_hp]').val();
		
		if(hp.match(regHp)){
			$('.hpResult').css('color','green').text('');
			checkHp = true;
		}else{
			$('.hpResult').css('color','red').text('올바른 번호를 사용해주세요.');
		}
	});
	$('input[name=km_hp]').keydown(function(){
		checkHp = false;
	});
	
	/*****************
		판매자 정보 입력
	****************/
	//name
	$('input[name=kms_name]').focusout(function(){
		checkName = false;
		let name = $('input[name=kms_name]').val();
		
		if(name.match(regName)){
			$('.nameResult').css('color','green').text('');
			checkName = true;
		}else{
			$('.nameResult').css('color','red').text('한글, 영문으로 2~18자까지 입력 가능합니다.');
		}
	});
	$('input[name=kms_name]').keydown(function(){
		checkName = false;
	});
	
	//company
	$('input[name=kms_company]').focusout(function(){
		checkCompany = false;
		let company = $('input[name=kms_company]').val();
		
		if(company.match(regCompany)){
			$('.companyResult').css('color','green').text('');
			checkCompany = true;
		}else{
			$('.companyResult').css('color','red').text(' - (주)포함 입력, 예) (주)케이마켓');
		}
	});
	$('input[name=kms_company]').keydown(function(){
		checkCompany = false;
	});
	
	//ceo
	$('input[name=kms_ceo]').focusout(function(){
		checkCeo = false;
		let ceo = $('input[name=kms_ceo]').val();
		
		if(ceo.match(regName)){
			$('.ceoResult').css('color','green').text('');
			checkCeo = true;
		}else{
			$('.ceoResult').css('color','red').text(' - 한글, 영문으로 2~18자까지 입력 가능합니다.');
		}
	});
	$('input[name=kms_ceo]').keydown(function(){
		checkCeo = false;
	});
	
	//corpReg
	$('input[name=kms_corpReg]').focusout(function(){
		checkCorpReg = false;
		let corpReg = $('input[name=kms_corpReg]').val();
		
		if(corpReg.match(regCorpReg)){
			$('.corpRegResult').css('color','green').text('');
			checkCorpReg = true;
		}else{
			$('.corpRegResult').css('color','red').text(' - 표시 포함 12자리 입력, 예) 123-45-67890');
		}
	});
	$('input[name=kms_corpReg]').keydown(function(){
		checkCorpReg = false;
	});
	
	//tel
	$('input[name=kms_tel]').focusout(function(){
		checkTel = false;
		let tel = $('input[name=kms_tel]').val();
		
		if(tel.match(regTelFax)){
			$('.telResult').css('color','green').text('');
			checkTel = true;
		}else{
			$('.telResult').css('color','red').text('  - 표시 포함, 지역번호 포함, 예) 02-234-1234');
		}
	});
	$('input[name=kms_tel]').keydown(function(){
		checkTel = false;
	});
	
	//fax
	$('input[name=kms_fax]').focusout(function(){
		checkFax = false;
		let fax = $('input[name=kms_fax]').val();
		
		if(fax.match(regTelFax)){
			$('.faxResult').css('color','green').text('');
			checkFax = true;
		}else{
			$('.faxResult').css('color','red').text('  - 표시 포함, 지역번호 포함, 예) 02-234-1234');
		}
	});
	$('input[name=kms_fax]').keydown(function(){
		checkFax = false;
	});
	
	//manager
	$('input[name=kms_manager]').focusout(function(){
		checkManager = false;
		let manager = $('input[name=kms_manager]').val();
		
		if(manager.match(regName)){
			$('.managerResult').css('color','green').text('');
			checkManager = true;
		}else{
			$('.managerResult').css('color','red').text('한글, 영문으로 2~18자까지 입력 가능합니다.');
		}
	});
	$('input[name=kms_manager]').keydown(function(){
		checkManager = false;
	});
	
	//managerHp
	$('input[name=kms_managerHp]').focusout(function(){
		checkHp = false;
		let managerHp = $('input[name=kms_managerHp]').val();
		
		if(managerHp.match(regHp)){
			$('.managerHpResult').css('color','green').text('');
			checkHp = true;
		}else{
			$('.managerHpResult').css('color','red').text('올바른 번호를 사용해주세요.');
		}
	});
	$('input[name=kms_managerHp]').keydown(function(){
		checkHp = false;
	});
	
	
	/*****************
		이메일
	****************/
	$('#btnSendEmail').click(function(){
		let email = $('input[name=km_email]').val();
		if(email == ''){
			$('.emailResult').text('이메일을 입력해주세요');
			return;
		}
		
		$('.emailResult').text('인증코드 전송 중입니다. 잠시만 기다리세요...');
		
		$.ajax({
			url: '/Kmarket1/member/emailAuth.do',
			method: 'GET',
			data: {"email": email},
			dataType: 'json',
			success: function(data){
				if(data.status > 0){
					//메일전송 성공
					$('.mailFirst').hide();
					$('.mailSecond').show();
					$('.emailResult').text('인증코드를 입력해주세요.');
					receivedCode = data.code;
				}else{
					//메일전송 실패
					$('.emailResult').css('color','red').text('메일 전송에 실패했습니다. 다시 시도해주세요');
				}
			}
		});
	});
	
	//email code check
	$('#btnCheckEmail').click(function(){
		let code = $('input[name=km_email_code]').val();
		if(code == ''){
			alert('이메일 확인 후 코드를 입력해주세요.');
			return;
		}

		if(code == receivedCode){
			$('.mailFirst').show();
			$('.mailSecond').hide();
			$('input[name=km_email]').attr('readonly', true);
			$('.emailResult').css('color','green').text('인증완료 되었습니다.');
			checkEmail = true;
		}
	});
	
	/*****************
		최종 입력 확인
	****************/	
	$('.register > form').submit(function(){
		//폼데이터 유효성 검증(Validation)
		//아이디 검증
		if(!checkUid){
			alert('아이디를 확인 하십시오.');
			return false;
		}
		//비밀번호 검증
		if(!checkPass){
			alert('비밀번호를 확인 하십시오.');
			return false;
		}
		//이름 검증
		if(!checkName){
			alert('이름을 확인 하십시오.');
			return false;
		}
		//이메일 검증
		if(!checkEmail){
			alert('이메일을 확인 하십시오.');
			return false;
		}
		//휴대폰 검증
		if(!checkHp){
			alert('휴대폰을 확인 하십시오.');
			return false;
		}
		//최종 전송
		return true;
	});
	
	$('.registerSeller > form').submit(function(){
		//폼데이터 유효성 검증(Validation)
		//아이디 검증
		if(!checkUid){
			alert('아이디를 확인 하십시오.');
			return false;
		}
		//비밀번호 검증
		if(!checkPass){
			alert('비밀번호를 확인 하십시오.');
			return false;
		}
		//이름 검증
		if(!checkName){
			alert('이름을 확인 하십시오.');
			return false;
		}
		//회사 검증
		if(!checkCompany){
			alert('회사명을 확인 하십시오.');
			return false;
		}
		//대표자 검증
		if(!checkCeo){
			alert('대표자란을 확인 하십시오.');
			return false;
		}
		//사업자번호 검증
		if(!checkCorpReg){
			alert('사업자번호를 확인 하십시오.');
			return false;
		}
		//전화번호 검증
		if(!checkTel){
			alert('전화번호를 확인 하십시오.');
			return false;
		}
		//팩스번호 검증
		if(!checkFax){
			alert('팩스번호를 확인 하십시오.');
			return false;
		}
		//이메일 검증
		if(!checkEmail){
			alert('이메일을 확인 하십시오.');
			return false;
		}
		//대표자 검증
		if(!checkManager){
			alert('담당자를 확인 하십시오.');
			return false;
		}
		//대표자 검증
		if(!checkHp){
			alert('담당자번호를 확인 하십시오.');
			return false;
		}
		
		//최종 전송
		return true;
	});
	
	
	
});