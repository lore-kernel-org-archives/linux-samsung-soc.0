Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA369286416
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 15:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667805; cv=none; b=j8Axf0A92qTKC92GNJi4eov9xFPtr70O3THBOv5nK5uNb9Rbr/L9dDgRbWct1B266etyILpVuEdxLkYRZtcbdShTI0/tRSnxY3eO9BDuR+1FKMj3p0xitQZKA+WrM9RnbuX6Ou8BrvtDuw92McBZo209a/CzQfAVCNy/WAzfRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667805; c=relaxed/simple;
	bh=SD64a+azpNmOHW6elx+Vgy/U4vlX/Fjq5QQLhfdVOdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=iZf7//bKtrco7aaOlNDXHjWJU6TcOodXMbc+qyr2ZQBBqqB12y7S2hhXPnOMsiwwoX0N0Q7jFccv98YeW238tkq0JmnDdswVzMIFCW4GIgOqUc0Nuz2PbL245IMl8y2UY/yTy/sAwWVJ1Sltvba7ZT6mlMrpn93JpRH6GOjWrOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=bPyTYPzt; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bPyTYPzt"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250519151640epoutp0470fde9e1cff0f3c0dcfb755eaf7d38d0~A9pr7HoJR2595025950epoutp04i
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 15:16:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250519151640epoutp0470fde9e1cff0f3c0dcfb755eaf7d38d0~A9pr7HoJR2595025950epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747667800;
	bh=cMsc0q9qkQWpITce3vvlurAUL6Xs0c1NrKMPNQ5La5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPyTYPzte3HP7R7tfM0IvmgA7sl2v3nf0S9O0qSUjYxNMFw9j4z13vVFrpCRO5P0h
	 fMYekBswCKhrM8KgyaZFW9F0lkRLuJ7o178pw3pw6L826AE6U1wTvG7gJkVKQeR3YW
	 21xlDfOid7qHE9BnS2Tkf1+UNeHiuA6s/a8ZUxjw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250519151639epcas5p2014c7fe4950e23ec25e81eb0b928ad10~A9pqsT31b1241412414epcas5p2E;
	Mon, 19 May 2025 15:16:39 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.174]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4b1Lr55h4Nz2SSKX; Mon, 19 May
	2025 15:16:37 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250516101800epcas5p49fdae57cdf1fbec0427720ee38b0f925~-_pDnl-iR0201802018epcas5p4l;
	Fri, 16 May 2025 10:18:00 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516101800epsmtrp17920a8c37711e9008c95699247181f7a~-_pDlyenu0890108901epsmtrp1E;
	Fri, 16 May 2025 10:18:00 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-cf-682710d8d208
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	57.B7.19478.8D017286; Fri, 16 May 2025 19:18:00 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101757epsmtip261abd4d021b1dbc082ba082f7c34a735~-_pAv3Oo62858928589epsmtip2m;
	Fri, 16 May 2025 10:17:57 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 1/2] dt-bindings: phy: samsung,usb3-drd-phy: add
 dt-schema for ExynosAutov920
Date: Fri, 16 May 2025 15:56:49 +0530
Message-Id: <20250516102650.2144487-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516102650.2144487-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMIsWRmVeSWpSXmKPExsWy7bCSvO4NAfUMgz1LVC0ezNvGZrHl1WYW
	izV7zzFZ3NuxjN1i/pFzrBbXbixkt/jz7zybxdHW/8wWL2fdY7PY9Pgaq8XlXXPYLCas+sZi
	MeP8PiaLtUfuslucf9HFarFhxj8Wi2f3VrBZ/N+zg93iy88HzBaH37SzWhxZ/pHJYuedE8wO
	Yh4n121m8ti0qpPN4861PWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG6/8b2QvO
	c1e0PmtkaWBcw9HFyMkhIWAiMWHVL+YuRi4OIYHtjBKP/txggUjISDyatpEVwhaWWPnvOTtE
	0VtGifcb+oEcDg42AVOJiXsSQOIiAj1MEk+v/mADcZgFTjNJbPg4gx2kW1ggQeLl5mmMIDaL
	gKrEpf2rweK8AvYS01pvskNskJfYf/AsM4jNKeAgsXFNExOILQRUs6vzE1S9oMTJmU/ArmMG
	qm/eOpt5AqPALCSpWUhSCxiZVjGKphYU56bnJhcY6hUn5haX5qXrJefnbmIEx5tW0A7GZev/
	6h1iZOJgPMQowcGsJMJ7PUs5Q4g3JbGyKrUoP76oNCe1+BCjNAeLkjivck5nipBAemJJanZq
	akFqEUyWiYNTqoFJx7tvg+rytF37ZP5/yli5y8hxjpf49oO6p6uWH2HvePT287N1cck+2mLz
	W/KMIl/qFjJKme3W27S4TFupNjNeQFp8+3KmvslTL1YcOcnyfpn4St9povaZ83LmnHkgYMbG
	vTTUZuqui2UlJ2eXMzw2vhv+a9/zbeo3zI5KPXKPCPPn/KdfwFnQXy1xq6Tqk1qaavVvH90W
	2yf8DW9Kdt3Y6P5tc1iZjUKZ6dIN2jLLwsr/HVvc0rKjoaJB5l+e1oayOZksyqoOr6Pl43RX
	Oz6tk6sxOCFkfmnGb6/rqo17s7986r+7//v8R8c3TrAP3ccuxOr7VPLGu+q3Rb1pwdtZtIOL
	Mh+yFj6wefuX96oSS3FGoqEWc1FxIgAzlGPHJgMAAA==
X-CMS-MailID: 20250516101800epcas5p49fdae57cdf1fbec0427720ee38b0f925
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101800epcas5p49fdae57cdf1fbec0427720ee38b0f925
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
	<CGME20250516101800epcas5p49fdae57cdf1fbec0427720ee38b0f925@epcas5p4.samsung.com>

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

