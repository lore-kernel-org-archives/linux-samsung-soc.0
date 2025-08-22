Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2370D2FC03F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855022; cv=none; b=Q16walKeQqvbvVAWQl56nezVksC4WdHyGSXa188yDfUT9JaJCfISbcAfFFttx6oejcsAyrr17ebHNkjvtk+rC4697oRn119gWRggVYBxwVd5J/g9CoEfCiGBG5Tf7VqPRFtVaTKgWwfGTt3aHn6FgFxnu4czlIzo9zXD+K9mThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855022; c=relaxed/simple;
	bh=6GebNM2o1GXDgSXOm0UyZPXUQCpsIjxC6vVx2gHkp+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=KoV6CXGushAOCGAtWjx3C0beEW1WWZ/ZMIk1uJAH9kigplEY79A3qV9y+OsiLn/9ovoCEdiijsmLo3GT0lqo56Io/VJXroPATGokUmFTFgWRBsVZpTG15Sk/3wavdKJyIJDdmCZlB9q23NbxRwMpqVTUrq/Br7cQFz8Du9u3uLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lWTtUNqE; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lWTtUNqE"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250822093018epoutp03074ede05e7df083e45801e64d761f2cf~eDNYZamWW0873508735epoutp03L
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Aug 2025 09:30:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250822093018epoutp03074ede05e7df083e45801e64d761f2cf~eDNYZamWW0873508735epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755855018;
	bh=8CcZrXnG1JviyezbOmZi9lSul/m6IUwEsJI7r8Fbjqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWTtUNqEAKye5P+UiIUlpKPzSfcC9YPDF6g2L9tZR3cmCr3jEPdKMYD406zzjPrFD
	 zS5rD5H4yx3HorlBRl1emTa9VfGVXFFxAfvNnbw5DykHRxEo0yiGIDy+OnDnyocoa+
	 v1+6HdTGLBnDt6yZBP3x6i9aTlDRs1UJBjmOf7fI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250822093017epcas5p481c9e85f6b7abec470fc25df42a4145b~eDNXuG0N71315013150epcas5p4i;
	Fri, 22 Aug 2025 09:30:17 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c7Zfc4SZ6z6B9m5; Fri, 22 Aug
	2025 09:30:16 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5~eDNVxtHir1782717827epcas5p1j;
	Fri, 22 Aug 2025 09:30:15 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250822093012epsmtip2f8b081184aa1a652519e157135745e89~eDNSv3KGE0192501925epsmtip2O;
	Fri, 22 Aug 2025 09:30:12 +0000 (GMT)
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
Subject: [PATCH v7 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Fri, 22 Aug 2025 15:08:42 +0530
Message-Id: <20250822093845.1179395-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822093845.1179395-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5
References: <20250822093845.1179395-1-pritam.sutar@samsung.com>
	<CGME20250822093015epcas5p1f479af38c65a6decc900c37fe37537e5@epcas5p1.samsung.com>

This phy only supports USB2.0 HS(480Mbps), FS(12Mbps) and
LS(1.5Mbps) data rates. It requires two clocks, named as "phy" and "ref".
The required supplies for this phy, named as vdd075_usb20(0.75v),
vdd18_usb20(1.8v), vdd33_usb20(3.3v).

Add schema for combo hsphy found on this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e238fd0c9f6c..f0cfca5736b8 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -226,6 +227,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
@@ -248,6 +250,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
-- 
2.34.1

