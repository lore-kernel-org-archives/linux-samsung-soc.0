Received: from out-02.smtp.spacemail.com (out-02.smtp.spacemail.com [63.250.43.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982222E3E3;
	Thu,  5 Dec 2024 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427372; cv=none; b=jnY4KEhflMuJCofVFgBGia9EAGhOpoNr+6Z34OzdPhc3pHVA4V5slkrd8vZPWsjKYEkdYh1xLbcUVmwruDyCT109QaLmEJC9eZoTmLOLUDrCU0x6DN23fbo0EDl7PRkEmJMrApjMxOJ5GkmLdvCjamM/vMPG+vAevXY8kWBtrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427372; c=relaxed/simple;
	bh=IlaqDb86M5VXDgMr6ajDDb8l0B67shdzrZ053fehWgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i640hFHFNByaOCq0sQSv7BHOz3F32BPyF+OcTTILNYvtebHBLNAE5T75uIvUV2m+ZnPhqaFr3tuziD6jMQOdhYRBddPkFwDSJaqueWZvt5ocdmWgpZLlzCri1vXYPmQck/xvePKCVCMMfxCB2J4UWzyjXEfF0L/K/65MC06mMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=eQ3loJpG; arc=none smtp.client-ip=63.250.43.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="eQ3loJpG"
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y44PZ53Dfz4w3R;
	Thu, 05 Dec 2024 19:36:02 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y44PQ4QJxz6tkL;
	Thu,  5 Dec 2024 19:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733427357;
	bh=IlaqDb86M5VXDgMr6ajDDb8l0B67shdzrZ053fehWgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQ3loJpG1oLPX+jTakbuFQIYYuKxnPVo/09uBNYop7xNwZ0U2Yebu6XnQYvlvasK6
	 Nxjc8rOo67Zm6A2kVW4waAdjjRhPHLfgslRWgnsauhPSWrKBQpL0FrLI0W9zeaHuYU
	 XG65ddyHlhIbyhK+iHOFaARAYBCUH5MryGUsoDbKBd1pTy5UXf1oY838yvcTkP46p8
	 LRC3A9GZPlz+UeYj4pUVl+vpQjhzQ++yczYbY4PO6yIrHjuarUklgKRjPVeyTQ3Qqv
	 WwRpM8bL6jXY/hfl3lm5UN6Eb4RlE3rqnp82JBdhWZBeavDtp/own8Y6F6c2Phflbw
	 SSkr1/sC6ELyg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: clock: Add Exynos990 SoC CMU bindings
Date: Thu,  5 Dec 2024 20:34:21 +0100
Message-ID: <20241205193423.783815-2-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
References: <20241205193423.783815-1-igor.belwon@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-schema documentation for the Exynos990 SoC CMU.

This clock management unit has a topmost block (CMU_TOP)
that generates top clocks for other blocks. Currently the
only other block implemented is CMU_HSI0, which provides
clocks for the USB part of the SoC.

Also, device-tree binding definitions added for these blocks:
- CMU_TOP
- CMU_HSI0

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../clock/samsung,exynos990-clock.yaml        | 120 +++++++++
 include/dt-bindings/clock/samsung,exynos990.h | 236 ++++++++++++++++++
 2 files changed, 356 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
new file mode 100644
index 000000000000..36d70d6d1b30
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos990-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos990 SoC clock controller
+
+maintainers:
+  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Exynos990 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that root tree
+  is an external clock: OSCCLK (26 MHz). This external clock must be defined
+  as a fixed-rate clock in dts.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynos990.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos990-cmu-hsi0
+      - samsung,exynos990-cmu-top
+
+  clocks:
+    minItems: 1
+    maxItems: 5
+
+  clock-names:
+    minItems: 1
+    maxItems: 5
+
+  "#clock-cells":
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - reg
+  - "#clock-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos990-cmu-hsi0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_HSI0 BUS clock (from CMU_TOP)
+            - description: CMU_HSI0 USB31DRD clock (from CMU_TOP)
+            - description: CMU_HSI0 USBDP_DEBUG clock (from CMU_TOP)
+            - description: CMU_HSI0 DPGTC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_cmu_hsi0_bus
+            - const: dout_cmu_hsi0_usb31drd
+            - const: dout_cmu_hsi0_usbdp_debug
+            - const: dout_cmu_hsi0_dpgtc
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos990-cmu-top
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+
+        clock-names:
+          items:
+            - const: oscclk
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos990.h>
+
+    cmu_hsi0: clock-controller@10a00000 {
+        compatible = "samsung,exynos990-cmu-hsi0";
+        reg = <0x10a00000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&oscclk>,
+                 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
+                 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
+                 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
+                 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
+        clock-names = "oscclk", "dout_cmu_hsi0_bus",
+                                "dout_cmu_hsi0_usb31drd",
+                                "dout_cmu_hsi0_usbdp_debug",
+                                "dout_cmu_hsi0_dpgtc";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
new file mode 100644
index 000000000000..307215a3f3ed
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -0,0 +1,236 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2024 Igor Belwon <igor.belwon@mentallysanemainliners.org>
+ *
+ * Device Tree binding constants for Exynos990 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS_990_H
+#define _DT_BINDINGS_CLOCK_EXYNOS_990_H
+
+/* CMU_TOP */
+#define CLK_FOUT_SHARED0_PLL		1
+#define CLK_FOUT_SHARED1_PLL		2
+#define CLK_FOUT_SHARED2_PLL		3
+#define CLK_FOUT_SHARED3_PLL		4
+#define CLK_FOUT_SHARED4_PLL		5
+#define CLK_FOUT_G3D_PLL		6
+#define CLK_FOUT_MMC_PLL		7
+#define CLK_MOUT_PLL_SHARED0		8
+#define CLK_MOUT_PLL_SHARED1		9
+#define CLK_MOUT_PLL_SHARED2		10
+#define CLK_MOUT_PLL_SHARED3		11
+#define CLK_MOUT_PLL_SHARED4		12
+#define CLK_MOUT_PLL_MMC		13
+#define CLK_MOUT_PLL_G3D		14
+#define CLK_MOUT_CMU_APM_BUS		15
+#define CLK_MOUT_CMU_AUD_CPU		16
+#define CLK_MOUT_CMU_BUS0_BUS		17
+#define CLK_MOUT_CMU_BUS1_BUS		18
+#define CLK_MOUT_CMU_BUS1_SSS		19
+#define CLK_MOUT_CMU_CIS_CLK0		20
+#define CLK_MOUT_CMU_CIS_CLK1		21
+#define CLK_MOUT_CMU_CIS_CLK2		22
+#define CLK_MOUT_CMU_CIS_CLK3		23
+#define CLK_MOUT_CMU_CIS_CLK4		24
+#define CLK_MOUT_CMU_CIS_CLK5		25
+#define CLK_MOUT_CMU_CMU_BOOST		26
+#define CLK_MOUT_CMU_CORE_BUS		27
+#define CLK_MOUT_CMU_CPUCL0_DBG_BUS	28
+#define CLK_MOUT_CMU_CPUCL0_SWITCH	29
+#define CLK_MOUT_CMU_CPUCL1_SWITCH	30
+#define CLK_MOUT_CMU_CPUCL2_BUSP	31
+#define CLK_MOUT_CMU_CPUCL2_SWITCH	32
+#define CLK_MOUT_CMU_CSIS_BUS		33
+#define CLK_MOUT_CMU_CSIS_OIS_MCU	34
+#define CLK_MOUT_CMU_DNC_BUS		35
+#define CLK_MOUT_CMU_DNC_BUSM		36
+#define CLK_MOUT_CMU_DNS_BUS		37
+#define CLK_MOUT_CMU_DPU		38
+#define CLK_MOUT_CMU_DPU_ALT		39
+#define CLK_MOUT_CMU_DSP_BUS		40
+#define CLK_MOUT_CMU_G2D_G2D		41
+#define CLK_MOUT_CMU_G2D_MSCL		42
+#define CLK_MOUT_CMU_HPM		43
+#define CLK_MOUT_CMU_HSI0_BUS		44
+#define CLK_MOUT_CMU_HSI0_DPGTC		45
+#define CLK_MOUT_CMU_HSI0_USB31DRD	46
+#define CLK_MOUT_CMU_HSI0_USBDP_DEBUG	47
+#define CLK_MOUT_CMU_HSI1_BUS		48
+#define CLK_MOUT_CMU_HSI1_MMC_CARD	49
+#define CLK_MOUT_CMU_HSI1_PCIE		50
+#define CLK_MOUT_CMU_HSI1_UFS_CARD	51
+#define CLK_MOUT_CMU_HSI1_UFS_EMBD	52
+#define CLK_MOUT_CMU_HSI2_BUS		53
+#define CLK_MOUT_CMU_HSI2_PCIE		54
+#define CLK_MOUT_CMU_IPP_BUS		55
+#define CLK_MOUT_CMU_ITP_BUS		56
+#define CLK_MOUT_CMU_MCSC_BUS		57
+#define CLK_MOUT_CMU_MCSC_GDC		58
+#define CLK_MOUT_CMU_CMU_BOOST_CPU	59
+#define CLK_MOUT_CMU_MFC0_MFC0		60
+#define CLK_MOUT_CMU_MFC0_WFD		61
+#define CLK_MOUT_CMU_MIF_BUSP		62
+#define CLK_MOUT_CMU_MIF_SWITCH		63
+#define CLK_MOUT_CMU_NPU_BUS		64
+#define CLK_MOUT_CMU_PERIC0_BUS		65
+#define CLK_MOUT_CMU_PERIC0_IP		66
+#define CLK_MOUT_CMU_PERIC1_BUS		67
+#define CLK_MOUT_CMU_PERIC1_IP		68
+#define CLK_MOUT_CMU_PERIS_BUS		69
+#define CLK_MOUT_CMU_SSP_BUS		70
+#define CLK_MOUT_CMU_TNR_BUS		71
+#define CLK_MOUT_CMU_VRA_BUS		72
+#define CLK_DOUT_CMU_APM_BUS		73
+#define CLK_DOUT_CMU_AUD_CPU		74
+#define CLK_DOUT_CMU_BUS0_BUS		75
+#define CLK_DOUT_CMU_BUS1_BUS		76
+#define CLK_DOUT_CMU_BUS1_SSS		77
+#define CLK_DOUT_CMU_CIS_CLK0		78
+#define CLK_DOUT_CMU_CIS_CLK1		79
+#define CLK_DOUT_CMU_CIS_CLK2		80
+#define CLK_DOUT_CMU_CIS_CLK3		81
+#define CLK_DOUT_CMU_CIS_CLK4		82
+#define CLK_DOUT_CMU_CIS_CLK5		83
+#define CLK_DOUT_CMU_CMU_BOOST		84
+#define CLK_DOUT_CMU_CORE_BUS		85
+#define CLK_DOUT_CMU_CPUCL0_DBG_BUS	86
+#define CLK_DOUT_CMU_CPUCL0_SWITCH	87
+#define CLK_DOUT_CMU_CPUCL1_SWITCH	88
+#define CLK_DOUT_CMU_CPUCL2_BUSP	89
+#define CLK_DOUT_CMU_CPUCL2_SWITCH	90
+#define CLK_DOUT_CMU_CSIS_BUS		91
+#define CLK_DOUT_CMU_CSIS_OIS_MCU	92
+#define CLK_DOUT_CMU_DNC_BUS		93
+#define CLK_DOUT_CMU_DNC_BUSM		94
+#define CLK_DOUT_CMU_DNS_BUS		95
+#define CLK_DOUT_CMU_DSP_BUS		96
+#define CLK_DOUT_CMU_G2D_G2D		97
+#define CLK_DOUT_CMU_G2D_MSCL		98
+#define CLK_DOUT_CMU_G3D_SWITCH		99
+#define CLK_DOUT_CMU_HPM		100
+#define CLK_DOUT_CMU_HSI0_BUS		101
+#define CLK_DOUT_CMU_HSI0_DPGTC		102
+#define CLK_DOUT_CMU_HSI0_USB31DRD	103
+#define CLK_DOUT_CMU_HSI0_USBDP_DEBUG	104
+#define CLK_DOUT_CMU_HSI1_BUS		105
+#define CLK_DOUT_CMU_HSI1_MMC_CARD	106
+#define CLK_DOUT_CMU_HSI1_PCIE		107
+#define CLK_DOUT_CMU_HSI1_UFS_CARD	108
+#define CLK_DOUT_CMU_HSI1_UFS_EMBD	109
+#define CLK_DOUT_CMU_HSI2_BUS		110
+#define CLK_DOUT_CMU_HSI2_PCIE		111
+#define CLK_DOUT_CMU_IPP_BUS		112
+#define CLK_DOUT_CMU_ITP_BUS		113
+#define CLK_DOUT_CMU_MCSC_BUS		114
+#define CLK_DOUT_CMU_MCSC_GDC		115
+#define CLK_DOUT_CMU_CMU_BOOST_CPU	116
+#define CLK_DOUT_CMU_MFC0_MFC0		117
+#define CLK_DOUT_CMU_MFC0_WFD		118
+#define CLK_DOUT_CMU_MIF_BUSP		119
+#define CLK_DOUT_CMU_NPU_BUS		120
+#define CLK_DOUT_CMU_OTP		121
+#define CLK_DOUT_CMU_PERIC0_BUS		122
+#define CLK_DOUT_CMU_PERIC0_IP		123
+#define CLK_DOUT_CMU_PERIC1_BUS		124
+#define CLK_DOUT_CMU_PERIC1_IP		125
+#define CLK_DOUT_CMU_PERIS_BUS		126
+#define CLK_DOUT_CMU_SSP_BUS		127
+#define CLK_DOUT_CMU_TNR_BUS		128
+#define CLK_DOUT_CMU_VRA_BUS		129
+#define CLK_DOUT_CMU_DPU		130
+#define CLK_DOUT_CMU_DPU_ALT		131
+#define CLK_DOUT_CMU_SHARED0_DIV2	132
+#define CLK_DOUT_CMU_SHARED0_DIV3	133
+#define CLK_DOUT_CMU_SHARED0_DIV4	134
+#define CLK_DOUT_CMU_SHARED1_DIV2	135
+#define CLK_DOUT_CMU_SHARED1_DIV3	136
+#define CLK_DOUT_CMU_SHARED1_DIV4	137
+#define CLK_DOUT_CMU_SHARED2_DIV2	138
+#define CLK_DOUT_CMU_SHARED4_DIV2	139
+#define CLK_DOUT_CMU_SHARED4_DIV3	140
+#define CLK_DOUT_CMU_SHARED4_DIV4	141
+#define CLK_GOUT_CMU_G3D_BUS		142
+#define CLK_GOUT_CMU_MIF_SWITCH		143
+#define CLK_GOUT_CMU_APM_BUS		144
+#define CLK_GOUT_CMU_AUD_CPU		145
+#define CLK_GOUT_CMU_BUS0_BUS		146
+#define CLK_GOUT_CMU_BUS1_BUS		147
+#define CLK_GOUT_CMU_BUS1_SSS		148
+#define CLK_GOUT_CMU_CIS_CLK0		149
+#define CLK_GOUT_CMU_CIS_CLK1		150
+#define CLK_GOUT_CMU_CIS_CLK2		151
+#define CLK_GOUT_CMU_CIS_CLK3		152
+#define CLK_GOUT_CMU_CIS_CLK4		153
+#define CLK_GOUT_CMU_CIS_CLK5		154
+#define CLK_GOUT_CMU_CORE_BUS		155
+#define CLK_GOUT_CMU_CPUCL0_DBG_BUS	156
+#define CLK_GOUT_CMU_CPUCL0_SWITCH	157
+#define CLK_GOUT_CMU_CPUCL1_SWITCH	158
+#define CLK_GOUT_CMU_CPUCL2_BUSP	159
+#define CLK_GOUT_CMU_CPUCL2_SWITCH	160
+#define CLK_GOUT_CMU_CSIS_BUS		161
+#define CLK_GOUT_CMU_CSIS_OIS_MCU	162
+#define CLK_GOUT_CMU_DNC_BUS		163
+#define CLK_GOUT_CMU_DNC_BUSM		164
+#define CLK_GOUT_CMU_DNS_BUS		165
+#define CLK_GOUT_CMU_DPU		166
+#define CLK_GOUT_CMU_DPU_BUS		167
+#define CLK_GOUT_CMU_DSP_BUS		168
+#define CLK_GOUT_CMU_G2D_G2D		169
+#define CLK_GOUT_CMU_G2D_MSCL		170
+#define CLK_GOUT_CMU_G3D_SWITCH		171
+#define CLK_GOUT_CMU_HPM		172
+#define CLK_GOUT_CMU_HSI0_BUS		173
+#define CLK_GOUT_CMU_HSI0_DPGTC		174
+#define CLK_GOUT_CMU_HSI0_USB31DRD	175
+#define CLK_GOUT_CMU_HSI0_USBDP_DEBUG	176
+#define CLK_GOUT_CMU_HSI1_BUS		177
+#define CLK_GOUT_CMU_HSI1_MMC_CARD	178
+#define CLK_GOUT_CMU_HSI1_PCIE		179
+#define CLK_GOUT_CMU_HSI1_UFS_CARD	180
+#define CLK_GOUT_CMU_HSI1_UFS_EMBD	181
+#define CLK_GOUT_CMU_HSI2_BUS		182
+#define CLK_GOUT_CMU_HSI2_PCIE		183
+#define CLK_GOUT_CMU_IPP_BUS		184
+#define CLK_GOUT_CMU_ITP_BUS		185
+#define CLK_GOUT_CMU_MCSC_BUS		186
+#define CLK_GOUT_CMU_MCSC_GDC		187
+#define CLK_GOUT_CMU_MFC0_MFC0		188
+#define CLK_GOUT_CMU_MFC0_WFD		189
+#define CLK_GOUT_CMU_MIF_BUSP		190
+#define CLK_GOUT_CMU_NPU_BUS		191
+#define CLK_GOUT_CMU_PERIC0_BUS		192
+#define CLK_GOUT_CMU_PERIC0_IP		193
+#define CLK_GOUT_CMU_PERIC1_BUS		194
+#define CLK_GOUT_CMU_PERIC1_IP		195
+#define CLK_GOUT_CMU_PERIS_BUS		196
+#define CLK_GOUT_CMU_SSP_BUS		197
+#define CLK_GOUT_CMU_TNR_BUS		198
+#define CLK_GOUT_CMU_VRA_BUS		199
+
+/* CMU_HSI0 */
+#define CLK_MOUT_HSI0_BUS_USER				1
+#define CLK_MOUT_HSI0_USB31DRD_USER			2
+#define CLK_MOUT_HSI0_USBDP_DEBUG_USER			3
+#define CLK_MOUT_HSI0_DPGTC_USER			4
+#define CLK_GOUT_HSI0_DP_LINK_DP_GTC_CLK		5
+#define CLK_GOUT_HSI0_DP_LINK_PCLK			6
+#define CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK			7
+#define CLK_GOUT_HSI0_LHM_AXI_P_HSI0_CLK		8
+#define CLK_GOUT_HSI0_PPMU_HSI0_BUS1_ACLK		9
+#define CLK_GOUT_HSI0_PPMU_HSI0_BUS1_PCLK		10
+#define CLK_GOUT_HSI0_CLK_HSI0_BUS_CLK			11
+#define CLK_GOUT_HSI0_SYSMMU_USB_CLK_S2			12
+#define CLK_GOUT_HSI0_SYSREG_HSI0_PCLK			13
+#define CLK_GOUT_HSI0_USB31DRD_ACLK_PHYCTRL		14
+#define CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY		15
+#define CLK_GOUT_HSI0_USB31DRD_USB31DRD_REF_CLK_40	16
+#define CLK_GOUT_HSI0_USB31DRD_USBDPPHY_REF_SOC_PLL	17
+#define CLK_GOUT_HSI0_USB31DRD_USBDPPHY_SCL_APB		18
+#define CLK_GOUT_HSI0_USB31DRD_USBPCS_APB_CLK		19
+#define CLK_GOUT_HSI0_VGEN_LITE_HSI0_CLK		20
+#define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
+#define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
+
+#endif
-- 
2.45.2

