Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E818059
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Jul 2024 23:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720394098; cv=none; b=jD8Kv+Cc63U2yVYs5mpFAipS1O8ctxQhqQZ0VZousnURtl5pwWwn5D5K4uOhFegsa+NEs7mL0ykHo9taOJCsrTsehKrjYylNsPJSuzmeU6f6i+ViQEJ4SDY1nNT/ARgGcqIOillJMhr7ZBKSXyOfdE+ivEet4VZydqthRdOWsGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720394098; c=relaxed/simple;
	bh=5k9aeH6nkUA5eOk7MLeL/Nv9iJY2d8t+llhYiJ67oYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Tb+rsO72njo2vC9sp18lHdEgR7/HztYIkS0Ie8eFLje1I5jsoHDWkO/5HvFqO+7ZWGk87UUy0Xv5Cw39Y23FvP6MzDicQE6B+MkKyNiFBhfoS4YxgRqxnJUM+HgKZTRWXbYTMoyjIzbtCWEiBNYVeiEh11cR4aMHsh+HMkaCM90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Co/79UrO; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Co/79UrO"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240707231446epoutp0233d8846f6916806c9008eb20d5c8cad1~gEU6CNjSm0324503245epoutp02G
	for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Jul 2024 23:14:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240707231446epoutp0233d8846f6916806c9008eb20d5c8cad1~gEU6CNjSm0324503245epoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720394086;
	bh=5wd/ILxEmFywJQU8uhlxDXAYw7mBQOnWAUfHbmJdTOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Co/79UrOO0Rs8WS6UDtVaX6qATueoyVd0zwj++u3/Z4sRfGonxPQI/gHtKhdh4jnB
	 fz7ge4QsEmZ5pk8QWxpSt4jhNSflI2o26fvEDVHgQmNzSKfKkx5D0vgwuHfnG6nv+N
	 nQg4MPsUZRzl3ITjE6GHiXvxD8Sc/itw+rGZdiZ0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20240707231445epcas2p370a2c008e7bc5075cb52e97eb1113699~gEU5fPe0W0348203482epcas2p3L;
	Sun,  7 Jul 2024 23:14:45 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4WHNPd2Lspz4x9Pt; Sun,  7 Jul
	2024 23:14:45 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	DF.41.09848.5612B866; Mon,  8 Jul 2024 08:14:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73~gEU4gTUtu0673306733epcas2p1C;
	Sun,  7 Jul 2024 23:14:44 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240707231444epsmtrp17f057892adfabb4e496f1fee9454ff46~gEU4fdnJc0835008350epsmtrp1Y;
	Sun,  7 Jul 2024 23:14:44 +0000 (GMT)
X-AuditID: b6c32a45-447fe70000002678-90-668b216571f4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	01.D7.19057.4612B866; Mon,  8 Jul 2024 08:14:44 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240707231444epsmtip1ad95e562c52f4eb7b8e393d176a4c172~gEU4SN46C2678226782epsmtip1X;
	Sun,  7 Jul 2024 23:14:44 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: add Exynos Auto v920 SoC CMU
 bindings
Date: Mon,  8 Jul 2024 08:13:28 +0900
Message-ID: <20240707231331.3433340-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmmW6qYneaQet/PosH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1qhsm4zUxJTUIoXUvOT8lMy8
	dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygO5UUyhJzSoFCAYnFxUr6djZF+aUl
	qQoZ+cUltkqpBSk5BeYFesWJucWleel6eaklVoYGBkamQIUJ2RkbJh9iKpgXVjH9xVGWBsYX
	bl2MnBwSAiYSv6fcY+1i5OIQEtjBKPHkxzEmCOcTo8SshxvYIZxvjBJrH8xjhml5sL6PGSKx
	l1Gi5WgPC4TzkVFi5asjjF2MHBxsAroSf/45gMRFBPYwSWw5vwRsLrPAWUaJu3MWsIOMEhYI
	lthz5C0TSAOLgKrEolZ1kDCvgL3E3f8g9SDb5CUurnnOBmJzCjhI3Gm4wghRIyhxcuYTFhCb
	GaimeetssIskBOZySGw+8Q+q2UVi99NGdghbWOLV8S1QtpTEy/42KDtfYvL1t0wQzQ2MEtf+
	dUP9aS+x6MxPdpDjmAU0Jdbv0gcxJQSUJY7cgtrLJ9Fx+C87RJhXoqNNCKJRTeLTlctQQ2Qk
	jp14BmV7SEz694gRElaTGSUWzt/FOIFRYRaSd2YheWcWwuIFjMyrGMVSC4pz01OLjQoM4VGc
	nJ+7iRGccLVcdzBOfvtB7xAjEwfjIUYJDmYlEd7Tj9vThHhTEiurUovy44tKc1KLDzGaAsN6
	IrOUaHI+MOXnlcQbmlgamJiZGZobmRqYK4nz3mudmyIkkJ5YkpqdmlqQWgTTx8TBKdXAdP4q
	x8nSe2Iuk1ZnTTwuOHFK2AORYJ2i3gulx9qL/jL+9THJeNe4/uRZK1/HK407aj5umHBteVpq
	wuNd/Lca/Q2k4jaFR05itHUWZLvGybiO0/TguZeeZQ/cNnUeMt8sGnk2/ZezKGfm3xv3n+n/
	nJTF5V29+odOuMnD/y+yHsfVzjt5ryP0/ZaHlsd1dE94aG5Uqkp3TFgxs17io+j1J6qzTi+I
	4xbTF4h/cG+iwlUrlvqCsOvG4uwSM3K5qzL3ank5xn9znFDC9L713tRDfw9Wm5/9djSp79zT
	it09LiWGD/Y//HLtGEt2xI3M3ICEYKZTSkfrlt1k3bIjma16V8OqIHHZ0vI8gWlmzSr/lFiK
	MxINtZiLihMBpN66dkEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnG6KYneawcdeQ4sH87axWazZe47J
	4vqX56wW84+cY7U4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwunnK1+L9nB7vF4TftrBb/
	rm1ksWhatp7Jgc/j/Y1Wdo9NqzrZPDYvqffo27KK0ePzJrkA1igum5TUnMyy1CJ9uwSujA2T
	DzEVzAurmP7iKEsD4wu3LkZODgkBE4kH6/uYuxi5OIQEdjNKzNvWwgSRkJHY2PCfHcIWlrjf
	coQVoug9o0TX7klADgcHm4CuxJ9/DiBxEYFDTBITPz9lAXGYBS4zShy7O5kZpFtYIFDi/I89
	bCANLAKqEota1UHCvAL2Enf/L4FaJi9xcc1zNhCbU8BB4k7DFUYQWwio5t2X6SwQ9YISJ2c+
	AbOZgeqbt85mnsAoMAtJahaS1AJGplWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMGR
	oaW1g3HPqg96hxiZOBgPMUpwMCuJ8J5+3J4mxJuSWFmVWpQfX1Sak1p8iFGag0VJnPfb694U
	IYH0xJLU7NTUgtQimCwTB6dUA9OpmBs1yg37Y/P2u/Kszo4Uzsrh6y2e+ceKde/taIXQT39V
	D06o6d+o4nbR/8DVz1bHTOtO+V1cc1w4MOh4kPsdNz0d8xXvtzM8d5MUC6kRKL8oO0vmsu4R
	82Ue6u18ype5E+3ebJ5oz/j2ZrTLS8mIzq839f9t2XNOc5es9e6JNiaHVDdx75HYWTx5KX9j
	7R6O7CDrKbUcOY8nzbhcXr7iz+JLlRvbeVnbElYKiYTsq3j2ZP+/+S9ESvIX1Ky7fOX1pe91
	CVymVdMXrvnxSTPgyY6/6i+K3nibXPl46EHgk9VsrYpbnQJ8P/f5+/9xnbRf6uaquzsPr6vc
	1b3l/b22sHPmbVPuup68s/h9Z/1WJZbijERDLeai4kQAALCZnPsCAAA=
X-CMS-MailID: 20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73
References: <20240707231331.3433340-1-sunyeal.hong@samsung.com>
	<CGME20240707231444epcas2p17d7c9842f0acaff0cc352d5c15f38e73@epcas2p1.samsung.com>

Add dt-schema for Exynos Auto v920 SoC clock controller.
Add device tree clock binding definitions for below CMU blocks.

- CMU_TOP
- CMU_PERIC0

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 115 +++++++++++
 .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
 2 files changed, 306 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
new file mode 100644
index 000000000000..ade74d6e90c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynosautov920-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos Auto v920 SoC clock controller
+
+maintainers:
+  - Sunyeal Hong <sunyeal.hong@samsung.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+description: |
+  Exynos Auto v920 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. Root clocks in that clock tree are
+  two external clocks:: OSCCLK/XTCXO (38.4 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  The external OSCCLK must be defined as fixed-rate clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynosautov920.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynosautov920-cmu-top
+      - samsung,exynosautov920-cmu-peric0
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_PERIC0 NOC clock (from CMU_TOP)
+            - description: CMU_PERIC0 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ip
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_PERIC0
+  - |
+    #include <dt-bindings/clock/samsung,exynosautov920.h>
+
+    cmu_peric0: clock-controller@10800000 {
+        compatible = "samsung,exynosautov920-cmu-peric0";
+        reg = <0x10800000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&xtcxo>,
+                 <&cmu_top DOUT_CLKCMU_PERIC0_NOC>,
+                 <&cmu_top DOUT_CLKCMU_PERIC0_IP>;
+        clock-names = "oscclk",
+                      "noc",
+                      "ip";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynosautov920.h b/include/dt-bindings/clock/samsung,exynosautov920.h
new file mode 100644
index 000000000000..9daa617c3636
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
+ *
+ * Device Tree binding constants for Exynos Auto V920 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
+#define _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H
+
+/* CMU_TOP */
+#define FOUT_SHARED0_PLL		1
+#define FOUT_SHARED1_PLL		2
+#define FOUT_SHARED2_PLL		3
+#define FOUT_SHARED3_PLL		4
+#define FOUT_SHARED4_PLL		5
+#define FOUT_SHARED5_PLL		6
+#define FOUT_MMC_PLL			7
+
+/* MUX in CMU_TOP */
+#define MOUT_SHARED0_PLL		101
+#define MOUT_SHARED1_PLL		102
+#define MOUT_SHARED2_PLL		103
+#define MOUT_SHARED3_PLL		104
+#define MOUT_SHARED4_PLL		105
+#define MOUT_SHARED5_PLL		106
+#define MOUT_MMC_PLL			107
+#define MOUT_CLKCMU_CMU_BOOST		108
+#define MOUT_CLKCMU_CMU_CMUREF		109
+#define MOUT_CLKCMU_ACC_NOC		110
+#define MOUT_CLKCMU_ACC_ORB		111
+#define MOUT_CLKCMU_APM_NOC		112
+#define MOUT_CLKCMU_AUD_CPU		113
+#define MOUT_CLKCMU_AUD_NOC		114
+#define MOUT_CLKCMU_CPUCL0_SWITCH	115
+#define MOUT_CLKCMU_CPUCL0_CLUSTER	116
+#define MOUT_CLKCMU_CPUCL0_DBG		117
+#define MOUT_CLKCMU_CPUCL1_SWITCH	118
+#define MOUT_CLKCMU_CPUCL1_CLUSTER	119
+#define MOUT_CLKCMU_CPUCL2_SWITCH	120
+#define MOUT_CLKCMU_CPUCL2_CLUSTER	121
+#define MOUT_CLKCMU_DNC_NOC		122
+#define MOUT_CLKCMU_DPTX_NOC		123
+#define MOUT_CLKCMU_DPTX_DPGTC		124
+#define MOUT_CLKCMU_DPTX_DPOSC		125
+#define MOUT_CLKCMU_DPUB_NOC		126
+#define MOUT_CLKCMU_DPUB_DSIM		127
+#define MOUT_CLKCMU_DPUF0_NOC		128
+#define MOUT_CLKCMU_DPUF1_NOC		129
+#define MOUT_CLKCMU_DPUF2_NOC		130
+#define MOUT_CLKCMU_DSP_NOC		131
+#define MOUT_CLKCMU_G3D_SWITCH		132
+#define MOUT_CLKCMU_G3D_NOCP		133
+#define MOUT_CLKCMU_GNPU_NOC		134
+#define MOUT_CLKCMU_HSI0_NOC		135
+#define MOUT_CLKCMU_HSI1_NOC		136
+#define MOUT_CLKCMU_HSI1_USBDRD		137
+#define MOUT_CLKCMU_HSI1_MMC_CARD	138
+#define MOUT_CLKCMU_HSI2_NOC		139
+#define MOUT_CLKCMU_HSI2_NOC_UFS	140
+#define MOUT_CLKCMU_HSI2_UFS_EMBD	141
+#define MOUT_CLKCMU_HSI2_ETHERNET	142
+#define MOUT_CLKCMU_ISP_NOC		143
+#define MOUT_CLKCMU_M2M_NOC		144
+#define MOUT_CLKCMU_M2M_JPEG		145
+#define MOUT_CLKCMU_MFC_MFC		146
+#define MOUT_CLKCMU_MFC_WFD		147
+#define MOUT_CLKCMU_MFD_NOC		148
+#define MOUT_CLKCMU_MIF_SWITCH		149
+#define MOUT_CLKCMU_MIF_NOCP		150
+#define MOUT_CLKCMU_MISC_NOC		151
+#define MOUT_CLKCMU_NOCL0_NOC		152
+#define MOUT_CLKCMU_NOCL1_NOC		153
+#define MOUT_CLKCMU_NOCL2_NOC		154
+#define MOUT_CLKCMU_PERIC0_NOC		155
+#define MOUT_CLKCMU_PERIC0_IP		156
+#define MOUT_CLKCMU_PERIC1_NOC		157
+#define MOUT_CLKCMU_PERIC1_IP		158
+#define MOUT_CLKCMU_SDMA_NOC		159
+#define MOUT_CLKCMU_SNW_NOC		160
+#define MOUT_CLKCMU_SSP_NOC		161
+#define MOUT_CLKCMU_TAA_NOC		162
+
+/* DIV in CMU_TOP */
+#define DOUT_SHARED0_DIV1		201
+#define DOUT_SHARED0_DIV2		202
+#define DOUT_SHARED0_DIV3		203
+#define DOUT_SHARED0_DIV4		204
+#define DOUT_SHARED1_DIV1		205
+#define DOUT_SHARED1_DIV2		206
+#define DOUT_SHARED1_DIV3		207
+#define DOUT_SHARED1_DIV4		208
+#define DOUT_SHARED2_DIV1		209
+#define DOUT_SHARED2_DIV2		210
+#define DOUT_SHARED2_DIV3		211
+#define DOUT_SHARED2_DIV4		212
+#define DOUT_SHARED3_DIV1		213
+#define DOUT_SHARED3_DIV2		214
+#define DOUT_SHARED3_DIV3		215
+#define DOUT_SHARED3_DIV4		216
+#define DOUT_SHARED4_DIV1		217
+#define DOUT_SHARED4_DIV2		218
+#define DOUT_SHARED4_DIV3		219
+#define DOUT_SHARED4_DIV4		220
+#define DOUT_SHARED5_DIV1		221
+#define DOUT_SHARED5_DIV2		222
+#define DOUT_SHARED5_DIV3		223
+#define DOUT_SHARED5_DIV4		224
+#define DOUT_CLKCMU_CMU_BOOST		225
+#define DOUT_CLKCMU_ACC_NOC		226
+#define DOUT_CLKCMU_ACC_ORB		227
+#define DOUT_CLKCMU_APM_NOC		228
+#define DOUT_CLKCMU_AUD_CPU		229
+#define DOUT_CLKCMU_AUD_NOC		230
+#define DOUT_CLKCMU_CPUCL0_SWITCH	231
+#define DOUT_CLKCMU_CPUCL0_CLUSTER	232
+#define DOUT_CLKCMU_CPUCL0_DBG		233
+#define DOUT_CLKCMU_CPUCL1_SWITCH	234
+#define DOUT_CLKCMU_CPUCL1_CLUSTER	235
+#define DOUT_CLKCMU_CPUCL2_SWITCH	236
+#define DOUT_CLKCMU_CPUCL2_CLUSTER	237
+#define DOUT_CLKCMU_DNC_NOC		238
+#define DOUT_CLKCMU_DPTX_NOC		239
+#define DOUT_CLKCMU_DPTX_DPGTC		240
+#define DOUT_CLKCMU_DPTX_DPOSC		241
+#define DOUT_CLKCMU_DPUB_NOC		242
+#define DOUT_CLKCMU_DPUB_DSIM		243
+#define DOUT_CLKCMU_DPUF0_NOC		244
+#define DOUT_CLKCMU_DPUF1_NOC		245
+#define DOUT_CLKCMU_DPUF2_NOC		246
+#define DOUT_CLKCMU_DSP_NOC		247
+#define DOUT_CLKCMU_G3D_SWITCH		248
+#define DOUT_CLKCMU_G3D_NOCP		249
+#define DOUT_CLKCMU_GNPU_NOC		250
+#define DOUT_CLKCMU_HSI0_NOC		251
+#define DOUT_CLKCMU_HSI1_NOC		252
+#define DOUT_CLKCMU_HSI1_USBDRD		253
+#define DOUT_CLKCMU_HSI1_MMC_CARD	254
+#define DOUT_CLKCMU_HSI2_NOC		255
+#define DOUT_CLKCMU_HSI2_NOC_UFS	256
+#define DOUT_CLKCMU_HSI2_UFS_EMBD	257
+#define DOUT_CLKCMU_HSI2_ETHERNET	258
+#define DOUT_CLKCMU_ISP_NOC		259
+#define DOUT_CLKCMU_M2M_NOC		260
+#define DOUT_CLKCMU_M2M_JPEG		261
+#define DOUT_CLKCMU_MFC_MFC		262
+#define DOUT_CLKCMU_MFC_WFD		263
+#define DOUT_CLKCMU_MFD_NOC		264
+#define DOUT_CLKCMU_MIF_NOCP		265
+#define DOUT_CLKCMU_MISC_NOC		266
+#define DOUT_CLKCMU_NOCL0_NOC		267
+#define DOUT_CLKCMU_NOCL1_NOC		268
+#define DOUT_CLKCMU_NOCL2_NOC		269
+#define DOUT_CLKCMU_PERIC0_NOC		270
+#define DOUT_CLKCMU_PERIC0_IP		271
+#define DOUT_CLKCMU_PERIC1_NOC		272
+#define DOUT_CLKCMU_PERIC1_IP		273
+#define DOUT_CLKCMU_SDMA_NOC		274
+#define DOUT_CLKCMU_SNW_NOC		275
+#define DOUT_CLKCMU_SSP_NOC		276
+#define DOUT_CLKCMU_TAA_NOC		277
+
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_IP_USER		1
+#define CLK_MOUT_PERIC0_NOC_USER	2
+#define CLK_MOUT_PERIC0_USI00_USI	3
+#define CLK_MOUT_PERIC0_USI01_USI	4
+#define CLK_MOUT_PERIC0_USI02_USI	5
+#define CLK_MOUT_PERIC0_USI03_USI	6
+#define CLK_MOUT_PERIC0_USI04_USI	7
+#define CLK_MOUT_PERIC0_USI05_USI	8
+#define CLK_MOUT_PERIC0_USI06_USI	9
+#define CLK_MOUT_PERIC0_USI07_USI	10
+#define CLK_MOUT_PERIC0_USI08_USI	11
+#define CLK_MOUT_PERIC0_USI_I2C		12
+#define CLK_MOUT_PERIC0_I3C		13
+
+#define CLK_DOUT_PERIC0_USI00_USI	14
+#define CLK_DOUT_PERIC0_USI01_USI	15
+#define CLK_DOUT_PERIC0_USI02_USI	16
+#define CLK_DOUT_PERIC0_USI03_USI	17
+#define CLK_DOUT_PERIC0_USI04_USI	18
+#define CLK_DOUT_PERIC0_USI05_USI	19
+#define CLK_DOUT_PERIC0_USI06_USI	20
+#define CLK_DOUT_PERIC0_USI07_USI	21
+#define CLK_DOUT_PERIC0_USI08_USI	22
+#define CLK_DOUT_PERIC0_USI_I2C		23
+#define CLK_DOUT_PERIC0_I3C		24
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOSAUTOV920_H */
-- 
2.45.2

