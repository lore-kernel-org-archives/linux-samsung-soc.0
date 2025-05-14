Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A18C1DB13E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292341; cv=none; b=Z+Rbt1rna8XZV3cwNALhQaAyfxtuXAUGuZOMgR1ndWm2WTB9k7UeT1YQj8iR4Xm/ER6W10huxpfEnQJO+bNily3+PbpOXlH5zLFUPohmGxgUHdlba3ZCnsmLORdtS3MkTrXjy8J7MaDh5fqHbgFYv+aFgKp7hm1st3lfa33gU38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292341; c=relaxed/simple;
	bh=SD64a+azpNmOHW6elx+Vgy/U4vlX/Fjq5QQLhfdVOdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=eOJon+yMkO7R7fyMq9FIBCmH/4xv7h+uusFBapWXX7w5LadRvI9tjZc1UIy0fgpAMkGNR5WpZWBvOjqVc9SfA3h2SbVPAZv2BEqujeV82s30Azf4NTgBBXhDln70LpZ2FyHxnrbe+gjN69GhU5mp5UbeXECDuZTavaMTbBQjeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Vp2Yu1m4; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Vp2Yu1m4"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250515065857epoutp019a5dfbac03c089e5ef1353ccdcda8717~-oR_h_Ycd0470004700epoutp01Y
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 06:58:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250515065857epoutp019a5dfbac03c089e5ef1353ccdcda8717~-oR_h_Ycd0470004700epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747292337;
	bh=cMsc0q9qkQWpITce3vvlurAUL6Xs0c1NrKMPNQ5La5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vp2Yu1m48I7pyrN14VgWJjeE6Gs26W30qZeVDg4O7MNuP66ciEH42do/SZfpOypsV
	 7D/K+ABXwZaf/Oc0J7izGqowXFTrTagkA4gbNlTwrq2YpCOQZTLxEoLhGi5Vwb5jUG
	 5bkowx8EzqAer5sypF88/QP6/m9zUJR70WkoMHXQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250515065856epcas5p19610493c51cff1a20695c0d51ca24a3c~-oR92FcFA0303903039epcas5p1K;
	Thu, 15 May 2025 06:58:56 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zygzf2MMYz6B9m8; Thu, 15 May
	2025 06:58:54 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950~-aFvjhL8R1375113751epcas5p36;
	Wed, 14 May 2025 13:38:44 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250514133844epsmtrp2d1df0f1aedf090fbc10bb17b0461d477~-aFvibPa10193601936epsmtrp2s;
	Wed, 14 May 2025 13:38:44 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-f2-68249ce4f552
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	A7.C5.19478.4EC94286; Wed, 14 May 2025 22:38:44 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514133841epsmtip2583a2a53d24db393c34c094aaee80af8~-aFspFKux2461524615epsmtip2H;
	Wed, 14 May 2025 13:38:41 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Pritam Manohar Sutar <pritam.sutar@samsung.com>
Subject: [PATCH 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add dt-schema
 for ExynosAutov920
Date: Wed, 14 May 2025 19:18:12 +0530
Message-Id: <20250514134813.380807-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514134813.380807-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO6TOSoZBouaOC0ezNvGZrHl1WYW
	izV7zzFZ3NuxjN1i/pFzrBbXbixkt/jz7zybxdHW/8wWL2fdY7PY9Pgaq8XlXXPYLCas+sZi
	MeP8PiaLtUfuslucf9HFarFhxj8Wi2f3VrBZ/N+zg93iy88HzBaH37SzWhxZ/pHJYuedE8wO
	Yh4n121m8ti0qpPN4861PWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG6/8b2QvO
	c1e0PmtkaWBcw9HFyMkhIWAi0Tv3JGsXIxeHkMB2Rom9ex+xQiRkJB5N2whlC0us/PecHaLo
	LaPE0R89TF2MHBxsAqYSE/ckgMRFBHqYJJ5e/cEG4jALPGKSOLDlC1i3sECsxNmFX9hAbBYB
	VYnN1xsYQWxeATuJ78cfsUBskJfYf/AsM4jNKWAv0f3oHxOILQRU8+joE3aIekGJkzOfgNUz
	A9U3b53NPIFRYBaS1CwkqQWMTKsYRVMLinPTc5MLDPWKE3OLS/PS9ZLzczcxguNNK2gH47L1
	f/UOMTJxMB5ilOBgVhLhvZ6lnCHEm5JYWZValB9fVJqTWnyIUZqDRUmcVzmnM0VIID2xJDU7
	NbUgtQgmy8TBKdXANFtgxRe/BYxb/hS6C6duazqywKiNs7wpN5WX//zcGoG7OTvMFyzetW5P
	64xpvUe033PyqbUwHt/Su98vbkbMQg3t2T3fl/Tmy/Bn2vLffVDNkJWea5DQuGXu/9Ps2iZb
	y35clb+0QW2v53+rBQt9+f7encvdn1/8baaQ5AsNd5d7uaFPby7WX/vnTQlPlzKbBdeia7tZ
	uxtM9DJEVs//dvanxEWP5NY3D/9WHb/WcKxu94EFC75KKL/cO/VmFROzm8yqekY7nZaav7Us
	KkFvmUpmJy+Q3jFhY6K6wNx/q0xv37nS0K/kWXbCWi523gXJw2fTu2beD54/m81D2PjgNy9p
	r7DZLGEzpSZO6Pt/VYmlOCPRUIu5qDgRAOlxciAmAwAA
X-CMS-MailID: 20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950
References: <20250514134813.380807-1-pritam.sutar@samsung.com>
	<CGME20250514133844epcas5p3bd8053eba9fb3b64fb0d5989b791d950@epcas5p3.samsung.com>

Add a dedicated compatible for USB phy found in this SoC

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index fdddddc7d611..c50f4218ded9 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - samsung,exynos7-usbdrd-phy
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-phy
 
   clocks:
     minItems: 2
@@ -204,6 +205,32 @@ allOf:
         reg-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-usb31drd-phy
+    then:
+      $ref: /schemas/usb/usb-switch.yaml#
+
+      properties:
+        clocks:
+          items:
+            - description: ext_xtal clock
+            - description: reference clock
+
+        clock-names:
+          items:
+            - const: ext_xtal
+            - const: ref
+
+        reg:
+          minItems: 1
+          maxItems: 1
+
+        reg-names:
+          minItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

