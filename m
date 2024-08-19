Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D334514A4D4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724045069; cv=none; b=nZnU6f8fhUh/r6JmtDL9SKbUKI/wIm/ROVd4UKLzH9zPvuorx5B7WfIJW5mZ78gLyB/dNzZpdCGY96hfoTeQIT319IFYI/wB96AdJLCL+7caQrhIin3G7e5h+pT/pQdjbNtc99TXQW9/zd18Op5f3ulWB4SFU8R3H+OvlCBl7SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724045069; c=relaxed/simple;
	bh=BCy2GC9V1kfX/CQm6QmemZgWpIvHHRsN0JNBHv/81rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=K/6A8I+s/uupzANQAX9jWwZL3Fi2Ubav8UrnIWFJJvHXtq252fKw7FqYYUc8qGRC/UCAeMOTxhJoiYwxOa8yYUd5fVeOTg1DLwdWV0TA7T2AWdpadLDrpLdSs501a2b1IaJT6xpyo7LzalvLCIVx+6pFt9ZgRJEN8LHuGqqUKiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XdpxKhd1; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XdpxKhd1"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240819052423epoutp026b0f6a45e5b4b077d3c3ec2fccb4031f~tCdnvehpy0971309713epoutp02F
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240819052423epoutp026b0f6a45e5b4b077d3c3ec2fccb4031f~tCdnvehpy0971309713epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724045064;
	bh=m19Rrrxc7T1jJx8xjmWuee6smxbUtS6zr0Eh+HtDGgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdpxKhd1+tRr1+H6oLJl34KPlB+dN+/TwAntLcclAkdpdnLnK4M4ScJoOMRV9AKax
	 kuaV3UxNV4pbCvSnomwxExB4nmXNYaFjlnYUrkZScLvxsulJUV0ldG6txVYJmeAa8f
	 F743y9XeHV5JRNbU4iePYzGxK4ukiIE5UDAIgVJ0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20240819052423epcas2p1e0a5f9722b36e5a4518890ad55f05c04~tCdnSiKCy2850728507epcas2p1X;
	Mon, 19 Aug 2024 05:24:23 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.70]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4WnLck6WzMz4x9Q9; Mon, 19 Aug
	2024 05:24:22 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	78.59.19039.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epcas2p4db394defd5f298658f7841af3649ac6f~tCdmP6_Cm2693626936epcas2p4Y;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240819052422epsmtrp29a4e7a5d43d196a3a450d6f5c6911146~tCdmO8zdP1492814928epsmtrp2L;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
X-AuditID: b6c32a4d-305ff70000004a5f-ae-66c2d7063c1b
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E7.FC.08964.607D2C66; Mon, 19 Aug 2024 14:24:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.60]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240819052422epsmtip1df6158966cf280e6d8851dac93e5bd02~tCdmAlgO91691916919epsmtip1W;
	Mon, 19 Aug 2024 05:24:22 +0000 (GMT)
From: Sunyeal Hong <sunyeal.hong@samsung.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki
	<s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar
	<alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Sunyeal Hong <sunyeal.hong@samsung.com>
Subject: [PATCH v6 1/4] dt-bindings: clock: add ExynosAuto v920 SoC CMU
 bindings
Date: Mon, 19 Aug 2024 14:24:12 +0900
Message-ID: <20240819052416.2258976-2-sunyeal.hong@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEJsWRmVeSWpSXmKPExsWy7bCmqS7b9UNpBk2r9SwezNvGZrFm7zkm
	i+tfnrNazD9yjtXi/PkN7BabHl9jtfjYc4/V4vKuOWwWM87vY7K4eMrV4v+eHewWh9+0s1r8
	u7aRxaJp2XomBz6P9zda2T02repk89i8pN6jb8sqRo/Pm+QCWKOybTJSE1NSixRS85LzUzLz
	0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA7lRSKEvMKQUKBSQWFyvp29kU5ZeW
	pCpk5BeX2CqlFqTkFJgX6BUn5haX5qXr5aWWWBkaGBiZAhUmZGfMuZZUcDmt4tTvI8wNjCsD
	uhg5OSQETCSOrZvO2MXIxSEksIdRYtrKP+wQzidGiZ1LWpghnG+MEm/2d7DBtFzsW8cGkdjL
	KLHhdxdU/0dGic9r3wK1cHCwCehK/PnnABIXEdjDJLHl/BImEIdZ4CyjxN05C9hBRgkLBElM
	/v2RGcRmEVCVWPlsEROIzStgL9GyaDM7xDp5iYtrnoOt5hRwkDjz8hwLRI2gxMmZT8BsZqCa
	5q2zwW6VEJjJIXG/9y0jRLOLROOvLywQtrDEq+NboIZKSXx+txfqn3yJydffMkE0NzBKXPvX
	zQyRsJdYdOYnO8g7zAKaEut36YOYEgLKEkduQe3lk+g4/JcdIswr0dEmBNGoJvHpymWoITIS
	x048g7I9JFb3/mGCBNZkRol5h94xTmBUmIXknVlI3pmFsHgBI/MqRqnUguLc9NRkowJD3bzU
	cng0J+fnbmIEJ14t3x2Mr9f/1TvEyMTBeIhRgoNZSYS3++XBNCHelMTKqtSi/Pii0pzU4kOM
	psAAn8gsJZqcD0z9eSXxhiaWBiZmZobmRqYG5krivPda56YICaQnlqRmp6YWpBbB9DFxcEo1
	MM1X+OOYe/Mvx7Tag7z3FR++fFi/Ve/zBodVfqmXT9ev+Vr4/nHR7NRAZtfjOsdznX4rXRB+
	xCEjHm5yjqNbxLj57VFbA6PPH9o6b2jX7+1f84PJ2Tls7rPSGy7n1ryTMMmoCNzjc+/1x4Lf
	pofr205v9N8dbbzzykatNyaz54QvZYrbqjHzoNvimAS3N1km7cfS9U0/inifCP0sY29Wt1v8
	UFr2cSm2Zz827C0pCKuun3lE3lrRsDbu+fa+X5+Sjh9dYHrfmKn+x/xVWTl3X20/9G6ryeS9
	MdzWch4OB7w0n5uZ1t+Q5ZjW3RT2c+Fc77lrJ3ZsebVn3YptH9S2/3r+4IdjxdRGuVkGPydn
	X/ZSYinOSDTUYi4qTgQAem38gEUEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnC7b9UNpBovXC1g8mLeNzWLN3nNM
	Fte/PGe1mH/kHKvF+fMb2C02Pb7GavGx5x6rxeVdc9gsZpzfx2Rx8ZSrxf89O9gtDr9pZ7X4
	d20ji0XTsvVMDnwe72+0sntsWtXJ5rF5Sb1H35ZVjB6fN8kFsEZx2aSk5mSWpRbp2yVwZcy5
	llRwOa3i1O8jzA2MKwO6GDk5JARMJC72rWPrYuTiEBLYzShx6EYHG0RCRmJjw392CFtY4n7L
	EVYQW0jgPaPEvN85XYwcHGwCuhJ//jmA9IoIHGKSmPj5KQuIwyxwmVHi2N3JzCANwgIBEms7
	trKA2CwCqhIrny1iArF5BewlWhZthlogL3FxzXOwxZwCDhJnXp5jgVhmL3Hz2m9GiHpBiZMz
	n4DFmYHqm7fOZp7AKDALSWoWktQCRqZVjJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjB
	caGluYNx+6oPeocYmTgYDzFKcDArifB2vzyYJsSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVv
	ipBAemJJanZqakFqEUyWiYNTqoEpfb2Yda6s7i6mkosZ/39Unfi5J9zQ62/RQ+HZUuK23Q0N
	q3iEc9yPvK0wWWKgdH3dmYcBol7BxdtPRwp1LLCRfBXY7iT5Y83ueROFJ7gGHZ2/OM2793gV
	e3k8S6qpVeXT2Ffr7Ceqca5f2GLUWuxWYltVeUqyXsFsGX8kH9+07IimM07RhYGfrueKND25
	uvfVj7P76mwul7NbsRjdczHZ2KpzsPiN5V2ltv8LZ0ifWVPhxenXJLN75wWr5y5t2gf2pF9f
	5DC5Law2WIblbJMO37Q5nus/qU/PUA+5bjmzP1HmaZ28Vy+nT3uizNWJD2de/H+2vuZtzwtJ
	u8DX+yoN7/9WzOlN2cIYfHrTEyWW4oxEQy3mouJEAF3CeRj6AgAA
X-CMS-MailID: 20240819052422epcas2p4db394defd5f298658f7841af3649ac6f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240819052422epcas2p4db394defd5f298658f7841af3649ac6f
References: <20240819052416.2258976-1-sunyeal.hong@samsung.com>
	<CGME20240819052422epcas2p4db394defd5f298658f7841af3649ac6f@epcas2p4.samsung.com>

Add dt-schema for ExynosAuto v920 SoC clock controller.
Add device tree clock binding definitions for below CMU blocks.

- CMU_TOP
- CMU_PERIC0

Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
---
 .../clock/samsung,exynosautov920-clock.yaml   | 197 ++++++++++++++++++
 .../clock/samsung,exynosautov920.h            | 191 +++++++++++++++++
 2 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov920.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
new file mode 100644
index 000000000000..7efb474e57e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynosautov920-clock.yaml
@@ -0,0 +1,197 @@
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-cmu-peric1
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_PERIC1 NOC clock (from CMU_TOP)
+            - description: CMU_PERIC1 IP clock (from CMU_TOP)
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
+          contains:
+            const: samsung,exynosautov920-cmu-misc
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_MISC NOC clock (from CMU_MISC)
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
+            const: samsung,exynosautov920-cmu-hsi0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (38.4 MHz)
+            - description: CMU_HSI0 NOC clock (from CMU_HSI0)
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

