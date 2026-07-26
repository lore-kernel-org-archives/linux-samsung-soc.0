Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A23D649C
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087850; cv=none; b=V4QW/+c8sXsLEcduE80i+h03k23737C3i4QF+7vtsc9/QK9rhIa4zc/UG3cLK+IX/rtorjiWiYcpPOyOEQNB8jUkqXgUiX5grG02mvJruq3iSIrTsv4dZSzAZvDnv39SATiG3mQrIxS+EGon6f33LQlHgheTftz9UgXF+ngpHQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087850; c=relaxed/simple;
	bh=9Kdc+t7zEowlwHOut1CYSzTz7wD6Zy1nYRHG/ARWJm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u94oROqgG5qFvAGrejGvq8S4voX0EpOO6OY6Y2XA/APpkqA+vddlReBSRJg5zsWwjTFqL3LTci3Kcy167tIaf7ejdnU8XJ1uE4mclkC4nUgDnicFpBotL2whR2ZZqyVqC8SYDiSD1nIyZOCnP3zhwgJJ5CfE4e6X93Ar01ntUkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0al+mQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9BaW9Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0al+mQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9BaW9Yz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7JhI1419243
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=; b=P0al+mQhnZ+RVhew
	tlSyAC60CwfR83K21+21eFCMjeqbRPG/k+Kapgipn+8nZkBf5LWA738CbEEyTJcn
	l6qQU1UrQJ9m3e6e9pYcpFNAnglDqhIWQBvnac80jRpcC2DG+GLd5bsPnCXrGZ63
	hEKHjUOZyeZO+TNV3G00jr5PHoN8eXbI9wPIrNg/zlyyS8fYb/LUUdIyOWJ5b55a
	4hGJyB4G0u57cOpKI4bic3JvEHfdfaCzj8ZsHA/Dx77JH0ie+nBPPfzupeZXXeJb
	5DNWfcPld4EdK52+gqhaJTbAwDTal///cOT4msMDdBM2QUOlFEhQf0dR+hLPB9LL
	5K2Vmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm573mwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so25689781cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087847; x=1785692647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=;
        b=C9BaW9YzeBzeqMhFLiQ5QW0I66ZiZIhE/PMFfI3O6VSsnpRgzlj410i6C58KK9TEtJ
         FldyTbOalamNULTePvf6dwhBjRWDf9APIqF4/PwFs/3ZLEqRZnkGSgHXzPIGyL8qksGp
         zj5iA+3qoyaHy6+Nca8HuJ+lZeLe/wBpuTMcoPk7tpdG1jnfuEecE9vGpNDKBdWJLzwV
         z/WaDj28smCO01p3r9FOJ7k4HfalLtfu6QDjj+/42lHlydR1bDJU53jzhzo5h8dfGxy9
         JIda4r+f6h6Cq7Anp48do0OLDHGIm6VQOoR3WZhuezKcU1EhyGgF3lMsipbi5//rMwD5
         +BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087847; x=1785692647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYEWRW0PHq2V9fq3m8eDc5+VKauFhMXll8srcAue+VQ=;
        b=G3dyapH5W+L44LYhvXBJuUXpH48f0BmWOhd1D1BASO9XpDVREngJ9/4r461u2v1w/y
         hnjcdFtPAg+HpuTDw9WiKUaXQWHY07itQwQ0vb63VG+z9oC8FsaWK4EtK0IOlewEAkHQ
         Tzaor2nJe10uOrDL3tkWJbfG1nKyGLSWneOfKS9Z05QZ4rpE5cM3Ta1Say3lNu7svSOj
         8KzYOeZCpkmCB6Xwh77bYW22l3AvXbxn86HVI20ZsBNEcB1W0SMt0awHAT0IPrEZKP/Z
         JBWCwA1sHecZWV82yBOZjRf0EfBQ5Kzvsb6dLMtLu6GB5T644PWRC2YufKKZeBag0BJ6
         Iiwg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3wb7N34eu/IB5juL2wzGNgJfxGm+LxGcFR3XFgCubNiaC0AUd105U9ocJQxyc+62CCl+bX1kThZcX50umVb7t7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFm9WUEHFt+/YDVhaCW3Wb1dO3DNCsz2p/DnhrF7keHlA0AHr/
	DUPGJsGyHXX3lm91f7vKsnBcB13rU/PeA3xk881h++PmnbYYeQ32OgaFOV3ySZhA/oxq+cVVxrk
	3hdf6XeAmrg7Z2hAxxPOYHXC5gFlA267HKnhRfK11QzKft4BnkwfCt6pz6L01/u7D5Yb6GIGNPg
	==
X-Gm-Gg: AR+sD11RG3rpb8ggJr4KLZoJN6kkZiaNcojym+V4lKAMCLOeO3v5FG5cD4sFbNK/u+e
	36kIEu9vdS0ERaHBl73HyhaBFERoWIkqzlDgsz0lvtuaRc310068odlgiUDtLl/mQuN+Zw9/qXZ
	t+gKQ33bMoCj/DayicdFPQHd+lzWxvrmeIxSvjcJzpxVOHz1TPJGGPEXgujsaf/fCNfnPo+DBi9
	+Vdn0p831uG62CGYWdsuEJyjuqh9KpPfzfBXTREQIi2QdtxTif7H0okUzDKyP78ViRg//dxoL7Y
	EPhbESf+EAuv1/gZNHy7aBX7OM8L0hy5pZhq+s+9mhz7Glgj4XO5cw6PAC+bTmXB7/yyWi8rnXI
	CKBvnBKlJ0CDdOHyE+z7fUPkq
X-Received: by 2002:a05:622a:2448:b0:51a:8aec:9bbd with SMTP id d75a77b69052e-529a8353f25mr61789131cf.19.1785087846686;
        Sun, 26 Jul 2026 10:44:06 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51a:8aec:9bbd with SMTP id d75a77b69052e-529a8353f25mr61788861cf.19.1785087846280;
        Sun, 26 Jul 2026 10:44:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:40 +0200
Subject: [PATCH 7/8] arm64: dts: fsd: Move 'status' to the end to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-7-e9e3e9879d05@oss.qualcomm.com>
References: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
In-Reply-To: <20260726-b4-dts-coding-style-strict-v1-0-e9e3e9879d05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6074;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9Kdc+t7zEowlwHOut1CYSzTz7wD6Zy1nYRHG/ARWJm0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdOTo4JZdSInPTNsae/rPkvBcq2DkLeb/n0h
 E1eSIPJiP6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTgAKCRDBN2bmhouD
 11fbD/kB7w+BCZ2Wl6vmGP5t1Gdr1C47gKiZ7WNxO3SskdUUknoEbhSAzctvfmJjFfI1VLyxzBo
 w/XCU6uezm9TLAqhaN3PSxHvQWdrlgUdUPyRNUBopvt58838pgy1bnMqvYLI2Naij6/zRg+w4Pe
 vMthXochuhM7SKokWPgVq36ZwuW6sKotzdojFashb/vtswaAeV7xaXwlJFV36pHivEEJY6fncyy
 dlLzVeb/whkff6QpLpgZLA92G7JdEJYEV/2bTO8XQBbt0KAIy9u6U6PuKr0YoOxAH2I0E5dx93/
 R6e3DpksRbhWsDA9z/b4uVwfUhm/BCesTwQK2EqKJWY5ll/fkfV6EzCoB1AQe9SaUcSdy2t+H6+
 zdWWRzTwAbYXJmLXA3DDP653xStAgds/uaXXQlAPGrN1Z6z8wyPZv8+7JHC0ZCe0mjXjCna4p08
 LTPOsoZBH92gFwKVX4nmJdX2HFRIY2+yFTAepNcB1GOQgoxyHaMNDj5Si11N48jX2NhFYMY2xfv
 eB+wHlTPSrADPF1TDaLu9Z1hhXkGZjhm2P38iVLb9Oo35QrCGtS/R4xWiQqBmmlQbWjitujBfM7
 0wNiCvgJGBqj3RP0L3dxweiCC/Te/UsXaiw4jwEsLPRsykBgrKzN529706N/Ox0gu0tZ7rgkif7
 NkBRpXZarNZBGtQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX4Vt0CuTgcvyX
 7OdUZzoHQDDXJR47MSlRv+XXttbTc+f25oHVNNycWR8QNPs545xhgE0+QSZyQnUF+w8lP5AUqng
 HM7BwWNhQLmUrM6AxjVgy8oqum6jy5A=
X-Proofpoint-GUID: JL2pybYSXkj9-rq6_um8xL2l9T7zhlPk
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a664767 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vEzWEtAh74nsurIt10gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: JL2pybYSXkj9-rq6_um8xL2l9T7zhlPk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX6KrP5SUUwsf3
 6ITsZ66k6Am25SzbyCVVL/Luq/vOQvhzbS+PC+RiKPzJ7JZtvIyqJo79lPs4b3j+Cdm3weeVARD
 6lQeJE9yUhoPbxYyangbfX/nf2pgnb+DRv9YEoQr5Enph/2xm/FKbjr8m7JKX5KDl1KrL1Mfc5T
 qbbSKC2uOd3/b5xsEBNPynX734YgYOB/TMnZZrnyW/GYcPA5b2FArOh3yl4n8R2+RvLMnOnVS3B
 NRwA8rJwhoX1ZUnz0HdhKwPVIqQPcFUE1CeUc0pw7N6Bj+uLwqwxJwd0+jBnYhgzQvJ4J+9YSmY
 khQ0/Vq0W74Kk8zXGDQfgs5CrGB1aVoH30QAia81WUunYtmJbv9FJLuHJTTN/0KlPK/la0EXBSj
 is7ZrPYsEJqDu6MjDGaJXhhE5V7Kc2jMWlwMD9/Lwd961HN2nZ97JXvTq1MDh2GZUqjDSiGfcn+
 aIHUKwL/IxDKlWt1/bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [required-blank-lines] "status" must be preceded by a blank line
  [property-order] property 'phy-mode' out of canonical order (should sort before 'status')

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

