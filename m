Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88B520E335;
	Mon,  3 Feb 2025 20:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615092; cv=none; b=MKSUfRGWqlX4DHhVNFY5I8ix+DAAbm+Aq+2ScSo4tuZ5nfNVxMWvsj0HPQv+OnOe8QJHLOmDinmO9jsSobpIToEfOK3NKjSh/EJ3kgZwYgOziZ5m9lMhgQFXoaZeKUH6GosQ3QaGW6D9C1fJ+REkB1b1ykm+GUsE9HxRaE3kFFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615092; c=relaxed/simple;
	bh=nUxuNflbwg6A8qIs5I9HClVjufd0saQihbGMGTVz/2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DRb4jCyajr1rPwljFUkWlbgszdsF1NSmX3zWs3gU6xZHAgAsIMLbpMcUjF+Gs+JmFgkrzEtgUwKTS6D36r1CqHCg0XewbCL2CsR/CSbos2i7X8im8GIkdiRCSViKsQaowGlFIqRFKnPH41Dn4ZvxWage6xvoHeEbhX1IIHb2Wmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BIp4bT/5; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BIp4bT/5"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 35F0525C7E;
	Mon,  3 Feb 2025 21:38:09 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chezXAQ3N202; Mon,  3 Feb 2025 21:38:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615084; bh=nUxuNflbwg6A8qIs5I9HClVjufd0saQihbGMGTVz/2Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BIp4bT/5eyM1SjA0v0Yk4s8+Jhk6NIjbLBk307ZvE+xwxF28aktW1xdDlSNMnly+s
	 Ypqukd1+QB2PaZuw7DxyAK1sUaQggODJWRFkTdBFvdD7QLyVcQ82hBtHWjjkcBJQuQ
	 OldOhwBsV0u8XgqajjRVc7UOtTKBD1FmVnbKqLKITNiOrbV+2CxPGBhvYeQ5euB/tO
	 oHerq/DhDBPNHWiEeTtZCE+tBdpGpgjEEZOI16SwxD9I9X+MvfjTVOqEEa7HtWQSWG
	 IXHRCXS0ABCPeSmXLOqra3HMIZzL50EKVyzhtEy+C8QxjqhStLTrGzt3okfELc4/lj
	 +8JcCTVSXqCoQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:07:30 +0530
Subject: [PATCH 2/5] dt-bindings: clock: document exynos7870 clock driver
 CMU bindings
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmu-clocks-v1-2-a3030ae5bb53@disroot.org>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=8151;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=nUxuNflbwg6A8qIs5I9HClVjufd0saQihbGMGTVz/2Q=;
 b=2MaxpSDLkpQeAnIvnSWYIITc0XUHnWq+krbHgDyHbu1IEOePgvKrNismrWuX1kxIlal6oxSgP
 YQbXmftjkGUCR7WSIFru/eHmFuN0T1lwCzsoLdBEgiogKiX95STqMMF
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Provide dt-schema documentation for Exynos7870 SoC clock controller.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../bindings/clock/samsung,exynos7870-clock.yaml   | 246 +++++++++++++++++++++
 1 file changed, 246 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..697e03ca191d685b71672d35257b022c663244ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7870-clock.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos7870-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos7870 SoC clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
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
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-mif
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-dispaud
+
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
+            - const: gout_mif_cmu_dispaud_bus
+            - const: gout_mif_cmu_dispaud_decon_eclk
+            - const: gout_mif_cmu_dispaud_decon_vclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-fsys
+
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
+            - const: gout_mif_cmu_fsys_bus
+            - const: gout_mif_cmu_fsys_usb20drd_refclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-g3d
+
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
+            - const: gout_mif_cmu_g3d_switch
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-isp
+
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
+            - const: gout_mif_cmu_isp_cam
+            - const: gout_mif_cmu_isp_isp
+            - const: gout_mif_cmu_isp_vra
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-mfcmscl
+
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
+            - const: gout_mif_cmu_mfcmscl_mfc
+            - const: gout_mif_cmu_mfcmscl_mscl
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7870-cmu-peri
+
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
+            - const: gout_mif_cmu_peri_bus
+            - const: gout_mif_cmu_peri_spi0
+            - const: gout_mif_cmu_peri_spi1
+            - const: gout_mif_cmu_peri_spi2
+            - const: gout_mif_cmu_peri_spi3
+            - const: gout_mif_cmu_peri_spi4
+            - const: gout_mif_cmu_peri_uart0
+            - const: gout_mif_cmu_peri_uart1
+            - const: gout_mif_cmu_peri_uart2
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
+  # Clock controller node for CMU_PERI
+  - |
+    #include <dt-bindings/clock/exynos7870.h>
+
+    cmu_peri: clock-controller@101F0000 {
+      compatible = "samsung,exynos7870-cmu-peri";
+      reg = <0x101f0000 0x1000>;
+      #clock-cells = <1>;
+
+      clock-names = "oscclk",
+                    "gout_mif_cmu_peri_bus",
+                    "gout_mif_cmu_peri_spi0",
+                    "gout_mif_cmu_peri_spi1",
+                    "gout_mif_cmu_peri_spi2",
+                    "gout_mif_cmu_peri_spi3",
+                    "gout_mif_cmu_peri_spi4",
+                    "gout_mif_cmu_peri_uart0",
+                    "gout_mif_cmu_peri_uart1",
+                    "gout_mif_cmu_peri_uart2";
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

