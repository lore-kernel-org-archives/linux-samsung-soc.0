Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE15039BFFA
	for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Aug 2026 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785596851; cv=none; b=T6b/r9KI10ULcPxQgcS4ZHosktbtk11SRy6Ds+uVkuYW7TArjUKY4l9nq+N4eVdgZfLQopktx4CICgkI+CuYmGFT05tGMHwWEWE9KerH6U7J+9gsZaBzUTG4rNQl1OGWSFY4uXNRmV70C3/bhtOWvQoDe2qpxy6Mw3k1igt1+PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785596851; c=relaxed/simple;
	bh=KafFn607twykEQnbRM/XOk9qfptsuPKINmLe6Loj6+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M0+PSnG9rxqhKogs1AU6qZUyMZRsC2v+hTFK7ZrF4IYwv2OddqkIjrOlnPfkru5Ysx23PZng1GdgzfCicTOf611vBnOMF1THvoFvHdPZ7E3xjL9Hjvsc/DibqDECFtF6/Ws27nFiEVWoiTp+UqptZTVCa8Pqj+tD5CKpeoKsRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RI7L4u08; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bpo09sak; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RI7L4u08";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bpo09sak"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671CadEX2815397
	for <linux-samsung-soc@vger.kernel.org>; Sat, 1 Aug 2026 15:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=; b=RI7L4u08Rvw7Fy7C
	iOzqqfOlM+8TkdV6M97+/sb96Oh/NGNoPHpcyhDXnve5qUtBZgepeKd2OT94hzx7
	83wPCqm6jKCr48WBXb7mc63FRHtMXAz83GleCODnt+zfcbhCxEMCMQTMSSAgCO2o
	vfNTAaLsCKVkyeAvkDQ+m60fvjOLNcvO6FX0KjIUSjLRpIlji3zHSU2LzYwXBXBE
	nvOX8Z3QB6I097s/D6KMKSHYd9ParVuWhI5yM8nodGyDXOIGHBR0N6xhojIgTDAv
	kVigCxJV8QPbJg3rcToXqvCNAP7zlUH5e/qf2fiE+er6OYwba9HeFwo1L1llwgdL
	1lxSSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfs0hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 15:07:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso34407661cf.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Aug 2026 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785596848; x=1786201648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=;
        b=bpo09sak1T277SXDl63GaM0RpfVS3lK32Aup2auMOefDigR/C0TrbhOo1T9PN7oAsA
         uMR1A+UuNJYUlgBvYLp90sQomWFuqDNd7EvrrbUFSUcITi9VGPg4ChI+ainDlaRV6s54
         w4eU6m1XwqWhhwtlukfZKLx/aWoOp5e8psmhdM/CQUawPNkG2uRKcstRhzt6Cyf1p7ia
         ajWjlRJDNNQ25ebcmIPX1u1hJjApy//F/jGYqziE5u1qzBQiwHT5fawEtsIpOiWBFzft
         Of4jOPqod1ZDt6SJS9LYOUbgKx9g2gTRcEvs9q1zVPOCIUdzPWKj2WwUJyLd7ns2ADcG
         iRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785596848; x=1786201648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTUNuN1/8ESsUUmXgeFtwpIQ1cpP4e3GVEtxRYxw+YQ=;
        b=YC9qGWukevtPP6nfjtHvgVQjYesB41SmtblIStwUkd4YlQixb46uKifFxl2oJsqN0u
         McvxlBPaCAformjAxWjK58DE9KQkQV1p1XEQZv2ND5VI8IqTOl9EsY6DgDHnFF7mHiEH
         ughLHPV22asZOvF1bWSXtg9nAl5ZhhhI0+QBUG34Qkv977e6yJcITHX8WJZvtDC8au48
         gnEnXsTmAYkGQvDoQU85AHqONBUs5Y4PpnWRQqSm4LRuT9ZLCxV4ITzv1LL94+1wqrdz
         S2bzEEYTAqBOqUhRdvg50KVq+Ir6LTUYPTfQ0/r66dvXWA9A6IFpW5l2paNRPJXqoYu8
         Ok/g==
X-Forwarded-Encrypted: i=1; AHgh+RqvYoTzhPql0Qa+ClMQyiaBOOXvVHvhCRzeYujZ0GGyCklokYMdSahoM0lsqIDO5WEQjdzPzIuxQC0VnAL3LvKkoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcX5A9TPBKvbQvHcyoplbopPvuElZC+ff4/i2KJxLoxLqV4mYH
	Z3epn39Hw+84/tPgP2+WJyl7mzcCXjOzAnL6rmnaWM4+ZaPUsp43fXJvLx6eoCwSx0xPg2fJnaC
	xKGiFcWKansyK6K31G73sCDF93OvlipgnSiUMvI8L+deKxPW3cJ2BU5QT/K1sVxb2YPBwo7vzng
	==
X-Gm-Gg: AR+sD10AUliT/sUIcwWXr6n5X5Jt7HFDrPFCJki3c6tQgLKtJusTmHSCg4d8/PG04zu
	OrWucdSU9YgtI0sDCX3Qfzcf7Ye2Fp1WneYybuFNTdeQGhB1hEw/knMb0512s/mqxMwPRDPOkf3
	NE5LZ5bnhEOxqQyS10u1awhnfbr+Ny3esf+hTRPIZaxj3brprR/5TIIH13yxljzt6xGVFWxOHAU
	9b97nuMvI7k7ppO1QN4E4+J5p/gsDXjKrFhQ4DwWyWwfKvdEVeUQqNXlTkPS3SSvYyKLKKlLfOL
	hDr3vzU2A1t142fVITquBKZ+E4NkE4f9QIwHxCGLtZ/HxOUylT/uGS99bLtrdvU/DXDZI1ASEQn
	krZWh+V3B04GrbiD10NYA2Jqh
X-Received: by 2002:a05:622a:580c:b0:517:63df:91a5 with SMTP id d75a77b69052e-52b4c5dc695mr87180881cf.19.1785596847846;
        Sat, 01 Aug 2026 08:07:27 -0700 (PDT)
X-Received: by 2002:a05:622a:580c:b0:517:63df:91a5 with SMTP id d75a77b69052e-52b4c5dc695mr87180021cf.19.1785596847372;
        Sat, 01 Aug 2026 08:07:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm16005222f8f.37.2026.08.01.08.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 08:07:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 17:07:02 +0200
Subject: [PATCH v2 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260801-b4-dts-coding-style-strict-v2-7-f09a659ab80d@oss.qualcomm.com>
References: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-dts-coding-style-strict-v2-0-f09a659ab80d@oss.qualcomm.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-fsd@tesla.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6130;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KafFn607twykEQnbRM/XOk9qfptsuPKINmLe6Loj6+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbgub8iXXMCK+PQR9IniToLvDNRTslgMN9i6rq
 gRNMOgmaz2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam4LmwAKCRDBN2bmhouD
 11IfD/9HqryBeEmp61exX7+aVNDjPT4Xk26jcy/YcgWSE0lP1nQYwvlCcGqQge8YBx3NAr59EMx
 bEyz3iKK+5O+oT2cVRrOHQ/K7ZBl+PXIRnlkAGCbINKFW9ROjhIYPN95+MXZ1VKDJOwOn5kD9q2
 Zg2qoKMIGtC0ShOsIZop46CVxkYocmUbguFgbDgHRmvmt/3DaLYl9gDDDCfIWWCiAnV2GSgxCr0
 D59Ad9dKDKZZT1XXIytuiv6UFWmBHTyQ05SFgi6VWHbGBUItEcysAIS6Iq1yWBIROHdshJ9likF
 CGJAZrbxHOnpbQFaID81+HpoXV9r22z6Wbhf6ZaCCkGMICYFfVOTTCDt72ogoJvNvTYwBrSPzCA
 rGMHIKpk+Lbx20w12C19h11UzzdwYQ5Wh4nnGMDt02erh9a4lmYoUkfHHtAwyrUNepmHsF7q3A+
 DmZupZDtI6a/qKD+aAxdYVClWRmU7xdqpQGMfzl4VVFXmAhnSbvrXvMYnXZTfrNBLgnx1EccZrj
 zEfXXcGqI1AssJLY+rv+XjrfwgJnLUo+KJa2c4VWE5a7wG7XMouVtD+0H3+7uL5bIJsoWVqqQVp
 0V3CFd9sktayuRW4g9l73QlntzHW/rbSY+/nKymFuaHlvt0st3jcy/hKMGq3n+xuX2gHbvUq8F+
 xhXWtIluRevWAHA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 71eh4ZS9Q9xFVjOJIz3QxCcZXZh_udLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfX09FhSPEbBeoJ
 jICjmKU9hVdrst20BLcR3gsPpHrSSi1ulmpa89Xlaq19UxdzZZwvbmqoc8vrQr1MPKp6YEpeV6u
 Fzi/7B7hYH4fqdoeox9/2BbVZk8VPJoVvtbw+ceecQlitGkOogv7thL9BHzW7itDQd3ZJRRkK/A
 hOMxoumSdV3pxtXsDzJ/mqwasS5Ib5grwBjoaVpWwDthtv/PvCmIPjgplyVUYGETkYniRyJlruA
 a6iq0OA7s4XzxG1DZ4/mQIKqKMH0xaxzJew4nkQWvijo4Jmyi5gO5QqFFHEH6J/gxBDhCcOSA1J
 o1V5DLfAgqlP/2Fc+yMELwbSN7HnEmfT5gUBW28lGUUQgeRHnVZ7VWoguMHt7X9oxchnBHjrqQ/
 +TWSm/UmZzlGWg094D8TxKvbBmo47Selb6hyn+vJ1NcVMJoZjHnzsQC74Ww3mOjflRysRCubM1/
 o34gxk3fegqFREIHINw==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6e0bb0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=vEzWEtAh74nsurIt10gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 71eh4ZS9Q9xFVjOJIz3QxCcZXZh_udLO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDEyMiBTYWx0ZWRfXxdhvgbOuE2jT
 N6yY8JjQvUluEEdWzERNUs5p5/a0hsfqueJzqYn658U4N70UHSFdMI/QP5x9cD0kbZMfn4M1yCJ
 XrZJZ6wuXlIwYic/wbFHQyWaB5GuelU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010122

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [required-blank-lines] "status" must be preceded by a blank line
  [property-order] property 'phy-mode' out of canonical order (should sort before 'status')

Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd-evb.dts |  6 ++++--
 arch/arm64/boot/dts/tesla/fsd.dtsi    | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts b/arch/arm64/boot/dts/tesla/fsd-evb.dts
index 9ff22e1c8723..73b6a25e0e4d 100644
--- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
+++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
@@ -65,9 +65,10 @@ codec {
 };
 
 &ethernet0 {
+	phy-mode = "rgmii-id";
+
 	status = "okay";
 
-	phy-mode = "rgmii-id";
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
@@ -75,9 +76,10 @@ fixed-link {
 };
 
 &ethernet1 {
+	phy-mode = "rgmii-id";
+
 	status = "okay";
 
-	phy-mode = "rgmii-id";
 	fixed-link {
 		speed = <1000>;
 		full-duplex;
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 5b06e2667b89..214d33ca7177 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -603,6 +603,7 @@ serial_0: serial@14180000 {
 				 <&clock_peric PERIC_SCLK_UART0>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -616,6 +617,7 @@ serial_1: serial@14190000 {
 				 <&clock_peric PERIC_SCLK_UART1>;
 			clock-names = "uart", "clk_uart_baud0";
 			samsung,uart-fifosize = <64>;
+
 			status = "disabled";
 		};
 
@@ -658,6 +660,7 @@ pwm_0: pwm@14100000 {
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -668,6 +671,7 @@ pwm_1: pwm@14110000 {
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+
 			status = "disabled";
 		};
 
@@ -681,6 +685,7 @@ hsi2c_0: i2c@14200000 {
 			pinctrl-0 = <&hs_i2c0_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -694,6 +699,7 @@ hsi2c_1: i2c@14210000 {
 			pinctrl-0 = <&hs_i2c1_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -707,6 +713,7 @@ hsi2c_2: i2c@14220000 {
 			pinctrl-0 = <&hs_i2c2_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -720,6 +727,7 @@ hsi2c_3: i2c@14230000 {
 			pinctrl-0 = <&hs_i2c3_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -733,6 +741,7 @@ hsi2c_4: i2c@14240000 {
 			pinctrl-0 = <&hs_i2c4_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -746,6 +755,7 @@ hsi2c_5: i2c@14250000 {
 			pinctrl-0 = <&hs_i2c5_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -759,6 +769,7 @@ hsi2c_6: i2c@14260000 {
 			pinctrl-0 = <&hs_i2c6_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -772,6 +783,7 @@ hsi2c_7: i2c@14270000 {
 			pinctrl-0 = <&hs_i2c7_bus>;
 			clocks = <&clock_peric PERIC_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
+
 			status = "disabled";
 		};
 
@@ -789,6 +801,7 @@ i2s_0: i2s@140e0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s0_bus>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -806,6 +819,7 @@ i2s_1: i2s@140f0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2s1_bus>;
 			#sound-dai-cells = <1>;
+
 			status = "disabled";
 		};
 
@@ -840,6 +854,7 @@ m_can0: can@14088000 {
 				 <&clock_peric PERIC_MCAN0_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -857,6 +872,7 @@ m_can1: can@14098000 {
 				 <&clock_peric PERIC_MCAN1_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -874,6 +890,7 @@ m_can2: can@140a8000 {
 				 <&clock_peric PERIC_MCAN2_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -891,6 +908,7 @@ m_can3: can@140b8000 {
 				 <&clock_peric PERIC_MCAN3_IPCLKPORT_CCLK>;
 			clock-names = "hclk", "cclk";
 			bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
+
 			status = "disabled";
 		};
 
@@ -909,6 +927,7 @@ spi_0: spi@14140000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi0_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -927,6 +946,7 @@ spi_1: spi@14150000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi1_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -945,6 +965,7 @@ spi_2: spi@14160000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&spi2_bus>;
 			num-cs = <1>;
+
 			status = "disabled";
 		};
 
@@ -1007,6 +1028,7 @@ ethernet1: ethernet@14300000 {
 				    <&eth1_rx_ctrl>, <&eth1_mdio>;
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_peric 0x0 0x1>;
+
 			status = "disabled";
 		};
 
@@ -1026,6 +1048,7 @@ ufs: ufs@15120000 {
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
 			phys = <&ufs_phy>;
 			phy-names = "ufs-phy";
+
 			status = "disabled";
 		};
 
@@ -1056,6 +1079,7 @@ ethernet0: ethernet@15300000 {
 				    <&eth0_rx_ctrl>, <&eth0_mdio>;
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_fsys0 0x0 0x1>;
+
 			status = "disabled";
 		};
 	};

-- 
2.53.0

