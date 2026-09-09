Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1D58497D
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2026 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963504; cv=none; b=dgWYuunTpmxQxni50HET2LCBsiZ/298Sg/RMZF7mEsZcG1IkpObS5hhv8kWKEQNPN71US3yyxaZdjDurCKMnUxHMt1bgR5BPivJ/EnmYuhtBU5kuvaV+nG9bIxiHPvTeH5x1b8MUZKHwVF3zI0gem8zvAAr4ZNQ3x6AthW5G6+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963504; c=relaxed/simple;
	bh=Y71eIQDDyUhXRKh/NkOaLzyOm5IcbP6RGlZeelTea5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMg7LasKiYiGCjMJO1iWVaUCV5lYMVUrrbZjkwGEqDTrs7TIHLEvgUY1UIC/ytkZK9Bsa3mvZSJyZYccn9NTAsG4p1lb4mtW9Frha/lihOW7LDbyf75hJWbckscn5iBDbvXmGuRHYi/hG+hnvUSvdNfNiZPvpzMY6zJkGDLHDBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfxnY0wl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eEF5VGl2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XfxnY0wl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eEF5VGl2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Fi2018943
	for <linux-samsung-soc@vger.kernel.org>; Wed, 9 Sep 2026 14:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXE6XobC3ury7rZX6jNG08P1KoDrVHt7n7WgxsPOMyw=; b=XfxnY0wlMWDMpBbA
	eAte+CIrumiTiT1u0UkoBUw/qihlJapQsw8j2gX+q0U40PfRZ1RDEsJAneNbU2Ix
	1CXFqV9GZ2ndP1sJA0HVvtUXbZ1SAUbQXGYGfadLypJiMxPquzh0/pXnWqKxj/PU
	8QAxXuR5d7BO1PnMUpjiy3nkX5/9XnAXIYtf52RyrajRC5x4RbRgYhIQiZ1b+FDo
	SI3M9Lm5Qxt/01NZpuWlb/HwWeDI/j8JmyEi3SGNUgZbJ33S4HIiwOFpo01rvXuc
	yw46+WgNT4WWooKAV+MgBvxrhib0+tWD26s1VOg7CUtR8+e8zk4oLK+bR8TEjzRc
	8349ow==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8t6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 14:18:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9909eeeaso483469241.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2026 07:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788963501; x=1789568301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXE6XobC3ury7rZX6jNG08P1KoDrVHt7n7WgxsPOMyw=;
        b=eEF5VGl2Cq3wmZB8i58Qiud77LGUlIHKkQ9OX/V6v1l/mcxZpXj/PLthEnc/zbT9kV
         fG8QgsVNHFfLkxk94OfZ3jwa+ha2VWirXIzke5ne3a3zDGqY/qLP0HJmpeasn7qWo6Oo
         dI/fq/tiqeSj91qqB/1uKJsdQh3SmFG8G4ue6fxQCPf7q+pI9BMDNvZj8132THJINbr3
         1tPVcYSFr6FbXNHWWPHkAwXviAFkKF8dArqv/FTKJNnRwBIrfFCBIDri/e1W7WcGjVey
         8+adUmzMqkC226e+yCIMVZ5F+4r2R1nF/41H9J9/wJ1JMjbCqU576tbFJearB0rN4xpa
         rEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788963501; x=1789568301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXE6XobC3ury7rZX6jNG08P1KoDrVHt7n7WgxsPOMyw=;
        b=e2Ni414N3CUJ3TzFXmzmt59d1xc3JhAMssDmIeRX05rKeRfCCYYc+2O7CYoHUQfSz6
         GuzPr2Ipbh+D1+pOXZUq6tuy2Z7Qe2b0ZgWaBucnsJ4ObOnjna+PYYtWCabCt4yGKFY+
         tb+0P1vsl2DGdkceKQt7Jq3DIll81WP4gq9F6s2sk46nbepx4xeXIioRiaurCgvVI3P2
         W7CDh9+qAd9D3otyivEcU1rmY8/QQg/sdY07FOqoSaIrxwAjrmmqnjlAB2Afpo5IrW8A
         +kwsTwhZSV6oM6U7CYQK0sH66kZUmEkDt56ENOEHbrCLYs+3rzdUTZZlxJ2r06St11OJ
         Fgdg==
X-Forwarded-Encrypted: i=1; AKwUvBzrFIkpshfkrO2sRMbXrYuOXJAunhRp4HvXKRA5Ipz8V77Zvc80jyFGVJxZKdH8JY1YiYkxcjtHYENOEs+l8xSXsQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nrLW7tUqG2nAwYRgt+P9AMIYIC48CqYKcfkAbrl8vAwuGRzvCN
	Fq6OQxvN4GbwQBpLNtMPeyPcfRjsj/b6Ak2PeVo4Qz1lyr1TkTglPWI/kF/6mMkG5WZtvl4rOOE
	cbKi0k46UeeYbRWCGFxRk5u4GHZB18IyWB4mb6B5TwfmAmrDH2YscwOFLBOi/Rj3SgRWpOX1i0A
	==
X-Gm-Gg: AYBFou0TNaLnujR19G0w6rrWf6HCfFvy6BAwXxsT4YOO9pW/HUwlaiLjNMGT/qJ2P7g
	GLl83yMDnlsmE7ucNsbxq90UQQLpiowcTas1hEzPja4azxyorFDRxdJHb0v9ANdZo8W2beimVGh
	GUEX937Dcpm4AoxdRL2uoUORvfH27MLLogUsPJ5KtvGQA7146YZZsF/uV+3KBpmWim2GR9h7Sfr
	gpUC6QsHb6eb3A0DHhixVMHGb1Ioih8gnUG/qemYB9XEP43hsAvrp57kP1MtpzprfOdXN1rNRrj
	cFefB8/AUNdzVXKybQeH0XesNGgT0LCLj/e5fdtgqaaCjRULSgi76mp1E3DVyPtaCn781FZKVBl
	OraJDaqxc5iDuiNd3hRCUWGk=
X-Received: by 2002:a05:6102:5346:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-78a4aa9948fmr14313858137.8.1788963500608;
        Wed, 09 Sep 2026 07:18:20 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:777:ab3c:b88c with SMTP id ada2fe7eead31-78a4aa9948fmr14313301137.8.1788963495366;
        Wed, 09 Sep 2026 07:18:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c293b6246c4sm77581766b.20.2026.09.09.07.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:18:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:17:56 +0200
Subject: [PATCH 5/5] arm64: dts: fsd: Re-order properties to match coding
 style
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-dts-samsung-cleanup-strict-v1-5-1b755a446b22@oss.qualcomm.com>
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7158;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y71eIQDDyUhXRKh/NkOaLzyOm5IcbP6RGlZeelTea5s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoWqV8WS50E8rmNpdpzicxS5MY0zirtCNvsHQ/
 jdWVWc3MIOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFqlQAKCRDBN2bmhouD
 13xoEACJGB+0HRDiw88mhMzjyFCiAhyUIPJyjQVG/AFypFan7lv0/bmSdwhOmvXOSKAq2L/MmvQ
 uLoJ5IEPOSGjgIXeEyi5Xqb/Z/leiVKUK/QiQ1EHmJpZ9rnW29jrUNlxvZE9UBWviXBnluA1RFD
 8foQW4iLuoS2K6tLu2KQk3WylJyLFJZrhh6VXRFriX0599STF0Mn8SpgrwokdeAQ37hCc38/WKQ
 aCiCR3ZULLIbJkLl6QZRRgmA/M1TYRLCghx4XMlMScRrvWopR6/orZR1ssTETbMMD5urZCitWCU
 xftcRsmrGmRaPdzoUmyQZvnrmL5wvpFb4JZ+X3NkBeeWxPni0XgeXOtXU/u8gKcodl78yiQUc3m
 qVlpr06+Qy5jQTxts+rqtN1kjE46kZFi0kCSCAzcdebV1N4yfoGK6A+FPVKJtflEYP42mM+GTx1
 CDSo0HqzHjCnJFiXMSP/jhPtGmhrt9cXaSK8h4VA6xrBroy3fgFu/njkAfNWc/5O6z/KpwS6kDc
 DU/0nvMXv/Q/ow7BXagzUSzWcVCWG3qXBf93SjKJmpXlQ6cCmD2pYTYA7fsQC/f3wicIWN5EPBO
 S94L4/uMQmxkm2e0/AafRYWyE8FqPWdaqnQmjdHS31hJ2ngFvdQ3hfRNf+o5W9ozBQq4345afFE
 lsY1rceJFnudd8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfXzGnLbPwy/SCz
 3NhNKLcr7KxnIaC6wukRdWgBaOAasl+P6zl6dK/Vik6urO3lf9FBo3M02z1xZuspsIjCI4RvLs1
 IpsxtFr4V+e9tq9XL0ekG4cyTXLzfdQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MCBTYWx0ZWRfX03bZyFBK54Hs
 BL1aAk3DsP0NhzcjhzsycvUpwnTboIvFff5du/q2lebKVhfrXV9oX2tN8nBirg6B4HeJGk+YBEP
 1VXp/M8Qn9+WyyYMBKRLVWO3yV6E7XEjJLAetOlb8mko5mw43oMppcUuXtXQMQb7zEDH5G9Tl5l
 AJ/+efVM1vI1IrYcZfvbHcO4g4uDVj5sMPE9+yZDFSN3bJ6ytde9OJxqjrFUupeAu9ex1L3BvWE
 wAPauEeqzmrbs1IZWHAQrSBW9AZP5W9zFTa/ZAXaNLfiH2N34Ec1virvhZzCUMM3MEdrfVutyfd
 bRjyj4Cp5rA+1Ap/UuMTLxPM6qFlmALhfKE1cZrUf2mldUseiTLgfbNtOdUrmWoXTFHcJTCY0J4
 mMC+vJHIxQ+nig905xc0BT5EM7pSM9In3fjLy50WGVWZFBW/93D8wWVn9VOXfcuplOnddbxmwH0
 TXS4oNscpws8HxevIrA==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa16aad cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pFgJNHYOF-_vrOvKCzcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: 6t5CIMzh0bAZR-MKnHyivyoRvQ_vEyyN
X-Proofpoint-GUID: 6t5CIMzh0bAZR-MKnHyivyoRvQ_vEyyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090160

Re-order a few properties to match coding style, as pointed out by
dt-check-style, e.g.:

  fsd.dtsi:357: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
  fsd.dtsi:362: [property-order] property 'reg' out of canonical order (should sort before 'no-map')

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/tesla/fsd.dtsi | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 22b997880d65..36925b2749b5 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -344,23 +344,23 @@ psci {
 	};
 
 	reserved-memory {
+		ranges;
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
 
 		mfc_left: region@84000000 {
 			compatible = "shared-dma-pool";
-			no-map;
 			reg = <0 0x84000000 0 0x8000000>;
+			no-map;
 		};
 	};
 
 	soc: soc@0 {
 		compatible = "simple-bus";
-		#address-cells = <2>;
-		#size-cells = <2>;
 		ranges = <0x0 0x0 0x0 0x0 0x0 0x18000000>;
 		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
 
 		clock_imem: clock-controller@10010000 {
 			compatible = "tesla,fsd-clock-imem";
@@ -468,11 +468,11 @@ smmu_imem: iommu@10200000 {
 
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
+			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
+			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
 			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg = <0x0 0x10400000 0x0 0x10000>, /* GICD */
-			      <0x0 0x10600000 0x0 0x200000>; /* GICR_RD+GICR_SGI */
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
@@ -686,10 +686,10 @@ i2s_1: i2s@140f0000 {
 		pwm_0: pwm@14100000 {
 			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
 			reg = <0x0 0x14100000 0x0 0x100>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM0_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 
 			status = "disabled";
 		};
@@ -697,10 +697,10 @@ pwm_0: pwm@14100000 {
 		pwm_1: pwm@14110000 {
 			compatible = "tesla,fsd-pwm", "samsung,exynos4210-pwm";
 			reg = <0x0 0x14110000 0x0 0x100>;
-			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 			#pwm-cells = <3>;
 			clocks = <&clock_peric PERIC_PWM1_IPCLKPORT_I_PCLK_S0>;
 			clock-names = "timers";
+			samsung,pwm-outputs = <0>, <1>, <2>, <3>;
 
 			status = "disabled";
 		};
@@ -802,8 +802,8 @@ hsi2c_0: i2c@14200000 {
 			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c0_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C0>;
 			clock-names = "hsi2c";
 
@@ -816,8 +816,8 @@ hsi2c_1: i2c@14210000 {
 			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c1_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C1>;
 			clock-names = "hsi2c";
 
@@ -830,8 +830,8 @@ hsi2c_2: i2c@14220000 {
 			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c2_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C2>;
 			clock-names = "hsi2c";
 
@@ -844,8 +844,8 @@ hsi2c_3: i2c@14230000 {
 			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c3_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C3>;
 			clock-names = "hsi2c";
 
@@ -858,8 +858,8 @@ hsi2c_4: i2c@14240000 {
 			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c4_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C4>;
 			clock-names = "hsi2c";
 
@@ -872,8 +872,8 @@ hsi2c_5: i2c@14250000 {
 			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c5_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C5>;
 			clock-names = "hsi2c";
 
@@ -886,8 +886,8 @@ hsi2c_6: i2c@14260000 {
 			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c6_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C6>;
 			clock-names = "hsi2c";
 
@@ -900,8 +900,8 @@ hsi2c_7: i2c@14270000 {
 			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&hs_i2c7_bus>;
+			pinctrl-names = "default";
 			clocks = <&clock_peric PERIC_PCLK_HSI2C7>;
 			clock-names = "hsi2c";
 
@@ -949,10 +949,10 @@ ethernet1: ethernet@14300000 {
 			assigned-clocks = <&clock_peric PERIC_EQOS_PHYRXCLK_MUX>,
 					  <&clock_peric PERIC_EQOS_PHYRXCLK>;
 			assigned-clock-parents = <&clock_peric PERIC_EQOS_PHYRXCLK>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&eth1_tx_clk>, <&eth1_tx_data>, <&eth1_tx_ctrl>,
 				    <&eth1_phy_intr>, <&eth1_rx_clk>, <&eth1_rx_data>,
 				    <&eth1_rx_ctrl>, <&eth1_mdio>;
+			pinctrl-names = "default";
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_peric 0x0 0x1>;
 
@@ -1012,8 +1012,8 @@ ufs: ufs@15120000 {
 				 <&clock_fsys0 UFS0_TOP0_CLK_UNIPRO>;
 			clock-names = "core_clk", "sclk_unipro_main";
 			freq-table-hz = <0 0>, <0 0>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&ufs_rst_n &ufs_refclk_out>;
+			pinctrl-names = "default";
 			phys = <&ufs_phy>;
 			phy-names = "ufs-phy";
 
@@ -1024,10 +1024,10 @@ ufs_phy: ufs-phy@15124000 {
 			compatible = "tesla,fsd-ufs-phy";
 			reg = <0x0 0x15124000 0x0 0x800>;
 			reg-names = "phy-pma";
-			samsung,pmu-syscon = <&pmu_system_controller>;
 			#phy-cells = <0>;
 			clocks = <&clock_fsys0 UFS0_MPHY_REFCLK_IXTAL26>;
 			clock-names = "ref_clk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
 		};
 
 		ethernet0: ethernet@15300000 {
@@ -1041,10 +1041,10 @@ ethernet0: ethernet@15300000 {
 				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_RGMII_CLK_I>,
 				 <&clock_fsys0 FSYS0_EQOS_TOP0_IPCLKPORT_CLK_RX_I>;
 			clock-names = "ptp_ref", "master_bus", "slave_bus", "tx", "rx";
-			pinctrl-names = "default";
 			pinctrl-0 = <&eth0_tx_clk>, <&eth0_tx_data>, <&eth0_tx_ctrl>,
 				    <&eth0_phy_intr>, <&eth0_rx_clk>, <&eth0_rx_data>,
 				    <&eth0_rx_ctrl>, <&eth0_mdio>;
+			pinctrl-names = "default";
 			local-mac-address = [00 00 00 00 00 00];
 			iommus = <&smmu_fsys0 0x0 0x1>;
 

-- 
2.53.0

