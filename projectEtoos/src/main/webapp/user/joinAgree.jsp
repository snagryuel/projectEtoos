<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통합회원</title>
<link rel="stylesheet" href="/projectEtoos/css/joinAgree.css" type="text/css">
<link rel="stylesheet" href="../css/reset.css" type="text/css">
</head>
<body>

<div id="titleContents">
	<div id="title">
		<p>ETOOS 통합회원</p>
	</div>
	<%@ include file="/common/loginHeader.jsp" %>
</div>



<div id="content">
	<div>
		<div class="logoControl">
			<img class="logo" alt="logo" src="https://img.etoos.com/enp/front/main/2023/web/icon_logo.svg">
		</div>
		<div class="agree">
			<div class="checkElement">
				<div class="ment">
		        <label for="select"><input type="checkbox" id="allCheck" name="allCheck">모두 동의</label>
		        </div>
		    </div>
		    <div class="checkElement open">
		    	<div class="ment">
			        <label for="select2"><input type="checkbox" id="select2" name="esntlCheck1">(필수) 이용약관 동의</label>
		        	<span class="detailAgree"">보기</span>
	        	</div>
	        	<div class="description">
	        		1장 총칙
					제1조 목적
					본 약관은 이투스에듀 주식회사(이하 "회사"라 합니다)가 제공하는 이투스 서비스(www.etoos.com, cheongsol.etoos.com, hyperacademy.etoos.com 이하 "서비스"라 합니다)의 이용과 관련하여 회원의 기본적인 권리와 책임 및 회사와의 중요 사항을 정하는 것을 목적으로 합니다.
					
					제2조 효력 및 적용 등
					(1) 회사는 본 약관의 내용을 회원이 쉽게 알 수 있도록 회원 가입 절차 및 서비스 화면에 게시합니다.
					(2) 본 약관의 내용은 이투스 서비스 사이트(www.etoos.com, cheongsol.etoos.com, hyperacademy.etoos.com 이하 "사이트"라 합니다)에 공지함으로써 효력이 발생합니다. 본 약관에 동의하고 회원 가입을 한 회원은 약관에 동의한 시점부터 동의한 약관의 적용을 받게 되고 약관이 개정된 경우에는 개정 약관의 효력이 발생한 시점부터 변경된 약관의 적용을 받습니다.
					(3) 회사는 약관의 규제에 관한 법률, 전자거래기본법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 소비자보호법 등 관련 법령을 위반하지 않고 회원의 정당한 권리를 부당하게 침해하지 않는 범위 내에서 본 약관을 개정할 수 있습니다.
					(4) 회사가 약관을 변경할 경우에는 적용일자 및 변경사유를 명시하여 현행약관과 함께 서비스 초기 화면에 그 적용일자 10일 이전부터 적용일자 이후 상당한 기간동안 공지합니다. 다만, 회원의 권리 또는 의무에 중요한 규정의 변경은 최소한 30일 전에 공지하고 변경될 약관, 적용일자 및 변경사유를 회원이 등록한 전자우편주소로 발송합니다. 기존 회원에게는 전자우편주소로 발송합니다.
					(5) 회사가 약관 개정 내용을 공지 또는 통지하면서 회원에게 30일 이내에 거부 의사를 표시하지 않으면 의사 표시가 표명된 것으로 본다는 뜻을 공지 또는 통지하였음에도 불구하고 회원이 명시적으로 거부 의사를 표시하지 않으면 회원이 개정 약관에 동의한 것으로 간주합니다.
					
					제3조 약관 외 준칙
					본 약관에 명시되지 않은 사항에 대해서는 관련 법령, 회사가 정한 서비스의 개별 이용 약관, 세부 이용 지침 및 규칙 등의 규정을 따르게 됩니다.
					
					제4조 용어 정의
					본 약관에서 사용하는 용어의 정의는 다음 각 호와 같습니다.
					(1) “회원’이라 함은 사이트에 접속하여 이 약관에 동의함으로써 회사와 서비스 이용계약을 체결하고 이용자 ID(이용자고유번호)와 Password(비밀번호)를 발급 받은 자를 말합니다.
					(2) “이용자 ID”라 함은 회원 식별과 서비스 이용을 위하여 회원이 선정하고 회사가 승인하여 부여하는 문자와 숫자의 조합을 말합니다.
					(3) “PASSWORD(비밀번호)”라 함은 서비스 이용 시 이용자 ID와 일치하는 이용자임을 확인하고, 회원의 개인정보 보호를 위하여, 회원 자신이 설정, 관리하는 문자와 숫자의 조합을 말합니다.
					(4) “회원 정보”라 함은 이용자가 회사와 이용 계약 체결 시 회사에 등록하는 이용자 ID, 성명, 주소 등 이용자의 신상에 관련된 정보를 말합니다.
					(5) “강좌 서비스”라 함은 사이트를 통해 제공되는 강좌 서비스를 말하며 그 이용 등에 관한 구체적인 사항은 본 약관 제15조에 기술된 바와 같습니다.
					(6) “강좌 교재 판매 서비스”라 함은 강좌 서비스 이용을 위해 필요한 강좌교재를 판매하는 서비스를 말하며 그 이용에 관한 구체적인 사항은 본 약관 제15조 제7항에 기술된 바와 같습니다.
					(7) “도서판매 서비스”라 함은 사이트를 통해 회사가 제작한 도서를 판매하는 서비스를 말하며 그 이용 등에 관한 구체적인 사항은 본 약관 제16조에 기술된 바와 같습니다.
					(8) “학습기기 판매 서비스”라 함은 사이트가 각 제조사를 통해 제공되는 학습기기의 판매 서비스를 말하며 그 이용 등에 관한 구체적인 사항은 본 약관 제 17조에 기술된 바와 같습니다.
					(9) “이투스머니”라 함은 회원이 현금, 신용카드 등으로 결제하여 충전하는 사이버머니를 말하며 그 이용 등에 관한 구체적인 사항은 본 약관 제18조에 기술된 바와 같습니다.
					(10) “포인트”라 함은 회원의 서비스 이용에 대한 대가로서 회사가 적립시켜 주는 적립금을 말하며 스터디포인트와 북포인트를 말하며. 그 이용 등에 관한 구체적인 사항은 본 약관 제18조에 기술된 바와 같습니다.
					
					2장 서비스 이용 계약
					제5조 콘텐츠 등에 관한 정보제공 및 이용계약의 성립 등
					(1) 회사는 콘텐츠 이용계약을 체결하기 전에 이용자가 콘텐츠 등에 관하여 정확하게 이해하고, 실수 또는 착오 없이 거래할 수 있도록 다음 각 호에서 규정한 사항을 제공합니다.
					  ① 회사의 대표자의 성명 및 상호
					  ② 회사의 주소, 전화번호, 모사전송번호 및 전자우편주소 등
					  ③ 콘텐츠의 명칭 및 내용
					  ④ 콘텐츠의 가격, 지급방법 및 지급시기
					  ⑤ 콘텐츠의 제공 방법 및 시기
					  ⑥ 청약철회의 행사가능 여부 및 행사의 방법
					  ⑦ 콘텐츠의 교환·반품·보증과 그 대금 환불의 조건 및 절차
					  ⑧ 콘텐츠 이용약관
					  ⑨ 콘텐츠의 이용에 필요한 최소한의 기술사양
					  ⑩ 이용자의 피해보상, 콘텐츠에 대한 불만 및 이용자와 회사 간 분쟁처리에 관한 사항
					  ⑪ 콘텐츠의 가격 이외에 교환·반품비용 등 이용자가 추가로 부담하여야 할 사항이 있는 경우 그 내용 및 금액
					  ⑫ 기타 콘텐츠 이용계약의 체결과 관련하여 필요한 사항
					(2) 이용 계약은 사이트에 가입하고자 하는 자가 회사가 정한 약관에 “동의합니다”를 선택하고, 온라인 신청 양식을 작성하여 서비스 이용을 신청한 후 이용 신청에 대하여 회사가 이를 승낙함으로써 성립합니다.
					
					제 6조 미성년자 회원의 이용계약 취소 등
					(1) 미성년자 회원의 결제는 원칙적으로 부모 등 법정대리인의 동의 하에 이루어져야 하고, 법정대리인은 본인 동의 없이 이루어진 계약을 취소할 수 있습니다.
					(2) 미성년자인 회원이 서비스 대금을 본인 명의로 결제하는 경우, 이용 계약 체결 및 철회 과정에서 법정대리인의 승낙을 증명하는 문서 등을 요구할 수 있으며, 동의 여부를 유·무선 등의 방법을 통하여 확인할 수 있습니다. 다만, 결제가 법정대리인의 명의로 이루어진 경우에는 법정대리인의 동의 하에 이루어진 것으로 간주합니다.
					제7조 이용 신청 시 기재 사항
					회원은 서비스 이용 신청 시 사이트의 회원 가입 화면에서 회사가 요청하는 정보를 온라인 신청서에 기재하여야 합니다.
					
					제8조 이용신청의 승낙 등
					(1) 회사는 회원이 제7조에서 정한 사항을 정확히 기재하고 본 약관에 동의할 경우 서비스의 이용 신청을 승낙합니다.
					(2) 다음 각호의 경우에는 회원의 서비스 이용 신청의 승낙을 유보할 수 있습니다.
					  ① 회사는 회원이 제7조에서 정한 사항을 정확히 기재하고 본 약관에 동의할 경우 서비스의 이용 신청을 승낙합니다.
					  ② 회사는 다음 각호의 경우에는 회원의 서비스 이용 신청의 승낙을 유보할 수 있습니다.
					    1. 기술상 서비스 제공이 불가능한 경우
					    2. 제7조의 기재사항에 허위, 기재누락, 도용, 오기가 있는 경우
					    3. 다른 사람 명의로 이용 신청을 하였을 때
					    4. 이용 신청 시 내용을 허위로 기재 하였을 때
					    5. 이용 신청자가 제19조 제2항에 의하여 이전에 회원자격을 상실한 사실이 있는 경우
					    6. 이용 신청자가 만 14세 미만으로 법정대리인의 동의 절차를 거치지 않은 경우
					  ③ 회사는 회원의 자격에 따라 서비스 이용 범위를 세분화할 수 있습니다.
					
					3장 서비스의 이용
					제9조 서비스의 이용
					(1) 회사는 회원의 서비스 이용 신청을 승낙한 때부터 서비스를 회원에게 제공합니다. 단, 유료 서비스를 포함한 일부 서비스의 경우에는 결제가 완료된 이후 또는 회사에서 별도 지정한 일자로부터 서비스를 개시합니다.
					(2) 회사는 기술상의 장애로 인하여 서비스를 개시 또는 제공하지 못하는 경우에는 사이트에 해당 사실을 공지하거나 회원에게 통지합니다.
					
					제10조 서비스 이용시간
					(1) 서비스의 이용은 연중 무휴 1일 24시간을 원칙으로 합니다. 다만, 시스템 점검, 증설과 교체 및 고장 등의 이유로 회사가 정한 기간에는 서비스가 일시 중지될 수 있습니다. 이경우 회사는 해당 사실을 회원에게 사전 또는 사후에 공지합니다.
					(2) 회사는 서비스를 일정 범위로 분할하여 각 범위 별로 이용 가능한 시간을 별도로 정할 수 있으며 해당 사실을 회원에게 공지합니다.
					
					제11조 서비스 변경 등
					(1) 회사는 서비스가 변경되는 경우 변경되는 서비스 내용 및 제공일자를 사이트를 통하여 공지하거나 회원에게 통지합니다.
					(2) 회사는 다음 각 호에 해당하는 경우 서비스의 이용을 전부 또는 일부 제한하거나 중단할 수 있습니다.
					  1. 서비스용 설비의 확장, 보수 등 공사로 인하여 서비스의 이용이 부득이한 경우
					  2. 회사가 통제할 수 없는 불가피한 사유로 서비스 중단이 필요한 경우
					  3. 서비스 이용량의 폭주 등으로 정상적인 서비스 제공에 지장이 있는 경우
					  4. 새로운 서비스로의 교체 등 회사가 적절하다고 판단하는 경우
					  5. 기타 정전, 천재지변, 국가비상사태 등 불가항력적 사유가 있는 경우
					(3) 회사는 만 14세 미만 아동이 서비스 가입 시 법정대리인의 동의 절차를 거치게 되며, 동의 절차를 거치지 않은 경우 회원 가입을 허락하지 아니하거나 취소할 수 있습니다.
					(4) 회사는 제2항 각 호에 의하여 서비스가 중단되는 경우 회원에게 해당 사실을 사전 통지합니다. 다만 회사가 통제할 수 없는 사유로 인하여 서비스가 중단됨으로써 사전 통지가 불가능한 경우에는 예외로 합니다.
					(5) 회사는 회사의 귀책 사유로 인하여 서비스가 중단되어 회원이 이미 결제한 유료 서비스를 이용할 수 없을 경우에는 당해 유료 서비스의 잔여 기간에 상응하는 유료 서비스 미사용 금액을 회원에게 보상합니다.
					
					제12조 ID 및 PASSWORD 관리
					(1) 회원은 ID 및 PASSWORD를 스스로의 책임 하에 관리하여야 하며, 회사는 회원이 ID 및 PASSWORD의 관리 소홀로 인하여 발생하는 서비스 이용 상의 손해에 대하여 책임을 부담하지 아니하며 제3자의 부정 이용 등에 대한 책임은 모두 회원에게 있습니다.
					(2) 회원은 자신의 ID 및 PASSWORD가 도난 또는 유출되거나 제3자에 의해 부정 사용되고 있음을 인지한 경우에는 해당 사실을 회사에 즉시 통지하여야 합니다.
					
					제13조 회원의 게시물
					(1) 회원은 서비스 내에 게시물(텍스트, 이미지, 파일 등)을 게시할 경우 본 약관 및 게시물 게재 규칙 또는 관련 법령을 준수하여야 합니다.
					(2) 회원은 다음 각 호에 해당하는 게시물을 서비스에 게시하거나 다른 회원에게 전달할 수 없으며 회사는 게시물이 다음 각 호에 해당한다고 판단되는 경우 해당 게시물을 삭제하거나 이동 또는 등록을 거부할 수 있습니다. 또한, 회사는 게시물에 관련된 세부 이용지침을 별도로 정하여 시행할 수 있으며, 회원은 그 지침에 따라 각종 게시물을 등록하거나 삭제하여야 합니다.
					  1. 회사, 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우
					  2. 공공질서 및 미풍양속에 위반되는 내용인 경우
					  3. 범죄 행위에 결부된다고 인정되는 내용인 경우
					  4. 회사의 저작권, 제3자의 저작권 등 타인의 권리를 침해하는 내용인 경우
					  5. 정치적, 종교적 분쟁을 야기하는 경우
					  6. 불필요하거나 승인되지 않은 광고물을 게재하는 경우
					  7. 타인의 개인정보를 도용하거나 사칭하여 작성한 내용 또는 타인이 입력한 정보를 무단으로 위ㆍ변조한 내용인 경우
					  8. 동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우
					  9. 기타 관련 법령 및 회사의 서비스 운영 정책 등에 위반되는 경우
					(3) 본 조 제3항 각 호에 해당하는 게시물을 게재하여 회사로부터 경고를 받은 회원의 경우 다음 각 호의 규정에 따라 서비스 이용이 제한될 수 있습니다.
					  1. 경고 1회: 게시물 삭제, 2주 간 게시물 등록 불가
					  2. 경고 2회: 게시물 삭제, 4주 간 게시물 등록 불가
					  3. 경고 3회: 게시물 삭제, 영구 게시물 등록 불가
					
					제14조 게시물의 저작권 등
					(1) 이용자가 서비스 내에 게시한 게시물의 저작권은 저작권법에 의해 보호를 받습니다. 회사가 작성한 저작물에 대한 저작권 기타 지적재산권은 회사가 보유합니다.
					(2) 이용자는 자신이 게시한 게시물을 회사가 국내외에서 다음 각 호의 목적으로 사용하는 것을 허락합니다.
					  1. 서비스 내에서 이용자 게시물의 복제, 전송, 전시, 배포 및 우수 게시물을 서비스 화면에 노출하기 위하여 이용자 게시물의 크기를 변환하거나 단순화하는 등의 방식으로 수정하는 것
					  2. 회사에서 운영하는 관련 사이트의 서비스 내에서 이용자 게시물을 전시ㆍ배포하는 것. 다만 회원이 전시, 배포에 동의하지 아니할 경우 회사는 관련 사이트의 서비스 내에서 당해 회원의 게시물을 전시, 배포하지 않습니다.
					  3. 회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 이용자의 게시물 내용을 보도, 방영하게 하는 것. 다만 이 경우 회사는 회원의 개별 동의 없이 미디어, 통신사 등에게 게시물 및 개인정보를 제공하지 않습니다.
					(3) 회사는 제2항에도 불구하고, 회사가 이용자의 게시물을 제2항 각 호에 기재된 목적 이외에 상업적 목적(예 : 제3자에게 게시물을 제공하고 금전적 대가를 지급받는 경우 등)으로 사용할 경우에는 사전에 해당 이용자로부터 동의를 받습니다. 이 경우 게시물에 대한 회사의 사용 요청, 이용자의 동의 및 동의 철회는 전화, 전자우편, 팩스 등 회사가 요청하는 방식에 따르며, 회사는 게시물의 출처를 표시하며 게시물의 사용에 동의한 해당 이용자에게 별도의 보상을 제공합니다.
					(4) 회원이 탈퇴를 하거나 제19조 제2항에 의하여 회원 자격을 상실한 경우에 본인 계정에 기록된 게시물은 삭제됩니다. 다만 제3자에게 의하여 스크랩, 펌, 담기 등으로 다시 게시된 게시물과 공용 서비스 내에 기록된 게시물 등 다른 이용자의 정상적인 서비스 이용에 필요한 게시물은 삭제되지 않습니다.
					(5) 회사는 서비스 운영 정책 상 필요한 경우로써 서비스를 회사가 운영하는 다른 서비스 또는 사이트와 통합하는 경우 게시물을 회사가 운영하는 다른 서비스 또는 사이트로 이전하거나 게재 위치를 변경하여 서비스할 수 있으며, 게시물의 이전 또는 게재 위치의 변경이 있는 경우에는 해당 사실을 사전 공지합니다.
					
					제15조 강좌 서비스 이용관련
					(1) 회원은 회사가 제공하는 강좌 서비스를 이용할 수 있습니다.
					(2) 회사는 강좌 서비스를 유료로 제공할 수 있으며 이 경우 이용 요금과 이용 조건, 결제 방법 등은 회사가 별도 고지하는 절차에 따릅니다.
					(3) 회사는 회원이 강좌 서비스의 수강을 시작하는 경우 회원이 신청한 강좌 서비스를 즉시 이용할 수 있도록 합니다.
					(4) 회사는 강좌 서비스와 관련하여 필요한 경우 별도의 동영상 재생 프로그램이나 어플리케이션 등 설치를 요구할 수 있으며, 회사는 그 이용 조건 등을 설치 시 회원에게 별도 고지합니다.
					(5) 회원은 강좌 서비스에 대하여 수강 기간 내 2회까지 강좌 서비스의 일시 정지를 신청할 수 있으며, 1회에 한하여 최대 10일의 기간까지 신청 가능합니다. 다만, 일시 정지 기간이 경과한 경우에는 강좌 서비스가 자동으로 재개됩니다.
					(6) 회원은 다음 각호에서 정한 기간과 횟수에 따라 강좌 서비스 이용기간 연장 신청을 할 수 있으며, 이용기간 연장에 대한 결제수단은 이투스머니, 스터디포인트, 북포인트로 결제 가능합니다.
					  1. 수강 기간 내(~수강 종료일까지): 최대 3회까지 신청 가능하며, 1회당 최대 5일까지만 연장할 수 있습니다. 해당 경우, 일반강좌는 1일 기준으로 500원(또는 포인트)을 사용하게 되며, 패키지 강좌는 1일 기준으로 1,000원(또는 포인트)을 사용하게 됩니다.
					  2. 수강 기간 후(최초 수강 종료일 이후 30일 이내): 1회 신청가능하며, 최대 7일까지만 연장할 수 있습니다. 해당 경우, 일반강좌는 1일 기준으로 1,000원(또는 포인트)을 사용하게 되며, 패키지 강좌는 1일 기준으로 1,500원(또는 포인트)을 사용하게 됩니다.
					(7) 회원은 강좌 서비스 수강에 필요한 교재를 해당 강좌 신청 시에 한하여 구매할 수 있으며, 회사는 회원에게 교재만 별도 판매하지 않습니다.
					
					제16조 도서 판매 서비스 등
					(1) 회원은 회사가 제작한 도서를 구매할 수 있으며, 회사는 회원에게 판매하는 도서 판매 서비스를 제공할 수 있습니다.
					(2) 회사는 회원이 구매 신청한 도서를 품절 등의 사유로 회원에게 제공할 수 없을 경우에는 지체 없이 해당 사유를 회원에게 통지하고 환불 등의 필요한 조치를 취합니다.
					(3) 회사는 회원이 도서 구매 신청을 할 경우 배송 수단, 배송 비용 부담자, 배송기간 등을 신청 화면을 통하여 회원에게 제공합니다. 이와 관련하여 회사의 귀책사유로 인하여 배송 기간을 경과하여 이용자에게 손해가 발생한 경우 회사는 회원에게 발생한 손해 전부를 배상합니다.
					(4) 회원은 도서를 배송 받은 날부터 7일 이내에는 당해 도서를 반품 또는 교환할 수 있습니다. 다만, 다음 각 호의 1에 해당하는 경우 도서를 반품 또는 교환을 할 수 없습니다.
					  1. 이용자에게 책임 있는 사유로 도서가 멸실 또는 훼손된 경우(다만, 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)
					  2. 회원의 사용 또는 일부 소비에 의하여 도서의 가치가 현저히 감소한 경우
					  3. 시간의 경과에 의하여 재판매가 곤란할 정도로 도서 등의 가치가 현저히 감소한 경우
					  4. 같은 성능을 지닌 도서 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
					(5) 회사는 도서의 배송을 위하여 필요한 최소한의 이용자의 개인 정보(성명, 주소, 전화번호)를 배송업체에 제공할 수 있습니다. 다만 이 경우 회사는 제공 목적, 제공 업체명, 제공 항목 등 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 관련 법령에 따른 동의 절차를 이행하며, 회사는 이용자의 개인 정보에 대한 처리나 보호 및 관리에 대한 사항을 배송업체와의 계약에 명시합니다.
					
					제 17조 학습기기 판매 서비스 등
					(1) 회사는 사이트를 통하여 PMP, 전자사전 등의 학습 기기(이하 ‘학습기기’라 합니다) 판매 서비스를 회원에게 제공할 수 있습니다. 이 경우 학습 기기의 배송ㆍ교환ㆍ환불에 대한 사항은 해당 학습기기의 제조사의 기준에 따르기로 하며, 회사는 관련 내용을 사이트 화면에 안내합니다.
					(2) 회사는 학습기기의 배송과 관련한 개인정보에 대하여 제16조 제5항을 준용합니다.
					
					제18조 이투스머니 및 포인트 적립 및 이용 등
					(1) 회원은 이투스머니를 신용카드 결제, 실시간 계좌 이체 및 기타 회사가 별도 지정하는 방법을 이용하여 직접 충전할 수 있습니다.
					(2) 회원은 스터디포인트를 회원의 강좌 서비스 이용, 강좌 서비스 교재 구입, 기타 회사가 진행하는 이벤트 응모 등을 통하여 적립할 수 있습니다.
					(3) 회원은 북포인트를 회사의 출판물을 사이트를 통하여 구매할 경우 적립할 수 있습니다.
					(4) 이투스머니, 스터디포인트, 북포인트는 사이트 내에서 1포인트 당 현금 1원에 상응하는 가치가 있습니다. 다만, 동 가치는 회사의 정책에 따라서 변경될 수 있습니다.
					(5) 회사는 스터디포인트와 북포인트의 적립 여부 및 적립율을 서비스 화면에 별도 고지합니다.
					(6) 스터디포인트와 북포인트는 상호 전환되지 않으며 중복 적립되지 않으며, 회사는 회원에게 적립되는 포인트의 종류 및 포인트를 서비스 화면 등을 통하여 회원에게 제공합니다.
					(7) 이투스머니는 사이트 내 모든 유료 서비스 결제 시 사용 가능하며, 스터디포인트는 강좌 구매, 강좌 수강 기간 연장 시 사용 가능하며, 북포인트는 강좌구매, 교재구매, 도서구매 및 강좌 수강 기간 연장 시 사용 가능합니다. 다만, 각각의 사용 용도는 회사의 정책에 따라 변경될 수 있습니다.
					(8) 이투스머니, 스터디포인트, 북포인트는 타인에게 양도되거나 대여 또는 담보의 목적으로 이용되거나 제공될 수 없습니다.
					(9) 회사는 위법ㆍ부당한 방법에 의하여 회원에게 이투스머니가 결제되거나, 스터디포인트, 북포인트, 이투스 할인권이 적립된 경우 결제된 금액 또는 적립된 스터디포인트, 북포인트, 이투스 할인권에 대하여 결제 또는 적립을 취소할 수 있습니다.
					(10) 회사는 이투스머니의 1회 충전 한도, 동일한 신용카드를 이용한 충전 가능 횟수, 일정 기간 동안의 총 충전 금액 한도 등에 대해 별도 제한을 할 수 있습니다. 이 경우 회사는 해당 사실을 회원에게 공지합니다.
					(11) 회사는 이투스머니, 스터디포인트, 북포인트를 각각 적립된 시점이 앞선 부분부터 차감합니다.
					(12) 회사는 이투스머니, 스터디포인트, 북포인트를 종료할 경우, 해당 사실을 회원에게 30일 전에 공지합니다.
					(13) 회사는 회원이 현금으로 결제한 이투스머니에 대해서는 서비스 종료 또는 회원 탈퇴 시 미사용한 이투스머니를 회원에게 전액 현금 환불합니다.
					
					제 19조 불법 사용 규제 관련
					(1) 회사는 다음 각 호에 해당하는 경우 회원에게 경고 등 주의 조치를 취할 수 있으며, 필요한 경우 이용계약을 해지하거나 서비스 이용을 중지시키는 등 서비스 이용에 제한을 가할 수 있습니다.
					  1. 동일한 ID로 2대 이상의 PC에서 동시접속이 발생하는 경우
					  2. 동일한 ID로 다수의 PC 또는 IP에서 서비스를 이용하는 경우
					  3. 자신의 ID 및 강좌 등의 서비스를 타인이 이용하도록 하는 경우
					  4. 자신의 ID 및 강좌 등의 서비스를 타인에게 판매, 대여, 양도하는 행위 및 이를 광고 하는 행위
					  5. 서비스 이용 중, 복제프로그램을 실행하는 경우 또는 녹화를 하거나 시도하는 경우
					(2) 회사는 전항에 따른 부정 이용자가 발견 되었을 경우, 다음 각호에 따른 조치를 취할 수 있습니다.
					  1. 부정 이용자 최초 적발 시 쪽지, 팝업 창, ID 일부 게시의 방법을 통하여 경고합니다. 이때, 7일 이내에 본인 및 보호자 [법정대리인]가 가족관계를 확인할 수 있는 주민등록등본(본인의 경우 신분증)을 첨부하여 소명 자료를 제출할 수 있습니다.
					  2. 부정 이용자가 최초 경고를 받은 후 7일 이내 소명자료를 제출하지 않거나, 이미 소명 경험이 있는 이용자가 부정 이용자로 추가 적발된 경우 쪽지, 팝업 창, ID 일부 게시의 방법을 통하여 위반 내용이 통지되며, 수강 영구 차단 조치됩니다. 단, 자신의 ID 및 강좌 등의 서비스를 판매ㆍ양도하는 행위와 시도, 복제 프로그램을 활용한 녹화 행위와 시도가 적발되었을 경우 수강 차단 처리 후 경고 진행되며 법적 조치가 취해질 수 있습니다.
					(3) 회원은 전항 제2호의 조치를 이유로, 서비스 이용기간의 연장을 요구할 수 없습니다.
					(4) 회원은 회사로부터의 본 조 제2항의 조치에 이의가 있는 경우, 회사 고객센터 또는 부정 사용관리센터에 해당사실에 대해 소명할 수 있으며, 그에 따라 이용에 관한 별도의 조치를 받을 수 있습니다. 이 경우 회원이 자신의 고의나 과실이 없었음을 입증한 경우 회사는 서비스 제공 정지기간만큼 이용기간을 연장합니다.
					(5) 부정이용 식별방법 및 차단
					  1. 회사는 회원의 서비스 이용 중에 수집ㆍ확인된 맥어드레스, 디바이스 정보 및 IP정보 등의 자료를 토대로, 서버를 통하여 부정이용 여부를 분류ㆍ확인합니다.
					  2. 회사는 이용자가 서비스 이용 중에 복제프로그램을 실행시키거나 동일한 ID로 동시 접속을 하는 경우, 서비스 이용 접속을 강제로 종료 시킵니다.
					
					4장 서비스 환불
					제 20조 청약철회
					(1) 교재 및 재화 등을 공급받은 날로부터 7일 이내에 전화 등으로 청약철회가 가능합니다. 다만, 재화 등의 내용이 회사가 표시·광고한 내용과 다르거나 계약내용과 다르게 이행된 경우에는 그 재화 등을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회가 가능합니다.
					(2) 회원이 재화 등의 청약철회를 하는 경우 회사에 공급받은 재화를 반환하여야 하며, 회사는 재화 등을 반환받은 날부터 3영업일 이내에 이미 지급받은 대금을 환불합니다.
					(3) 청약철회 시 재화 등이 일부 소비된 경우에는 해당 금액을 공제하고 환불하며, 반환에 필요한 비용은 회원이 부담해야 합니다.
					(4) 다음 각호의 경우에는 회원의 청약철회가 제한됩니다.
					  ① 회원의 책임있는 사유로 재화 등이 멸실되거나 훼손된 경우. 다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외됩니다.
					  ② 회원의 사용 또는 일부 소비로 재화 등의 가치가 현저히 감소한 경우
					  ③ 시간이 지나 다시 판매하기 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
					  ④ 복제가 가능한 재화 등의 포장을 훼손한 경우
					
					제 21조 강좌 서비스 환불
					(1) 회사는 강좌 서비스에 대하여 원칙적으로 다음과 같은 환불규정을 적용합니다.
					(2) 회사는 회원이 강좌서비스의 환불을 하고자 하는 경우 회사에 그 의사를 표시하여야 하며, 회사는 환불요청을 즉시 접수하고 회원의 요청과 환불규정을 확인한 후, 5일 이내 환불합니다.
					(3) 강좌서비스를 환불할 경우, 해당 강좌의 교재 및 학습기기가 포함되었을 경우 함께 반납하여야 합니다.
					(4) 기간제 정액상품, 이벤트 강좌 등의 상품은 별도의 수강 취소, 변경 및 환불규정이 적용될 수 있으며, 자세한 내용은 회사 웹사이트 및 고객센터를 통해 확인할 수 있습니다.
					(5) PMP등 학습기기로 강의를 저장한 경우, 이는 실제 수강한 것으로 간주되어 저장한 부분만큼 공제한 후 환불 됩니다. 학습기기가 강좌 서비스 구매 시 제공된 제화인 경우 반드시 반납하여야 하며, 개인 소유의 학습기기일 경우 기기 내 저장되어 있던 강의를 삭제하여야 하며, 기기의 분실, 고장 등으로 인하여 강의의 삭제가 불가능할 경우에는 별도의 환불규정이 적용될 수 있습니다.
					(6) 환불 요청 시 추가적인 혜택(할인, 수강연장, 사은품, 포인트, 배송료 등)은 철회 및 반환 되어야 하며 사용되었거나 상품가치가 감소했을 경우 회원이 해당 금액을 부담합니다.
					
					구분	반환사유 발생일	반환금액
					학원의 교습정지, 자진폐원, 등록말소 등	교습을 할 수 없거나 교습장소를 제공할 수 없게 된 날	이미 납부한 교습비 등을 일할 계산한 금액
					회원이 본인의 의사로
					수강을 포기한 경우	교습기간 이 1개월 이내인 경우	교습시작 전	이미 납부한 교습비 등의 전액
					총 교습시간의 1/3 경과 전	이미 납부한 교습비 등의 2/3에 해당하는 금액
					총 교습시간의 1/2 경과	이미 납부한 교습비 등의 1/2에 해당하는 금액
					총 교습시간의 1/2 경과 후	반환하지 않음
					교습기간이 1개월을 초과하는 경우	교습 시작 전	이미 납부한 교습비 등의 전액
					교습 시작 후	반환사유가 발생한 해당 월의 반환대상 교습비 등 (교습기간이 1개월 이내인 경우의 기준에 따라 산출한 금액을 말한다)과 나머지 월의 교습비 등의 전액을 합산한 금액
					비고	1. 총 교습시간은 교습기간 중의 총 교습시간을 말하며, 반환 금액의 산정은 반환사유가 발생한 날까지 경과된 교습시간을 기준으로 한다.
					2. 원격교습의 경우 반환금액은 교습내용을 실제 수강한 부분(인터넷으로 수강하거나 학습기기로 저장한 것을 말한다)에 해당하는 금액을 뺀 금액으로 한다.
					(7) 회원이 간편결제를 통한 상품주문 혜택으로 간편결제사의 포인트를 지급받고, 결제일로부터 29일을 초과하여 환불을 요청하는 경우, 회사는 회원이 혜택으로 지급받은 간편결제사의 포인트에 상응하는 금액을 차감한 후, 잔여 금액만을 회원에게 환불합니다.
					
					제22조 도서 출판 서비스 환불
					(1) 회사는 도서 출판 서비스의 경우 회원이 기결제한 수단을 통해 환불 처리하는 것이 원칙입니다. 다만, 회사는 회원이 도서 반환을 완료한 이후 환불 처리를 하며 회원이 미성년자인 경우에는 환불 시 법정대리인의 동의를 거쳐 환불을 합니다.
					(2) 회사는 회원의 단순 변심으로 인하여 도서를 반품하거나 교환을 요청하는 경우에는 회원이 도서의 반환 등에 필요한 비용을 부담합니다. 다만 회사에 귀책 사유가 있는 경우에는 회사가 비용 전부를 부담합니다.
					(3) 회원이 간편결제를 통한 도서 상품 주문건에 대하여 환불을 요청하는 경우, 회사는 본 약관 제21조 제7항의 내용을 준용하여 처리합니다.
					
					제23조 학습기기 서비스 환불
					(1) 회사는 이투스를 통하여 구매한 학습기기에 대한 환불과 관련하여 학습기기가 미개봉된 경우에 한해 회원이 배송 완료 후 7일 이내 환불 의사를 표시하여야 하며, 이 경우 회사는 해당 학습기기의 반송이 완료된 후 회원에게 환불 조치를 합니다.
					(2) 회사는 회원이 학습기기 패키지 상품에 대하여 환불을 요청하는 경우에는 패키지로 구성된 전체 상품을 대상으로 환불이 가능하며, 패키지 상품 혜택을 회원이 이미 사용한 경우에는 해당 혜택에 상응하는 금액을 제외한 차액을 회원에게 환불합니다.
					(3) 회사는 이투스 고객센터 및 제조사 고객센터와 사전에 협의되지 않은 학습기기에 대해서는 반송을 거절할 수 있습니다.
					(4) 회원이 간편결제를 통한 학습기기 상품 주문건에 대하여 환불을 요청하는 경우, 회사는 본 약관 제21조 제7항의 내용을 준용하여 처리합니다.
					
					제24조 이투스머니 및 포인트의 환불
					(1) 회사는 사이트 또는 서비스 종료 등을 이유로 회원이 이투스머니의 환불을 요청하는 경우 이를 회원에게 현금으로 환불 처리합니다.
					(2) 회사는 스터디포인트, 북포인트를 회원에게 현금으로 환불하지 않으며, 회원은 적립일로부터 1년 간 사용이 가능합니다. 만약 회원이 사용 가능 기간 동안 이를 사용하지 않은 경우에는 자동 소멸됩니다.
					(3) 회사는 회원이 서비스를 탈퇴할 경우 이투스머니 미사용 금액을 확인할 수 있도록 필요한 조치를 취하며, 이투스머니 미사용 금액이 있는 경우 회원은 회사가 별도로 정한 절차에 따라 이투스머니의 환불을 신청할 수 있습니다. 이 경우 회사는 해당 회원에게 미사용한 이투스머니 잔액을 현금으로 환불 처리해 드립니다.
					
					제25조 과오금의 환급
					(1) 회원이 교습비 및 대금 등을 결제함에 있어서 과오금을 지급한 경우 회사는 대금결제와 동일한 방법으로 과오금을 환불합니다. 다만, 동일한 방법으로 과오금의 환불이 불가능할 때에는 즉시 이를 고지하고, 회원이 선택한 방법으로 환불합니다.
					(2) 회사의 책임있는 사유로 과오금이 발생한 경우 회사는 계약비용·수수료 등에 관계없이 과오금 전액을 환불합니다. 다만, 회원의 책임있는 사유로 과오금이 발생한 경우 회사는 과오금을 환불하는데 소요되는 비용을 합리적인 범위 내에서 공제하고 환불할 수 있습니다.
					
					5장 계약당사자의 의무
					제 26조 회사의 의무
					(1) 회사는 관련 법령 및 본 약관이 금지하거나 미풍 양속에 반하는 행위를 하지 않으며, 본 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는데 최선을 다하여야 합니다.
					(2) 회사는 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 손상된 경우에는 부득이한 사유가 없는 한 이를 지체 없이 수리 또는 복구합니다.
					(3) 회사는 회원의 개인정보 보호와 안전한 서비스 제공을 위하여 보안시스템을 구축합니다.
					(4) 회사는 회원의 개인정보를 본인의 동의 없이 제3자에게 유출하거나 누설하지 않습니다. 다만, 적법한 절차를 거친 국가기관의 요구나 수사상 또는 기타 공익을 위하여 필요하다고 인정되는 경우는 예외로 합니다. 회사는 관련법령이 정하는 바에 따라서 회원 등록 정보를 포함한 회원의 개인정보를 보호하기 위하여 노력하며 회원의 개인정보보호에 관해서는 관련 법령 및 회사가 정하는 "개인정보처리방침/청소년보호정책"에 정한 바에 의합니다.
					(5) 회사는 이용자로부터 서비스 이용과 관련되어 제기되는 의견이나 불만이 정당하다고 인정되는 경우 이를 즉시 처리하여야 합니다. 다만, 즉시 처리가 어려운 경우 이용자에게 그 사유와 처리 일정을 통보합니다.
					
					제 27조 회원의 의무
					(1) 회원은 서비스와 관련한 권리 및 의무를 타인에게 양도, 증여하거나 이를 담보로 제공할 수 없습니다.
					(2) 회원은 서비스 이용 시 다음 각 호에 해당하는 행위를 하여서는 아니 됩니다.
					  1. 회원이 서비스 이용 신청 또는 변경 시 허위 사실을 기재하거나, 본인 또는 다른 회원의 ID 및 개인정보를 이용하거나 공유하는 경우
					  2. 회원이 회사가 제공하는 서비스를 통하여 얻은 정보를 상업적 목적으로 이용하거나 무단으로 출판, 방송, 복제, 전송, 공유 등을 하는 경우
					  3. 회원이 저작권 등 제3자의 권리를 침해하는 경우
					  4. 회원이 서비스를 이용하여 상품 또는 용역을 판매하는 등 영업 활동을 하는 경우
					  5. 회원이 회사의 사이트 또는 서비스 운영 또는 다른 회원의 사이트 또는 서비스 이용을 방해하는 경우
					  6. 회원이 회사의 운영진이나 직원을 사칭하는 경우
					  7. 회원이 공서양속을 저해하는 부호, 문자, 음성, 음향 및 영상 등의 정보를 제3자에게 유포시키는 경우
					  8. 회원이 이투스머니, 스터디 포인트, 북포인트 등을 제3자와 유상 거래하거나 현금으로 전환하는 경우
					(3) 회원은 서비스의 이용을 위해 본인의 개인 정보를 직접 관리하여야 하며 제 7조의 등록 사항에 변경이 있을 경우 회사가 제공하는 서비스 내의 개인정보 수정 페이지를 통하여 변경 사항을 즉시 수정하여야 합니다.
					
					6장 계약해지 및 이용제한
					제 28조 계약해지 및 이용제한
					(1) 회원은 회사가 제공하는 서비스 내의 회원 탈퇴 기능, 전화 등을 통하여 언제라도 서비스 탈퇴를 요청할 수 있습니다. 이 경우 회사는 제 11조 제2항 각호와 같은 불가피한 사정이 없는 한 회원의 탈퇴 요청을 지체 없이 처리합니다.
					(2) 회사는 회원이 관련 법령 또는 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우, 당해 회원에게 해당 사실을 통지한 후, 서비스 이용 권한을 일정 기간 제한하거나 이용 권한을 박탈할 수 있습니다. 다만, 회사는 회원에게 시정 또는 소명 기회를 부여합니다. 회원의 이의신청이 정당한 경우 회사는 즉시 회원이 서비스를 이용할 수 있도록 필요한 조치를 취하고 정지한 기간만큼 이용기간을 연장합니다.
					
					제 29조 양도 금지 등
					(1) 회원은 서비스 이용 권한이나 이용 계약상 지위를 타인에게 양도하거나 증여할 수 없으며 게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원 본인에게 있습니다.
					(2) 회사는 서비스 또는 사이트가 제3자에게 합병ㆍ분할 되거나 제3자에게 양도하는 등 서비스 또는 사이트의 운영ㆍ제공 주체가 변경되는 경우, 해당 사실을 회원에게 사전 통지합니다.
					
					7장 손해배상 등
					제 30조 손해배상
					(1) 회사는 고의 또는 중대한 과실에 의하여 회원에게 손해를 입힌 경우 그 손해를 배상할 책임이 있습니다.
					(2) 회사는 시스템 점검, 증설과 교체 등 회사가 정한 기간 외에 고의 또는 중대한 과실로 예고 없이 서비스가 일시 중단될 경우 유료 서비스 이용기간을 연장하는 방법으로 회원에게 보상합니다.
					(3) 회사는 회원이 결제한 유료 서비스를 이용할 수 없는 경우, 해당 유료 서비스의 복원, 교환 또는 환불 조치 합니다.
					(4) 회사는 회원이 서비스를 이용함에 있어 관련 법령 내지 본 약관을 위반함으로 인하여 회사 또는 제3자에게 손해가 발생하거나 제3자로부터 회사가 손해배상청구 또는 각종 소(이의) 제기를 받는 경우, 당해 회원은 회사에 발생하는 손해를 배상하여야 합니다.
					
					제 31조 면책사항
					(1) 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
					(2) 회사는 회원의 귀책사유로 인한 서비스의 이용 장애에 대하여 책임을 지지 않습니다.
					(3) 회사는 회원이 회사의 서비스로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
					(4) 회사는 제3자가 사이트에 저장, 게시 또는 전송한 정보ㆍ자료ㆍ사실의 신뢰도 및 정확성 등 내용에 대하여는 책임을 지지 않습니다.
					(5) 회사는 사이트에 입점 및 연결되어 있는 제3자의 웹사이트(이하 '링크 사이트'라 합니다)가 있는 경우, 회원이 링크 사이트를 이용함에 따라 발생하는 문제에 대하여는 책임을 지지 않습니다.
					
					제 32조 분쟁의 해결
					(1) 회사는 회원이 제기하는 의견이나 불만에 대하여 적절하고 신속하게 처리하고, 그 결과를 통지합니다. 다만, 신속한 처리가 곤란한 경우에 회사는 회원에게 그 사유와 처리 일정을 통보합니다.
					(2) 회사는 회원이 제기한 의견 등이 정당하지 않음을 이유로 처리하지 않은 경우 이의 사유를 통보합니다.
					(3) 회사와 회원 사이에 분쟁이 발생한 경우 회사 또는 회원은 콘텐츠산업진흥법 제 29조에서 정하고 있는 콘텐츠분쟁조정위원회에 분쟁조정을 신청할 수 있습니다.
					
					제 33조 재판관할
					(1) 회사와 회원간의 서비스 이용계약에 관한 소송은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다.
					(2) 제소 당시 회원의 주소 또는 거소가 분명하지 아니한 경우에 회사와 회원간의 서비스 이용계약에 관한 소송에 과한 관할법원은 민사소송법에 따라 정합니다.
					
					(부칙) 본 이용약관은 2023년 4월 17일부터 적용되고, 종전 약관은 본 약관으로 대체됩니다. 또한 개정된 이용약관의 적용일자 이전 가입자 또한 개정된 이용약관의 적용을 받습니다.
					
					[개정사항]
					공고일자 : 2023년 4월 07일
					시행일자 : 2023년 4월 17일
					

	        	</div>
		    </div>
		    <div class="checkElement">   
	    		<div class="ment">    
			        <label for="select3"><input type="checkbox" id="select3" name="esntlCheck2">(필수) 개인정보 항목 수집 및 이용 동의</label>
			    	<span class="detailAgree"">보기</span>
		    	</div>
		    	<div class="description">
					<table>
			            <colgroup>
			                <col style="width:11%">
			                <col style="width:8%">
			                <col style="width:11%">
			                <col style="width:30%">
			                <col style="width:20%">
			                <col style="width:20%">
			            </colgroup>
			            <thead>
			                <tr>
			                    <th colspan="3">구분 및 대상</th>
			                    <th>수집하는 개인정보 항목 </th>
			                    <th>수집 및 이용 목적 </th>
			                    <th>보유 및 이용기간 </th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <td rowspan="4">
			                        ETOOS통합회원서비스<br>회원가입시 
			                    </td>
			                    <td>필수 </td>
			                    <td>만14세 미만 <br>미성년 회원 </td>
			                    <td>아이디, 비밀번호, 이름, 생년월일, 학년, 이메일, 법정대리인 본인인증정보 </td>
			                    <td rowspan="4">-본인확인 및 가입의사 확인<br>-ETOOS통합회원 계정
			                        기반 회원제 서비스 제공<br>-법정대리인 동의 여부 확인(*단 학부모·일반회원
			                        경우)<br>-ETOOS통합회원 회원관리 및 서비스 운영 </td>
			                    <td rowspan="4">회원 탈퇴시 14일간 보관 후 파기<br>아이디는 중복가입 방지 및 부정이용 이슈 방지를 위해 14일 보관 후 파기<br><span class="bold">(단, 관련 법령에 따라 보존이 필요한 경우 보관기간 경과 후 파기)</span></td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>만14세 이상<br>회원 </td>
			                    <td>아이디, 비밀번호, 이름, 생년월일, 학년, 이메일, 휴대폰번호 </td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>학부모·일반회원 </td>
			                    <td>이름, 생년월일, 아이디, 비밀번호, 휴대폰 번호, 이메일 </td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>교·강사회원 </td>
			                    <td> 이름, 생년월일, 아이디, 비밀번호, 휴대폰 번호,
			                        이메일   </td>
			                </tr>
			                
			                <tr>
			                    <td rowspan="2">강사 채용시 </td>
			                    <td>필수 </td>
			                    <td>ETOOS </td>
			                    <td>사진, 이름, 생년월일, 성별, 휴대폰번호, 이메일, 주소, 학력사항(최종학력, 교원자격증 유무, 학교명, 전공, 재학기간,
			                        이수형태) </td>
			                    <td rowspan="2">-채용 지원 및 채용 이력관리<br>-상시 채용
			                        실시를 위한 인적자원관리 </td>
			                    <td rowspan="2">채용 전형 종료후 지체 없이 파기 </td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>지점학원 </td>
			                    <td>사진, 이름, 생년월일, 휴대폰번호, 이메일, 주소, 지원분야, 지원과목, 강의대상, 학력사항(구분, 학교명), 경력사항(학원명(학교명),
			                        재직기간, 근무지유형, 강의대상/학년) </td>
			                </tr>
			                <tr>
			                    <td rowspan="5">이투스 계정 연동 (SNS계정)</td>
			                    <td>필수 </td>
			                    <td>네이버 로그인</td>
			                    <td>이메일주소, 별명</td>
			                    <td rowspan="5">회원가입 및 로그인</td>
			                    <td rowspan="5">회원 탈퇴시 14일간 보관 후 파기<br>아이디는 중복가입 방지 및 부정이용 이슈 방지를 위해 14일 보관 후 파기<br><span class="bold">(단, 관련 법령에 따라 보존이 필요한 경우 보관기간 경과 후 파기)</span></td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>카카오 로그인</td>
			                    <td>이메일주소</td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>애플 로그인</td>
			                    <td>이메일주소</td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>구글 로그인</td>
			                    <td>이메일주소</td>
			                </tr>
			                <tr>
			                    <td>필수 </td>
			                    <td>페이스북 로그인</td>
			                    <td>이메일주소</td>
			                </tr>
			                <tr>
			                    <td rowspan="1">학습기기<br>물품배송시 </td>
			                    <td>필수 </td>
			                    <td>이투스<br>오픈마켓 </td>
			                    <td>구매자정보(구매자ID, 이름, 전화번호, 휴대폰번호), 구매상품, 배송정보 </td>
			                    <td>서비스 이용계약 체결에 따른 상품 배송 </td>
			                    <td>법령이 정하는 경우를 제외하고는 회원 탈퇴 시까지 보유 및 이용합니다. </td>
			                </tr>
			                <tr>
			                    <td rowspan="1">서비스 부정 이용 사용 방지</td>
			                    <td>필수 </td>
			                    <td>공통</td>
			                    <td>- MAC Address, HDD Serial, 모바일기기 고유번호(IMEI, UUID)</td>
			                    <td>각 계정 별, 디바이스 1대 등록 식별</td>
			                    <td>법령이 정하는 경우를 제외하고는 회원 탈퇴 시까지 보유 및 이용합니다.<br>쿠키의 경우 로그아웃 또는 브라우저 종료 시 삭제됩니다.</td>
			                </tr>
			            </tbody>
			        </table>
				</div>
		    </div> 
		    <div class="checkElement">  
		    	<div class="ment">
			        <label for="select4"><input type="checkbox" id="select4" name="chcCheck1">(선택) 마케팅/광고 활용 동의</label>
					<span class="detailAgree" onclick="">보기</span>
				</div>
				<div class="description">
					<table>
			        <tbody>
			            <tr>
			                <td><span>수집 및 이용 목적</span></td>
			                <td><span>수집하는 개인정보 항목</span></td>
			                <td><span>보유 및 이용기간</span></td>
			            </tr>
			            <tr>
			                <td><span>- ETOOS, CURI, LINKER, 족보닷컴 등 서비스 이용 안내 및 홍보/이벤트/프로모션 발송 및 홍보</span><br><span>- 고객맞춤정보 제공</span></td>
			                <td><span>이메일, 휴대전화번호, 가입 정보</span></td>
			                <td><span>회원 탈퇴 시 (위탁업무 종료 시 파기)</span></td>
			            </tr>
			            <tr>
			                <td><span>- ETOOS 이용자의 행태정보 기반 타겟 마케팅 제공</span></td>
			                <td><span>개인 정보와 결합된 쿠키 기반 웹/앱 서비스 방문 기록, 검색, 클릭 등 사용 기록, 접속 기기 정보 및 운영 체제 정보</span></td>
			                <td><span>수집 일로부터 최대 3년간 보유·이용되며, 이용 기간 종료 시 행태 정보는 지체 없이 파기</span></td>
			            </tr>
			        </tbody>
			        </table>
				</div>
			</div>	
			<div class="checkElement">
				<div class="ment">
					<label for="select4"><input type="checkbox" id="select4" name="chcCheck2">(선택) 제3자 개인정보 제공 동의(ETOOS ECI)</label>
					<span class="detailAgree">보기</span>
				</div>
				<div class="description">
					<p>
			            개인정보의 제공 및 공유 회사는 이용자들의 개인정보를 “개인정보의 수집 및 이용 목적”에 고지한 범위에 한해서만 사용하며, 이용자의 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 개인정보를 외부에 공개하지 않습니다. 단, 다음의 경우는 예외로 합니다.<br>
			            가. 이용자들이 사전에 동의한 경우 개인정보 제공 이전에 개인정보 제공자, 개인정보 제공 목적, 제공하는 개인정보의 항목 및 보유기간을 별도로 알리고 동의절차를 거치며, 이에 이용자가 동의하지 않을 경우에는 제 3자에게 이용자의 개인정보를 제공하지 않습니다.<br>
			            나. 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br>
			            다. 제 3자 제공에 동의한 경우, 해당 서비스 제공 업체에 아래의 개인정보가 제공됩니다.
			        </p>
				</div>
			</div>
			<div class="buttones">
				<button class="prev">이전</button>
				<button class="next">다음</button>
			</div>
		</div>
	</div>
</div>
<%@ include file="/common/footer.jsp" %> 
<script>
let showes = document.querySelectorAll(".checkElement .detailAgree");
let details = document.querySelectorAll(".checkElement .description");
for(let show of showes) {
	show.addEventListener("click", () => {
		for(let show2 of showes) {
			show2.parentElement.parentElement.classList.remove("open");
		}
		show.parentElement.parentElement.classList.add("open");
	})
}
/* 전체선택 */
let allCheck = document.querySelector("#allCheck");
let checkBoxes = document.querySelectorAll("input[type = checkbox]:not(#allCheck)");

allCheck.addEventListener("change", ()=> {
	
	let checkYN = allCheck.checked;
	
	if (checkYN == true) {
		console.log("여기는 if문");
		for (let i of checkBoxes) {
			i.setAttribute("checked", "ture");
		}
	} else {
		console.log("여기는 else문");
		for (let i of checkBoxes) {
			i.chechked = false;
			i.removeAttribute("checked");
		}
	}
})

/* 이전 */
let prev = document.querySelector("button.prev");
prev.addEventListener("click", ()=> {
	history.back();
})

/* 다음 */
let next = document.querySelector("button.next");
next.addEventListener("click", ()=> {
	window.location = "/projectEtoos/user/Join.do?step=2&gubun=${param.gubun}";
})
</script>
</body>
</html>