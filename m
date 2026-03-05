Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D07377031
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Mar 2026 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772701779; cv=none; b=caUOqv5/BywDX0PiZ3SVrTpq2cuC7AoSGA59Z0MYLSQIBksK7gZF3ixqtcE868reOatgmHA0eG0ae0jHs261jl3EJHuHq0bciNW2Dbx92xCLjSF8CbiplaICGYEt6giNJb2/blUC1B73yD/jv/6WZ05ZwdrdmkI0mAu/uP1zSfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772701779; c=relaxed/simple;
	bh=qkwvOBIjVKY+jX5sOdQlNLj1HsD1JTAivWXbCCNysDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHxhevXfnW0ni2TPzzyxw0FhgPTMVbiUKsV6mN96UsPzStapS7c1cxBugwscn9Lt/jdne0NQMEqPMghlSnWSTNKhjtX4jkex9MQrmd8sZ4xJP5AnSRcvbEMVu/csQazBk2XwUloRwiBDwgGsNksnSN5DAjvZs9awWaol7DBa9PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9fqzOeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cgi5SFEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9fqzOeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cgi5SFEx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AMvi865886
	for <linux-samsung-soc@vger.kernel.org>; Thu, 5 Mar 2026 09:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=; b=P9fqzOeHiMFU3pVm
	SS3hs3HuOLA0t9IOKqUyOodq9WYGCZ0z8BZUs0pgEU99MRnGq3j1Si/B1Fzzb02R
	1sjht9ljwLbkW2mpMsB2itIYxkyUvuOi9menhPzPl6Rz31pVJQDo8j2Uyy8YmhWF
	skhJ6HPZa1KnKFLA/B250RlC2Qx9QW1v2F0/aBMc0kOUaZaGmoLxkI4uGlzo8msC
	E4GGaqgRmKaqNv7o4J7Oyq60inL6fEc81kdEFWcYIeuJQCzljCgXctuaeetBLEY5
	hOWxsP2XBneG0+4AwDk1f176UlgUWTt5Q/XiW5bbGMAbh67tVkshWCnikEj9kMMm
	ttiVCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk1308-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 09:09:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so4353046885a.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Mar 2026 01:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772701775; x=1773306575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=;
        b=Cgi5SFExY/IuU2K92SmpLhjA434edw3c00B2ilvG8x7rMEVvM9pY4HOAraKVK0nfPF
         2xMKTlmTclupppVo9tXBxJel9PCed2ehQarZqGvajJmCGVlzVIh96hGjQoJBdzXoMegu
         ANk8Xrb08dw92P2P/eJQIQstX0j6t/9IfWNcy59T1fSpHdyNTOAb73bu2VwlndQbAWeL
         DUps6qhquJYBpxEuFPMN5ZBjwxPrufKqbDvEd6BLwJdOT6V3pXbvidpgqXP5kRu87IPW
         ZjIYmgZuCVt2AbSJaRVnkLVX+vTF2K+AVJw37uRO4wCaHRIMvtj3azcni4pBeVbkd/6R
         Y6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772701775; x=1773306575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3NSqAxF3r0Iieh2WUFeA3eHT3sx6AFCO5GTCkL4uXVs=;
        b=r8zilSAksMlrlqDHqvNTF2DfbqLNmtmlwCch+Lq0FjvH90gjwklwsxHR70WFaG610M
         7J8ae+7N4Hx+RCs+/S/4xp5gDaIHRiaEwm1QMv8yKbxT/reORUP0RqmyQ7oWthmhF021
         lN/Fni02APH5zybuZGoAxCZ8kNWGxfHf9KJcwVz/fxQ7+lS+sGZn7NBfgE5JIIBs7HQY
         6RLnmqIk7VkB6lRinN8GAnz6uWocnljV1CaRo2QdIhi8OY8pjURPGzuee7qDooD2V4nr
         uJYJXQdQS2sA5yqMuZUMq15KxAqPW785O/iQPyXqkwVLrLFifpsRRLmNn5qzZeX91Tka
         46Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXKLSYlH+aJLvgXznSrj+904nDDUtTGrn5bMW4oajfpHv++ek6iuG6YrVZIHjbES2WiwyKgH5WwS+HWZE+x440+Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZxCcUR0N6C9nFb+VTY6e0FO5eM+jxfT2TXVXBKYAabw3AgJze
	FyWQPTNiM1Cj01jRrKGTvSzCLJFm7HnWZGGQmgxo0wn3w3NcwhvPoz31Lo4QirDXKFPc9ol3HBe
	9uCkmT9eqr8Rl2gdDEStN/F0hDc/fH9QfVUscPpCUEPGC1m01uxXd89ys1BBwpnOEkHSFPV8kOg
	==
X-Gm-Gg: ATEYQzxNL+7+K9GR7y/+hX263fd8/EwSNoMYjjcwgyJowmRb2BR1b79gLBVHAGwDLxz
	8NNdZCLuJyAlcOo/arA2/inTeezeUloyZ1vni7pNaSdD5s4qsO1hyZrUpOPrb0o/36CjuUXfRP3
	ucG/p+qGwG1xixbDCkFjYcESfn3wAPZvZE6+W9T8yZ3nrLHyTUju9hjZmBl1wF5Ds7heKWWwf5u
	sAzOKr3rHQemzkRUQBSc7fQCm2PAl6SA/3BaBx7DPh+XlYewTj0TKIZc6AEN1GLMkN9mqfD4LUy
	7+0igBkb5AvYQ25MYtOPeTHylYJ7DDGi8G+T7FgwUpOzNXf9Mex3oK6wW+/ecjej7ArG6RwRPlW
	SRcUk/crpIEoJw3gdIkPZKLfssVAyPg8ZVmRKv/BJ9THT
X-Received: by 2002:a05:620a:c4b:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cd5aeea4e4mr678426185a.20.1772701775318;
        Thu, 05 Mar 2026 01:09:35 -0800 (PST)
X-Received: by 2002:a05:620a:c4b:b0:8cb:4543:c5cc with SMTP id af79cd13be357-8cd5aeea4e4mr678423485a.20.1772701774882;
        Thu, 05 Mar 2026 01:09:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm38817703f8f.6.2026.03.05.01.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:09:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 10:09:25 +0100
Subject: [PATCH 2/5] arm64: dts: exynos8895: Move I2C address/size-cells to
 DTSI
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dts-exynos-i2c-v1-2-2c8d3df3b9ca@oss.qualcomm.com>
References: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
In-Reply-To: <20260305-dts-exynos-i2c-v1-0-2c8d3df3b9ca@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9622;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=qkwvOBIjVKY+jX5sOdQlNLj1HsD1JTAivWXbCCNysDg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqUhGeownSnEhVD4uNo77/EysGV8haRBVi6gue
 04tpfN5TCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaalIRgAKCRDBN2bmhouD
 12lvD/oCHl5sKqK+y1S4uef9jsHOvxti/Z1DN9Z4wtTICWqMV2ih3tCF5bvXNUh5cfUEyPJNDk+
 e539pPAyz54mX3ORNAtjMxdnE0PhwSwsM6SDF6c9rIneLS4kxiS8ILfUZBtx1zlTiWdpapIY3AJ
 sb8rZBu0hSgQcNHVSS1scWw/E6mCp9wStDYD+Y1m/QL8/7nJcUw+bkA6BWXNV1QYR6jnK2wzxWi
 NGOiC16v7fqgNYE478C8RBXhv5jvwbULCsc0sQldl3EyxoH29rMpmfe7cjXD3x5VUXWb4zfrIBf
 EYQUZgeqC/BFaDRBE7uEzhhpqGl6Qyx5lH+xhejTgwXHfSQMTKTX72DImtHE3ZP3J+NRIt8yC7M
 AEKNLxlIceZ3kr8y2Z4m/cKYfu2RCsBWPxozhblthmpOr/gZ8mva+7h2RkHiKsuc1IrMca0Nxtx
 hLcejm8j0g++1KEoVH9gXR2RF+2e4mUDXNqVzPZf+hjivESBXwny2yw0fcqMQIAitCpJ/l2Nvtj
 EKaL8XQ6cWWmiJYTCzLfZbJb/AlIqasgH+mNg7MQKv1Xq9Ria+B5J4EKsJ7//dS5bG49qbRkFQq
 rZ9bM5D8w0C72eK2Pwf+9Ls/F9OFkcfZzuA9vHjIBmytu5zcnWuA/71SxZ8gJHOTMepmTm7GXFP
 g4p3Oi4IJa+mYeQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: YrWZ4pFpbrOumsJssgYaSO6TkpUO_BU1
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a94850 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DzUSkR2MQIpuhHpr3ioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YrWZ4pFpbrOumsJssgYaSO6TkpUO_BU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3MyBTYWx0ZWRfXyeVnDepuQvmV
 yfqRs+DGtJU8nI9QATsLw+PEVgWHzGigtZ8HC8K69GESAWbl96ctx4ObMz4gQdxE7wKVxTR9NTE
 mwgdDuzmCfkKXpSQuWlHQXyUB7bpqlN8a2K39ekIK6C/9gjVB2ou4mXAQa+WVdgvUrOjba+3uhf
 Dt7FUg/bkJP45UoIEt4PplEkDrC7Q9DIhCSfLnxRBUtN4VvOUiuctoluSvj8v7U7MYefsor60lQ
 DO+fNNNc98FR8hZo2zXwrvXL9s585uCCcMHizHuloYL+CIMcwWmSwa3XHFOGlibp/0WXdO/LKP0
 wJadwhKW81Kg3VPhpr61PJga7w+4v6PGmi/2HA2gMzuCV3iYEGibvbIQqd2X0KiX00kSEJD/2Ce
 y2lWWOWQld2T1gwpKw1mNoDp5IZLwiuRyaDNlAh9T3boaC2fhXcifJiDi9Ff6z4eMVCUo2j2Z2F
 B9zt3bjeo9i6olCrxxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050073

Convention followed in all other DTSI files is to define I2C controller
address/size-cells in the DTSI thus reducing code needed in each DTS.
It's also logical, since I2C is a bus and needs definition of addressing
children, even if the bus is enabled without the nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |   2 -
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 128 +++++++++++++++++++++
 2 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
index 61e064af3337..305dc72f93d8 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts
@@ -103,8 +103,6 @@ reg_placeholder: regulator-0 {
 };
 
 &hsi2c_23 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	status = "okay";
 
 	touchscreen@48 {
diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
index f92d2a8a20a2..ff114cd6c9ea 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
@@ -266,6 +266,10 @@ hsi2c_5: i2c@0 {
 				interrupts = <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -305,6 +309,10 @@ hsi2c_6: i2c@10000 {
 				interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c6_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -328,6 +336,10 @@ hsi2c_7: i2c@0 {
 				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c5_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -367,6 +379,10 @@ hsi2c_8: i2c@10000 {
 				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c8_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -390,6 +406,10 @@ hsi2c_9: i2c@0 {
 				interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c9_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -429,6 +449,10 @@ hsi2c_10: i2c@10000 {
 				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c10_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -452,6 +476,10 @@ hsi2c_11: i2c@0 {
 				interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c11_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -491,6 +519,10 @@ hsi2c_12: i2c@10000 {
 				interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c12_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -565,6 +597,10 @@ hsi2c_13: i2c@0 {
 				interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c13_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -604,6 +640,10 @@ hsi2c_14: i2c@10000 {
 				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c14_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -627,6 +667,10 @@ hsi2c_15: i2c@0 {
 				interrupts = <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c15_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -666,6 +710,10 @@ hsi2c_16: i2c@10000 {
 				interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c16_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -689,6 +737,10 @@ hsi2c_17: i2c@0 {
 				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c17_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -728,6 +780,10 @@ hsi2c_18: i2c@10000 {
 				interrupts = <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c18_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -751,6 +807,10 @@ hsi2c_19: i2c@0 {
 				interrupts = <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c19_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -790,6 +850,10 @@ hsi2c_20: i2c@10000 {
 				interrupts = <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c20_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -813,6 +877,10 @@ hsi2c_21: i2c@0 {
 				interrupts = <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c21_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -852,6 +920,10 @@ hsi2c_22: i2c@10000 {
 				interrupts = <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c22_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -875,6 +947,10 @@ hsi2c_23: i2c@0 {
 				interrupts = <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c23_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -914,6 +990,10 @@ hsi2c_24: i2c@10000 {
 				interrupts = <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c24_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -937,6 +1017,10 @@ hsi2c_25: i2c@0 {
 				interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c25_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -976,6 +1060,10 @@ hsi2c_26: i2c@10000 {
 				interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c26_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -999,6 +1087,10 @@ hsi2c_27: i2c@0 {
 				interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c27_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1038,6 +1130,10 @@ hsi2c_28: i2c@10000 {
 				interrupts = <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c28_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1061,6 +1157,10 @@ hsi2c_29: i2c@0 {
 				interrupts = <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c29_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1100,6 +1200,10 @@ hsi2c_30: i2c@10000 {
 				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c30_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1123,6 +1227,10 @@ hsi2c_31: i2c@0 {
 				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c31_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 
@@ -1162,6 +1270,10 @@ hsi2c_32: i2c@10000 {
 				interrupts = <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>;
 				pinctrl-0 = <&hsi2c32_bus>;
 				pinctrl-names = "default";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				status = "disabled";
 			};
 		};
@@ -1180,6 +1292,10 @@ hsi2c_1: i2c@10990000 {
 			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c1_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1191,6 +1307,10 @@ hsi2c_2: i2c@109a0000 {
 			interrupts = <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c2_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1202,6 +1322,10 @@ hsi2c_3: i2c@109b0000 {
 			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c3_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1213,6 +1337,10 @@ hsi2c_4: i2c@109c0000 {
 			interrupts = <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&hsi2c4_bus>;
 			pinctrl-names = "default";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 		};
 

-- 
2.51.0

