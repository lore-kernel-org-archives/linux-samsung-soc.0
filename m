Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792761351;
	b=lLbPrjkao22W3NmANhj7a2lYs5dGSZaptMlR8vEXu+uKEVMadnpwZpoO8rKKyj1y0Toa
	 CH0cwbjiXjt175Jqxd8CTwFSvbEmF6ZSRcz8pJeAlM/Q1sIa5S3NcRp0Th9dGP9Bfjs5C
	 08Dc70MvqIZp2iL8ajm6JBJlIr1kUwGgfv2IvI9Weg5Dew9dzaieNfk5/DUcDRaKAA9eq
	 swvN4OE4u7huNhu6Po0KL/rcEdkDOfnfrbHToRVXiyyTahdcadQ1zubUfKbub86Bqqeui
	 BP/tlfuO033jDV61Hnmn9zGQCMpDxAaYOfUeSJk39MIG4hBrhaYCIhmtty/hu/XyHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792761351;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=;
	b=cIkZp4u+DB6xrni76IgIIUr9cUYPpDaNrxjctf1MDZhtZhs6sLPG9qNa9fnVAJsdjUWz
	 ZLvJQ6FTJ6I2YpQJF1Bzr0sG1eHmUMFIA952rRtEOAieIalqekOqL4/2vqGdM7y9XZ5vG
	 F57MlrLVK0nAG98PukAw8uZfvYHIBJ2JxEp2s6+nOnojo0d+XLq5AM1GgvAQgcsKd5Fao
	 ZKQFeGSoiBXJCtTQbpa+wVdUq+NmZ/XCO9/UkBsozTQEp7GSmUBq33opT6Wx3N/iyASbO
	 QAV5z62YDSmYj0Oawr5jjbtkKypNo9rj9myYRyIm3amSWWv6K+fSPM2it5TVSXKrnag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mVGGwHjl;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4273606A31A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 13:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4273606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mVGGwHjl
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261023131548epoutp03341eab3210287afc07ac2a94e1551897~hKvK-FakQ3172631726epoutp03b
	for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Oct 2026 13:15:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261023131548epoutp03341eab3210287afc07ac2a94e1551897~hKvK-FakQ3172631726epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1792761348;
	bh=cdpF+fVt2Hy2HfAcjpixN/WDxEX2Gn1Ra3OqY32SpVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVGGwHjlJfnuh/4+7+Ci5EO+0VrPVE/ID3N16GY7xk2HufMz8Zu7DApt4jlTHlBa7
	 Kn2rzMwGmklvJWSYc8OYYp8/3WbazSLys/EwhLEjvJr5+KJNWo0S2D6LNDmPQCmemu
	 Q41VhPDT0SfgZqQAvVd2It/p6hQFyxUGmb3YMlYo=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261023131547epcas5p209499d6511be03591bb323d282998a0a~hKvJ8q5X10460604606epcas5p2V;
	Fri, 23 Oct 2026 13:15:47 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jB3Rk4SDdz2SSKY; Fri, 23 Oct
	2026 13:15:46 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc~hKvIRFYpW3047030470epcas5p1q;
	Fri, 23 Oct 2026 13:15:45 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261023131542epsmtip2ba58969fa0472da8c45d845928488ab5~hKvFhqAQp0806808068epsmtip2C;
	Fri, 23 Oct 2026 13:15:42 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v3 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller binding
Date: Fri, 23 Oct 2026 18:45:00 +0530
Message-Id: <20261023131501.3157463-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261023131501.3157463-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc
References: <20261023131501.3157463-1-selvarasu.g@samsung.com>
	<CGME20261023131545epcas5p1eff195129ccfb0fb476d3c78e6a507bc@epcas5p1.samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list

Add the Samsung Exynos8855 DWC3 binding using a flattened node
representation, where the DWC3 controller is directly addressable
rather than nested as a child node of a glue layer.

This is the first Samsung Exynos binding using the flattened
representation.

Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---
 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
new file mode 100644
index 000000000000..d8983c310d31
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/samsung,exynos8855-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos8855 DWC3 USB controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Selvarasu Ganesan <selvarasu.g@samsung.com>
+
+description:
+  Describes the DWC3 USB controller block implemented on the Samsung
+  Exynos8855 SoC.
+
+properties:
+  compatible:
+    enum:
+      - samsung,exynos8855-dwc3
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
+      Two clocks are used:
+       - ref: Reference clock for SOF/ITP generation.
+       - bus: Bus (APB) clock for register access.
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@13200000 {
+        compatible = "samsung,exynos8855-dwc3";
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

