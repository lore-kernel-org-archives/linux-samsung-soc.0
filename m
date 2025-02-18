Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F4280A49;
	Tue, 18 Feb 2025 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739904674; cv=none; b=iLg/wD4zMct8Ak62o30NKfYfcGrcX6Oj4AZTux4DnnBVZDf+0ucoIbZWBjKySPd+AbSd5zMz2ScJQ0RynD7UoHg940zBo0oUICgz0bqQ72MNEPKIPAWajOasfD2T6d74LVPyyLlXRHjHqgQQpMVoPn01aFO06QLHVSYjhftre/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739904674; c=relaxed/simple;
	bh=/aS0ew2+QW+26E+AGGAFKefl9VuK6gHDnbpmIW/wiaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ubEnSeoHQrj1Sn+0WJM6K8N4tP2CocSwB4VLghmpv98uCLK+p+PIA2hxVYV2uFXMUjYqWwl/cnperPWl8p5J6pj6y7jCX1CUDnrRT4T8DtZV6+vR8+we+V562+Ee6dxW3T/r3w9P3bolM9+DzL9PT5xEyrjf3i9lJAWJoJlWpmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BKrFT2rN; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BKrFT2rN"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A2B87234ED;
	Tue, 18 Feb 2025 19:51:10 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72V-OccThic6; Tue, 18 Feb 2025 19:51:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904666; bh=/aS0ew2+QW+26E+AGGAFKefl9VuK6gHDnbpmIW/wiaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BKrFT2rNZYjIHzc7PD2whkFF/u0LhnlUTTGuzhQaT4RmFGmchJrDvL/kCNdYWmiem
	 F0RueQL8t6tnNQhMkR9hvIuk6z66HeFjMuax1ujf9A70bes+/tEM592oZMs8AQkEcH
	 piKvDo8UJleSkf/WFDmsFcO5ENL7CVsjzfv4l8fIsNial6KBjrJ7OoqgLGwo8q1U5E
	 pyWjd913VbRjNh2nHAZkY1FQTa3TFRMEmsWb+e6xaUHw64DsblJoFQcnDLVEEy9W+a
	 Vr174edutfJ+SY40hwAs9bkIONubmOwjJxyN3OJBR2trpjxltKpaaOEX+tqLXJsrCa
	 yhSYIbn0Zt/wg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:20:29 +0530
Subject: [PATCH v3 2/5] dt-bindings: clock: document exynos7870 clock
 driver CMU bindings
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-pmu-clocks-v3-2-0d1e415e9e3a@disroot.org>
References: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
In-Reply-To: <20250219-exynos7870-pmu-clocks-v3-0-0d1e415e9e3a@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904648; l=7253;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/aS0ew2+QW+26E+AGGAFKefl9VuK6gHDnbpmIW/wiaY=;
 b=+Lyc/A2h3/9C9yxWDWVwaVMGg+SgTAsUG9v+CgydR/PcsW33cg++5jbUImBwFeY7qrP7S6C8+
 vacLd62/+LLCF2JjzrRyHHgziqXHtD699MeflyCnoYZjKDroHpHgoMu
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Provide dt-schema documentation for Exynos7870 SoC clock controller.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/clock/samsung,exynos7870-clock.yaml   | 227 +++++++++++++++++++++
 1 file changed, 227 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9361723f4f880de0b7127e6ab8f770990c9720e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
@@ -0,0 +1,227 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos7870-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos7870 SoC clock controller
+
+maintainers:
+  - Kaustabh Chakraborty <kauschluss@disroot.org>
+
+description: |
+  Exynos7870 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that root tree
+  is an external clock: OSCCLK (26 MHz). This external clock must be defined
+  as a fixed-rate clock in dts.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'dt-bindings/clock/exynos7870.h' header.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos7870-cmu-mif
+      - samsung,exynos7870-cmu-dispaud
+      - samsung,exynos7870-cmu-fsys
+      - samsung,exynos7870-cmu-g3d
+      - samsung,exynos7870-cmu-isp
+      - samsung,exynos7870-cmu-mfcmscl
+      - samsung,exynos7870-cmu-peri
+
+  clocks:
+    minItems: 1
+    maxItems: 10
+
+  clock-names:
+    minItems: 1
+    maxItems: 10
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-mif
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-dispaud
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_DISPAUD bus clock (from CMU_MIF)
+            - description: DECON external clock (from CMU_MIF)
+            - description: DECON vertical clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: decon_eclk
+            - const: decon_vclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-fsys
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_FSYS bus clock (from CMU_MIF)
+            - description: USB20DRD clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: usb20drd_refclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-g3d
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: G3D switch clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: switch
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-isp
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: ISP camera clock (from CMU_MIF)
+            - description: ISP clock (from CMU_MIF)
+            - description: ISP VRA clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: cam
+            - const: isp
+            - const: vra
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-mfcmscl
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: MSCL clock (from CMU_MIF)
+            - description: MFC clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: mfc
+            - const: mscl
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-peri
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_PERI bus clock (from CMU_MIF)
+            - description: SPI0 clock (from CMU_MIF)
+            - description: SPI1 clock (from CMU_MIF)
+            - description: SPI2 clock (from CMU_MIF)
+            - description: SPI3 clock (from CMU_MIF)
+            - description: SPI4 clock (from CMU_MIF)
+            - description: UART0 clock (from CMU_MIF)
+            - description: UART1 clock (from CMU_MIF)
+            - description: UART2 clock (from CMU_MIF)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: spi0
+            - const: spi1
+            - const: spi2
+            - const: spi3
+            - const: spi4
+            - const: uart0
+            - const: uart1
+            - const: uart2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos7870.h>
+
+    cmu_peri: clock-controller@101f0000 {
+      compatible = "samsung,exynos7870-cmu-peri";
+      reg = <0x101f0000 0x1000>;
+      #clock-cells = <1>;
+
+      clock-names = "oscclk", "bus", "spi0", "spi1", "spi2",
+                    "spi3", "spi4", "uart0", "uart1", "uart2";
+      clocks = <&oscclk>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_BUS>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI0>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI1>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI2>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI3>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_SPI4>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART0>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART1>,
+               <&cmu_mif CLK_GOUT_MIF_CMU_PERI_UART2>;
+    };
+
+...

-- 
2.48.1

