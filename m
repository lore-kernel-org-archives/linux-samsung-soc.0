Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4D183CA1
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 23:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724282822; cv=none; b=RaRP1eZn/0a0P5YMLb5DacgipIxlJYc8DdNyzonWeIN0IRo9YNXiAVMkeljVz84Fd4XrdjLz1QqxfVUCVL4eH/N1oQUkRSg9AMoVxBD6G12HjVcbQINeu0GSlm8jYlOHzlI6QsYCuMbuoFtVNutbtcrtChRZNdZEUZHI5YiKG3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724282822; c=relaxed/simple;
	bh=FmxjfcG8nTdlKxtkOhNnv8s6ldHGylqQzadDAip1iqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=RB5mbr2EQEiGApbZ7Ui33oqKaS88w9PcV4b/OoyP8Q3WkAMMFDUsamXlE1YkjcnK8fxkNp4JjoDzGrsV7kFKcmrsTbywE48CR2P4lVAGZmScnzCNxsbmhB6HV8Y8vxIiFWCqut0hh2Rsl78yP6KKnKMbswH1l4Isn/Zp5RYcWH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hasXazQw; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hasXazQw"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240821232657epoutp03811911bab25087457b3a806c2895a6bf~t4hZU8p9Q0518005180epoutp03A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Aug 2024 23:26:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240821232657epoutp03811911bab25087457b3a806c2895a6bf~t4hZU8p9Q0518005180epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724282817;
	bh=WUVynzx6tGeWDRNXio+zaYe9ETrlcviyJuAww6Msj6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hasXazQwtKtk71sDNWPjfjoDpGcjY9DUaqKFtuQjqPqovgXu5LrSlrFtbV7sh0wag
	 1YHJi6oIIpf7lrv+28Ic8ieoG9pWu7Zf9dZTpz4E76zlp3akbIdorYWHEyOZge3F6Y
	 N+Kb486uZRH7d/rzU80S+dRyZd1ASOOhWbXofFwY=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240821232657epcas2p4ecd2e507f50750d34e1010488c2d0b8b~t4hY75tJD2090520905epcas2p4n;
	Wed, 21 Aug 2024 23:26:57 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Wq2Xw64Xpz4x9Pp; Wed, 21 Aug
	2024 23:26:56 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.1A.19039.0C776C66; Thu, 22 Aug 2024 08:26:56 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20240821232656epcas2p3c59f98d2bd185b8258096bf1597d75eb~t4hXsscpO0565305653epcas2p3t;
	Wed, 21 Aug 2024 23:26:56 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240821232656epsmtrp2c02e93f6a0cbc36d92e38bd668258ce8~t4hXrzcX02801228012epsmtrp2T;
	Wed, 21 Aug 2024 23:26:56 +0000 (GMT)
X-AuditID: b6c32a4d-36b9f70000004a5f-5a-66c677c0f223
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7E.F7.07567.FB776C66; Thu, 22 Aug 2024 08:26:56 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240821232655epsmtip236c05d906cd10676bd6b1c66e12f5484~t4hXeE5GZ2565325653epsmtip2a;
	Wed, 21 Aug 2024 23:26:55 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v9 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Thu, 22 Aug 2024 08:26:49 +0900
Message-ID: <20240821232652.1077701-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmhe6B8mNpBlsvals8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM5Ys1mzYH5Cxff501kbGK/7
	dDFyckgImEjsXHyFsYuRi0NIYA+jxPPGnWwQzidGiaXtb6Ccb4wSNx8vZYNp6d90lAUisZdR
	ornjOzuE85FRonPJC6BhHBxsAroSf/45gMRFBPYwSWw5v4QJxGEWOMsocXfOAnaQUcICQRKv
	rv5hBLFZBFQlOtacA1vBK2Avsb6pnxVinbzExTXPweKcAg4SU6cfY4eoEZQ4OfMJC4jNDFTT
	vHU2M8gCCYG5HBJ7jlxmhmh2kdj67D0LhC0s8er4FnYIW0ri87u9UP/kS0y+/pYJormBUeLa
	v26oZnuJRWd+soO8wyygKbF+lz6IKSGgLHHkFtRePomOw3/ZIcK8Eh1tQhCNahKfrsBcICNx
	7MQzKNtD4nLXP2iQTmaU6Jn+jXkCo8IsJO/MQvLOLITFCxiZVzFKpRYU56anJhsVGOrmpZbD
	ozk5P3cTIzjxavnuYHy9/q/eIUYmDsZDjBIczEoivEn3jqYJ8aYkVlalFuXHF5XmpBYfYjQF
	BvhEZinR5Hxg6s8riTc0sTQwMTMzNDcyNTBXEue91zo3RUggPbEkNTs1tSC1CKaPiYNTqoEp
	eOGyCbZbrsiWVF+NdWT5Kmp5et66R2pPb02TZxHeFJn/lE1nlarZ24LPlvJX2DNnXuFzdC2f
	1ZzteUtGYYt6kX3hBNOf85yyEnOnbN4+fy13rOPyo9V3FjR6buWKesp1R0uztOGASeqjr6/u
	6133j3+mcl/iJscp8Utb7rbstXs9Md/l/LRjV/dM11QWvtcWVmuZfnRyx5bKSE7Hgq0Mbw8J
	/b347gGP/7KtUyr3HG+Pf+7AdqH5uYiJ+qElzf+fGiq+7vT6ZOu3Se/erDN+Pro3118JO+/w
	wTxZZpfRP54qiTnTZ270WnX05pr7X8p3bTa6d4HF9oHfzKCyjUFHlh/bpRB9SeOPx8KJTGaC
	T5RYijMSDbWYi4oTAU1yWftFBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvO6B8mNpBpN/M1k8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZazZ
	rFkwP6Hi+/zprA2M1326GDk5JARMJPo3HWXpYuTiEBLYzShx6fdnVoiEjMTGhv/sELawxP2W
	I6wQRe8ZJS6+38/cxcjBwSagK/HnnwNIXETgEJPExM9PwSYxC1xmlDh2dzIzSLewQIDE/WN3
	WUBsFgFViY4159hAbF4Be4n1Tf1Q2+QlLq55DhbnFHCQmDr9GNhmIaCavcvbWSDqBSVOznwC
	ZjMD1Tdvnc08gVFgFpLULCSpBYxMqxglUwuKc9Nzkw0LDPNSy/WKE3OLS/PS9ZLzczcxgiND
	S2MH4735//QOMTJxMB5ilOBgVhLhTbp3NE2INyWxsiq1KD++qDQntfgQozQHi5I4r+GM2SlC
	AumJJanZqakFqUUwWSYOTqkGJtX/b78rVK09ULPUMnIL4x6D476WUc6Nqzct3Hl9b8WeF5ee
	X4tbmtyy8KUFS6OMrc9Z7TVv9z/48OrxpGns23U/RXy58Xl3ca3Sw4B03U8bbe/yVh+OUU0+
	/F6wM1pbVarwmEJJ0OOb4cea2K5HfjObcbDseKxG+XXtm2r3dq8+52W4vbH0/aOEz1dLn1gZ
	FG7+K8zd2PrpsMPztT9yz8o3XN1+TVfxnsKCh2+UkpQfTfglsULPZr/Q6UccPLpfOvX/VwUs
	rrl0b9O6dWvfSy06+2dpk7CYZXjry0fyE2drOKxS185/wHVEI/rAt8/y/zuYX5xPSFXunu6W
	0mblyiPssTD/PsPTlHentr0NaNqhxFKckWioxVxUnAgAU8e1lvsCAAA=
X-CMS-MailID: 20240821232656epcas2p3c59f98d2bd185b8258096bf1597d75eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240821232656epcas2p3c59f98d2bd185b8258096bf1597d75eb
References: <20240821232652.1077701-1-sunyeal.hong@samsung.com>
	<CGME20240821232656epcas2p3c59f98d2bd185b8258096bf1597d75eb@epcas2p3.samsung.com>

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

