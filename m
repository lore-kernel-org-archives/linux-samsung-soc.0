Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68B3D6485
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785087845; cv=none; b=DvXKLg3CWmCbZGgSBbYfQkPAS01VIPCQdog5qdZQ8vq1sST37GqotT7vvdcC0/MavfS1lDVAz7F0ItOkAVh4V0ZSIOutLb2PllbQ5DF0My5l+I7fmjJY9JCVbZ0qAI05V2HmmRwSbKKlVu5vgrrjvAicllJu50YnSFO6x0M2xBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785087845; c=relaxed/simple;
	bh=fsqiEaBAY3HEz6IjQfmCcoQZvhkbhYkDY/+ZBElAv1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWYl/VovYSoHzgzotVIvE5w39rDNFIPEYBL+jzh4tkbRUxXPVKdpYwdSLzUzEtzMxjuVQy+C13rVvavGFoFk6VIx++bbUrK31V/gmKUuwCBkYvF1UOYCXdVo+htE127OSmRwprCCyrIkt9YEjBs8n8rfNdTS3tTQdPtXZY1bJs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBiz58Im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+LOBqQ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBiz58Im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+LOBqQ7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH85LR1094350
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K5n0vVy0SApkUwOafcy13Sj0H1nVfoBKi2oNeFyC4qg=; b=XBiz58ImbIoytp0G
	G18IBaSsitIftyCTh5Va1OT1013cCH6MF5Q5CWrXJ1I9yKujT78QzfKERWHpxjeX
	gVqp0s0M9NnmKfG9DBQpt7FkIejEPamECq5ZP9O6bW1xSqqf85eiSQ/RsycEbZoL
	wwecFHBfQKSDck3srCF2ASSqmqo8n2nmjQz1VgTszbhEmkCRPIgLqiFiXVf5I6Jz
	Y56qU2Z8z4WjUr31w0rBr1LCMXp58eyb5zahSSEP++y22dxjcQWLLr/pxxmAwVNf
	CBOlmlyY9gAt1RxCsxjN26PbaGy0nDQfvg3Hqoc91/xqzgCi3IoyOS1Z/uQMs6p0
	nNDR+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7ud97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 17:44:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0e702df8so25801711cf.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jul 2026 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785087842; x=1785692642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5n0vVy0SApkUwOafcy13Sj0H1nVfoBKi2oNeFyC4qg=;
        b=O+LOBqQ7naeN5oJjxQsE6ZRVRgEknAMVmsITsE8HFV+o4jPjQfznMJNzhttUcMTFDv
         q8BKpccMqeRlswhb7LWGIUHrvWWxpNREXr9gAutuy+2OYk+t8hDdBz7wAb3zzKBri2HZ
         qHOizW9NWFHk2zXY8XwbvdBJYyuQP5M7AgXjzon3XD7CvY3jpeWLehDhROpGrhaV/w1a
         YaZx1PHcKSq7cR5t3mlTm7a8ndNZB8ssRLf7JZLwtBzLxgbt6WxsGf8PCLYXxNFNxlnK
         /GfCf7IEDKc/ErZ3VGdvDSqXVHzgif/fSTLPfxpYxeZe64AB+0kkryIXYmxNPhuqyy7H
         5Ojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785087842; x=1785692642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K5n0vVy0SApkUwOafcy13Sj0H1nVfoBKi2oNeFyC4qg=;
        b=TC4xwBlDw7iKdgT9cIqW5pH5C9Zddgjtl9P5tRxuI9jqPkzRtQ4QfRLFlany6W/32q
         C40g3KyhZVrqFiCONzLP45hU8LxdcGFQmsUeJK1mYHC4xsMLTbY63anpg7RmzgJdoy1j
         JCNrohyIDtJLmhLZaUFp+NHjDlkpsrICMbCbM448HC/nGL03YUCU09yovxDmM+hCrWxg
         pLpO/Q1wSweQkgJWZEptEkOrM/6xy1uUpOM2TW8QZeLTyUDCi20GSUwyikxNtkJjQJSo
         dyIrV2dyshKFe2iEYO7KkQO1B4nOvWyrQ7AzgHbPCbzKpDDm2mmuwxC4X9tgrj8i/MSK
         aULA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8pUWtqyGpvIcSBBZDMlVu0FdG7gW08RnXF0qYNjG+xDQzZT38qGhiiY24nlCBiVN0WboXHD3x1+9/yGtwBTGaPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQTxW5F0R6dPkZ/x9mkt9kLeCRqxnOs0hUgX+WIn48QHPIMsL/
	xqwARoaw9jSWeBa5GihK2Zb/VEK4X/i7VKRGKKV32/cBBCkIdzT6riW3lqBDIaXzRNmc/SHJUw8
	adh6fPXSYmgFcnr0oRWStoPau0hoysL2dIaCPgbQvFz++X4yCAkNzK3tUAsUj6e41GBTkcplGug
	==
X-Gm-Gg: AR+sD10Oery625VSViMBn8ejLead8/wX0yJ1Yp01/2rLKrbpbDRmglwpFbeDyL5X1MZ
	p1y1EMeobaf+wrkfg5joXsv0tPoPMFBknHzbYuppsiw/+l1Ko/k/RJ/Rsh6t1Amm5AYfkD62ICU
	UppQGqpFJUS8c4zA3XpTQO1NBGvMOHKIWMTMZKmbBm+LXEsfvc05AfK4O1YVYQ8SIOgfw7KED/v
	cpwJge1TowseDT/l3GHl2I8VDQQzVHKAEXi/wtKkI6jq7Ffw7H0Kv9zXXbHO4cO85tgs63CrzKc
	dPRcMbTK+QhB4Fex0f9g5YNYsAOZ+2a5wj2lxcmovmNflb82q1WBqydSTBVUUoSy58Sodc4YiWF
	MNXcXq3qEWWdydAJg7M77L2c6
X-Received: by 2002:ac8:7d14:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-529a835df5amr59203681cf.4.1785087842091;
        Sun, 26 Jul 2026 10:44:02 -0700 (PDT)
X-Received: by 2002:ac8:7d14:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-529a835df5amr59203331cf.4.1785087841574;
        Sun, 26 Jul 2026 10:44:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm41576093f8f.27.2026.07.26.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 10:44:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 19:43:38 +0200
Subject: [PATCH 5/8] arm64: dts: google: Move 'status' to the end to match
 coding style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-b4-dts-coding-style-strict-v1-5-e9e3e9879d05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=18939;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fsqiEaBAY3HEz6IjQfmCcoQZvhkbhYkDY/+ZBElAv1Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZkdMGapoNAp9hZI3nZ3qfLapKqqL0RHCbpMYd
 hDtuR1l6E6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamZHTAAKCRDBN2bmhouD
 1366D/4lCsGdmGelxKw3fA244Qjin/ig0iYC5Rlem89Pnoh1V/ENzVSRw9hV1wt4Ifqa6VjDwae
 Pas5kadx0bWzYClkHlQWcG4r4ulmiJQYWHNZbHk4kzVtbHZXLqCpWDntnp2RbOVOz6m1gk/B+ZT
 1eLEdzdpxNn9O/MsnVm86ogQvmDX9Oqa5v2wo4fcelhKqLWfdq4CsB294ROEi6WZVfWrhATYqWN
 pqM/mKdai9fWlzn6omPsRURoGKyZCazpEbsW+Td/krnMsiWGaOvnnwqju6AClPCAk5R6XFwj/Ty
 5Ih8ckDXLgXuLPbHuFSbcvuNGwiCaQ/t5NfOV9tGgJnKfQZBQ7VuX70DET3cHuzelMbMKP+1/N3
 wEoMIzyxi1PRJt9GRUa0BevctksDSLR1fBm7lmr667s7xvkcD8SP4+UpncY7C11vk0NNOG3UUNa
 meR1IgqCHbtUCdiRTJIPpto5tqJAODiCFKBvhhkvop4MHXKJmPV+EcQDp4LNpTZU2olR1I9Mvra
 VkqvrVc8y9iQqt0ojSVG013T+QkCYylnIxgtc+TxW2NZpYkLOxuumzvLuV1D9x9+51DZO/wJ7s8
 5aURpnkwyKTbAOEZdQhUxnM3VV1T7SayynhCNm64MndwVbVMTC0ooOZQ6aEKa/U3JjJdM5jgXYW
 VeDDmXCb5lqj3lw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: niGHJ4lWYAzFOsZetpvzsI_812eRgCvg
X-Proofpoint-GUID: niGHJ4lWYAzFOsZetpvzsI_812eRgCvg
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a664762 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=m3zw2U_XGuQn2lDZ05UA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX/+RUSuYD2l0e
 EAxr7oqtpkMjfg6flX69sAVuvyJp4EPUxCEftdWkG42XR4rJdU2rYUHJwR0CcudG29lNQWOlQon
 GvWLdxzLzIXYpT21vhmcm50pqV+6GI6vyh+hGKCpI0oGzYWt7m+qkJ/7QcbOFEgtrBRdwKFwU2G
 qxI2e1cT9mDSZWbGZLD0iAj91VF099T3IcpF5w4zk2NImsS+dZ/oliAniwEA4SZvrwCMghgwoo7
 0/Exa3vDHMpjVLW/r7fovSRdYYI7RJQ0kp/y9GPfhM2RibWFw5HOxKK4kNEw31GD55bXy2bkGMk
 dV7mQ12X/tRLMFuQd74ej2QoV6Hw7NFNSGhXyJqHm/TPHc2FqpUFbjYBS6vSOQB6UfOfQNJX8DN
 xwfklMzQTGt+H8FvEUEOzXKHEDgtazYXVYHp3ZWw1iydyoRx331/NPmuh/wmx3QCtHYJbzZM+B+
 k9O4GllK/MO93C7oiPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE3OSBTYWx0ZWRfX7Ts8YXJasOKo
 ltoa8jwBb9QeJ9dwvGPQJm0bcZ0YHhCw+n0OlZQRrYjc1EFUMs7Iy4qBHhSDSmbp+WrPJDVb/1k
 eQd3+xf0AK8byFokb2B79OyfRT1NYVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260179

'status' property is special, thus DTS coding style expects it to be
always the last property preceded with a blank line, as reported by
dt-check-style:

  [required-blank-lines] "status" must be preceded by a blank line
  [property-order] property 'vcc-supply' out of canonical order (should sort before 'status')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  2 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 12 +++-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 70 ++++++++++++++++++++++
 4 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 36721adcaa23..c5a3958c2320 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -39,6 +39,7 @@ ldo31m {
 
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1080 * 2400 * 4)>;
+
 	status = "okay";
 };
 
@@ -47,5 +48,6 @@ &framebuffer0 {
 	height = <2400>;
 	stride = <(1080 * 4)>;
 	format = "a8r8g8b8";
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index 5227cd4e314b..a12f2b88d72d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -32,6 +32,7 @@ framebuffer0: framebuffer-0 {
 			vci-supply = <&s2mpg10_ldo22m>;
 			vddi-supply = <&s2mpg11_bucka>;
 			/* format properties to be added by actual board */
+
 			status = "disabled";
 		};
 	};
@@ -98,6 +99,7 @@ cont_splash_mem: splash@fac00000 {
 			/* size to be updated by actual board */
 			reg = <0x0 0xfac00000 0x0>;
 			no-map;
+
 			status = "disabled";
 		};
 	};
@@ -856,8 +858,9 @@ &serial_0 {
 };
 
 &ufs_0 {
-	status = "okay";
 	vcc-supply = <&ufs_0_fixed_vcc_reg>;
+
+	status = "okay";
 };
 
 &ufs_0_phy {
@@ -867,6 +870,7 @@ &ufs_0_phy {
 &usbdrd31 {
 	vdd10-supply = <&reg_placeholder>;
 	vdd33-supply = <&reg_placeholder>;
+
 	status = "okay";
 };
 
@@ -875,6 +879,7 @@ &usbdrd31_dwc3 {
 	usb-role-switch;
 	role-switch-default-mode = "peripheral";
 	maximum-speed = "super-speed-plus";
+
 	status = "okay";
 
 	port {
@@ -893,6 +898,7 @@ &usbdrd31_phy {
 	vdd33-usb20-supply = <&reg_placeholder>;
 	vdda-usbdp-supply = <&reg_placeholder>;
 	vddh-usbdp-supply = <&reg_placeholder>;
+
 	status = "okay";
 
 	port {
@@ -904,20 +910,24 @@ usbdrd31_phy_orien_switch: endpoint {
 
 &usi_uart {
 	samsung,clkreq-on; /* needed for UART mode */
+
 	status = "okay";
 };
 
 &usi8 {
 	samsung,mode = <USI_MODE_I2C>;
+
 	status = "okay";
 };
 
 &usi12 {
 	samsung,mode = <USI_MODE_I2C>;
+
 	status = "okay";
 };
 
 &watchdog_cl0 {
 	timeout-sec = <30>;
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
index a422542715f2..7c4273796a22 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-raven.dts
@@ -35,6 +35,7 @@ ldo14s {
 
 &cont_splash_mem {
 	reg = <0x0 0xfac00000 (1440 * 3120 * 4)>;
+
 	status = "okay";
 };
 
@@ -43,5 +44,6 @@ &framebuffer0 {
 	height = <3120>;
 	stride = <(1440 * 4)>;
 	format = "a8r8g8b8";
+
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86933f22647b..edc38f2d1183 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -624,6 +624,7 @@ watchdog_cl0: watchdog@10060000 {
 			interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <0>;
+
 			status = "disabled";
 		};
 
@@ -636,6 +637,7 @@ watchdog_cl1: watchdog@10070000 {
 			interrupts = <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH 0>;
 			samsung,syscon-phandle = <&pmu_system_controller>;
 			samsung,cluster-index = <1>;
+
 			status = "disabled";
 		};
 
@@ -707,6 +709,7 @@ usi1: usi@109000c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_0>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1000>;
+
 			status = "disabled";
 
 			hsi2c_1: i2c@10900000 {
@@ -721,6 +724,7 @@ hsi2c_1: i2c@10900000 {
 				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c1_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -734,6 +738,7 @@ serial_1: serial@10900000 {
 				pinctrl-0 = <&uart1_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -748,6 +753,7 @@ spi_1: spi@10900000 {
 				interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi1_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -762,6 +768,7 @@ usi2: usi@109100c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_1>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1004>;
+
 			status = "disabled";
 
 			hsi2c_2: i2c@10910000 {
@@ -776,6 +783,7 @@ hsi2c_2: i2c@10910000 {
 				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c2_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -789,6 +797,7 @@ serial_2: serial@10910000 {
 				pinctrl-0 = <&uart2_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -803,6 +812,7 @@ spi_2: spi@10910000 {
 				interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi2_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -817,6 +827,7 @@ usi3: usi@109200c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1008>;
+
 			status = "disabled";
 
 			hsi2c_3: i2c@10920000 {
@@ -831,6 +842,7 @@ hsi2c_3: i2c@10920000 {
 				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c3_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -844,6 +856,7 @@ serial_3: serial@10920000 {
 				pinctrl-0 = <&uart3_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -858,6 +871,7 @@ spi_3: spi@10920000 {
 				interrupts = <GIC_SPI 637 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi3_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -872,6 +886,7 @@ usi4: usi@109300c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_3>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x100c>;
+
 			status = "disabled";
 
 			hsi2c_4: i2c@10930000 {
@@ -886,6 +901,7 @@ hsi2c_4: i2c@10930000 {
 				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c4_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -899,6 +915,7 @@ serial_4: serial@10930000 {
 				pinctrl-0 = <&uart4_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -913,6 +930,7 @@ spi_4: spi@10930000 {
 				interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi4_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -927,6 +945,7 @@ usi5: usi@109400c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_4>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1010>;
+
 			status = "disabled";
 
 			hsi2c_5: i2c@10940000 {
@@ -941,6 +960,7 @@ hsi2c_5: i2c@10940000 {
 				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -954,6 +974,7 @@ serial_5: serial@10940000 {
 				pinctrl-0 = <&uart5_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -968,6 +989,7 @@ spi_5: spi@10940000 {
 				interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi5_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -982,6 +1004,7 @@ usi6: usi@109500c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_5>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1014>;
+
 			status = "disabled";
 
 			hsi2c_6: i2c@10950000 {
@@ -996,6 +1019,7 @@ hsi2c_6: i2c@10950000 {
 				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c6_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1009,6 +1033,7 @@ serial_6: serial@10950000 {
 				pinctrl-0 = <&uart6_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1023,6 +1048,7 @@ spi_6: spi@10950000 {
 				interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi6_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1037,6 +1063,7 @@ usi7: usi@109600c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_6>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1018>;
+
 			status = "disabled";
 
 			hsi2c_7: i2c@10960000 {
@@ -1051,6 +1078,7 @@ hsi2c_7: i2c@10960000 {
 				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c7_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1064,6 +1092,7 @@ serial_7: serial@10960000 {
 				pinctrl-0 = <&uart7_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1078,6 +1107,7 @@ spi_7: spi@10960000 {
 				interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi7_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1092,6 +1122,7 @@ usi8: usi@109700c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x101c>;
+
 			status = "disabled";
 
 			hsi2c_8: i2c@10970000 {
@@ -1106,6 +1137,7 @@ hsi2c_8: i2c@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c8_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1119,6 +1151,7 @@ serial_8: serial@10970000 {
 				pinctrl-0 = <&uart8_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1133,6 +1166,7 @@ spi_8: spi@10970000 {
 				interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi8_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1148,6 +1182,7 @@ usi_uart: usi@10a000c0 {
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1020>;
 			samsung,mode = <USI_MODE_UART>;
+
 			status = "disabled";
 
 			serial_0: serial@10a00000 {
@@ -1160,6 +1195,7 @@ serial_0: serial@10a00000 {
 				pinctrl-0 = <&uart0_bus>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <256>;
+
 				status = "disabled";
 			};
 		};
@@ -1174,6 +1210,7 @@ usi14: usi@10a200c0 {
 				 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric0 0x1028>;
+
 			status = "disabled";
 
 			hsi2c_14: i2c@10a20000 {
@@ -1188,6 +1225,7 @@ hsi2c_14: i2c@10a20000 {
 				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c14_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1201,6 +1239,7 @@ serial_14: serial@10a20000 {
 				pinctrl-0 = <&uart14_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1215,6 +1254,7 @@ spi_14: spi@10a20000 {
 				interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi14_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1254,6 +1294,7 @@ usi0: usi@10d100c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1000>;
+
 			status = "disabled";
 
 			hsi2c_0: i2c@10d10000 {
@@ -1268,6 +1309,7 @@ hsi2c_0: i2c@10d10000 {
 				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c0_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1281,6 +1323,7 @@ serial_usi0: serial@10d10000 {
 				pinctrl-0 = <&uart0_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1295,6 +1338,7 @@ spi_0: spi@10d10000 {
 				interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi0_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1309,6 +1353,7 @@ usi9: usi@10d200c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1004>;
+
 			status = "disabled";
 
 			hsi2c_9: i2c@10d20000 {
@@ -1323,6 +1368,7 @@ hsi2c_9: i2c@10d20000 {
 				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c9_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1336,6 +1382,7 @@ serial_9: serial@10d20000 {
 				pinctrl-0 = <&uart9_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1350,6 +1397,7 @@ spi_9: spi@10d20000 {
 				interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi9_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1364,6 +1412,7 @@ usi10: usi@10d300c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1008>;
+
 			status = "disabled";
 
 			hsi2c_10: i2c@10d30000 {
@@ -1378,6 +1427,7 @@ hsi2c_10: i2c@10d30000 {
 				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c10_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1391,6 +1441,7 @@ serial_10: serial@10d30000 {
 				pinctrl-0 = <&uart10_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1405,6 +1456,7 @@ spi_10: spi@10d30000 {
 				interrupts = <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi10_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1419,6 +1471,7 @@ usi11: usi@10d400c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x100c>;
+
 			status = "disabled";
 
 			hsi2c_11: i2c@10d40000 {
@@ -1433,6 +1486,7 @@ hsi2c_11: i2c@10d40000 {
 				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c11_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1446,6 +1500,7 @@ serial_11: serial@10d40000 {
 				pinctrl-0 = <&uart11_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1460,6 +1515,7 @@ spi_11: spi@10d40000 {
 				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi11_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1474,6 +1530,7 @@ usi12: usi@10d500c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1010>;
+
 			status = "disabled";
 
 			hsi2c_12: i2c@10d50000 {
@@ -1488,6 +1545,7 @@ hsi2c_12: i2c@10d50000 {
 				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c12_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1501,6 +1559,7 @@ serial_12: serial@10d50000 {
 				pinctrl-0 = <&uart12_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1515,6 +1574,7 @@ spi_12: spi@10d50000 {
 				interrupts = <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi12_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1529,6 +1589,7 @@ usi13: usi@10d600c0 {
 				 <&cmu_peric1 CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6>;
 			clock-names = "pclk", "ipclk";
 			samsung,sysreg = <&sysreg_peric1 0x1014>;
+
 			status = "disabled";
 
 			hsi2c_13: i2c@10d60000 {
@@ -1543,6 +1604,7 @@ hsi2c_13: i2c@10d60000 {
 				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&hsi2c13_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 
@@ -1556,6 +1618,7 @@ serial_13: serial@10d60000 {
 				pinctrl-0 = <&uart13_bus_single>;
 				pinctrl-names = "default";
 				samsung,uart-fifosize = <64>;
+
 				status = "disabled";
 			};
 
@@ -1570,6 +1633,7 @@ spi_13: spi@10d60000 {
 				interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
 				pinctrl-0 = <&spi13_bus>;
 				pinctrl-names = "default";
+
 				status = "disabled";
 			};
 		};
@@ -1609,6 +1673,7 @@ usbdrd31_phy: phy@11100000 {
 			clock-names = "phy", "ref", "ctrl_aclk", "ctrl_pclk", "scl_pclk";
 			#phy-cells = <1>;
 			samsung,pmu-syscon = <&pmu_system_controller>;
+
 			status = "disabled";
 		};
 
@@ -1622,6 +1687,7 @@ usbdrd31: usb@11110000 {
 			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
 			#address-cells = <1>;
 			#size-cells = <1>;
+
 			status = "disabled";
 
 			usbdrd31_dwc3: usb@0 {
@@ -1635,6 +1701,7 @@ usbdrd31_dwc3: usb@0 {
 				snps,has-lpm-erratum;
 				snps,dis_u2_susphy_quirk;
 				snps,dis_u3_susphy_quirk;
+
 				status = "disabled";
 			};
 		};
@@ -1698,6 +1765,7 @@ ufs_0: ufs@14700000 {
 			phys = <&ufs_0_phy>;
 			phy-names = "ufs-phy";
 			samsung,sysreg = <&sysreg_hsi2 0x710>;
+
 			status = "disabled";
 		};
 
@@ -1709,6 +1777,7 @@ ufs_0_phy: phy@14704000 {
 			#phy-cells = <0>;
 			clocks = <&ext_24_5m>;
 			clock-names = "ref_clk";
+
 			status = "disabled";
 		};
 
@@ -1812,6 +1881,7 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			/* TODO: update once support for this CMU exists */
 			clocks = <0>;
 			clock-names = "pclk";
+
 			status = "disabled";
 		};
 

-- 
2.53.0

