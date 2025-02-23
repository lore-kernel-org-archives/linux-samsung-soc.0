Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDAC2063ED;
	Sun, 23 Feb 2025 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311770; cv=none; b=NmZSMCmBf13asjaC41v3Jt+WVrvEonFH7hf4j3bYta1HO8H7Jv4wgKKKgWfK2s/On6u9JNOcKj+bMPUAoh/jxKF+66guAaLa4LJZoWY1Ee+WBauEZkWZJXGXb3xOxm8vXkNlilNoilRFKbGyfe1EvoV+wJgtmyN9wR9Rzb260Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311770; c=relaxed/simple;
	bh=hT3+smZw/Csn+VDQbsrrta5galDbZ2D8vWMzynbdIrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBQ2pEznGtr5CYTg6tOP6DEShPSf/kWbH+zj5yF9B15jst1FX94G716oKS5jdsYgbG+wq2G5Q5DPFxWE60gMZV0WZzlwP6kZ7WGZ4r5Vp1/zjwT1dblqOGk0N4Dp1aC+SbWOVVFO0nXtjfKwipuxl1IucW3dWqyjbWz0ptRUhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2+JFC+E; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2+JFC+E"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-439a2780b44so21330545e9.1;
        Sun, 23 Feb 2025 03:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740311766; x=1740916566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMBd4/B0I9P4lDduyFLB82bX7tZOWr7QksevjXQdF8o=;
        b=F2+JFC+EjjGZhehCiUMSa5tM79VEOUspTV+ZGWBA+R3pxLvE90WLvFGLyZcFyfkmxA
         iHeloGtZb5e6KncrPDTiPuwVEFD0t8AS/ewXHL0eq0dH3f8pdc3nrXBdPLr3WYlvp21o
         867OMES4AswBMaZQJqa/MJvlpfbGwjKZ3vH5MB8x8F+1XvzhQxjktmLs/bqaKF7i+lLm
         6myy6il0pzpZB36vA8bt3iU6cnXiIuHunItLCn+wLiep/rEHXnaQr2Gepic0XC9ZfRbU
         rckQN/9DfxkF1ilaIsJylK0pUukHV68wWdFziLomAlZbJRRaJRndiEE9sKjQ0fnZ+2zU
         DPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740311766; x=1740916566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMBd4/B0I9P4lDduyFLB82bX7tZOWr7QksevjXQdF8o=;
        b=qmwJA0JkVfPvdoLpdN8uf0PYfHTEGQd8jogIkwpRdFAkXWgl9VO3kOgThjtlazldSb
         anR6Mtzd1xanmJ3l3ydmWdFl11AG70xsAIw3FI3MfPuwrwVRMbXXLMk4tHPxiJm3IIt4
         pULTQaMFV1PXq9NMG3bKrjIhg3o6jWqfWbX+YJO/WzCZrvKnR7MHkXPxn4Il2OhLPS/r
         5OvM8kuOVwUGHXwJVly+fd0YvzQaF14OmmEpOPTsB3j2z2V6pj+5AANp0QNlo6TaPd8M
         RMlUccuUzMAjAiXlNkoeu40E18lCKBMP+CAuiMuXpPGl9v+MwgMj+L75nBVbCw9kubbK
         aGSg==
X-Forwarded-Encrypted: i=1; AJvYcCUqWfSt35wNc6S4Dl2QIjTjzv4pGpGy5rAYZOQ5hWIzaQPRQl0dznzufTOfQ1TE2+91OEpWtmtF3cGr@vger.kernel.org, AJvYcCVA4TcdQ0jSaVc8UeFXPeTKp/Jkelg9M3+Xuqg83imvC2wxqmrS44Jcl6X+i2eZ/ED/7IWzqI+8IZftrhNl5OGgKvk=@vger.kernel.org, AJvYcCWqNCJt/OZxu7dwSE9FNPSkMmdfjxfOlrgzO5UaW0UxY228ibb76L2YE0si9flE9OMEi43XGLVmeo5L4aK+@vger.kernel.org, AJvYcCXexf+LlvFx+nuUII4Y1eN0pt5qgeBO+bMk0mt4tUrP4CLYG2J4PHDy4JBEVh5Jv/Y0bsb9ZPFCsqKv@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBlMFtQaCu7UIwUHGFlLjfANTT080tjrF35eFQO530NwiFKIC
	iA78HQlsApVR8NoehGzu6FgfrjDMnnbE5ac+m7/jMcbcP74eDc53
X-Gm-Gg: ASbGncuSO0gV67IhB/KWNc2W6X6gtTJJ4l1iQYry6ds9QZzOioI4h6qHo9+s+rpNLTQ
	DOfxr4pUd3pEB+YSTx62FyY+tAFDuVqJc0r2zKmmtXGGa5Z6BOMDsERpb+ksiOmBjb7T5uCmAJn
	gUWAtnoTCgbpB7LO6DuTKB6WUX/Gc0XkfJWI2yKyXnunoPP+60pKhDkRS59SluM5edwO1lyN0jN
	YkX1FhciRbmwZt+UkiIwJ2cLzgftDhwvkH8bDx2/Rd7t/H96AWdiuhAzRwwXrAGfbx1qVtv8w+X
	h/K47LK1rVOkrW2MShnk8IApeLmn9Hk+9Zx3BNJyFHoHzTbRlOq9wX8q1zaPprTygKevKCRFqca
	5uw==
X-Google-Smtp-Source: AGHT+IF/LqBW5WtnZsckfu8zM6I04PzEGOFwsbFnSqSH9Hh16jKQrzHMfj8QvSMdCqPQlJO3N81Hug==
X-Received: by 2002:a5d:64a7:0:b0:38f:4f25:1482 with SMTP id ffacd0b85a97d-38f6f0b1c97mr9058047f8f.42.1740311765424;
        Sun, 23 Feb 2025 03:56:05 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm28861189f8f.71.2025.02.23.03.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:56:04 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: add Exynos2200 SoC
Date: Sun, 23 Feb 2025 13:55:58 +0200
Message-ID: <20250223115601.723886-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide dt-schema documentation for Exynos2200 SoC clock controller.
Add device tree clock binding definitions for the following CMU blocks:
- CMU_ALIVE
- CMU_CMGP
- CMU_HSI0
- CMU_PERIC0/1/2
- CMU_PERIS
- CMU_TOP
- CMU_UFS
- CMU_VTS

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../clock/samsung,exynos2200-cmu.yaml         | 247 ++++++++++
 .../clock/samsung,exynos2200-cmu.h            | 431 ++++++++++++++++++
 2 files changed, 678 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
new file mode 100644
index 000000000..89433e6d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
@@ -0,0 +1,247 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos2200-cmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos2200 SoC clock controller
+
+maintainers:
+  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Exynos2200 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clocks in that root tree
+  are two external clocks: XTCXO (76.8 MHz) and RTCCLK (32768 Hz). XTCXO must be
+  defined as a fixed-rate clock in dts, whereas RTCCLK originates from PMIC.
+
+  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_TOP.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/samsung,exynos2200-cmu.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos2200-cmu-alive
+      - samsung,exynos2200-cmu-cmgp
+      - samsung,exynos2200-cmu-hsi0
+      - samsung,exynos2200-cmu-peric0
+      - samsung,exynos2200-cmu-peric1
+      - samsung,exynos2200-cmu-peric2
+      - samsung,exynos2200-cmu-peris
+      - samsung,exynos2200-cmu-top
+      - samsung,exynos2200-cmu-ufs
+      - samsung,exynos2200-cmu-vts
+
+  clocks:
+    minItems: 1
+    maxItems: 6
+
+  clock-names:
+    minItems: 1
+    maxItems: 6
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
+            const: samsung,exynos2200-cmu-alive
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_ALIVE NOC clock (from CMU_TOP)
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
+            const: samsung,exynos2200-cmu-cmgp
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_CMGP NOC clock (from CMU_TOP)
+            - description: CMU_CMGP PERI clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: peri
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-hsi0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: External RTC clock (32768 Hz)
+            - description: CMU_HSI0 NOC clock (from CMU_TOP)
+            - description: CMU_HSI0 DPGTC clock (from CMU_TOP)
+            - description: CMU_HSI0 DPOSC clock (from CMU_TOP)
+            - description: CMU_HSI0 USB32DRD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: rtcclk
+            - const: noc
+            - const: dpgtc
+            - const: dposc
+            - const: usb
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos2200-cmu-peric0
+              - samsung,exynos2200-cmu-peric1
+              - samsung,exynos2200-cmu-peric2
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_PERICn NOC clock (from CMU_TOP)
+            - description: CMU_PERICn IP0 clock (from CMU_TOP)
+            - description: CMU_PERICn IP1 clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: ip0
+            - const: ip1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-peris
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25.6 MHz)
+            - description: CMU_PERIS NOC clock (from CMU_TOP)
+            - description: CMU_PERIS GIC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: tcxo_div3
+            - const: noc
+            - const: gic
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-top
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-ufs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_UFS NOC clock (from CMU_TOP)
+            - description: CMU_UFS MMC clock (from CMU_TOP)
+            - description: CMU_UFS UFS clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: noc
+            - const: mmc
+            - const: ufs
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos2200-cmu-vts
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_VTS DMIC clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dmic
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/samsung,exynos2200-cmu.h>
+
+    cmu_vts: clock-controller@15300000 {
+        compatible = "samsung,exynos2200-cmu-vts";
+        reg = <0x15300000 0x8000>;
+        #clock-cells = <1>;
+
+        clocks = <&oscclk>,
+                 <&cmu_top CLK_DOUT_CMU_VTS_DMIC>;
+        clock-names = "oscclk", "dmic";
+    };
+
+...
diff --git a/include/dt-bindings/clock/samsung,exynos2200-cmu.h b/include/dt-bindings/clock/samsung,exynos2200-cmu.h
new file mode 100644
index 000000000..310552be0
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,exynos2200-cmu.h
@@ -0,0 +1,431 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ * Author: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ *
+ * Device Tree binding constants for Exynos2200 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS2200_H
+#define _DT_BINDINGS_CLOCK_EXYNOS2200_H
+
+/* CMU_TOP */
+#define CLK_FOUT_SHARED0_PLL			1
+#define CLK_FOUT_SHARED1_PLL			2
+#define CLK_FOUT_SHARED2_PLL			3
+#define CLK_FOUT_SHARED3_PLL			4
+#define CLK_FOUT_SHARED4_PLL			5
+#define CLK_FOUT_MMC_PLL			6
+#define CLK_FOUT_SHARED_MIF_PLL			7
+
+#define CLK_MOUT_CMU_CP_MPLL_CLK_D2_USER	8
+#define CLK_MOUT_CMU_CP_MPLL_CLK_USER		9
+#define CLK_MOUT_CMU_AUD_AUDIF0			10
+#define CLK_MOUT_CMU_AUD_AUDIF1			11
+#define CLK_MOUT_CMU_AUD_CPU			12
+#define CLK_MOUT_CMU_CPUCL0_DBG_NOC		13
+#define CLK_MOUT_CMU_CPUCL0_SWITCH		14
+#define CLK_MOUT_CMU_CPUCL1_SWITCH		15
+#define CLK_MOUT_CMU_CPUCL2_SWITCH		16
+#define CLK_MOUT_CMU_DNC_NOC			17
+#define CLK_MOUT_CMU_DPUB_NOC			18
+#define CLK_MOUT_CMU_DPUF_NOC			19
+#define CLK_MOUT_CMU_DSP_NOC			20
+#define CLK_MOUT_CMU_DSU_SWITCH			21
+#define CLK_MOUT_CMU_G3D_SWITCH			22
+#define CLK_MOUT_CMU_GNPU_NOC			23
+#define CLK_MOUT_CMU_UFS_MMC_CARD		24
+#define CLK_MOUT_CMU_M2M_NOC			25
+#define CLK_MOUT_CMU_NOCL0_NOC			26
+#define CLK_MOUT_CMU_NOCL1A_NOC			27
+#define CLK_MOUT_CMU_NOCL1B_NOC0		28
+#define CLK_MOUT_CMU_NOCL1C_NOC			29
+#define CLK_MOUT_CMU_SDMA_NOC			30
+#define CLK_MOUT_CMU_CP_HISPEEDY_CLK		31
+#define CLK_MOUT_CMU_CP_SHARED0_CLK		32
+#define CLK_MOUT_CMU_CP_SHARED2_CLK		33
+#define CLK_MOUT_CMU_MUX_ALIVE_NOC		34
+#define CLK_MOUT_CMU_MUX_AUD_AUDIF0		35
+#define CLK_MOUT_CMU_MUX_AUD_AUDIF1		36
+#define CLK_MOUT_CMU_MUX_AUD_CPU		37
+#define CLK_MOUT_CMU_MUX_AUD_NOC		38
+#define CLK_MOUT_CMU_MUX_BRP_NOC		39
+#define CLK_MOUT_CMU_MUX_CIS_CLK0		40
+#define CLK_MOUT_CMU_MUX_CIS_CLK1		41
+#define CLK_MOUT_CMU_MUX_CIS_CLK2		42
+#define CLK_MOUT_CMU_MUX_CIS_CLK3		43
+#define CLK_MOUT_CMU_MUX_CIS_CLK4		44
+#define CLK_MOUT_CMU_MUX_CIS_CLK5		45
+#define CLK_MOUT_CMU_MUX_CIS_CLK6		46
+#define CLK_MOUT_CMU_MUX_CIS_CLK7		47
+#define CLK_MOUT_CMU_MUX_CMU_BOOST		48
+#define CLK_MOUT_CMU_MUX_CMU_BOOST_CAM		49
+#define CLK_MOUT_CMU_MUX_CMU_BOOST_CPU		50
+#define CLK_MOUT_CMU_MUX_CMU_BOOST_MIF		51
+#define CLK_MOUT_CMU_MUX_CPUCL0_DBG_NOC		52
+#define CLK_MOUT_CMU_MUX_CPUCL0_NOCP		53
+#define CLK_MOUT_CMU_MUX_CPUCL0_SWITCH		54
+#define CLK_MOUT_CMU_MUX_CPUCL1_SWITCH		55
+#define CLK_MOUT_CMU_MUX_CPUCL2_SWITCH		56
+#define CLK_MOUT_CMU_MUX_CSIS_DCPHY		57
+#define CLK_MOUT_CMU_MUX_CSIS_NOC		58
+#define CLK_MOUT_CMU_MUX_CSIS_OIS_MCU		59
+#define CLK_MOUT_CMU_MUX_CSTAT_NOC		60
+#define CLK_MOUT_CMU_MUX_DNC_NOC		61
+#define CLK_MOUT_CMU_MUX_DPUB			62
+#define CLK_MOUT_CMU_MUX_DPUB_ALT		63
+#define CLK_MOUT_CMU_MUX_DPUB_DSIM		64
+#define CLK_MOUT_CMU_MUX_DPUF			65
+#define CLK_MOUT_CMU_MUX_DPUF_ALT		66
+#define CLK_MOUT_CMU_MUX_DSP_NOC		67
+#define CLK_MOUT_CMU_MUX_DSU_SWITCH		68
+#define CLK_MOUT_CMU_MUX_G3D_NOCP		69
+#define CLK_MOUT_CMU_MUX_G3D_SWITCH		70
+#define CLK_MOUT_CMU_MUX_GNPU_NOC		71
+#define CLK_MOUT_CMU_MUX_HSI0_DPGTC		72
+#define CLK_MOUT_CMU_MUX_HSI0_DPOSC		73
+#define CLK_MOUT_CMU_MUX_HSI0_NOC		74
+#define CLK_MOUT_CMU_MUX_HSI0_USB32DRD		75
+#define CLK_MOUT_CMU_MUX_UFS_MMC_CARD		76
+#define CLK_MOUT_CMU_MUX_HSI1_NOC		77
+#define CLK_MOUT_CMU_MUX_HSI1_PCIE		78
+#define CLK_MOUT_CMU_MUX_UFS_UFS_EMBD		79
+#define CLK_MOUT_CMU_MUX_LME_LME		80
+#define CLK_MOUT_CMU_MUX_LME_NOC		81
+#define CLK_MOUT_CMU_MUX_M2M_NOC		82
+#define CLK_MOUT_CMU_MUX_MCSC_MCSC		83
+#define CLK_MOUT_CMU_MUX_MCSC_NOC		84
+#define CLK_MOUT_CMU_MUX_MFC0_MFC0		85
+#define CLK_MOUT_CMU_MUX_MFC0_WFD		86
+#define CLK_MOUT_CMU_MUX_MFC1_MFC1		87
+#define CLK_MOUT_CMU_MUX_MIF_NOCP		88
+#define CLK_MOUT_CMU_MUX_MIF_SWITCH		89
+#define CLK_MOUT_CMU_MUX_NOCL0_NOC		90
+#define CLK_MOUT_CMU_MUX_NOCL1A_NOC		91
+#define CLK_MOUT_CMU_MUX_NOCL1B_NOC0		92
+#define CLK_MOUT_CMU_MUX_NOCL1B_NOC1		93
+#define CLK_MOUT_CMU_MUX_NOCL1C_NOC		94
+#define CLK_MOUT_CMU_MUX_PERIC0_IP0		95
+#define CLK_MOUT_CMU_MUX_PERIC0_IP1		96
+#define CLK_MOUT_CMU_MUX_PERIC0_NOC		97
+#define CLK_MOUT_CMU_MUX_PERIC1_IP0		98
+#define CLK_MOUT_CMU_MUX_PERIC1_IP1		99
+#define CLK_MOUT_CMU_MUX_PERIC1_NOC		100
+#define CLK_MOUT_CMU_MUX_PERIC2_IP0		101
+#define CLK_MOUT_CMU_MUX_PERIC2_IP1		102
+#define CLK_MOUT_CMU_MUX_PERIC2_NOC		103
+#define CLK_MOUT_CMU_MUX_PERIS_GIC		104
+#define CLK_MOUT_CMU_MUX_PERIS_NOC		105
+#define CLK_MOUT_CMU_MUX_SDMA_NOC		106
+#define CLK_MOUT_CMU_MUX_SSP_NOC		107
+#define CLK_MOUT_CMU_MUX_VTS_DMIC		108
+#define CLK_MOUT_CMU_MUX_YUVP_NOC		109
+#define CLK_MOUT_CMU_MUX_CMU_CMUREF		110
+#define CLK_MOUT_CMU_MUX_CP_HISPEEDY_CLK	111
+#define CLK_MOUT_CMU_MUX_CP_SHARED0_CLK		112
+#define CLK_MOUT_CMU_MUX_CP_SHARED1_CLK		113
+#define CLK_MOUT_CMU_MUX_CP_SHARED2_CLK		114
+#define CLK_MOUT_CMU_M2M_FRC			115
+#define CLK_MOUT_CMU_MCSC_MCSC			116
+#define CLK_MOUT_CMU_MCSC_NOC			117
+#define CLK_MOUT_CMU_MUX_M2M_FRC		118
+#define CLK_MOUT_CMU_MUX_UFS_NOC		119
+
+#define CLK_DOUT_CMU_ALIVE_NOC			120
+#define CLK_DOUT_CMU_AUD_NOC			121
+#define CLK_DOUT_CMU_BRP_NOC			122
+#define CLK_DOUT_CMU_CMU_BOOST			123
+#define CLK_DOUT_CMU_CMU_BOOST_CAM		124
+#define CLK_DOUT_CMU_CMU_BOOST_CPU		125
+#define CLK_DOUT_CMU_CMU_BOOST_MIF		126
+#define CLK_DOUT_CMU_CPUCL0_NOCP		127
+#define CLK_DOUT_CMU_CSIS_DCPHY			128
+#define CLK_DOUT_CMU_CSIS_NOC			129
+#define CLK_DOUT_CMU_CSIS_OIS_MCU		130
+#define CLK_DOUT_CMU_CSTAT_NOC			131
+#define CLK_DOUT_CMU_DPUB_DSIM			132
+#define CLK_DOUT_CMU_LME_LME			133
+#define CLK_DOUT_CMU_G3D_NOCP			134
+#define CLK_DOUT_CMU_HSI0_DPGTC			135
+#define CLK_DOUT_CMU_HSI0_DPOSC			136
+#define CLK_DOUT_CMU_HSI0_NOC			137
+#define CLK_DOUT_CMU_HSI0_USB32DRD		138
+#define CLK_DOUT_CMU_HSI1_NOC			139
+#define CLK_DOUT_CMU_HSI1_PCIE			140
+#define CLK_DOUT_CMU_UFS_UFS_EMBD		141
+#define CLK_DOUT_CMU_LME_NOC			142
+#define CLK_DOUT_CMU_MFC0_MFC0			143
+#define CLK_DOUT_CMU_MFC0_WFD			144
+#define CLK_DOUT_CMU_MFC1_MFC1			145
+#define CLK_DOUT_CMU_MIF_NOCP			146
+#define CLK_DOUT_CMU_NOCL1B_NOC1		147
+#define CLK_DOUT_CMU_PERIC0_IP0			148
+#define CLK_DOUT_CMU_PERIC0_IP1			149
+#define CLK_DOUT_CMU_PERIC0_NOC			150
+#define CLK_DOUT_CMU_PERIC1_IP0			151
+#define CLK_DOUT_CMU_PERIC1_IP1			152
+#define CLK_DOUT_CMU_PERIC1_NOC			153
+#define CLK_DOUT_CMU_PERIC2_IP0			154
+#define CLK_DOUT_CMU_PERIC2_IP1			155
+#define CLK_DOUT_CMU_PERIC2_NOC			156
+#define CLK_DOUT_CMU_PERIS_GIC			157
+#define CLK_DOUT_CMU_PERIS_NOC			158
+#define CLK_DOUT_CMU_SSP_NOC			159
+#define CLK_DOUT_CMU_VTS_DMIC			160
+#define CLK_DOUT_CMU_YUVP_NOC			161
+#define CLK_DOUT_CMU_CP_SHARED1_CLK		162
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF0		163
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF0_SM		164
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF1		165
+#define CLK_DOUT_CMU_DIV_AUD_AUDIF1_SM		166
+#define CLK_DOUT_CMU_DIV_AUD_CPU		167
+#define CLK_DOUT_CMU_DIV_AUD_CPU_SM		168
+#define CLK_DOUT_CMU_DIV_CIS_CLK0		169
+#define CLK_DOUT_CMU_DIV_CIS_CLK1		170
+#define CLK_DOUT_CMU_DIV_CIS_CLK2		171
+#define CLK_DOUT_CMU_DIV_CIS_CLK3		172
+#define CLK_DOUT_CMU_DIV_CIS_CLK4		173
+#define CLK_DOUT_CMU_DIV_CIS_CLK5		174
+#define CLK_DOUT_CMU_DIV_CIS_CLK6		175
+#define CLK_DOUT_CMU_DIV_CIS_CLK7		176
+#define CLK_DOUT_CMU_DIV_CPUCL0_DBG_NOC		177
+#define CLK_DOUT_CMU_DIV_CPUCL0_DBG_NOC_SM	178
+#define CLK_DOUT_CMU_DIV_CPUCL0_SWITCH		179
+#define CLK_DOUT_CMU_DIV_CPUCL0_SWITCH_SM	180
+#define CLK_DOUT_CMU_DIV_CPUCL1_SWITCH		181
+#define CLK_DOUT_CMU_DIV_CPUCL1_SWITCH_SM	182
+#define CLK_DOUT_CMU_DIV_CPUCL2_SWITCH		183
+#define CLK_DOUT_CMU_DIV_CPUCL2_SWITCH_SM	184
+#define CLK_DOUT_CMU_DIV_DNC_NOC		185
+#define CLK_DOUT_CMU_DIV_DNC_NOC_SM		186
+#define CLK_DOUT_CMU_DIV_DPUB			187
+#define CLK_DOUT_CMU_DIV_DPUB_ALT		188
+#define CLK_DOUT_CMU_DIV_DPUF			189
+#define CLK_DOUT_CMU_DIV_DPUF_ALT		190
+#define CLK_DOUT_CMU_DIV_DSP_NOC		191
+#define CLK_DOUT_CMU_DIV_DSP_NOC_SM		192
+#define CLK_DOUT_CMU_DIV_DSU_SWITCH		193
+#define CLK_DOUT_CMU_DIV_DSU_SWITCH_SM		194
+#define CLK_DOUT_CMU_DIV_G3D_SWITCH		195
+#define CLK_DOUT_CMU_DIV_G3D_SWITCH_SM		196
+#define CLK_DOUT_CMU_DIV_GNPU_NOC		197
+#define CLK_DOUT_CMU_DIV_GNPU_NOC_SM		198
+#define CLK_DOUT_CMU_DIV_UFS_MMC_CARD		199
+#define CLK_DOUT_CMU_DIV_UFS_MMC_CARD_SM	200
+#define CLK_DOUT_CMU_DIV_M2M_NOC		201
+#define CLK_DOUT_CMU_DIV_M2M_NOC_SM		202
+#define CLK_DOUT_CMU_DIV_NOCL0_NOC		203
+#define CLK_DOUT_CMU_DIV_NOCL0_NOC_SM		204
+#define CLK_DOUT_CMU_DIV_NOCL1A_NOC		205
+#define CLK_DOUT_CMU_DIV_NOCL1A_NOC_SM		206
+#define CLK_DOUT_CMU_DIV_NOCL1B_NOC0		207
+#define CLK_DOUT_CMU_DIV_NOCL1B_NOC0_SM		208
+#define CLK_DOUT_CMU_DIV_NOCL1C_NOC		209
+#define CLK_DOUT_CMU_DIV_NOCL1C_NOC_SM		210
+#define CLK_DOUT_CMU_DIV_SDMA_NOC		211
+#define CLK_DOUT_CMU_DIV_SDMA_NOC_SM		212
+#define CLK_DOUT_CMU_DIV_CP_HISPEEDY_CLK	213
+#define CLK_DOUT_CMU_DIV_CP_HISPEEDY_CLK_SM	214
+#define CLK_DOUT_CMU_DIV_CP_SHARED0_CLK		215
+#define CLK_DOUT_CMU_DIV_CP_SHARED0_CLK_SM	216
+#define CLK_DOUT_CMU_DIV_CP_SHARED2_CLK		217
+#define CLK_DOUT_CMU_DIV_CP_SHARED2_CLK_SM	218
+#define CLK_DOUT_CMU_UFS_NOC		219
+#define CLK_DOUT_CMU_DIV_M2M_FRC		220
+#define CLK_DOUT_CMU_DIV_M2M_FRC_SM		221
+#define CLK_DOUT_CMU_DIV_MCSC_MCSC		222
+#define CLK_DOUT_CMU_DIV_MCSC_MCSC_SM		223
+#define CLK_DOUT_CMU_DIV_MCSC_NOC		224
+#define CLK_DOUT_CMU_DIV_MCSC_NOC_SM		225
+#define CLK_DOUT_SHARED0_DIV1			226
+#define CLK_DOUT_SHARED0_DIV2			227
+#define CLK_DOUT_SHARED0_DIV4			228
+#define CLK_DOUT_SHARED1_DIV1			229
+#define CLK_DOUT_SHARED1_DIV2			230
+#define CLK_DOUT_SHARED1_DIV4			231
+#define CLK_DOUT_SHARED2_DIV1			232
+#define CLK_DOUT_SHARED2_DIV2			233
+#define CLK_DOUT_SHARED2_DIV4			234
+#define CLK_DOUT_SHARED3_DIV1			235
+#define CLK_DOUT_SHARED3_DIV2			236
+#define CLK_DOUT_SHARED3_DIV4			237
+#define CLK_DOUT_SHARED4_DIV1			238
+#define CLK_DOUT_SHARED4_DIV2			239
+#define CLK_DOUT_SHARED4_DIV4			240
+#define CLK_DOUT_SHARED_MIF_DIV1		241
+#define CLK_DOUT_SHARED_MIF_DIV2		242
+#define CLK_DOUT_SHARED_MIF_DIV4		243
+#define CLK_DOUT_TCXO_DIV3			244
+#define CLK_DOUT_TCXO_DIV4			245
+
+/* CMU_ALIVE */
+#define CLK_MOUT_ALIVE_NOC_USER			1
+#define CLK_MOUT_ALIVE_RCO_SPMI_USER		2
+#define CLK_MOUT_RCO_ALIVE_USER			3
+#define CLK_MOUT_ALIVE_CHUB_PERI		4
+#define CLK_MOUT_ALIVE_CMGP_NOC			5
+#define CLK_MOUT_ALIVE_CMGP_PERI		6
+#define CLK_MOUT_ALIVE_DBGCORE_NOC		7
+#define CLK_MOUT_ALIVE_DNC_NOC			8
+#define CLK_MOUT_ALIVE_CHUBVTS_NOC		9
+#define CLK_MOUT_ALIVE_GNPU_NOC			10
+#define CLK_MOUT_ALIVE_GNSS_NOC			11
+#define CLK_MOUT_ALIVE_SDMA_NOC			12
+#define CLK_MOUT_ALIVE_UFD_NOC			13
+#define CLK_MOUT_ALIVE_DBGCORE_UART		14
+#define CLK_MOUT_ALIVE_NOC			15
+#define CLK_MOUT_ALIVE_PMU_SUB			16
+#define CLK_MOUT_ALIVE_SPMI			17
+#define CLK_MOUT_ALIVE_TIMER			18
+#define CLK_MOUT_ALIVE_CSIS_NOC			19
+#define CLK_MOUT_ALIVE_DSP_NOC			20
+
+#define CLK_DOUT_ALIVE_CHUB_PERI		21
+#define CLK_DOUT_ALIVE_CMGP_NOC			22
+#define CLK_DOUT_ALIVE_CMGP_PERI		23
+#define CLK_DOUT_ALIVE_DBGCORE_NOC		24
+#define CLK_DOUT_ALIVE_DNC_NOC			25
+#define CLK_DOUT_ALIVE_CHUBVTS_NOC		26
+#define CLK_DOUT_ALIVE_GNPU_NOC			27
+#define CLK_DOUT_ALIVE_SDMA_NOC			28
+#define CLK_DOUT_ALIVE_UFD_NOC			29
+#define CLK_DOUT_ALIVE_DBGCORE_UART		30
+#define CLK_DOUT_ALIVE_NOC			31
+#define CLK_DOUT_ALIVE_PMU_SUB			32
+#define CLK_DOUT_ALIVE_SPMI			33
+#define CLK_DOUT_ALIVE_CSIS_NOC			34
+#define CLK_DOUT_ALIVE_DSP_NOC			35
+
+/* CMU_PERIS */
+#define CLK_MOUT_PERIS_GIC_USER			1
+#define CLK_MOUT_PERIS_NOC_USER			2
+#define CLK_MOUT_PERIS_GIC			3
+
+#define CLK_DOUT_PERIS_OTP			4
+#define CLK_DOUT_PERIS_DDD_CTRL			5
+
+/* CMU_CMGP */
+#define CLK_MOUT_CMGP_CLKALIVE_NOC_USER		1
+#define CLK_MOUT_CMGP_CLKALIVE_PERI_USER	2
+#define CLK_MOUT_CMGP_I2C			3
+#define CLK_MOUT_CMGP_SPI_I2C0			4
+#define CLK_MOUT_CMGP_SPI_I2C1			5
+#define CLK_MOUT_CMGP_SPI_MS_CTRL		6
+#define CLK_MOUT_CMGP_USI0			7
+#define CLK_MOUT_CMGP_USI1			8
+#define CLK_MOUT_CMGP_USI2			9
+#define CLK_MOUT_CMGP_USI3			10
+#define CLK_MOUT_CMGP_USI4			11
+#define CLK_MOUT_CMGP_USI5			12
+#define CLK_MOUT_CMGP_USI6			13
+
+#define CLK_DOUT_CMGP_I2C			14
+#define CLK_DOUT_CMGP_SPI_I2C0			15
+#define CLK_DOUT_CMGP_SPI_I2C1			16
+#define CLK_DOUT_CMGP_SPI_MS_CTRL		17
+#define CLK_DOUT_CMGP_USI0			18
+#define CLK_DOUT_CMGP_USI1			19
+#define CLK_DOUT_CMGP_USI2			20
+#define CLK_DOUT_CMGP_USI3			21
+#define CLK_DOUT_CMGP_USI4			22
+#define CLK_DOUT_CMGP_USI5			23
+#define CLK_DOUT_CMGP_USI6			24
+
+/* CMU_HSI0 */
+#define CLK_MOUT_CLKCMU_HSI0_DPGTC_USER		1
+#define CLK_MOUT_CLKCMU_HSI0_DPOSC_USER		2
+#define CLK_MOUT_CLKCMU_HSI0_NOC_USER		3
+#define CLK_MOUT_CLKCMU_HSI0_USB32DRD_USER	4
+#define CLK_MOUT_HSI0_NOC			5
+#define CLK_MOUT_HSI0_RTCCLK			6
+#define CLK_MOUT_HSI0_USB32DRD			7
+
+#define CLK_DOUT_DIV_CLK_HSI0_EUSB		8
+
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_IP0_USER		1
+#define CLK_MOUT_PERIC0_IP1_USER		2
+#define CLK_MOUT_PERIC0_NOC_USER		3
+#define CLK_MOUT_PERIC0_I2C			4
+#define CLK_MOUT_PERIC0_USI04			5
+
+#define CLK_DOUT_PERIC0_I2C			6
+#define CLK_DOUT_PERIC0_USI04			7
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_IP0_USER		1
+#define CLK_MOUT_PERIC1_IP1_USER		2
+#define CLK_MOUT_PERIC1_NOC_USER		3
+#define CLK_MOUT_PERIC1_I2C			4
+#define CLK_MOUT_PERIC1_SPI_MS_CTRL		5
+#define CLK_MOUT_PERIC1_UART_BT			6
+#define CLK_MOUT_PERIC1_USI07			7
+#define CLK_MOUT_PERIC1_USI07_SPI_I2C		8
+#define CLK_MOUT_PERIC1_USI08			9
+#define CLK_MOUT_PERIC1_USI08_SPI_I2C		10
+#define CLK_MOUT_PERIC1_USI09			11
+#define CLK_MOUT_PERIC1_USI10			12
+
+#define CLK_DOUT_PERIC1_I2C			13
+#define CLK_DOUT_PERIC1_SPI_MS_CTRL		14
+#define CLK_DOUT_PERIC1_UART_BT			15
+#define CLK_DOUT_PERIC1_USI07			16
+#define CLK_DOUT_PERIC1_USI07_SPI_I2C		17
+#define CLK_DOUT_PERIC1_USI08			18
+#define CLK_DOUT_PERIC1_USI08_SPI_I2C		19
+#define CLK_DOUT_PERIC1_USI09			20
+#define CLK_DOUT_PERIC1_USI10			21
+
+/* CMU_PERIC2 */
+#define CLK_MOUT_PERIC2_IP0_USER		1
+#define CLK_MOUT_PERIC2_IP1_USER		2
+#define CLK_MOUT_PERIC2_NOC_USER		3
+#define CLK_MOUT_PERIC2_I2C			4
+#define CLK_MOUT_PERIC2_SPI_MS_CTRL		5
+#define CLK_MOUT_PERIC2_UART_DBG		6
+#define CLK_MOUT_PERIC2_USI00			7
+#define CLK_MOUT_PERIC2_USI00_SPI_I2C		8
+#define CLK_MOUT_PERIC2_USI01			9
+#define CLK_MOUT_PERIC2_USI01_SPI_I2C		10
+#define CLK_MOUT_PERIC2_USI02			11
+#define CLK_MOUT_PERIC2_USI03			12
+#define CLK_MOUT_PERIC2_USI05			13
+#define CLK_MOUT_PERIC2_USI06			14
+#define CLK_MOUT_PERIC2_USI11			15
+
+#define CLK_DOUT_PERIC2_I2C			16
+#define CLK_DOUT_PERIC2_SPI_MS_CTRL		17
+#define CLK_DOUT_PERIC2_UART_DBG		18
+#define CLK_DOUT_PERIC2_USI00			19
+#define CLK_DOUT_PERIC2_USI00_SPI_I2C		20
+#define CLK_DOUT_PERIC2_USI01			21
+#define CLK_DOUT_PERIC2_USI01_SPI_I2C		22
+#define CLK_DOUT_PERIC2_USI02			23
+#define CLK_DOUT_PERIC2_USI03			24
+#define CLK_DOUT_PERIC2_USI05			25
+#define CLK_DOUT_PERIC2_USI06			26
+#define CLK_DOUT_PERIC2_USI11			27
+
+/* CMU_UFS */
+#define CLK_MOUT_UFS_MMC_CARD_USER		1
+#define CLK_MOUT_UFS_NOC_USER			2
+#define CLK_MOUT_UFS_UFS_EMBD_USER		3
+
+/* CMU_VTS */
+#define CLK_MOUT_CLKALIVE_VTS_NOC_USER		1
+#define CLK_MOUT_CLKALIVE_VTS_RCO_USER		2
+#define CLK_MOUT_CLKCMU_VTS_DMIC_USER		3
+#define CLK_MOUT_CLKVTS_AUD_DMIC1		4
+#define CLK_MOUT_CLKVTS_NOC			5
+#define CLK_MOUT_CLKVTS_DMIC_PAD		6
+
+#define CLK_DOUT_CLKVTS_AUD_DMIC0		7
+#define CLK_DOUT_CLKVTS_AUD_DMIC1		8
+#define CLK_DOUT_CLKVTS_CPU			9
+#define CLK_DOUT_CLKVTS_DMIC_IF			10
+#define CLK_DOUT_CLKVTS_DMIC_IF_DIV2		11
+#define CLK_DOUT_CLKVTS_NOC			12
+#define CLK_DOUT_CLKVTS_SERIAL_LIF		13
+#define CLK_DOUT_CLKVTS_SERIAL_LIF_CORE		14
+
+#endif
-- 
2.43.0

