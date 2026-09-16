Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9FA4EE849
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789561441; cv=none; b=lOYpSmaYMphG/s9gqPl8Nwi6o86o7XPD2DhrVKb1v/eajJsg1VrvzluQkqv+AW8nBFv4eF4CjsrddpPOoq3+1fBnNBiCCpN8uBP/4gilIRpByj1M5k/LGYrFNutw4je2lA6dCF5aiCDy9afDHepKH2Bk47aomEP9PPFCkTd+qno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789561441; c=relaxed/simple;
	bh=qFdkK+MGpbLSReiqJ/fFCqIyZxfqzNHYGcsAnnrdObg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=WLj+Lnba0qCOEmidRZeZnfPmIylArhXyu7UNINvU18Bstj8kAB3Kx42hFchs/cV6tSCQzfIVJaqCHC3fiwPqNbqE8uNQURELPmVQNNvzWF/63LzuhxXSO/5ybO3avSvUWivygwwLmLBwZ6CIdqguYHGOg5nduno0TbhdzB9NAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=hPRv60cU; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hPRv60cU"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260916122356epoutp01663bda08bf2ebf5aa9dabe7086ce7bee~VzKU0Cj_U1193011930epoutp010
	for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Sep 2026 12:23:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260916122356epoutp01663bda08bf2ebf5aa9dabe7086ce7bee~VzKU0Cj_U1193011930epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789561436;
	bh=d9clsv65KP7miuXWuGSwYtJ+gKiTMpauqdvSERwB1jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPRv60cUQ6xzDz6ijvsQGbAOJ0DOebE3+y5GmJllAoJBDCv6DXaTg8tGjkik4nAzL
	 3rWo9rbV3TZudsoFoknXSLwBmKpTzXxRPPb2uPe3RQw7x4eWBdwiah89a7017fqNQX
	 z/eeMOlVF2+KD3+8pGRS2EFKokNg21UiHFT5skgk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260916122356epcas5p172f58abb443b695f66f404fa97550258~VzKUEEQgs2436624366epcas5p14;
	Wed, 16 Sep 2026 12:23:56 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hlJ2z0qKnz2SSKY; Wed, 16 Sep
	2026 12:23:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260916122354epcas5p401fd6470d6cef75951af732b03aa5970~VzKSrhk6G2362023620epcas5p42;
	Wed, 16 Sep 2026 12:23:54 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260916122351epsmtip2a0d230ddcf74ce15a76721bae9f3f745~VzKP1PVk31938919389epsmtip2g;
	Wed, 16 Sep 2026 12:23:51 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Date: Wed, 16 Sep 2026 17:52:28 +0530
Message-Id: <20260916122229.2604003-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260916122229.2604003-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122354epcas5p401fd6470d6cef75951af732b03aa5970
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly addressable
rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation. The existing samsung,exynos-dwc3 binding describes the
parent and child representation used by existing Exynos SoCs, which can
be migrated to the flattened model.

Samsung Exynos SoCs sharing the same flattened model can be added by
using the samsung,snps-dwc3 fallback compatible and extending the
compatible enum with per SoC clock and property constraints.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---

Krzysztof Kozlowski is added as a maintainer of this YAML binding, as
he is the ARM/Samsung SoC architecture maintainer (ARM/SAMSUNG S3C,
S5P AND EXYNOS ARM ARCHITECTURES) who already maintains Samsung Exynos
DT bindings (e.g. samsung,exynos-dwc3.yaml) and reviews all
Samsung related binding changes. This follows the same convention used
by existing Samsung Exynos DT binding schemas.
---
 .../bindings/usb/samsung,snps-dwc3.yaml       | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
new file mode 100644
index 000000000000..480308c16f37
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,snps-dwc3.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/samsung,snps-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos SoC DWC3 USB Controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Selvarasu Ganesan <selvarasu.g@samsung.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: samsung,snps-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - samsung,exynos8855-dwc3
+      - const: samsung,snps-dwc3
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are:
+       - ref: Reference clock for SOF/ITP generation.
+       - bus: Bus (APB) clock for register access.
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref
+            - const: bus
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@13200000 {
+        compatible = "samsung,exynos8855-dwc3",
+                     "samsung,snps-dwc3";
+        reg = <0x13200000 0x10000>;
+        interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&usb_clk 0>,
+                 <&usb_clk 1>;
+        clock-names = "ref", "bus";
+        dr_mode = "peripheral";
+        phys = <&usbdrd_phy 0>;
+        phy-names = "usb2-phy";
+        snps,quirk-frame-length-adjustment = <0x20>;
+        snps,dis-u2-freeclk-exists-quirk;
+        snps,gfladj-refclk-lpm-sel-quirk;
+    };
+...
-- 
2.17.1

