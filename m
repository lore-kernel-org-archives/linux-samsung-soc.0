Received: from spam.coasia.com (mail2.coasia.com [112.168.119.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B320182B4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jul 2025 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=112.168.119.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752106864; cv=none; b=Wut5bCzWnEMRyOTNVCI3wWVGGSuamnZZAkTj1lMkmUj538Tt61OdRhYop8JBxC2LLb1LfsH/tb2WtnVK3IeOHQu1Qc923cG3BwkqydLumfUIQv5hUXT3pOB+0i+Epo4Qp9mQdmMBTQO6Otr+o/zZpij+V9qKySEB6zQ5hdLT23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752106864; c=relaxed/simple;
	bh=8vgv+qYIBssDu0PpaPFIKmoPLn4IZbctIWW+nNruduQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QyNGQ2t4jFHBu5D33+Iw4Qgr9lPkkYpE93CrKs6Xu9zEoyiUkABBzYlVopk26jyU7We+faJ3/McS6LyyjQwOj0ZWWiS/EuOXLZI52veoHrrtysWQ3/z0YVAGhsXw9w989/sv3svRUT7fPDlugfyuqxrdpzk56h6ICuuOYd0cA2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com; spf=pass smtp.mailfrom=coasia.com; dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b=UeqXKGti; arc=none smtp.client-ip=112.168.119.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=coasia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=coasia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=coasia.com header.i=@coasia.com header.b="UeqXKGti"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=coasia.com; s=coasia;
	t=1752106851; bh=8vgv+qYIBssDu0PpaPFIKmoPLn4IZbctIWW+nNruduQ=;
	l=7205; h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=UeqXKGtibTgHwtcwQKzVJ5RFRwl3yJay/rB7BEoUA1ZFi5e+SjC+mco/OTYyjBzJd
	 c3RyiO4HRZWHfWOHJDlk64npi+rFs8TCNNY+XjhyV//LC6ShXN5SUuq4POmFHRbnQ5
	 tG7HmfqhnuqW6etU7+vnE9sBl16YBqgmn4TYTS3Y=
Received: from unknown (HELO kangseongu..) (ksk4725@coasia.com@115.23.218.194)
	by 192.168.10.159 with ESMTP; 10 Jul 2025 09:20:51 +0900
X-Original-SENDERIP: 115.23.218.194
X-Original-SENDERCOUNTRY: KR, South Korea 
X-Original-MAILFROM: ksk4725@coasia.com
X-Original-RCPTTO: jesper.nilsson@axis.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	tomasz.figa@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ravi.patel@samsung.com,
	ksk4725@coasia.com,
	smn1196@coasia.com,
	kenkim@coasia.com,
	pjsin865@coasia.com,
	gwk1013@coasia.com,
	hgkim05@coasia.com,
	mingyoungbo@coasia.com,
	pankaj.dubey@samsung.com,
	shradha.t@samsung.com,
	inbaraj.e@samsung.com,
	swathi.ks@samsung.com,
	hrishikesh.d@samsung.com,
	dj76.yang@samsung.com,
	hypmean.kim@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
From: ksk4725@coasia.com
To: Jesper Nilsson <jesper.nilsson@axis.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ravi Patel <ravi.patel@samsung.com>,
	SeonGu Kang <ksk4725@coasia.com>,
	SungMin Park <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>,
	Jongshin Park <pjsin865@coasia.com>,
	GunWoo Kim <gwk1013@coasia.com>,
	HaGyeong Kim <hgkim05@coasia.com>,
	GyoungBo Min <mingyoungbo@coasia.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Shradha Todi <shradha.t@samsung.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Hrishikesh <hrishikesh.d@samsung.com>,
	Dongjin Yang <dj76.yang@samsung.com>,
	Sang Min Kim <hypmean.kim@samsung.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@axis.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 02/16] dt-bindings: clock: Add ARTPEC-8 CMU bindings
Date: Thu, 10 Jul 2025 09:20:32 +0900
Message-Id: <20250710002047.1573841-3-ksk4725@coasia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710002047.1573841-1-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hakyeong Kim <hgkim05@coasia.com>

Add dt-schema for ARTPEC-8 SoC clock controller.

Add device-tree binding definitions for following CMU blocks:
- CMU_CMU
- CMU_BUS
- CMU_CORE
- CMU_CPUCL
- CMU_FSYS
- CMU_IMEM
- CMU_PERI

Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
Signed-off-by: Hakyeong Kim <hgkim05@coasia.com>
---
 .../bindings/clock/axis,artpec8-clock.yaml    | 224 ++++++++++++++++++
 1 file changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml b/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
new file mode 100644
index 000000000000..baacea10599b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/axis,artpec8-clock.yaml
@@ -0,0 +1,224 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/axis,artpec8-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axis ARTPEC-8 SoC clock controller
+
+maintainers:
+  - Jesper Nilsson <jesper.nilsson@axis.com>
+
+description: |
+  ARTPEC-8 clock controller is comprised of several CMU units, generating
+  clocks for different domains. Those CMU units are modeled as separate device
+  tree nodes, and might depend on each other. The root clock in that root tree
+  is an external clock: OSCCLK (25 MHz). This external clock must be defined
+  as a fixed-rate clock in dts.
+
+  CMU_CMU is a top-level CMU, where all base clocks are prepared using PLLs and
+  dividers; all other clocks of function blocks (other CMUs) are usually
+  derived from CMU_CMU.
+
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All clocks available for usage
+  in clock consumer nodes are defined as preprocessor macros in
+  'include/dt-bindings/clock/axis,artpec8-clk.h' header.
+
+properties:
+  compatible:
+    enum:
+      - axis,artpec8-cmu-cmu
+      - axis,artpec8-cmu-bus
+      - axis,artpec8-cmu-core
+      - axis,artpec8-cmu-cpucl
+      - axis,artpec8-cmu-fsys
+      - axis,artpec8-cmu-imem
+      - axis,artpec8-cmu-peri
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
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-cmu
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+
+        clock-names:
+          items:
+            - const: fin_pll
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-bus
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_BUS BUS clock (from CMU_CMU)
+            - description: CMU_BUS DLP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: dout_clkcmu_bus_bus
+            - const: dout_clkcmu_bus_dlp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-core
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_CORE main clock (from CMU_CMU)
+            - description: CMU_CORE DLP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: dout_clkcmu_core_main
+            - const: dout_clkcmu_core_dlp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-cpucl
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_CPUCL switch clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: dout_clkcmu_cpucl_switch
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-fsys
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_FSYS SCAN0 clock (from CMU_CMU)
+            - description: CMU_FSYS SCAN1 clock (from CMU_CMU)
+            - description: CMU_FSYS BUS clock (from CMU_CMU)
+            - description: CMU_FSYS IP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: dout_clkcmu_fsys_scan0
+            - const: dout_clkcmu_fsys_scan1
+            - const: dout_clkcmu_fsys_bus
+            - const: dout_clkcmu_fsys_ip
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-imem
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_IMEM ACLK clock (from CMU_CMU)
+            - description: CMU_IMEM JPEG clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: dout_clkcmu_imem_aclk
+            - const: dout_clkcmu_imem_jpeg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: axis,artpec8-cmu-peri
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (25 MHz)
+            - description: CMU_PERI IP clock (from CMU_CMU)
+            - description: CMU_PERI AUDIO clock (from CMU_CMU)
+            - description: CMU_PERI DISP clock (from CMU_CMU)
+
+        clock-names:
+          items:
+            - const: fin_pll
+            - const: dout_clkcmu_peri_ip
+            - const: dout_clkcmu_peri_audio
+            - const: dout_clkcmu_peri_disp
+
+additionalProperties: false
+
+examples:
+  # Clock controller node for CMU_FSYS
+  - |
+    #include <dt-bindings/clock/axis,artpec8-clk.h>
+
+    cmu_fsys: clock-controller@16c10000 {
+        compatible = "axis,artpec8-cmu-fsys";
+        reg = <0x16c10000 0x4000>;
+        #clock-cells = <1>;
+        clocks = <&fin_pll>,
+                 <&cmu_cmu DOUT_CLKCMU_FSYS_SCAN0>,
+                 <&cmu_cmu DOUT_CLKCMU_FSYS_SCAN1>,
+                 <&cmu_cmu DOUT_CLKCMU_FSYS_BUS>,
+                 <&cmu_cmu DOUT_CLKCMU_FSYS_IP>;
+        clock-names = "fin_pll",
+                      "dout_clkcmu_fsys_scan0",
+                      "dout_clkcmu_fsys_scan1",
+                      "dout_clkcmu_fsys_bus",
+                      "dout_clkcmu_fsys_ip";
+    };
+
+...
-- 
2.34.1

