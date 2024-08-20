Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4618017C988
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724139925; cv=none; b=rdHG2vsAXaVBzNsgASdlgeOo1AlRM47SUGVTttyqsY/6+NMUNAtRE1TE6SHUNy9mqpYQBulPpZf14I8hF+qe8Kra0AAdGhga6BX8f7rCAOwAWeqS4VDDxVC/NLwdJHze2ABJuQr6TTqpNE0kY9qyiCtIxmoXHQvD+fi6Z3q1VOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724139925; c=relaxed/simple;
	bh=tFdXxqvbEPWS/2X84cRw4lXWT39VkHCWo9RTPhQiXgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=brPc6XU/nSpula15BaM5oJ1BQlfX53sWgF1PHR3hNP1XrRrCtGtH1E0iB81aTyCf4Q2/D57UIqP4QALvSwvJn4AlPJBGRNvWO6UOWWVgog1NIO8gpV3KVeLROjPd2b8zWkH8Y4d+GSgJOpM0G5RDjjl7nsJAqlOKWQ1lasTmaZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TlBxZrfw; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TlBxZrfw"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240820074521epoutp03d7738033dcb5eb1e08d6c5530ecdfdc0~tYB_p67lV2056720567epoutp03I
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240820074521epoutp03d7738033dcb5eb1e08d6c5530ecdfdc0~tYB_p67lV2056720567epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724139921;
	bh=JaLSNX/LII5pRQun5OTMTXaQepMwVrjPws75qjrehH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlBxZrfw36FR4Cgi45LuGVC6UH2W85+KIGCfeqVxluTQAFxGcS3eaqcoSmXscHFGl
	 2re7ybL0OgS85fn6YdLFevFUQ4eqr3jXHIOZtxmklGJAfZ4C7DqDzKP/h3L/ylyNHC
	 aT44y3FgydZOPM3YETyMgARzMvJo6gJaTNXPlCSw=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240820074521epcas2p4ef7cd360536d2dd9d4695f4096d38405~tYB_WBbbJ2322123221epcas2p45;
	Tue, 20 Aug 2024 07:45:21 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4Wp1hw3r63z4x9QD; Tue, 20 Aug
	2024 07:45:20 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	3E.39.10012.09944C66; Tue, 20 Aug 2024 16:45:20 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epcas2p3504bbaff7b06423c296501e59d3ce9a6~tYB9RFlyw0568805688epcas2p3A;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240820074519epsmtrp1f335b3e8f4547ae1f7cca4b4451532c0~tYB9QCBPx0720407204epsmtrp1-;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
X-AuditID: b6c32a47-4dfd9a800000271c-65-66c449909174
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	59.E0.08964.F8944C66; Tue, 20 Aug 2024 16:45:19 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240820074519epsmtip23ef38dc4c94a68e01bd338864d962231~tYB9C-_x92557725577epsmtip2z;
	Tue, 20 Aug 2024 07:45:19 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v7 2/5] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 20 Aug 2024 16:45:11 +0900
Message-ID: <20240820074514.3123767-3-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHJsWRmVeSWpSXmKPExsWy7bCmhe4EzyNpBs0fRC0ezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGd8bdvHXrAooWJ2+yGmBsZb
	Pl2MHBwSAiYSs57UdjFycQgJ7GCUWHOoiQ3C+cQosWHxIXYI5xujxI2f74EcTrCOl8tOMUEk
	9jJKzD28kQXC+cgosWjRaXaQuWwCuhJ//jmAxEUE9jBJbDm/BKyDWeAso8TdOQvARgkLBElM
	OH8ZzGYRUJU40HCRFcTmFbCXuHnpMhPEOnmJi2ues4HYnAIOEjM6j0DVCEqcnPmEBcRmBqpp
	3jqbGWSBhMBcDomNUyazQjS7SNzuescIYQtLvDq+BeoHKYmX/W1Qdr7E5OtvmSCaGxglrv3r
	ZoZI2EssOvMT7B1mAU2J9bv0ISGmLHHkFtRePomOw3/ZIcK8Eh1tQhCNahKfrlyGGiIjcezE
	MyjbQ+Lo7hZo+E5mlJg6s519AqPCLCTvzELyziyExQsYmVcxiqUWFOempxYbFRjDozg5P3cT
	IzjharnvYJzx9oPeIUYmDsZDjBIczEoivN0vD6YJ8aYkVlalFuXHF5XmpBYfYjQFBvZEZinR
	5Hxgys8riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoFp2szKeb3c
	H7/aJJ6/8MEo0LM2S7PwTrVg2J2UMKU1TJdSdsgm3eo8frM1lXWX22ZNJ4WeU6Vm88R/nN3i
	IZs8mfXCRk6zt0LTl9buYfHV2Lxjw871B9J4rp5wmtw4/+iKZKmsycLz1krz99vG2E/2esF2
	6HLxP6v+dV/3TCm0svoo9X7tikOOv++6M50898rMbKaapLTar9UW79n2Ku98b3321d4H7h6V
	17/GrHac6bSnwI11f7hanbfjRsPZ304c+BFy98z7INM2/v6VtvwlwhElE/xfaP2R3Fm13boo
	6fK8BRsXv+mWZPlsbHtMUacuaYWQn4KbQ2Aux6bsgwv1OX781g3Tv6+5aeeXsu+sSizFGYmG
	WsxFxYkASj80fUEEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvG6/55E0g7UPTSwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mr62
	7WMvWJRQMbv9EFMD4y2fLkZODgkBE4mXy04xdTFycQgJ7GaUaGr+wQSRkJHY2PCfHcIWlrjf
	coQVoug9o8T+7htADgcHm4CuxJ9/DiBxEYFDTBITPz9lAXGYBS4zShy7O5kZpFtYIEBi9bej
	bCA2i4CqxIGGi6wgNq+AvcTNS5ehtslLXFzzHKyGU8BBYkbnEbAFQkA1j5caQ5QLSpyc+YQF
	xGYGKm/eOpt5AqPALCSpWUhSCxiZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEeG
	luYOxu2rPugdYmTiYDzEKMHBrCTC2/3yYJoQb0piZVVqUX58UWlOavEhRmkOFiVxXvEXvSlC
	AumJJanZqakFqUUwWSYOTqkGJoG5r64ERD65d/fuycaKP00MQRybPvVI7WFovJnz4PT+txrT
	qxy+lmhfepRj/k0qcdvTrRXnOF+cu1QZxHbo9YTZprNSpH9xcqsf+Rn29m3qx2UyryWi8r6K
	b/uQmGNuK+w46aP/rvQdm+NlDwa6ejx5sbq4M0Rr9qrQw2+fnrxy5saKb7NWXOxo5eibxTzf
	/nmcqqZfzvGdt055CarKar26+sPg5ocpq/4a75lmuXSPu+Tr6H2nwoXdkyauWXxmDrtz9JQj
	wnkFB6+sSlm6Z5en53z15Sq/q9ieMC+e8P7HOpEzX8xS96SevsoUYHMs5Y+f+sy/rXay5x+t
	EJryKu/ftTdV/1ljf5YtWabenCjGpcRSnJFoqMVcVJwIAOwqSDv7AgAA
X-CMS-MailID: 20240820074519epcas2p3504bbaff7b06423c296501e59d3ce9a6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240820074519epcas2p3504bbaff7b06423c296501e59d3ce9a6
References: <20240820074514.3123767-1-sunyeal.hong@samsung.com>
	<CGME20240820074519epcas2p3504bbaff7b06423c296501e59d3ce9a6@epcas2p3.samsung.com>

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
index 000000000000..574234dd3438
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
+            - description: CMU_HSI1 NOC clock (from CMU_HSI1)
+            - description: CMU_HSI1 USBDRD clock (from CMU_HSI1)
+            - description: CMU_HSI1 MMC_CARD clock (from CMU_HSI1)
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

