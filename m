Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E163418FC6D
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323555; cv=none; b=VjcQiUGH2PyE+/lZDCqAoA3vNfMMh+ZnuiCMcMX/4Bbo/P1szKq1AtGjMzhk72/lVL7U2piBPI8Wes+Y6Kl22xiptwVlDD4DaxLbl7RTQK1YUzTdnqDccXYPzdz9Igm36B2i3BaFUq8hrWrmRJIibRPzh/NmabgDZbXa43AogiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323555; c=relaxed/simple;
	bh=3Mz0cpQay2byXME+FrTrxfhTFv1UfxkXxFzYqvkpACc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=LgHgjrRApNh7rH8VkITDzWq7013BzoCuSyhdbXiTAW2tbPMCN1Vs3nszfQce830Q38ca1riE+26M9VDAeG6ozfkmA/i1/9PiRWXna1Cu9qSIF8uRl3vDwzGudtVt0hS3F7NLrnKO3e84RJxzyARgXd61+kv6CFV6xqyR9BYXCZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=KlDCBnn7; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="KlDCBnn7"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240730071229epoutp04cb85d11f3b0de0b49f06972d27167e57~m7CSmbTxr0501305013epoutp04a
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2024 07:12:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240730071229epoutp04cb85d11f3b0de0b49f06972d27167e57~m7CSmbTxr0501305013epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1722323549;
	bh=P3YHsWvpP42jeGY4goMl62qHTFybIIn2FHSr7KtAX9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KlDCBnn7nBEeJPUfQ3Kmw5tKbfX+AIotUljHorjCOZ6vZduXdmIkSl/AFtLcjfTHn
	 j/S9qPa+o2nrXDbaFozCjx7nJgrB59y7shZgEjt7wqn4taSn5IMgxZajencETXyGiM
	 Bwp5U84sbFrTxmicesPgs3TMHFCZHVJdAgHLSCJ8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20240730071229epcas2p4dbbad55bb9ac071b2a914ce6691f415b~m7CSGspDJ2379123791epcas2p4d;
	Tue, 30 Jul 2024 07:12:29 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4WY5yh45xcz4x9Q7; Tue, 30 Jul
	2024 07:12:28 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F4.D5.10431.C5298A66; Tue, 30 Jul 2024 16:12:28 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epcas2p278017961013950cd75c4266eda45c236~m7CQ8d0pG0794807948epcas2p2O;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240730071227epsmtrp166404d7333998068ae2706ac9be78985~m7CQ7S91L1008010080epsmtrp1L;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
X-AuditID: b6c32a45-ffffa700000028bf-c6-66a8925c04b4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.CB.08456.B5298A66; Tue, 30 Jul 2024 16:12:27 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240730071227epsmtip25c7ac94d8493bf1f56c2f706b8fced37~m7CQnN2R30505705057epsmtip2W;
	Tue, 30 Jul 2024 07:12:27 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v5 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Tue, 30 Jul 2024 16:12:18 +0900
Message-ID: <20240730071221.2590284-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPJsWRmVeSWpSXmKPExsWy7bCmuW7MpBVpBiePSVk8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZl22SkJqakFimk5iXnp2Tm
	pdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3amkUJaYUwoUCkgsLlbSt7Mpyi8t
	SVXIyC8usVVKLUjJKTAv0CtOzC0uzUvXy0stsTI0MDAyBSpMyM64vvMTY8GEkIqNH6cyNjCe
	c+1i5OSQEDCRWNtzg6mLkYtDSGAHo0TD6q8sEM4nRom2pSuhnG+MEncWnmeDaXm8aysjRGIv
	o8SFZ1PYIJyPjBKbGkEyHBxsAroSf/45gMRFBPYwSWw5vwRsCbPAWUaJu3MWsIOMEhYIkvg+
	YTbYWBYBVYkN546C2bwC9hLzb1yDWicvcXHNczCbU8BB4sDHeSwQNYISJ2c+AbOZgWqat85m
	BlkgITCXQ+Lc1bPsEM0uEps+/IcaJCzx6vgWqLiUxMv+Nig7X2Ly9bdMEM0NjBLX/nUzQyTs
	JRad+ckO8g6zgKbE+l36IKaEgLLEkVtQe/kkOg7/ZYcI80p0tAlBNKpJfLpyGWqIjMSxE8+g
	bA+JGzs2skMCazKjxLlJfcwTGBVmIXlnFpJ3ZiEsXsDIvIpRLLWgODc9tdiowBAex8n5uZsY
	wSlXy3UH4+S3H/QOMTJxMB5ilOBgVhLhjb+yNE2INyWxsiq1KD++qDQntfgQoykwsCcyS4km
	5wOTfl5JvKGJpYGJmZmhuZGpgbmSOO+91rkpQgLpiSWp2ampBalFMH1MHJxSDUz881meZHIc
	CUw0rd2x0tmE+3LW/QpTlf6etPUlV4QuLn95tGk28/JbJY1zNlS55ETac55gbYuX2ZPlu+jt
	Xf1bAr/LPbbZtU9mWXRf6yV36d0PgnydT/s2r2nJ+P0x6ndRhKn8RnmfefF+hWkHl6+Wlmk5
	nlsftHDrmxdpLAYrtzvoyd+VSnLl2RfYc33DsV+bb4hsrtddUDRpfsm6buUPE55+cFI+zRwX
	U/WAWbP0zS2utd0xl4yEGSYWHjz29Ky5tphQX++mBTo/Q6VbqqvWJzbuCvq5OVNT+O2jDQdC
	vU1sv9iFlWr6LjMvmWOm4R68YvnKrHR50Yu3V+788krE5q3J1kXfnJLW+F+c8UyJpTgj0VCL
	uag4EQDdTrp6QgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvG70pBVpBg83a1o8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZVzf
	+YmxYEJIxcaPUxkbGM+5djFyckgImEg83rWVsYuRi0NIYDejxKfVG9kgEjISGxv+s0PYwhL3
	W46wQhS9Z5ToO/4GqIiDg01AV+LPPweQuIjAISaJiZ+fsoA4zAKXGSWO3Z3MDFIkLBAgcehX
	CMggFgFViQ3njoIt4BWwl5h/4xrUMnmJi2ueg9mcAg4SBz7OYwGxhYBq3jdfZIaoF5Q4OfMJ
	WJwZqL5562zmCYwCs5CkZiFJLWBkWsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERwZ
	Wlo7GPes+qB3iJGJg/EQowQHs5IIb/yVpWlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeb+97k0R
	EkhPLEnNTk0tSC2CyTJxcEo1MOU0ary09Nvyxsy0IeDG1BevgtbKpv7TujDz0fMZtbLHWtfd
	N2vJkz184twT6/lTrm/2dO/339lqZ/iEdVNmaEP9mlTnPLYXKy0m9cnej257t8r6a+iLvJTd
	MxLkToY8axPq+l3CaxoQ+OLQBdM4btFTurdm3Dhh8O7LtNK9zUH/7TSZ3uz6mmbyb7eInZvg
	kuXWtk7nZgrNPHzn12Y+NdMj8Wtr2mZv4nix/9fE471iP3mmz+G9vsX1/PKtqS2MNp+/n+JS
	vX+R6Utyqdpql90L9z/JufPr8N9Stm8ySvERliesS8pZrkZu3ZEp8PTdvimXW6W/92VsbPr/
	QuQOe+KChxcsytbkzwjgzf2oPe+tEktxRqKhFnNRcSIA5CgcvPsCAAA=
X-CMS-MailID: 20240730071227epcas2p278017961013950cd75c4266eda45c236
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240730071227epcas2p278017961013950cd75c4266eda45c236
References: <20240730071221.2590284-1-sunyeal.hong@samsung.com>
	<CGME20240730071227epcas2p278017961013950cd75c4266eda45c236@epcas2p2.samsung.com>

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
index 000000000000..d5c50997107d
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
+    items:
+      - description: External reference clock (38.4 MHz)
+      - description: Block NOC clock (from CMU_TOP)
+      - description: Block IP clock (from CMU_TOP)
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: oscclk
+      - const: noc
+      - const: ip
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - reg
+
+if:
+  properties:
+    compatible:
+      enum:
+        - samsung,exynosautov920-cmu-top
+
+then:
+  properties:
+    clocks:
+      maxItems: 1
+
+    clock-names:
+      maxItems: 1
+
+else:
+  if:
+    properties:
+      compatible:
+        enum:
+          - samsung,exynosautov920-cmu-peric0
+
+  then:
+    properties:
+      clocks:
+        minItems: 3
+        maxItems: 3
+
+      clock-names:
+        minItems: 3
+        maxItems: 3
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

