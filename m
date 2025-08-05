Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D586296145
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414540; cv=none; b=FeqE1GLmyTmRqRzxDRd93XQ9JPLZ5Ri/gZyOWx9YhbJUkwxiHhdXHcheaJPrRVXl1dTr9YqS/Jw2tAJJ+7wdTRT/HNDninglhsDB4N8sBC5Aydu+AI8BCo6jjaxydI7VKUZJaTwZH3Y4aPNbJNs/qRGzFh1SQhKjlLg+Wwddxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414540; c=relaxed/simple;
	bh=M42Pkv+2O3RHZp2p8lvNPcTfwnr5qu4Wp0fPV5hvqXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cVEQWkyiiuvZ3Unfvac6nlf2WEZC72jXN7E00CBuHAwN3UkZlNI8+FA1lRZPQ8E1/jm8uWSEY7qBu/RAXVOCu8dL8W2q/5KSvUsuBEdZHxgFukgFjDBLj9Of4tG32p8CjYwdGAAg8CuRMImk+cMxxFizJM6xPwMdLptnJcS+hOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jkKZnSHC; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jkKZnSHC"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250805172216epoutp03877375c8885296d05c35589b166d74b7~Y7rnIWxqG0097100971epoutp03i
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 17:22:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250805172216epoutp03877375c8885296d05c35589b166d74b7~Y7rnIWxqG0097100971epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754414536;
	bh=l4q8MX8CATXRHpiVO/WpCJL4YnEHmgp04TW4vRLD6OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jkKZnSHCS3miJo3fVWT6c0tvq+fgyw0KNf9UxnJ7gtpDFY1rP3xMFofqweRddHqBV
	 isLBY3JH10yaMkV1kdVw8dKg/ihIo8WclRCbrtjqvyIbnwfF57sCPe2Y3rJupY3ufK
	 bQK5ai8FIEkdLh1yCvoCqz/Qai8QWnMciX22jhFQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250805172215epcas5p1f78948ec4bdeb49df47afecdd5c644ba~Y7rmQN8Ds3014130141epcas5p1G;
	Tue,  5 Aug 2025 17:22:15 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxKx24k5nz3hhT4; Tue,  5 Aug
	2025 17:22:14 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a~Y3DfD36Zq1521815218epcas5p3d;
	Tue,  5 Aug 2025 11:43:06 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250805114303epsmtip1cc4d64568a5ff83276b57953e8948eed~Y3Db8IMhR1482414824epsmtip1B;
	Tue,  5 Aug 2025 11:43:03 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, igor.belwon@mentallysanemainliners.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v5 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Tue,  5 Aug 2025 17:22:11 +0530
Message-Id: <20250805115216.3798121-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805115216.3798121-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
	<CGME20250805114306epcas5p37782c02ae0ddc6b77094786c90af247a@epcas5p3.samsung.com>

This SoC has USB2.0 phy and supports only UTMI+ interface. This phy
requires two clocks, named as "phy" and "ref". The required supplies for
this phy are vdd075_usb20(0.75v), vdd18_usb20(1.8v), vdd33_usb20(3.3v).

Add a dedicated compatible string for USB HS phy found in this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e906403208c0..1932a2272ef9 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -110,6 +111,12 @@ properties:
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
+  dvdd075-usb20-supply:
+    description: 0.75V power supply for the USB 2.0 phy.
+
+  vdd18-usb20-supply:
+    description: 1.8V power supply for the USB 2.0 phy.
+
 required:
   - compatible
   - clocks
@@ -219,6 +226,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
         clocks:
@@ -235,6 +243,17 @@ allOf:
 
         reg-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      required:
+        - dvdd075-usb20-supply
+        - vdd18-usb20-supply
+        - vdd33-usb20-supply
 
 unevaluatedProperties: false
 
-- 
2.34.1

