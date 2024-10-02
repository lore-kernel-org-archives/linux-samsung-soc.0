Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57D2C6A3
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727847229; cv=none; b=p8FBnsd1czZO4GMPEMf4BS0rR4a1CQNB77HHVlbtQExKDkmA/OZa1dmp6fCtpLztl9WIBkgBfzUYY0nLIQ8WXUAZNGc31OiNjJExA6Q6j6It5j22PuX20kTNnqrZDlwbAwMoV8gDxQsRb8fPUma/IO1jMrTQU/zOmRPALISSZ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727847229; c=relaxed/simple;
	bh=L4+N9c9dJFYqxO8qWc0YAzdJrvQX64RITmIxwy2/86k=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:To:Cc:
	 Content-Type:References; b=dK7Y99OztUlSQCG+As4wt3Mi/ArMix3uITRch/CO01o4bZQb18pXHIFrc25r8/9oCuIA1gesTTQFkoCcAhJDLxhz2+i9mpmK/ik2hPZ+i0rV6jZfm0KyHBlugdwOCUufQSu/gLmL0oTqp1rlSlt0YH5aV+YCC6TQWfv9/FGpjM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dsxInqD+; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dsxInqD+"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241002053345epoutp040025a2311c946e649242ef5cbd772eb8~6i_WSY2kX1347013470epoutp04_
	for <linux-samsung-soc@vger.kernel.org>; Wed,  2 Oct 2024 05:33:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241002053345epoutp040025a2311c946e649242ef5cbd772eb8~6i_WSY2kX1347013470epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1727847225;
	bh=SWz82tgtuTEes+cJOkt3lBaqqV26Ccw2buKlU29BouA=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=dsxInqD+5SJcd2h4l++TlFPVWx074Z4JYWBSTfRJPOYvmHshYUaLkoi/QrUw8rR/8
	 eOLGHs9gNpfoEb3MyJdHKqP3F+O7sgZrj3DoPAJ6KsCf9Omk1PbbHEeSIwtCEnj1eH
	 44llhZAGcwkDZO7uaMtSCLoGevf5mMWqnrWyUPqc=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20241002053344epcas1p4768c9b737992722f4b8cb1495bbefbed~6i_V5y7NT2542525425epcas1p4R;
	Wed,  2 Oct 2024 05:33:44 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.237]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4XJNlC4mLRz4x9Q7; Wed,  2 Oct
	2024 05:33:43 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	DB.95.09435.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epcas1p120ca6ca452b016a59af981632a8055a4~6i_TpiPXX0169001690epcas1p1H;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241002053342epsmtrp2fa76ab78cabfd54d28d7c023460d2972~6i_To4WOh3062730627epsmtrp2l;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
X-AuditID: b6c32a36-35e72a80000024db-21-66fcdb36f64a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	85.66.07371.63BDCF66; Wed,  2 Oct 2024 14:33:42 +0900 (KST)
Received: from [127.0.1.1] (unknown [10.113.111.204]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241002053342epsmtip19af16b1a43bd3d5e3d17296ca373da35~6i_TcStVX1771117711epsmtip1U;
	Wed,  2 Oct 2024 05:33:42 +0000 (GMT)
From: Kwanghoon Son <k.son@samsung.com>
Date: Wed, 02 Oct 2024 14:33:27 +0900
Subject: [PATCH WIP 7/7] arm64: dts: exynosautov9: Enable drm
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-auto9-v1-7-c4dc3385f415@samsung.com>
In-Reply-To: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,  David Virag
	<virag.david003@gmail.com>,  Sam Protsenko <semen.protsenko@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, Kwanghoon Son <k.son@samsung.com>
X-Mailer: b4 0.14.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmga7Z7T9pBlsXaVo8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwfoDCWF
	ssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgWmBXnFibnFpXrpeXmqJlaGBgZEpUGFC
	dsb2t3vZCu5oVpz8eYSlgfGFQhcjJ4eEgInEht0bWLsYuTiEBHYwSlxd3sgI4XxilFhzrpEZ
	wvnGKPF57zugDAdYy9SVPhDxvYwS/WdOsEE4rxglNh2fywQyl01AXWJJ21p2EJtFQFVi45pu
	MFtYwFZi9pUWRhCbV0BQ4uTMJywgNrOAvMT2t3OYIeJWEmt7d4PN4RSwllh16ylYvYjAaUaJ
	/3MVIeo9JGY8W8cO8YOwxOfda8COkBD4yy4xd0kXVMJF4vOSN2wwRa+Ob4GKS0l8frcXKp4t
	cfQjjF0icX3WIlYI21hi/9LJTCAfMwtoSqzfpQ+xl0/i3dceVkhA8Ep0tAlBmPIStzrLIRpF
	Jc48/Qg10ENi550t0DDsY5Ro+/WCZQKj/Cwk389C8v0shGULGJlXMYqlFhTnpqcWGxYYwSM1
	OT93EyM4JWqZ7WCc9PaD3iFGJg7GQ4wSHMxKIrz3Dv1ME+JNSaysSi3Kjy8qzUktPsRoCoyD
	icxSosn5wKScVxJvaGJpYGJmZGxiYWhmqCTOe+ZKWaqQQHpiSWp2ampBahFMHxMHp1QD08K0
	Gw8v9p/8d26f+sUT/+4xZzwU2vnGpvg738dNL88selrxw+UMF9cvOc8JJ5hq98ZK1O82OPRJ
	ptD58oLy9LO+E2Z9ZObl++S2fVVVqNw6p6yQXDfhE9PUorTkWM4qM+2oSehtfWF//e/3HRpl
	Kg6zVkac9Py16POtdUEL2rYfTZh/3sUlbObHf70qjZaHT1UvqbTnetW/b2ekk6YAw2uHT+qX
	tTfFhXfJZjLNXvkiLE6uqzLy5b6rTxxYkh9WxXvWFKcIpOc+15Kv72jd8Oalj7uIfEJNo8zt
	7+e31rUJnmZw3HT80IWZOX7T0rc7aC+WMtdV2OHw9/S2ktPHDGpvuIUxvYiqeat1weVRtBJL
	cUaioRZzUXEiAMSeW4oSBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSnK7Z7T9pBjfn8Fk8mLeNzWLS/Qks
	Fr1rrjJZnD+/gd1ixvl9TBbP+4DE8fePGR3YPXbOusvusWlVJ5vHnWt72Dz6tqxi9Pi8SS6A
	NYrLJiU1J7MstUjfLoErY/vbvWwFdzQrTv48wtLA+EKhi5GDQ0LARGLqSp8uRi4OIYHdjBJb
	lq1i7mLkBIqLSnRcbmSEqBGWOHy4GKLmBaPEye3fGUFq2ATUJZa0rWUHsVkEVCU2rukGs4UF
	bCVmX2kBq+EVEJQ4OfMJC8gcZgFNifW79EHCzALyEtvfzmGGKLGSWNu7mwnEFgKxd75hBbE5
	BawlVt16ygiyV0TgHKPEtT972SGaPSRmPFvHDnGnsMTn3WvYJjAKzkKybhbCullI1i1gZF7F
	KJlaUJybnptsWGCYl1quV5yYW1yal66XnJ+7iREcAVoaOxjvzf+nd4iRiYPxEKMEB7OSCO+9
	Qz/ThHhTEiurUovy44tKc1KLDzFKc7AoifMazpidIiSQnliSmp2aWpBaBJNl4uCUamA60fTm
	V9yDPE3VA6u3svr2JZfahltuneyx/JzMjuLTCd+y1O8bTD1XHfr/QErz9i37PyQwC9yXZOxb
	0z1x682iuWbX0xf5Ha9+8PKINONd6Q9hWyJV5/2T/yNcv1A283ZdecP5+I0bF4eGi+dcklo2
	Ra6+8HPc/7Dq+jt+LrlMnOIXuSTXfsoOPdS2uCpf50JFc6xL9ZTHvWJ2388U1gWXsp1bd+GW
	k9Td0882hE3IsLGQyFPcsbqwVL/YeleJ+Nm1fmuubNFcuO254A612yUbtjp76FgkGTzZ4bTj
	deytSo2LNmIBR50vf4zZyFys1eL80tbp2kO+/++5rqvuEZn36oXpI41JDmuO51gvnTRViaU4
	I9FQi7moOBEAYPkWfO8CAAA=
X-CMS-MailID: 20241002053342epcas1p120ca6ca452b016a59af981632a8055a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241002053342epcas1p120ca6ca452b016a59af981632a8055a4
References: <20241002-auto9-v1-0-c4dc3385f415@samsung.com>
	<CGME20241002053342epcas1p120ca6ca452b016a59af981632a8055a4@epcas1p1.samsung.com>

Signed-off-by: Kwanghoon Son <k.son@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-dpu.dtsi | 110 +++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi     |  30 +++++++
 2 files changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-dpu.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9-dpu.dtsi
new file mode 100644
index 000000000000..d69980cb3bd9
--- /dev/null
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-dpu.dtsi
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Baremetal linux display configure */
+
+#define DECON_SHD_OFFSET			0x2000
+#define DPUM_DMA_GF0				0x18C65000
+#define DPUM_DMA_COMMON				0x18C60000
+#define DPUM_DPP_GF0				0x18C21000
+#define DPUM_WIN0				0x18C30000
+#define DECON0_WIN_CTRL_OFFSET			0x20000
+#define DECON1_WIN_CTRL_OFFSET			0x28000
+#define DPUM_DECON0				0x18C38000
+#define DPUM_DECON0_GLOBAL			0x18C4A000
+#define DPUM_CON_CONTROL			0x18C3C000
+#define DPUM_SUB0_DQE0				0x18C40000
+#define DPUM_SUB0_DSC0				0x18C42000
+#define DPTX_LINK_TOP0				0x18A80000
+#define USBDP_PHY0				0x18AA0000
+
+//c3_0000 - c3_f000
+&soc {
+
+	/************** DECON **************/
+	/* sysMMU  DMA    DPP   DECON_WIN
+	====================================
+	   MMU_0   GF0    GF0     WIN0 <= To support HV sysmmu location
+	   MMU_0   G0     GF1     WIN1
+	   MMU_1   G1     GF2     WIN2
+	   MMU_1   GF1    GF3     WIN3 <= Reserved for telltale
+	   MMU_2   VG0    VG0     WIN4 <= To support HV sysmmu location
+	   MMU_2   G2     GF4     WIN5
+	   MMU_3   G3     GF5     WIN6
+	   MMU_3   VG1    VG1     WIN7
+	 */
+
+	/************** DECON **************/
+	dpum_decon0: decon@18c30000 {
+		compatible = "samsung,exynos910-decon";
+		reg = <0x18c30000 0xf004>,
+		      <0x18c40000 0xb038>,
+			  <0x18c50000 0xf018>;
+
+		reg-names = "main", "sub0", "sub1";
+
+		cell-index = <0>;
+
+		interrupts = <0 116 IRQ_TYPE_LEVEL_HIGH>; //fd
+
+		/* clock */
+		clock-names = "aclk";
+		clocks = <&cmu_dpum CLK_GOUT_DPUM_ACLK_DECON>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			dpum_decon0_output1: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dp0_sst1_input>;
+			};
+		};
+	};
+
+	/*** DisplayPort ***/
+	exynos_dp0: dp_tx@0x18a80000 {
+		compatible = "samsung,exynos910-dp";
+		reg = <DPTX_LINK_TOP0 0xA000>, <USBDP_PHY0 0xA000>;
+
+		reg-names = "link_base", "phy_base";
+
+		interrupts = <0 111 IRQ_TYPE_LEVEL_HIGH>;
+		// interrupts = <0 INTREQ__DPTX_TOP0_DPTX IRQ_TYPE_LEVEL_HIGH>;
+		//power-domains = <&pd_dptx>;
+
+		/* index(0-base) from &default_timings */
+		samsung,native-mode,idx = <1>;
+		/* set config BPC, Default 8 if not set */
+		samsung,native-mode,bpc = <8>;
+		/* samsung,native-only; */
+
+		phys = <&dp_phy 0>;
+		phy-names = "dp_phy";
+
+		clock-names = "aclk", "pclk";
+		clocks = <&cmu_dptx CLK_MOUT_DPTX_BUS_USER>, <&cmu_dptx CLK_MOUT_DPTX_DPGTC_USER>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp0_hpd>;
+		samsung,hpd-gpio = <&gpa1 0 0x2>;
+		/* samsung,force-dsc-dis; */
+		/* samsung,mst-dsc-en; */
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* SST index is started at '1' */
+			dp0_sst1_input: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dpum_decon0_output1>;
+				samsung,native-mode,idx = <1>;
+				samsung,native-mode,bpc = <8>;
+			};
+		};
+	};
+
+	dp_phy: dp-phy {
+		compatible = "samsung,exynosautov9-dp-video-phy";
+		samsung,pmu-syscon = <&pmu_system_controller>;
+		#phy-cells = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index b36292a7db64..5be2f51e0744 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -251,6 +251,19 @@ cmu_fsys2: clock-controller@17c00000 {
 				      "dout_fsys2_clkcmu_ethernet";
 		};
 
+		cmu_dptx: clock-controller@18a00000 {
+			compatible = "samsung,exynosautov9-cmu-dptx";
+			reg = <0x18a00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_DPTX_BUS>,
+				 <&cmu_top DOUT_CLKCMU_DPTX_DPGTC>;
+			clock-names = "oscclk",
+				      "dout_clkcmu_dptx_bus",
+					  "dout_clkcmu_dptx_dpgtc";
+		};
+
 		cmu_dpum: clock-controller@18c00000 {
 			compatible = "samsung,exynosautov9-cmu-dpum";
 			reg = <0x18c00000 0x8000>;
@@ -261,6 +274,22 @@ cmu_dpum: clock-controller@18c00000 {
 			clock-names = "oscclk", "bus";
 		};
 
+		dpp_dpum: dpp@18c20000 {
+			compatible = "samsung,exynosauto-dpp";
+			reg = <0x18c20000 0x9000>;
+			clock-names = "aclk";
+			clocks = <&cmu_dpum CLK_GOUT_DPUM_ACLK_DPP>;
+		};
+
+		dma_dpum: dpu-dma@18c60000 {
+			compatible = "samsung,exynosauto-dpu-dma";
+			reg = <0x18c60000 0x9000>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "aclk";
+			clocks = <&cmu_dpum CLK_GOUT_DPUM_ACLK_DMA>;
+			iommus = <&sysmmu_dpum_0>;
+		};
+
 		sysmmu_dpum_0: sysmmu@18c80000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x18c80000 0x10000>;
@@ -1637,3 +1666,4 @@ pwm: pwm@103f0000 {
 };
 
 #include "exynosautov9-pinctrl.dtsi"
+#include "exynosautov9-dpu.dtsi"
\ No newline at end of file

-- 
2.39.2

