Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9CE17556C
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145312; cv=none; b=UvwRNLyfb4tFHUCxS8EdG8/ovz8drxP7PeobkDFoW0FoNuvSjerOwRk0w3WtmvNHE60GDR8aMvWx/WACQfUQwi4J1luuAgLOKrlI+qUqO9JDowRDNUQFwtYrPPKBglbZyCxrBoxWrn7Nw8Fif15Cqj/iRmXyVlvnzd7FtAb+I8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145312; c=relaxed/simple;
	bh=FmxjfcG8nTdlKxtkOhNnv8s6ldHGylqQzadDAip1iqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VpbyLglG0/65AC4ByC0+csKNkGtkBaGT4SH1BHc7Pkm2VVIu87Fs0rAblM0AXe+Wi8IWBQ5vLZVJLie65PAHPvsguzI8Lr29llaFSqQI9q176tvpGa3XyHYBm1EgkTZQ+viOFceHAk0UT25Fk90+HODe+1J4P6UtnZDEna4oBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CZZrDLj5; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CZZrDLj5"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20240820091506epoutp01680bc0c0685af62accebd57f045ba6af~tZQVfAbNQ0529805298epoutp01F
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 09:15:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20240820091506epoutp01680bc0c0685af62accebd57f045ba6af~tZQVfAbNQ0529805298epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724145306;
	bh=WUVynzx6tGeWDRNXio+zaYe9ETrlcviyJuAww6Msj6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CZZrDLj5ecgJVlCJi88fmMYF9mXpn9G6UxOF0i5FBOLNS60p24fEiXhPM4JRohsbI
	 jzgC8Kg1pDwGR7XZHGKKD/rZIadesbHOsc+vS5/X4krWuBTm40UKIIJSVYvWNBXQVR
	 +Ov+fZ5lQZIMYFaRGZ+WhFrBJs3TB73F6Eel8S6k=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240820091505epcas2p1fc9b43f013ddb551afc3ba831d789454~tZQU-rjS62621826218epcas2p1U;
	Tue, 20 Aug 2024 09:15:05 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Wp3hS6yqcz4x9Pw; Tue, 20 Aug
	2024 09:15:04 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	8B.E3.10066.89E54C66; Tue, 20 Aug 2024 18:15:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epcas2p119e83a64557149d334c4fa5a7d4e753a~tZQUB6RVU2860628606epcas2p1_;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820091504epsmtrp153c56635f9c70c81cf1da547f198597c~tZQUBDZEy2606026060epsmtrp1J;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
X-AuditID: b6c32a46-ae0cca8000002752-b5-66c45e98cfb1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.7F.07567.89E54C66; Tue, 20 Aug 2024 18:15:04 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240820091504epsmtip155ba271524667017ab27aa4319f6e577~tZQT2qc4E3093230932epsmtip1e;
	Tue, 20 Aug 2024 09:15:04 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v8 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 20 Aug 2024 18:14:57 +0900
Message-ID: <20240820091501.3395841-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNJsWRmVeSWpSXmKPExsWy7bCmme6MuCNpBn82mlg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM5Ys1mzYH5Cxff501kbGK/7
	dDFycEgImEh8PBbfxcjFISSwg1Hi34UDTBDOJ0aJLVemMHcxcgI53xgl1n9OB7FBGiY8/cgO
	UbSXUaJtxSQ2COcjo8T33iZWkLFsAroSf/45gMRFBPYwSWw5vwRsLLPAWUaJu3MWsIOMEhYI
	ktg8/yULiM0ioCpxbdkisHW8AvYS31f2s0Osk5e4uOY5G4jNKeAgcWntVyaIGkGJkzOfgPUy
	A9U0b53NDLJAQmAmh8T9tufMEM0uEl9/7oKyhSVeHd8CNVRK4mV/G5SdLzH5+lsmiOYGRolr
	/7qhGuwlFp35yQ7yDrOApsT6XfqQAFOWOHILai+fRMfhv+wQYV6JjjYhiEY1iU9XLkMNkZE4
	duIZlO0hMWHHK3ZIiE5mlFh3Om4Co8IsJN/MQvLNLIS9CxiZVzGKpRYU56anFhsVGMHjNzk/
	dxMjONVque1gnPL2g94hRiYOxkOMEhzMSiK83S8PpgnxpiRWVqUW5ccXleakFh9iNAWG9URm
	KdHkfGCyzyuJNzSxNDAxMzM0NzI1MFcS573XOjdFSCA9sSQ1OzW1ILUIpo+Jg1OqgUn3Xkd+
	KJfjEqZNn179U7BTFWPdFjx/1sTVO+RslBMq13yNO6/a++7eh0OPag7Nffdfz8G2Rc87/fjD
	ed+nq32w8p7Pe3mJW8qjrsMTX3Dr72+z1qxZ9uXvmc6927Vy7j51jV3xpNSrt/LxfYu9/3MP
	hxXXL4pXFzpsJ/fp/6TccydfT1CwTcif+PF2fp/13bZEmcoKu9Nama1+N5sm5F5LF4xI6dzH
	YfD28oo5nc1+zMwiTjP/l+dFcDbv6mYI4uNxbmDw2VWt473txGuFv++PK589vc9D69Wyo1vz
	/yx4+PWz0C1RJjH+2Fy2viTt42ecp3o8NnJp3HXr+hLRSeVsK+erXItIv7Fzj2LW+14lluKM
	REMt5qLiRABPqh8HPgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnO6MuCNpBvcOyVg8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZazZ
	rFkwP6Hi+/zprA2M1326GDk5JARMJCY8/cjexcjFISSwm1Giv2MbM0RCRmJjw392CFtY4n7L
	EVaIoveMEq9Xr2PsYuTgYBPQlfjzzwEkLiJwiEli4uenLCAOs8BlRoljdyeDTRIWCJD4vngJ
	C4jNIqAqcW3ZIrA4r4C9xPeV/VAb5CUurnnOBmJzCjhIXFr7lQnEFgKqmbegGapeUOLkzCdg
	c5iB6pu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5yYYFhnmp5XrFibnFpXnpesn5uZsYwZGh
	pbGD8d78f3qHGJk4GA8xSnAwK4nwdr88mCbEm5JYWZValB9fVJqTWnyIUZqDRUmc13DG7BQh
	gfTEktTs1NSC1CKYLBMHp1QD07x1hlPa/R78jZY5Vvji8+STfqy6mtLH/c6a3p3w8zz7wllG
	wb2L3RaZHco+Ook//qw3v9ZcJnvGrivSf3d5b1U6kfRnosinx/NKrsTWdvxpl7BvKT/PnOw0
	6bRJ6fl7fkrtj7rjpllVZzGL3Fm9JSNAUXnR0rZEndXNJy7Odpk3S/Nh3KEuV8mVgqt4FVds
	sKhZ+sVCPv7Dop0i77eFnzUOk6g/G3lUO6gs0GfuPx75q80f2CbJz83fYCWU9ln1b8pZNaby
	efJ/HhZf9qzkfOb2iV8p98X+1RNvTms/zHStpsPtb9nJjnmPT90pywvZcv5gX7CsgfmR3wLf
	S9v513E9+PhK8JOGWJVS4y1nbiWW4oxEQy3mouJEAAePosT7AgAA
X-CMS-MailID: 20240820091504epcas2p119e83a64557149d334c4fa5a7d4e753a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820091504epcas2p119e83a64557149d334c4fa5a7d4e753a
References: <20240820091501.3395841-1-sunyeal.hong@samsung.com>
	<CGME20240820091504epcas2p119e83a64557149d334c4fa5a7d4e753a@epcas2p1.samsung.com>

Add dt-schema for ExynosAuto v920 SoC clock controller.
Add device tree clock binding definitions for below CMU blocks.

- CMU_TOP
- CMU_PERIC0/1
- CMU_MISC
- CMU_HSI0/1

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 162 +++++++++++++++
 .../clock/samsung,exynosautov920.h            | 191 ++++++++++++++++++
 2 files changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
new file mode 100644
index 000000000000..3330b2727474
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynosautov920-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung ExynosAuto v920 SoC clock controller
+
+maintainers:
+  - Sunyeal Hong <sunyeal.hong@samsung.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+description: |
+  ExynosAuto v920 clock controller is comprised of several CMU units, generating
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
+      - samsung,exynosautov920-cmu-peric1
+      - samsung,exynosautov920-cmu-misc
+      - samsung,exynosautov920-cmu-hsi0
+      - samsung,exynosautov920-cmu-hsi1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
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
+            enum:
+              - samsung,exynosautov920-cmu-peric0
+              - samsung,exynosautov920-cmu-peric1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_PERICn NOC clock (from CMU_TOP)
+            - description: CMU_PERICn IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ip
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - samsung,exynosautov920-cmu-misc
+            - samsung,exynosautov920-cmu-hsi0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_MISC/CMU_HSI0 NOC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-hsi1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_HSI1 NOC clock (from CMU_TOP)
+            - description: CMU_HSI1 USBDRD clock (from CMU_TOP)
+            - description: CMU_HSI1 MMC_CARD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: usbdrd
+            - const: mmc_card
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
index 000000000000..c720f344b6bf
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynosautov920.h
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Samsung Electronics Co., Ltd.
+ * Author: Sunyeal Hong <sunyeal.hong@samsung.com>
+ *
+ * Device Tree binding constants for ExynosAuto v920 clock controller.
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
+#define MOUT_SHARED0_PLL		8
+#define MOUT_SHARED1_PLL		9
+#define MOUT_SHARED2_PLL		10
+#define MOUT_SHARED3_PLL		11
+#define MOUT_SHARED4_PLL		12
+#define MOUT_SHARED5_PLL		13
+#define MOUT_MMC_PLL			14
+#define MOUT_CLKCMU_CMU_BOOST		15
+#define MOUT_CLKCMU_CMU_CMUREF		16
+#define MOUT_CLKCMU_ACC_NOC		17
+#define MOUT_CLKCMU_ACC_ORB		18
+#define MOUT_CLKCMU_APM_NOC		19
+#define MOUT_CLKCMU_AUD_CPU		20
+#define MOUT_CLKCMU_AUD_NOC		21
+#define MOUT_CLKCMU_CPUCL0_SWITCH	22
+#define MOUT_CLKCMU_CPUCL0_CLUSTER	23
+#define MOUT_CLKCMU_CPUCL0_DBG		24
+#define MOUT_CLKCMU_CPUCL1_SWITCH	25
+#define MOUT_CLKCMU_CPUCL1_CLUSTER	26
+#define MOUT_CLKCMU_CPUCL2_SWITCH	27
+#define MOUT_CLKCMU_CPUCL2_CLUSTER	28
+#define MOUT_CLKCMU_DNC_NOC		29
+#define MOUT_CLKCMU_DPTX_NOC		30
+#define MOUT_CLKCMU_DPTX_DPGTC		31
+#define MOUT_CLKCMU_DPTX_DPOSC		32
+#define MOUT_CLKCMU_DPUB_NOC		33
+#define MOUT_CLKCMU_DPUB_DSIM		34
+#define MOUT_CLKCMU_DPUF0_NOC		35
+#define MOUT_CLKCMU_DPUF1_NOC		36
+#define MOUT_CLKCMU_DPUF2_NOC		37
+#define MOUT_CLKCMU_DSP_NOC		38
+#define MOUT_CLKCMU_G3D_SWITCH		39
+#define MOUT_CLKCMU_G3D_NOCP		40
+#define MOUT_CLKCMU_GNPU_NOC		41
+#define MOUT_CLKCMU_HSI0_NOC		42
+#define MOUT_CLKCMU_HSI1_NOC		43
+#define MOUT_CLKCMU_HSI1_USBDRD		44
+#define MOUT_CLKCMU_HSI1_MMC_CARD	45
+#define MOUT_CLKCMU_HSI2_NOC		46
+#define MOUT_CLKCMU_HSI2_NOC_UFS	47
+#define MOUT_CLKCMU_HSI2_UFS_EMBD	48
+#define MOUT_CLKCMU_HSI2_ETHERNET	49
+#define MOUT_CLKCMU_ISP_NOC		50
+#define MOUT_CLKCMU_M2M_NOC		51
+#define MOUT_CLKCMU_M2M_JPEG		52
+#define MOUT_CLKCMU_MFC_MFC		53
+#define MOUT_CLKCMU_MFC_WFD		54
+#define MOUT_CLKCMU_MFD_NOC		55
+#define MOUT_CLKCMU_MIF_SWITCH		56
+#define MOUT_CLKCMU_MIF_NOCP		57
+#define MOUT_CLKCMU_MISC_NOC		58
+#define MOUT_CLKCMU_NOCL0_NOC		59
+#define MOUT_CLKCMU_NOCL1_NOC		60
+#define MOUT_CLKCMU_NOCL2_NOC		61
+#define MOUT_CLKCMU_PERIC0_NOC		62
+#define MOUT_CLKCMU_PERIC0_IP		63
+#define MOUT_CLKCMU_PERIC1_NOC		64
+#define MOUT_CLKCMU_PERIC1_IP		65
+#define MOUT_CLKCMU_SDMA_NOC		66
+#define MOUT_CLKCMU_SNW_NOC		67
+#define MOUT_CLKCMU_SSP_NOC		68
+#define MOUT_CLKCMU_TAA_NOC		69
+
+/* DIV in CMU_TOP */
+#define DOUT_SHARED0_DIV1		70
+#define DOUT_SHARED0_DIV2		71
+#define DOUT_SHARED0_DIV3		72
+#define DOUT_SHARED0_DIV4		73
+#define DOUT_SHARED1_DIV1		74
+#define DOUT_SHARED1_DIV2		75
+#define DOUT_SHARED1_DIV3		76
+#define DOUT_SHARED1_DIV4		77
+#define DOUT_SHARED2_DIV1		78
+#define DOUT_SHARED2_DIV2		79
+#define DOUT_SHARED2_DIV3		80
+#define DOUT_SHARED2_DIV4		81
+#define DOUT_SHARED3_DIV1		82
+#define DOUT_SHARED3_DIV2		83
+#define DOUT_SHARED3_DIV3		84
+#define DOUT_SHARED3_DIV4		85
+#define DOUT_SHARED4_DIV1		86
+#define DOUT_SHARED4_DIV2		87
+#define DOUT_SHARED4_DIV3		88
+#define DOUT_SHARED4_DIV4		89
+#define DOUT_SHARED5_DIV1		90
+#define DOUT_SHARED5_DIV2		91
+#define DOUT_SHARED5_DIV3		92
+#define DOUT_SHARED5_DIV4		93
+#define DOUT_CLKCMU_CMU_BOOST		94
+#define DOUT_CLKCMU_ACC_NOC		95
+#define DOUT_CLKCMU_ACC_ORB		96
+#define DOUT_CLKCMU_APM_NOC		97
+#define DOUT_CLKCMU_AUD_CPU		98
+#define DOUT_CLKCMU_AUD_NOC		99
+#define DOUT_CLKCMU_CPUCL0_SWITCH	100
+#define DOUT_CLKCMU_CPUCL0_CLUSTER	101
+#define DOUT_CLKCMU_CPUCL0_DBG		102
+#define DOUT_CLKCMU_CPUCL1_SWITCH	103
+#define DOUT_CLKCMU_CPUCL1_CLUSTER	104
+#define DOUT_CLKCMU_CPUCL2_SWITCH	105
+#define DOUT_CLKCMU_CPUCL2_CLUSTER	106
+#define DOUT_CLKCMU_DNC_NOC		107
+#define DOUT_CLKCMU_DPTX_NOC		108
+#define DOUT_CLKCMU_DPTX_DPGTC		109
+#define DOUT_CLKCMU_DPTX_DPOSC		110
+#define DOUT_CLKCMU_DPUB_NOC		111
+#define DOUT_CLKCMU_DPUB_DSIM		112
+#define DOUT_CLKCMU_DPUF0_NOC		113
+#define DOUT_CLKCMU_DPUF1_NOC		114
+#define DOUT_CLKCMU_DPUF2_NOC		115
+#define DOUT_CLKCMU_DSP_NOC		116
+#define DOUT_CLKCMU_G3D_SWITCH		117
+#define DOUT_CLKCMU_G3D_NOCP		118
+#define DOUT_CLKCMU_GNPU_NOC		119
+#define DOUT_CLKCMU_HSI0_NOC		120
+#define DOUT_CLKCMU_HSI1_NOC		121
+#define DOUT_CLKCMU_HSI1_USBDRD		122
+#define DOUT_CLKCMU_HSI1_MMC_CARD	123
+#define DOUT_CLKCMU_HSI2_NOC		124
+#define DOUT_CLKCMU_HSI2_NOC_UFS	125
+#define DOUT_CLKCMU_HSI2_UFS_EMBD	126
+#define DOUT_CLKCMU_HSI2_ETHERNET	127
+#define DOUT_CLKCMU_ISP_NOC		128
+#define DOUT_CLKCMU_M2M_NOC		129
+#define DOUT_CLKCMU_M2M_JPEG		130
+#define DOUT_CLKCMU_MFC_MFC		131
+#define DOUT_CLKCMU_MFC_WFD		132
+#define DOUT_CLKCMU_MFD_NOC		133
+#define DOUT_CLKCMU_MIF_NOCP		134
+#define DOUT_CLKCMU_MISC_NOC		135
+#define DOUT_CLKCMU_NOCL0_NOC		136
+#define DOUT_CLKCMU_NOCL1_NOC		137
+#define DOUT_CLKCMU_NOCL2_NOC		138
+#define DOUT_CLKCMU_PERIC0_NOC		139
+#define DOUT_CLKCMU_PERIC0_IP		140
+#define DOUT_CLKCMU_PERIC1_NOC		141
+#define DOUT_CLKCMU_PERIC1_IP		142
+#define DOUT_CLKCMU_SDMA_NOC		143
+#define DOUT_CLKCMU_SNW_NOC		144
+#define DOUT_CLKCMU_SSP_NOC		145
+#define DOUT_CLKCMU_TAA_NOC		146
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

