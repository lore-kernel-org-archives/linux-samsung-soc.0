Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A5D512
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721687627; cv=none; b=laxPtW3pl3E8hBUmcgxNMfRk0Lb2eLnJ1x4SpPjFtNpnQNZjsk4PBO1jAWwSq/doikcU4DA/9PqAptnXmNAbKh9EoW6PcrJ8nNcpqGIgSYd3o+Z6KGstAPqn5vfe1kRCW3S+wPyImachaLCVuBeqEH3IU58S+4RRka3YzVA9qrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721687627; c=relaxed/simple;
	bh=pyPycAp1tpTirRZ7+Bm2BLnjYPIktNQ3dq7mUMcXeCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=apEZ1WOSxT9+WtVrRocf+YRx11vJlDttAUzwKORLnJQB0E+bdWrjwMztRuhCWG5X9CNxfuM/IqvHSRP5q6HtQ8WTUzsEYePqztsREfi7yVraE+FfKu6w2xfY2qeVBN8XfINLXw89xsqVbH9HKtREevIFZq+vXctIAR82tyRxg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TOcdcqVi; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TOcdcqVi"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20240722223342epoutp03c06eaf6e763bc59053929a965a622aad~kqcVcrx6A1144211442epoutp03s
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2024 22:33:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20240722223342epoutp03c06eaf6e763bc59053929a965a622aad~kqcVcrx6A1144211442epoutp03s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1721687622;
	bh=7da3NioKRcbaK0hXL2D8aKN831VOnV4wvg9fng94q8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TOcdcqViiuVKSacKwHDa4QnmZAN7ie9NLkMDN2Z/3w1F3znS1OVQuixnrTosuKVM6
	 614mBb23btpSIuK0Liqwk3aS1aNOxXGcL6swu6LA9Slfy7XGCPjVYysHFZhD2g8uqw
	 kUStsD4NTk2ZEeUBlvd6q7KuOs5pEKVkA6+omLkM=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTP id
	20240722223341epcas2p29e9327c958aa40d83e22596f0d2c19df~kqcUy_fql1716817168epcas2p2b;
	Mon, 22 Jul 2024 22:33:41 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.102]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WSZnK351lz4x9Q1; Mon, 22 Jul
	2024 22:33:41 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	10.5B.08901.54EDE966; Tue, 23 Jul 2024 07:33:41 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d~kqcTxYy8q1651716517epcas2p4v;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240722223340epsmtrp2170a6d22d0462744559f4a07306ee5f7~kqcTwk00P3083030830epsmtrp24;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
X-AuditID: b6c32a43-a0fff700000022c5-77-669ede45e4a5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.98.08964.44EDE966; Tue, 23 Jul 2024 07:33:40 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240722223340epsmtip1f1d2a0b95e2fb68eb2562cdd5f1c29d8~kqcTgwX4z2373223732epsmtip1f;
	Mon, 22 Jul 2024 22:33:40 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v4 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 23 Jul 2024 07:33:30 +0900
Message-ID: <20240722223333.1137947-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDJsWRmVeSWpSXmKPExsWy7bCmua7rvXlpBh9aBCwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGd8+7OcrWBWWMWh4w4NjC/c
	uhg5OCQETCRW3s3uYuTiEBLYwShx88dFdgjnE6NE67RuKOcbo8SFiRMZuxg5wTpeTH7FDJHY
	yyjx7M12KOcjo8TOLzdZQOayCehK/PnnABIXEdjDJLHl/BImEIdZ4CyjxN05C9hBRgkLBEms
	WbOXCcRmEVCVuLe9A2wFr4C9xJxzp5gh1slLXFzznA1kKKeAg8TkWwoQJYISJ2c+YQGxmYFK
	mrfOBjtCQmAuh8TaeVOgel0k1i4+CXW2sMSr41vYIWwpic/v9rJB2PkSk6+/ZYJobmCUuPav
	G6rZXmLRmZ/sIIuZBTQl1u/ShwSYssSRW1B7+SQ6Dv9lhwjzSnS0CUE0qkl8unIZaoiMxLET
	z6BsD4kPkzuhYTWZUeL760UsExgVZiF5ZxaSd2YhLF7AyLyKUSy1oDg3PTXZqMAQHsHJ+bmb
	GMHJVst5B+OV+f/0DjEycTAeYpTgYFYS4X3yam6aEG9KYmVValF+fFFpTmrxIUZTYFhPZJYS
	Tc4Hpvu8knhDE0sDEzMzQ3MjUwNzJXHee61zU4QE0hNLUrNTUwtSi2D6mDg4pRqYLC+GHNil
	0xT2YOIDsf/vdl01bF61U3quZaLWWXHp5zMkS6w/RuSemXzu4NHqmidLT7rndMiz6rSx59/n
	DRL9IKCsO9lDcsb9Mwmnf7CZd28qTzF7xZqeYJPwcXGO9IGMtxtdMmuNrx1brMw2aSL/52TJ
	QPeew73MnuUZTywOuE5sC5qTclvtr9JTw32N0+ZyObv32JmafCgN6Fo91YZVT3o/+7FHysLM
	jk5C3uabTk6fd+n17fpdoofDJla09qrYie5v7ZLTS+ownuavce/4/2W2sZ/mPTz4ekaRUXfU
	oq8G/TbbkybZJevUJrelv9z1cbfNA4aPwW0ycSxip1f1aXzeNvVTpuBd3sPcl0uVWIozEg21
	mIuKEwFj2Ok5PwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnK7LvXlpBu8XG1g8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZXz7
	s5ytYFZYxaHjDg2ML9y6GDk5JARMJF5MfsXcxcjFISSwm1Hi/pmdbBAJGYmNDf/ZIWxhifst
	R1ghit4zSpz7MwMowcHBJqAr8eefA0hcROAQk8TEz09ZQBxmgcuMEsfuTmYG6RYWCJDoO3ea
	EcRmEVCVuLe9A8zmFbCXmHPuFDPEBnmJi2ues4EM5RRwkJh8SwEkLARUMuvlNWaIckGJkzOf
	sIDYzEDlzVtnM09gFJiFJDULSWoBI9MqRsnUguLc9NxiwwLDvNRyveLE3OLSvHS95PzcTYzg
	uNDS3MG4fdUHvUOMTByMhxglOJiVRHifvJqbJsSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVv
	ipBAemJJanZqakFqEUyWiYNTqoFJ6uE1sy2vxGsargl06G7c3x13aHlK3INZ0dHz1v78N9v4
	cWH0fba8luRs/06JH/YZG+zL+AUfz1857cGBBXvV82Z/yyxlnbWmY703X27eouc7PfZN8jhQ
	wJwfdyiHczP3ple/t5t/Nub8cGDK6g+etzWr5uaZ8rIVqeqtnft3pbtaokw1g77o/+lcz/mc
	b2TUfz4Q/8W036jqT/xSxlvb6oJWX2M4a3gpfcaSu8+2PYmXz43prJb/NzXt8A9z9iNfTC/+
	v3arOPJwWtPa4+7TmZJ81TiTcueenXDor3hjjelP6YwwU5kfZ9xTH+x/duUk90uJqSWM9mYx
	siqlHlJHes/5rzn3WGWT06cLz2RalViKMxINtZiLihMBHcZgPPoCAAA=
X-CMS-MailID: 20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
	<CGME20240722223340epcas2p4ab83b1e8dbc64eaaf32f4f8b7e3f015d@epcas2p4.samsung.com>

Add dt-schema for ExynosAuto v920 SoC clock controller.
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
index 000000000000..90f9f17da959
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -0,0 +1,115 @@
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
index 000000000000..ad89728a4396
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

