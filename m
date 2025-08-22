Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C020E2FD1C8
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855028; cv=none; b=t4IMZ4p1LoAGWzR+mfqE87MT135VILNghP7aSk46v3JM3gGe0GbNTmp54ZOfnEPsCrhbukPDFSc7OGvG6THW5RrupU6/FZhzh6sgrRGyZ+x6Zt4fXhtH4VwUGdtD9Lg4bVW2mSEdUN+nun/gAn+l9Jfk8B/VtEkGtkKkOBgY4Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855028; c=relaxed/simple;
	bh=CGZC9rvDYJn6hoomOPZa+LcY3gSlz6wSmOoeiMhP2IU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=QzBcfUhC3CCdUTAIic91PEdasRRYipONRtyWfmb84X7Sxz6F18Bkpv3EjjkQgGfK9nmFyiRr7Usb9jDsLdELfNLpw98uU20rux02ZnaeVYe8/Z5MB3Y9IvEFKvEQHpESk+euYgq5hWIQhwW+mjbVSMaCos7zOgLnKvj7NZaWt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XzD4ZkWM; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XzD4ZkWM"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250822093025epoutp0368c3e61806350343f7907476e3148d88~eDNepQXtk0873508735epoutp03R
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250822093025epoutp0368c3e61806350343f7907476e3148d88~eDNepQXtk0873508735epoutp03R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755855025;
	bh=Gq+PpG5cVj4mp8JBa0dZZvGn/EEDRm/JzW0Q8UqHc3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XzD4ZkWM3FTRvFeP3iVAUO197ilgj8h0S1DNyQP2XFIDOq0+mc8A6yC0AG3TtbLq6
	 yIuaHJ9G/fKyLaDMmSzxwtYQGEFr/RuJISWN2mihv3MM+KdIFJzl1oCDgXlp3pj3Bb
	 smlFr8KGy2qY9MvyVrBNPi/UrRGRz4xwVJ8ZGToU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250822093024epcas5p13a69b1277f50affcf4862339dd4540da~eDNd2TI7q1782717827epcas5p10;
	Fri, 22 Aug 2025 09:30:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c7Zfl2Fkfz3hhTF; Fri, 22 Aug
	2025 09:30:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f~eDNcRlRyr2690826908epcas5p4w;
	Fri, 22 Aug 2025 09:30:22 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250822093019epsmtip2641178230191f30da0a89d4d5af595c9~eDNZQkGfV2817928179epsmtip2b;
	Fri, 22 Aug 2025 09:30:19 +0000 (GMT)
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
Subject: [PATCH v7 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Fri, 22 Aug 2025 15:08:44 +0530
Message-Id: <20250822093845.1179395-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822093845.1179395-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093022epcas5p42d8c16c851769dab0e1da9d45743ab1f@epcas5p4.samsung.com>

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

