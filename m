Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880880;
	b=s/IIZK/8VhNKxjxZADBcTrPEG1bWcuQ5wnKY7FCeRwZV4Jt0GmepXEUxWPE6+9ktiA3M
	 XUP3yEbbJV1xT/rAlYZNqBzq2wQKBhqx9mzYzwX3D4iYnwvhe2UMJNh5vE3Vyp/s8LuZ5
	 uTpvYnjTYFA50WJHjTbc0Qc1RYmkOWPhnz/vfHLLJ9bZF/gWGPK8s6/35hbL8RQIWM10+
	 O15DHAvLFrRhfA2xmH2IzDr4sDnSzcYuBfBQONrSUV51DSqV84eKiQNs9ojOJzGpZyrJV
	 hVOgQi2EzjGWexfPYRkWQC0CaPBwJN/52d1oTWvGbhmIa4wcQqUZn2enn5onWn0qqlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880880;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=Sh8XuEouFSxM3Nere9HIciNOvbIlIxwEdyp0u63ZD0M=;
	b=CEGXO+5Ij0joMKI9SjtT6twEWLMkE+exP2xOSOnEOvPF0CDo5dEU7j6rOhsz3M0+6L4Q
	 /rmw/XGXq/TS56qM8ZVwuCI5BJPI6ohy1/jv6msLG2x17uNCQopEeg0NRH2y211Eq4Dw9
	 a6CuQpyJsMcfESBMX9TlY2J455A8z+CXdjTI/aObDC/ttuWQw6iC22rn0mwWlAZoAHl3b
	 2ZCLsIAgA7Oy2RfrHxoD/339ArKXonNIx4oqWIlx8avr/D1JwNBz7IBR1dm2B58fMXVfq
	 uwH71GnVpoqKE8USOQh/Y/YyIg8mhi3IwaO7Bv+oCXfxNURq+mBIkg2q/d0ChSl5hKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=PDybQWtJ;
	arc=none smtp.remote-ip=203.254.224.25
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C026606D81C
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 12:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C026606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=PDybQWtJ
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261105121431epoutp02e3efaacd0526e2640f2754d77bea7a64~lJSX1KA_t1418914189epoutp02P
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Nov 2026 12:14:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261105121431epoutp02e3efaacd0526e2640f2754d77bea7a64~lJSX1KA_t1418914189epoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793880871;
	bh=Sh8XuEouFSxM3Nere9HIciNOvbIlIxwEdyp0u63ZD0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDybQWtJtaT7HN37J2PX4Ws4OFuscgdPQbVh8Efrhh4YTk8biaj49+hOvWkpkY3M7
	 vuw6S6E2CD3toP5oXcs4wYxPamYgkt4L8WrAbtLRhbllk0nzfJqO3uh0dJrkBstrvk
	 LF4RuyEfEwphJsWdcYwHWtkgQ+MTtz1Oj0BlcZL0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261105121430epcas5p34f3ca1eb34c18b8da084aae5b60407af~lJSXKYc_Y2560125601epcas5p3B;
	Thu,  5 Nov 2026 12:14:30 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.88]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jL1T15JsDz6B9m6; Thu,  5 Nov
	2026 12:14:29 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261105121429epcas5p39d2113969a054d297cda76a67f309c14~lJSVreVaO2344923449epcas5p32;
	Thu,  5 Nov 2026 12:14:29 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261105121426epsmtip1d622e1345811eb639be62820813704d9~lJSS_xApT3060130601epsmtip10;
	Thu,  5 Nov 2026 12:14:26 +0000 (GMT)
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
Subject: [PATCH v5 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Date: Thu,  5 Nov 2026 17:44:00 +0530
Message-Id: <20261105121401.1661711-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261105121401.1661711-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261105121429epcas5p39d2113969a054d297cda76a67f309c14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261105121429epcas5p39d2113969a054d297cda76a67f309c14
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
	<CGME20261105121429epcas5p39d2113969a054d297cda76a67f309c14@epcas5p3.samsung.com>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
new file mode 100644
index 000000000000..664c26c1a9ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml
@@ -0,0 +1,71 @@
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
+  clocks:
+    items:
+      - description: Reference clock for SOF/ITP generation.
+      - description: Bus (APB) clock for register access.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: bus
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
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
+        clocks = <&usb_clk 0>,
+                 <&usb_clk 1>;
+        clock-names = "ref", "bus";
+        interrupts = <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>;
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

