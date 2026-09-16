Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242EB4B8291
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789591621; cv=none; b=Cl6HIfIbf/8CL2irpHP3kXLLPBZE74nZvYn2VE/+nxZ6s5Zi92XwrdFNvcKlduwCFs+itGKfVYhY/XQ58dgmZUmoWGb7duPrrfK+fxvDFV+K5jHEOcbbICSMkfGF4f7RPYPnCYiRnGPssyQP8CtoR92VZd0jaK8613l/0fS/Hdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789591621; c=relaxed/simple;
	bh=NEusXuICV9Epshdd6Pdkkas8eIUI83cgzBxWfSGQQns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cKo99XJdQgZCFeBufPksXCQ++PJ4hZ893dYEiE9MUR1aXBV0KvYZ2EnJDPEPTCDT2VkFif37YcOZsa72MnrvG3L/UuoCNCOMSgbM+uFFzgCvztNbs5lQzwQBSV7vZBFApRPB2/QSBKqvqrZfpnu0vzDTapvX35KYhUdFv6wfzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGkxKHRq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpYuiOU/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGkxKHRq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpYuiOU/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GG5KJk3597313
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=; b=FGkxKHRqdkxCE3fW
	zl2QlsrkmFR1lZZFof2rb0NcGJBVUnjO9epOivpV8+eWyH9zPzERqgnFxD17h8VX
	iYgnYzci4wkQsb+4jposJL06jHvBaex1vK6mhQWjvgHbRJW3k4B8MSteNjUEpwDI
	hf3mHqzaf+MVJHDIaw9JPaUG8QsUyVQ6w5j5dKwx8kggdcDNa4kE8wD1Wav/R29B
	DNokNgcwKCHOaPNaLpgTNYaVlssI9Q+637MCBBEshYyuNB9o+guxbBcGTDFkXkaL
	UQqu/0hxrg4HldK7149K+j5P+fmL8WWn/9Ygffv+60+vJHJjUP2hvtjcO9xCt1zR
	mvfGKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxay970j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 20:46:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530ef845909so946071cf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789591605; x=1790196405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=;
        b=EpYuiOU/boFPi8mvIE7LqRbqsa6Wr4erIpG39I3YsJhORt2cFqOcbHzRUilYX67WO4
         387clZ3yAfdmQ1GX7ba4DNgcYYt1PYsprBrMRNCMdEU79/kzPs4tgaDEyYm0Z4lV+QTX
         h4MUJTe+wcYfUxtsOWM80NntuUnCnsaRu87wrqIRsLiucPV6ZmBpNMQDDW5oI6yK15Pz
         bhMbyCJIiXEntUN4jNYaMiXkHPeW3TRjdaq5n98jukl8TWd1O4HI1h/XDUud6LB4EPAC
         TydET5RNdLcvTt1ttTDhf3CdA6hxrSuhLlFOxHSoQCFSxaRNvMMeFKyY5rZH9YSxcd1U
         126g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789591605; x=1790196405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zP+Gzl4ru1gJNt1ar6U9V5ebCT/YgufB5EK5poCLhpw=;
        b=zQpiNgBCOqQdWMLsyl+WavhdukM6Ytfy//HE9r5Iuw1giKB0KWzsOp48+4OlYkG7Rz
         MVC8obz9zpHbKloI/1RfV1LKGeTBR7VvMJ9ouBQQZg1HzzRvLy/FlIgiVN0WN9gz/h3a
         tT0K1azvqNklgB1iNuqSxjCGyhSekBuxHZicnO2jnDktrJN7Xm2k3eORJB9doJvgJ6si
         qbdA6z6ISxBG2Z4bIvHpH6jz7+YIGkWkyQwmCBSPbURUfQurxURmPHnygn8K69toPjfL
         XHG9kbmdyPhb0q1/XwC9mvqO1kt79h25vPU49Hf9E79Ke7NTdEPZ1TGSuwdQ/Gq+hmnE
         6n5A==
X-Forwarded-Encrypted: i=1; AKwUvBwdqye5aBnZbE/lvOpmoimOquwzGAJso3HAcbaOiuiuImf7J9eyeqnL3fqlvc7VqKfJ2BpX8bFBLVgc/6FwVBaEBw==@vger.kernel.org
X-Gm-Message-State: AFuF++nDWVIgjwTUzTmfONiMRB83F3/53cW8Rl2WhGJ0owFw2XLSm8aF
	QOt5o15XYIPvZAQys0Loj8xrxQX5R4cVH6yFY4GARhkj7eeZqvn7bE2hgJr0SEnEKqezjKde3GW
	eRHlFh4FQuJDKgNLY/IxsAbRSZ9LaMi4kS7o2fDfhutV8YDnR3IfG2gVUUzE9LSyVdVMd+kJunQ
	==
X-Gm-Gg: AYBFou1V7okVVJRJ18GcefSQHw8IWp8cfVBZ7EPWC067lX+yZOESy4R2ZNCod5jg90d
	UH+bELc9fiZ/imQ33qhBTLr10/uDSpYEzFg049DDo0Pt+cgihEIrR39R0t6dggqPSGpgzT7skw2
	o1k9/31P+bh2QhIaL5S3F/mp7fPa1GCdW5DbdqCSyuc+1L7Hj2umZb4cNLS1DaEJ+nsUgqKKlj+
	H3uy+gpEDoxhpnGlaowsU14SHkDkRnfWo2iIk+yCc4OJnzTUWJkSeUwaAdyGFlrTPYicsSPbZ8+
	6Umkue2llQzh/5yvaYVnw+cuqIJIkCjG2cV/NLvkVgiJ6/19ecJrpmK4+YPnDSc/LUHAswrVM28
	uqqQCAKVv2RO7GBYOpIJJWo4=
X-Received: by 2002:a05:622a:151:b0:530:f1d2:f39e with SMTP id d75a77b69052e-5327ef109e7mr69027781cf.40.1789591605630;
        Wed, 16 Sep 2026 13:46:45 -0700 (PDT)
X-Received: by 2002:a05:622a:151:b0:530:f1d2:f39e with SMTP id d75a77b69052e-5327ef109e7mr69027291cf.40.1789591605137;
        Wed, 16 Sep 2026 13:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa7dsm9857077f8f.8.2026.09.16.13.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:46:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 22:46:33 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: Suppress a few intentional redundant
 whitespaces
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-dts-style-checker-suppress-v1-2-81b86685d068@oss.qualcomm.com>
References: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
In-Reply-To: <20260916-b4-dts-style-checker-suppress-v1-0-81b86685d068@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3910;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NEusXuICV9Epshdd6Pdkkas8eIUI83cgzBxWfSGQQns=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqwAsVybke5T91kM1TocXoFt05g3wt+bikxgUG
 w+wM22d1WKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqsALAAKCRDBN2bmhouD
 1+lOD/9TFBqkLUx+ePlnMqvDYZKE28RQugErzOJgTzp1O32YJZrIzFPBcM446BJGdLR7zIOsOyJ
 jiMu9DVpm1SsTAlUX7FdNyFRtx3j1yts/ZIrRd3+3ec/9F9o5U3fJW2TVGlHLTPBJNG9abphIm3
 F57hiSEdrx3nJM1vWMgkalBI3CLkTzE69NbxHrfLOHfoJHJZdNR17MqK3C+9KbVg8dnoULT5K/J
 ZLpFa11hAVy+dvLo3yiPhy/ftAafocA+tY//qkMH78zlyeDBTzlIqV69N9kV9FXWnk2ITHaBTVD
 ykces68TVXSqRQbe2jvoS4+DkwgqDfRYdpopg/meFoqA/2G2Yx5+8rk/x84pPbbFF6mQv/HcvS3
 pyDWrFjzMpTuJ2yGeQOu45tfq+EgUXLt+ZNXBy5EKrljKX0Ch7cU7J1YsV+v0mE8r6NoVdf7oT6
 Uo1UPJZ01bDpReL2Ae8brH464IniDAFDiUuu9tc1LIGiPbGEK8ZG3aDEa3M8QzZ07gcJ0APFBO0
 3szZUGdX6V/GIIEDlrP3zxpRacohiXUoiGgJQ2ko9kXLM4M1ttYQUWXWhHHLMMpiykv90kTK7z9
 QVEgjm7XIvJqxW8klT+fVtZQ+ttzcS7lkRT0bVSsdrz2KZkBfFJ8ndTgHwhfTmVJGaf3GDQ3AJu
 gTjh9HR2CZ4rEww==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfXyLtx2rtsiEwi
 l7jxiEpRuNvriWNClc7wUCOvEqDQjzooVvmQxATCfIYblM9w2jW2n92nK1nZl6JOu4m62cfEGvE
 SfXhQcDML86nT8F7ibwbZYq3qY6JVnW4KEaeuq9In9Wl2VIOvlN0EsIoLm58tQTteAjeeL60Is9
 qkOct/koV4n7mzao7CssqTg3icVvL+cRkLfmFSAhogzRWB/Ts4ANEUkfXiskPIcyb9eXdYLku12
 lqB0aRVpl+9X6NH8AUtpDY2bVTw/q6OwnaDD37fPxRnNglQA6/miywZbKy7pJUOqgjh+fUDeN9i
 sYUZnAKrFgyV6yAPizYfNdfncJ2D8lpXZBq1n/pKMcj+2CHAeA16aFIt4mZCCpet4MQQkzsBwLN
 BERXS8Dci/Nxw/oVGZRKwnBd6AMlJcOoaa31uBEg/tOb6TeewZgxhktS5ryEgDBxDrqwGIhTqxY
 TfgX7mcpwyFEGPSuEQQ==
X-Proofpoint-GUID: _raGv78vho-sz6iRSSELsT0Q-s7-54gm
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aab0036 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I0iP3be13vs9ipy7py4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: _raGv78vho-sz6iRSSELsT0Q-s7-54gm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI4OCBTYWx0ZWRfX03XM/QHkT5N7
 wK3B6J3VBBVHrhQu90gU3G3Dk+BZfaaGyp7DRSWBSNMUIwYgX9ZzNdFgtebO7hISyV+ih3sIHR1
 JWvg9Jounb/ObTJLb0c88Qemoctq5S4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160288

Ignore redundant whitespaces in a few places to suppress warnings from
`dt-check-style --mode relaxed` like:

  sc7280-herobrine.dtsi:357: [redundant-whitespace] extra whitespace after :

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi           | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 58ea0532c0fb..21179ca1219b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -354,11 +354,13 @@ keyboard_backlight: led-0 {
 pp1256_s8b: &vreg_s8b_1p256 {};
 
 pp1800_l18b_s0: &vreg_l18b_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l18b:    &vreg_l18b_1p8 {};
 
 vreg_l19b_s0: &vreg_l19b_1p8 {};
 
 pp1800_alc5682: &vreg_l2c_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l2c:     &vreg_l2c_1p8 {};
 
 vreg_l4c: &vreg_l4c_1p8_3p0 {};
@@ -368,14 +370,17 @@ keyboard_backlight: led-0 {
 pp3000_l7c: &vreg_l7c_3p0 {};
 
 pp1800_prox: &vreg_l8c_1p8 {};
+/* dt-check-style disable=redundant-whitespace */
 pp1800_l8c:  &vreg_l8c_1p8 {};
 
 pp2950_l9c: &vreg_l9c_2p96 {};
 
+/* dt-check-style disable=redundant-whitespace */
 pp1800_lcm:  &vreg_l12c_1p8 {};
 pp1800_mipi: &vreg_l12c_1p8 {};
 pp1800_l12c: &vreg_l12c_1p8 {};
 
+/* dt-check-style disable=redundant-whitespace */
 pp3300_lcm:  &vreg_l13c_3p0 {};
 pp3300_mipi: &vreg_l13c_3p0 {};
 pp3300_l13c: &vreg_l13c_3p0 {};
@@ -384,6 +389,7 @@ keyboard_backlight: led-0 {
 
 vreg_edp_bl: &ppvar_sys {};
 
+/* dt-check-style disable=redundant-whitespace */
 ts_avdd:      &pp3300_left_in_mlb {};
 vreg_edp_3p3: &pp3300_left_in_mlb {};
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index ed3d29e13021..afeb6e57e0aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2480,6 +2480,7 @@ swr3: soundwire@6ab0000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
@@ -2527,6 +2528,7 @@ swr1: soundwire@6ad0000 {
 			qcom,din-ports = <1>;
 			qcom,dout-ports = <11>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0x31 0xff 0xff 0xff>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0x00 0xff 0xff 0xff>;
@@ -2591,6 +2593,7 @@ swr0: soundwire@6b10000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <9>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
 			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
@@ -2644,6 +2647,7 @@ swr2: soundwire@7630000 {
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <0>;
 
+			/* dt-check-style disable=redundant-whitespace-strict */
 			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;

-- 
2.53.0

