Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF12741AC
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760079669; cv=none; b=Nrb9Ql/d3oEsWu87uS63DEUPmZlLJRUs075fAS6j/uxCaKhjAazmI+PZB+nwtS/Wd2Nde7hpx6ChRD5obeCoIGgNJaMyyGSklxoRjzS5Q+jQRIfPwpKxWKo/YUWsbHk/jQg7TC6ZThNZOAc7HT4PQuxAlXRi6KmrBVooluh7tRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760079669; c=relaxed/simple;
	bh=w2pNTyI+FkJBrQ9E9U10RZC4PqEIJhjnGH2mtq7UiYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Am4oAL/NIKD5C8gKb8swfXYOSRtmnhENPBP0nzS41SJQfAJAluFSEWd/58l2fXqnMQyBFThVh2oy04RgIGYMCmqlEEPwg1qB0vlSNomd47nMK0Nov6ke0oP3jMixz4EK4Ud2ghCpG3J7n/DThA2rlS37fMgaEPFbu/uK0CPcRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UcI6IId/; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UcI6IId/"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251010070103epoutp03a5e2516446e53896f6c3b1ca4506651f~tDyEB41Q51920219202epoutp03k
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:01:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251010070103epoutp03a5e2516446e53896f6c3b1ca4506651f~tDyEB41Q51920219202epoutp03k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760079663;
	bh=jNEfzAYNR9/nDHDLmB8YDO6rgg8PhpHBNkpglcMtp9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcI6IId/QfXIzyZh10dWvEWPGyPgATnJGy46G1ZDwVQWPtOjK2IPq8iEBNai0462w
	 /hvFh3Y/IxQirjCbatFmX0HYB5NDmqBV0UwWXYJBy/BQpLO1tFmi5THE1DB7k1WzqQ
	 +rv2S1HO72DHJP345dmcdOzh6H1vnTod1kJGQTLI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251010070103epcas5p13dc4469f13ed96a1a0fefbef4b2ef53c~tDyDhioeg1415114151epcas5p1F;
	Fri, 10 Oct 2025 07:01:03 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cjd1p2HvXz6B9m6; Fri, 10 Oct
	2025 07:01:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20251010070101epcas5p1be06087e5511f4a3fc387b232e0353b5~tDyCCumkg1211212112epcas5p1R;
	Fri, 10 Oct 2025 07:01:01 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251010070058epsmtip20f29a36baa1ca8a74add180edc15aa40~tDx_vb0_v0784907849epsmtip2a;
	Fri, 10 Oct 2025 07:00:57 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	johan@kernel.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v9 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Fri, 10 Oct 2025 12:39:11 +0530
Message-Id: <20251010070912.3758334-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251010070912.3758334-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251010070101epcas5p1be06087e5511f4a3fc387b232e0353b5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070101epcas5p1be06087e5511f4a3fc387b232e0353b5
References: <20251010070912.3758334-1-pritam.sutar@samsung.com>
	<CGME20251010070101epcas5p1be06087e5511f4a3fc387b232e0353b5@epcas5p1.samsung.com>

The USBDRD31 5nm controller consists of Synopsys USB20 femptoPhy and
USB31 SSP+ combophy. Document support for the USB31 SSP+ phy found on
combophy of the ExynosAutov920 SoC.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml     | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 4a8bcf63cd91..72d41ccdb090 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-combo-ssphy
       - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
@@ -230,6 +231,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usb31drd-combo-ssphy
               - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
@@ -254,18 +256,32 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usb31drd-combo-ssphy
               - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
         - dvdd-supply
         - vdd18-supply
-        - vdd33-supply
 
     else:
       properties:
         dvdd-supply: false
         vdd18-supply: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      required:
+        - vdd33-supply
+
+    else:
+      properties:
         vdd33-supply: false
 
 unevaluatedProperties: false
-- 
2.34.1

