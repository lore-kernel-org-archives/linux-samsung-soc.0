Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47C12EA489
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755761304; cv=none; b=TY/AhQTrB3+NXf4M8k3DCCRxZPhFifoFsP48Tv+KOxmE1LGSjM158MeFOmtwfnf9D9oE6YyTdiUBX6jyRTQOj/TaUZeXHhbKEwm5cXbpa8ohYt8Op8y9Oc6lHCETGPPto3OdWmDPHI0SVNDI1obsa0CnRbJTaHfkQd2SuLoQGn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755761304; c=relaxed/simple;
	bh=CGZC9rvDYJn6hoomOPZa+LcY3gSlz6wSmOoeiMhP2IU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=fbdzZ6rtOS3Zh3G5BtPSBCUeRIeF/TU0q4jUfOgOSYsgu0APqzoYKxXRsgc7w+F87am5TXha7dFzSurFJWdBi1DJGw2t9OpGM1MWOl4q7QQ/W3MT+dwhbDETy+jK+SbBOhsuLH/P4RDOH052O1dq0WIteXO6sfYUtYAvouipRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=SAlq6O4j; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="SAlq6O4j"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250821072821epoutp01bffcb2a1b39c8c8002fabe89ce69ee32~dt5nRYeCy2112521125epoutp01N
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:28:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250821072821epoutp01bffcb2a1b39c8c8002fabe89ce69ee32~dt5nRYeCy2112521125epoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755761301;
	bh=Gq+PpG5cVj4mp8JBa0dZZvGn/EEDRm/JzW0Q8UqHc3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SAlq6O4jJT2hQCwzXhHHvtAOZ6mP0avF56f4XPE3Z9sVg8nf/fZw3q1sYk1XhiY6K
	 Tb+eY17PzcpHFSk+ihPQnMLGMfxpmbHJ2eBsw380lot58VCqc7OXTrCQ5LlD4Rk4T7
	 9ZrlvVI032LS60g8zjNm5YfnPdfgimgqUaoV+Jfg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250821072820epcas5p24ed0de20d41342b2f7f94aa6b8790470~dt5mk5G911748617486epcas5p2R;
	Thu, 21 Aug 2025 07:28:20 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c6w0M1SmBz6B9mF; Thu, 21 Aug
	2025 07:28:19 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055~dt5k5IxOg0472004720epcas5p1u;
	Thu, 21 Aug 2025 07:28:18 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250821072815epsmtip14ad9e3879f13ec088a32dcaab8c76f77~dt5h4Cuyt0624006240epsmtip1k;
	Thu, 21 Aug 2025 07:28:15 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	johan@kernel.org, m.szyprowski@samsung.com, s.nawrocki@samsung.com,
	pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v6 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Thu, 21 Aug 2025 13:07:02 +0530
Message-Id: <20250821073703.2498302-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821073703.2498302-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055
References: <20250821073703.2498302-1-pritam.sutar@samsung.com>
	<CGME20250821072818epcas5p1763afdfb7f0b4cf48a98d9c4e6eca055@epcas5p1.samsung.com>

This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
compatible to the USB3.0 SS(5Gbps). It requires two clocks, named
"phy" and "ref". The required supplies for USB3.1 are named as
vdd075_usb30(0.75v), vdd18_usb30(1.8v).

Add schemas for combo ssphy found on this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index f0cfca5736b8..96e5bbb2e42c 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-combo-ssphy
       - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
@@ -118,6 +119,12 @@ properties:
   vdd18-usb20-supply:
     description: 1.8V power supply for the USB 2.0 phy.
 
+  dvdd075-usb30-supply:
+    description: 0.75V power supply for the USB 3.0 phy.
+
+  vdd18-usb30-supply:
+    description: 1.8V power supply for the USB 3.0 phy.
+
 required:
   - compatible
   - clocks
@@ -227,6 +234,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usb31drd-combo-ssphy
               - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
@@ -262,6 +270,21 @@ allOf:
       properties:
         dvdd075-usb20-supply: false
         vdd18-usb20-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usb31drd-combo-ssphy
+    then:
+      required:
+        - dvdd075-usb30-supply
+        - vdd18-usb30-supply
+
+    else:
+      properties:
+        dvdd075-usb30-supply: false
+        vdd18-usb30-supply: false
 
 unevaluatedProperties: false
 
-- 
2.34.1

