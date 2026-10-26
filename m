Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023077;
	b=FD+R761/MIDyYnE4sdu+wun1F7jp1ewPM3HateW5g3AK1YIS5iTJdXBrsO3fen1TyqwZ
	 D71ngEyTU2937AiKA2OljbXAytSx2rrPcOIH36+XB2sh+0RUKlshpl0OkiTEJvoY9qr/u
	 LWYGK2I+5xIzgR+QWsR4RniPVOv/CM1HAyqK12P5UqawLVjn9Jjj4kbgwiEVBkJpqFxyW
	 Nwb6YlkO/gmSDqVmfirM4oJtwZlVLgEVSWaEr3s4Ojt2SoViBzjcE/037KwbaD9KoZYta
	 Gf2i+CwPJ44KHE1ZO2xQcakUYEFe4q3i/gUqDju7fzCtIz3MxGvPFbTcFpgv6s+2DDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023077;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:
	 cpgsPolicy:X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=JKdhQiOmdCsaaqBF8qWcsHGORlwa7z3ZiWBezdGBF/g=;
	b=4xx/XNHH3GJxCcCQKvbP5XfUaVg6wj303QLv/VfwrmGUIteFWUuhPrD3BPH3FiksfrXL
	 7cP27s+/wSfly3dTIrqUnYf+dIcT6FMiwbgnPCQqVgPEoAY0+Q3umc3Ys0RiRG0dxL8Ik
	 6vX1Zr4m7FqPl3lwgebHugK7yvWYZNDOvEgk7DoqE/gq+NKVkTrCqh2mGu8Lqinjbb248
	 HzSlfkUcsB76Hb4DInEQIzNXmorLnPCLaJRX8yi89KMuK2P4u6Hu0ZMMNDLdVMdj5AS4G
	 8qa4uWrF40nPsjOszVAEr2LvSPhcU9iAdmaePNbWEPAFcyJUdfkil3j1mv8oer20mKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aK60vapI;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B030606A32C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B030606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aK60vapI
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261026135754epoutp03f63bee11e2151109335b68cf224f7008~iGPxpJBsA1329813298epoutp03N
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:57:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261026135754epoutp03f63bee11e2151109335b68cf224f7008~iGPxpJBsA1329813298epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793023074;
	bh=JKdhQiOmdCsaaqBF8qWcsHGORlwa7z3ZiWBezdGBF/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aK60vapI0AWHbrOew2Lu7P1t9SC5KiJEgf1FvVsJD6wHezPXO9JXAuVRVXVsEDCjz
	 cWjRuWCA/y+IjURe+kJ61GXAihngER1ycum1SXXn5vxjc2k0XmouIMeWiwvRmqy+1q
	 n5MIxrNGmP22ed5jDB5He45tFTNoPnmTyF9eK1bc=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261026135753epcas5p45ab627f117aa3abac4e60a193f90fe66~iGPxKHSBs1250512505epcas5p4A;
	Mon, 26 Oct 2026 13:57:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jCwDw3ttYz2SSKY; Mon, 26 Oct
	2026 13:57:52 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261026135751epcas5p42c28c8315cd25554a11032714b85bbed~iGPvuSnZ41250512505epcas5p4-;
	Mon, 26 Oct 2026 13:57:51 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026135748epsmtip24fb2850f7c59f2c8e06a5ae1f9928f87~iGPs3FI2B1343713437epsmtip2x;
	Mon, 26 Oct 2026 13:57:48 +0000 (GMT)
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
Subject: [PATCH v4 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Date: Mon, 26 Oct 2026 19:27:14 +0530
Message-Id: <20261026135715.33071-2-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026135715.33071-1-selvarasu.g@samsung.com>
X-CMS-MailID: 20261026135751epcas5p42c28c8315cd25554a11032714b85bbed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135751epcas5p42c28c8315cd25554a11032714b85bbed
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
	<CGME20261026135751epcas5p42c28c8315cd25554a11032714b85bbed@epcas5p4.samsung.com>
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

