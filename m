Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540003FFF94
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419607; cv=none; b=i1b/DOyw8edocrjG7LTgnnmCFeEwOJHcwb/+Hhw6vgXn6vFV8EMI5uw0H6ilQwBtbj8XNvcDf2hQwuH8g2N2ToX1eJT8WmASpNRwMsFBeT4+o/9kz71oBHn57AjxGyShcSlyB5zZpkMKOYa7DHAeD8h3prqVYGCh11fyinAISxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419607; c=relaxed/simple;
	bh=6bYwP1kZBZ++mg/QTFZGU18TMlZOpyQ31rYtNQZOojo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:Content-Type:
	 References; b=CMGQeGkSSzuF2aJUoaD2KguPEXHDdHYuQtiVXruru8lu3lYvgA2jJ0BhuAHh2lg+Rrx/qYpvDf2NeuA1CKpM1pO1bNm6giIoQtsK9C9lAQ4JSf2++Y+C8MLdB87LwHkr/g5+gAsQR7l2SXqoi347jGbRPUkWsgA+vrwz4HSuBU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EqzJUY0p; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EqzJUY0p"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260903071320epoutp046493017230ac0714cd9e19fc7396767e~Rvia8krL_0762507625epoutp04l
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Sep 2026 07:13:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260903071320epoutp046493017230ac0714cd9e19fc7396767e~Rvia8krL_0762507625epoutp04l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788419600;
	bh=BnxZREpoQomMdni/0IbPmEvnTyI2nuMEf4vRri/185k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqzJUY0p4eaEhIq8RyaRRkbsplFwaOJFeXUEEDw3kQcDFbRd2KfQKSHablegT2e68
	 9O16/tKRBcvEqPWgHMKrUoDenKXNfH+bR+vq9GTkQfQKxn4eVB7T0yJwubaFQQQ3IB
	 M2fQqxW2BwS/MrRQcZdIvAsYxkpk0UrVqwUVwxtg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260903071320epcas5p1e4e4d69e93efaf2f2b3ae59d2045154f~RviacGfoO2447024470epcas5p1a;
	Thu,  3 Sep 2026 07:13:20 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hb9mb0sswz6B9mJ; Thu,  3 Sep
	2026 07:13:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260903071318epcas5p4b804edb84554847c576d1d034b814d7a~RviZEeIdN0465304653epcas5p47;
	Thu,  3 Sep 2026 07:13:18 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260903071315epsmtip1689e8b7180bcc558724f6b8c00059c43~RviV6Jy-p2402924029epsmtip1T;
	Thu,  3 Sep 2026 07:13:15 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: krzk@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com, shijie.cai@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Date: Thu,  3 Sep 2026 12:42:49 +0530
Message-Id: <20260903071250.3421499-3-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260903071250.3421499-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260903071318epcas5p4b804edb84554847c576d1d034b814d7a
References: <20260903071250.3421499-1-selvarasu.g@samsung.com>
	<CGME20260903071318epcas5p4b804edb84554847c576d1d034b814d7a@epcas5p4.samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>

The Samsung Exynos8855 USB glue is not separate from the Synopsys DWC3
core, using a flattened model where the DWC3 controller is directly
addressable rather than nested as a child node of a glue layer.

Describe the Exynos USB block as a single node, referencing the split
out Synopsys DWC3 core properties via snps,dwc3-common.yaml. The new
binding follows the same approach as qcom,snps-dwc3.

A generic fallback compatible "samsung,snps-dwc3" is introduced to
describe this binding, selected by the validator based on the presence
of the fallback string in the compatible list. Future Exynos SoCs
utilizing the same flattened model can be added by extending the
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

