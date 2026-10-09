Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BE4D9568
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546234; cv=none; b=XN2bJ1kmtcgWc1RmXSb3m8P/dQWwR4yMvmNgL9cKe3nDEi/e1Gu01JXb1CdWRqLV6uVqTB4KY/0+agGptHwjKEOflxy6TElmUUgj6T2+YpgNKvsWxQH5mTchRo0EAXJLalauWXOoNGJP1EOEgxUQ2l7bGt0uyKn58o54Qi9Xbrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546234; c=relaxed/simple;
	bh=sL8M5Q6weXbpRTIZP+3kOlpSLzZhEfBubZFiz+LhRcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=qN1T5kAbRK410gH2DR870Rpx1FnIrl+hx82eOTzHG8AaE8c5zMkXQMgoVpUJV9FbUTf7MqeCH23wFSNo2TaA8ZWMQMfgkz8VDKZ/43BH5x7t/vmVTl61UfKlLuUxn38WLDKI1C6QvXX+yDcwQhie+0ijUGPZb1UUVRLWQ04jcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=azuf1BYZ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="azuf1BYZ"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261009114340epoutp03f5c2e016e55b9555248f05f3c455d8ec~c2cuhNwen2399623996epoutp03r
	for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2026 11:43:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261009114340epoutp03f5c2e016e55b9555248f05f3c455d8ec~c2cuhNwen2399623996epoutp03r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546220;
	bh=mW0hbvBWH5lyR88FIY8UT1xPLptnZpwLAPTdsUFL4qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azuf1BYZko9g6DKaHYcG8Fju0z3qWq2h5c9+0on9pMON/BOJ1xHmg4k7NcpUMoDFv
	 I6BgWxj03zyOmQVhQuxA5gOpWW0N5C7cLt1wGLi+o73aZDqIZ0E5N849vR/yRvWeBo
	 E2CscC1spHhDE1VLcOCQB55VuXqNbdIpgmds4DpI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261009114339epcas5p42d84027e85a6f74efcaacd7860e98ec1~c2ctXF5E02657826578epcas5p4_;
	Fri,  9 Oct 2026 11:43:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.90]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4j1Q3t0yczz2SSKX; Fri,  9 Oct
	2026 11:43:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261009114337epcas5p4493d8845a2ecd69331a415c1c7fee50c~c2crvQuz22878528785epcas5p4I;
	Fri,  9 Oct 2026 11:43:37 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114334epsmtip2b26429dfc7901f9e9c923b1e15b2c71e~c2cpGyKA80981609816epsmtip2V;
	Fri,  9 Oct 2026 11:43:34 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 02/14] dt-bindings: clock: exynos8855: add top & peric
 clock definitions
Date: Fri,  9 Oct 2026 17:31:25 +0530
Message-Id: <20261009120137.2801911-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114337epcas5p4493d8845a2ecd69331a415c1c7fee50c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114337epcas5p4493d8845a2ecd69331a415c1c7fee50c
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114337epcas5p4493d8845a2ecd69331a415c1c7fee50c@epcas5p4.samsung.com>

Add device tree clock binding definitions for CMU_TOP & CMU_PERIC

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 115 ++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    | 206 ++++++++++++++++++
 2 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
new file mode 100644
index 000000000000..073c19debd0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos8855-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos 8855 SoC clock controller
+
+maintainers:
+  - Raghav Sharma <raghav.s@samsung.com>
+
+description: |
+  Exynos 8855 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. Root clocks in that clock tree are
+  two external clocks:: OSCCLK/XTCXO (76.8 MHz) and RTCCLK/XrtcXTI (32768 Hz).
+  The external OSCCLK must be defined as fixed-rate clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynos8855.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos8855-cmu-peric
+      - samsung,exynos8855-cmu-top
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
+            const: samsung,exynos8855-cmu-peric
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERIC NOC clock (from CMU_TOP)
+            - description: CMU_PERIC MMC_CARD clock (from CMU_TOP)
+            - description: CMU_PERIC IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: mmc_card
+            - const: ip
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
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
+  - |
+    #include <dt-bindings/clock/samsung,exynos8855.h>
+
+    cmu_peric0: clock-controller@15400000 {
+        compatible = "samsung,exynos8855-cmu-peric";
+        reg = <0x15400000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&xtcxo>,
+                 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
+                 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
+                 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
+        clock-names = "oscclk",
+                      "bus",
+                      "mmc_card",
+                      "ip";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
new file mode 100644
index 000000000000..cd445bb45070
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -0,0 +1,206 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Samsung Electronics Co., Ltd.
+ * Author: Raghav Sharma <raghav.s@samsung.com>
+ *
+ * Device Tree binding constants for Exynos 8855 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS8855_H
+#define _DT_BINDINGS_CLOCK_EXYNOS8855_H
+
+/* CMU_TOP  */
+#define FOUT_SHARED0_PLL		   1
+#define FOUT_SHARED1_PLL		   2
+#define FOUT_SHARED2_PLL		   3
+#define FOUT_SHARED3_PLL		   4
+#define FOUT_SHARED4_PLL		   5
+#define FOUT_MMC_PLL			   6
+#define MOUT_SHARED0_PLL		   7
+#define MOUT_SHARED1_PLL		   8
+#define MOUT_SHARED2_PLL		   9
+#define MOUT_SHARED3_PLL		   10
+#define MOUT_SHARED4_PLL		   11
+#define MOUT_MMC_PLL			   12
+#define CLKCMU_MOUT_PERIC_NOC              13
+#define CLKCMU_MOUT_PERIC_MMC_CARD         14
+#define CLKCMU_MOUT_PERIC_IP               15
+#define CLKCMU_DOUT_PERIC_NOC              16
+#define CLKCMU_DOUT_PERIC_MMC_CARD         17
+#define CLKCMU_DOUT_PERIC_IP               18
+#define DOUT_SHARED0_DIV1		   19
+#define DOUT_SHARED0_DIV2		   20
+#define DOUT_SHARED0_DIV3		   21
+#define DOUT_SHARED0_DIV4		   22
+#define DOUT_SHARED1_DIV1		   23
+#define DOUT_SHARED1_DIV2		   24
+#define DOUT_SHARED1_DIV3		   25
+#define DOUT_SHARED1_DIV4		   26
+#define DOUT_SHARED2_DIV1		   27
+#define DOUT_SHARED2_DIV2		   28
+#define DOUT_SHARED2_DIV3		   29
+#define DOUT_SHARED2_DIV4		   30
+#define DOUT_SHARED3_DIV1		   31
+#define DOUT_SHARED3_DIV2		   32
+#define DOUT_SHARED3_DIV3		   33
+#define DOUT_SHARED3_DIV4		   34
+#define DOUT_SHARED4_DIV1		   35
+#define DOUT_SHARED4_DIV2		   36
+#define DOUT_SHARED4_DIV3		   37
+#define DOUT_SHARED4_DIV4		   38
+#define FOUT_MMC_PLL_DIV1                  39
+#define FOUT_MMC_PLL_DIV2                  40
+#define CLKCMU_MOUT_PERIS_GIC              41
+#define CLKCMU_MOUT_PERIS_NOC              42
+#define CLKCMU_DOUT_PERIS_GIC              43
+#define CLKCMU_DOUT_PERIS_NOC              44
+#define FOUT_MMC_PLL_CLKOUT_DIV2           45
+#define CLKCMU_MOUT_HSI_NOC                46
+#define CLKCMU_MOUT_HSI_UFS_EMBD           47
+#define CLKCMU_DOUT_HSI_NOC                48
+#define CLKCMU_DOUT_HSI_UFS_EMBD           49
+#define CLKCMU_MOUT_USB_NOC                50
+#define CLKCMU_MOUT_USB_USB20DRD           51
+#define CLKCMU_DOUT_USB_NOC                52
+#define CLKCMU_DOUT_USB_USB20DRD           53
+#define FOUT_MIF_SWITCH_PLL		   54
+#define MOUT_MIF_SWITCH_PLL		   55
+#define FOUT_MMC_PLL_DIV3                  56
+#define FOUT_MMC_PLL_DIV4                  57
+#define FOUT_MIF_SWITCH_PLL_DIV1           58
+#define FOUT_MIF_SWITCH_PLL_DIV2           59
+#define FOUT_MIF_SWITCH_PLL_DIV3           60
+#define FOUT_MIF_SWITCH_PLL_DIV4           61
+#define CLKCMU_MOUT_AUD_CPU                62
+#define CLKCMU_MOUT_AUD_NOC                63
+#define CLKCMU_MOUT_CPUCL0_SWITCH          64
+#define CLKCMU_MOUT_CPUCL0_NOCP            65
+#define CLKCMU_MOUT_DSU_SWITCH             66
+#define CLKCMU_MOUT_CPUCL1_SWITCH          67
+#define CLKCMU_MOUT_CIS_CLK0               68
+#define CLKCMU_MOUT_CIS_CLK1               69
+#define CLKCMU_MOUT_CIS_CLK2               70
+#define CLKCMU_MOUT_CIS_CLK3               71
+#define CLKCMU_MOUT_CIS_CLK4               72
+#define CLKCMU_MOUT_CMU_BOOST_TOP          73
+#define CLKCMU_MOUT_CMU_BOOST              74
+#define CLKCMU_MOUT_CMU_BOOST_CPU          75
+#define CLKCMU_MOUT_CMU_BOOST_MIF0         76
+#define CLKCMU_MOUT_CSIS_NOC               77
+#define CLKCMU_MOUT_CSTAT_NOC              78
+#define CLKCMU_MOUT_CSTAT_BYRP             79
+#define CLKCMU_MOUT_DPU_NOC                80
+#define CLKCMU_MOUT_G3DCORE_SWITCH         81
+#define CLKCMU_MOUT_M2M_NOC                82
+#define CLKCMU_MOUT_M2M_JPEG               83
+#define CLKCMU_MOUT_M2M_GDC                84
+#define CLKCMU_MOUT_MIF1_NOCP              85
+#define CLKCMU_MOUT_MFC_NOC                86
+#define CLKCMU_MOUT_MIF0_NOCP              87
+#define CLKCMU_MOUT_NOCL0_NOC              88
+#define CLKCMU_MOUT_NOCL1A_NOC             89
+#define CLKCMU_MOUT_RGBP_NOC               90
+#define CLKCMU_MOUT_YUVP_NOC               91
+#define CLKCMU_MOUT_ALIVE_NOC              92
+#define CLKCMU_MOUT_CSIS_DCPHY             93
+#define CLKCMU_MOUT_CSIS_OIS               94
+#define CLKCMU_MOUT_ICPU_NOCD_0            95
+#define CLKCMU_MOUT_ICPU_NOCD_1            96
+#define CLKCMU_MOUT_GNPU0_NOC              97
+#define CLKCMU_MOUT_GNPU0_XMAA             98
+#define CLKCMU_MOUT_SDMA_NOC               99
+#define CLKCMU_MOUT_DNC_HTU               100
+#define CLKCMU_MOUT_DNC_NOC               101
+#define CLKCMU_MOUT_PSP_NOC               102
+#define CLKCMU_MOUT_G3D_NOCP              103
+#define CLKCMU_MOUT_USI_NOC               104
+#define CLKCMU_MOUT_USI_IP                105
+#define CLKCMU_MOUT_CPUCL0_DBG_NOC        106
+#define CLKCMU_MOUT_BOOST_RCO             107
+#define CLKCMU_MOUT_MIF0_SWITCH           108
+#define CLKCMU_MOUT_MIF1_SWITCH           109
+#define CLKCMU_MOUT_NOCL1B_NOC            110
+#define CLKCMU_MOUT_CPUCL2_SWITCH         111
+#define CLKCMU_MOUT_CMU_BOOST_MIF1        112
+#define CLKCMU_MOUT_CSTAT_MCSC            113
+#define CLKCMU_MOUT_G3D_HTU               114
+#define CLKCMU_DOUT_AUD_CPU               115
+#define CLKCMU_DOUT_AUD_NOC               116
+#define CLKCMU_DOUT_CPUCL0_SWITCH         117
+#define CLKCMU_DOUT_CPUCL0_NOCP           118
+#define CLKCMU_DOUT_DSU_SWITCH            119
+#define CLKCMU_DOUT_CPUCL1_SWITCH         120
+#define CLKCMU_DOUT_CIS_CLK0              121
+#define CLKCMU_DOUT_CIS_CLK1              122
+#define CLKCMU_DOUT_CIS_CLK2              123
+#define CLKCMU_DOUT_CIS_CLK3              124
+#define CLKCMU_DOUT_CIS_CLK4              125
+#define CLKCMU_DOUT_CMU_BOOST_TOP         126
+#define CLKCMU_DOUT_CMU_BOOST             127
+#define CLKCMU_DOUT_CMU_BOOST_CPU         128
+#define CLKCMU_DOUT_CMU_BOOST_MIF0        129
+#define CLKCMU_DOUT_CSIS_NOC              130
+#define CLKCMU_DOUT_CSTAT_NOC             131
+#define CLKCMU_DOUT_CSTAT_BYRP            132
+#define CLKCMU_DOUT_DPU_NOC               133
+#define CLKCMU_DOUT_G3DCORE_SWITCH        134
+#define CLKCMU_DOUT_M2M_NOC               135
+#define CLKCMU_DOUT_M2M_JPEG              136
+#define CLKCMU_DOUT_M2M_GDC               137
+#define CLKCMU_DOUT_MIF1_NOCP             138
+#define CLKCMU_DOUT_MFC_NOC               139
+#define CLKCMU_DOUT_MIF0_NOCP             140
+#define CLKCMU_DOUT_NOCL0_NOC             141
+#define CLKCMU_DOUT_NOCL1A_NOC            142
+#define CLKCMU_DOUT_RGBP_NOC              143
+#define CLKCMU_DOUT_YUVP_NOC              144
+#define CLKCMU_DOUT_ALIVE_NOC             145
+#define CLKCMU_DOUT_CSIS_DCPHY            146
+#define CLKCMU_DOUT_CSIS_OIS              147
+#define CLKCMU_DOUT_ICPU_NOCD_0           148
+#define CLKCMU_DOUT_ICPU_NOCD_1           149
+#define CLKCMU_DOUT_GNPU0_NOC             150
+#define CLKCMU_DOUT_GNPU0_XMAA            151
+#define CLKCMU_DOUT_SDMA_NOC              152
+#define CLKCMU_DOUT_DNC_HTU               153
+#define CLKCMU_DOUT_DNC_NOC               154
+#define CLKCMU_DOUT_PSP_NOC               155
+#define CLKCMU_DOUT_G3D_NOCP              156
+#define CLKCMU_DOUT_USI_NOC               157
+#define CLKCMU_DOUT_USI_IP                158
+#define CLKCMU_DOUT_CPUCL0_DBG_NOC        159
+#define CLKCMU_DOUT_NOCL1B_NOC            160
+#define CLKCMU_DOUT_CPUCL2_SWITCH         161
+#define CLKCMU_DOUT_CMU_BOOST_MIF1        162
+#define CLKCMU_DOUT_CSTAT_MCSC            163
+#define CLKCMU_DOUT_G3D_HTU               164
+
+/* CMU_PERIC */
+#define CLK_MOUT_PERIC_IP_USER             1
+#define CLK_MOUT_PERIC_MMC_CARD_USER       2
+#define CLK_MOUT_PERIC_NOC_USER            3
+#define CLK_MOUT_PERIC_I2C                 4
+#define CLK_MOUT_PERIC_UART_DBG            5
+#define CLK_MOUT_PERIC_USI00               6
+#define CLK_MOUT_PERIC_USI01               7
+#define CLK_MOUT_PERIC_USI02               8
+#define CLK_MOUT_PERIC_USI03               9
+#define CLK_MOUT_PERIC_USI04               10
+#define CLK_MOUT_PERIC_USI09_USI_OIS       11
+#define CLK_MOUT_PERIC_USI10_USI_OIS       12
+#define CLK_DOUT_PERIC_NOCP                13
+#define CLK_DOUT_PERIC_UART_DBG            14
+#define CLK_DOUT_PERIC_USI00_USI           15
+#define CLK_DOUT_PERIC_USI01_USI           16
+#define CLK_DOUT_PERIC_USI02_USI           17
+#define CLK_DOUT_PERIC_USI03_USI           18
+#define CLK_DOUT_PERIC_USI04_USI           19
+#define CLK_DOUT_PERIC_USI09_USI_OIS       20
+#define CLK_DOUT_PERIC_USI10_USI_OIS       21
+#define CLK_DOUT_PERIC_USI_I2C             22
+#define CLK_GOUT_CMU_PERIC                 23
+#define CLK_GOUT_SYSREG_PERIC              24
+#define CLK_GOUT_UART_DBG_PERIC            25
+#define CLK_GOUT_USI_PERIC                 26
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1

