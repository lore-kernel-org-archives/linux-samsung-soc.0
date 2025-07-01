Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7222094
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375280; cv=none; b=hzMTt5tLYSCzdEzKP3aMMzptT0DphhXClvZ68+Nc7Ii3YYGiVDM0VKZ4yx+eTNGyP6a3aXJVmN3aNwpSLZujmAmzd6DiolnNcaQcD6gQyK3WU6oSfeOxNaGbvcrOwTSSdKxD4rAml94umWUccTCqfspM8XqSHqyDQ3eQ7GSshvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375280; c=relaxed/simple;
	bh=sfo18rhjx+MnvjGPYwSwlFPsNtPEB9rKrlyHRga8FKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=JcqlykTzoH/3Sx25OPdiL+ICgzTHtymVX8EX6pXNREsMJFJT4mmThEYMf0hcWQad8fP1QruKu+jkLFF1JiWmI5t5lIJbGPyw7CuUtVpIGsYx1lWUSwsYZaQini0/dGMTyRH0UQldkTqkdy1Stt4oSWhqGX4curnULKfMZIwWYyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lL8Z+9An; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lL8Z+9An"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250701130756epoutp023cdb374eb882515e086aea1fa41fc73f~OIoj0W1VN0639006390epoutp02L
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:07:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250701130756epoutp023cdb374eb882515e086aea1fa41fc73f~OIoj0W1VN0639006390epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751375276;
	bh=JgnhviKDwcEkzqEavBNjnoGVBk5ClTzXwbk+ec1DARo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lL8Z+9AnRIqdhnPclPzn0hzkfWvFh0y0Ofq0QFj/4FFqb7bQa0mMBAmfjgdJfj7GX
	 TK1GOjyHDjl6m44ShEyA0fJL9EKowiPEXX5uWcI19iifi7itbgupXTLfj8ThQgPWYc
	 9U2sPadATskrHV3QX2TuTyNcHei8eZBlpQHgMzLM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250701130755epcas5p22ab68adeef6288e7c8cc5a7e48343b8a~OIojEhiQA2000520005epcas5p2p;
	Tue,  1 Jul 2025 13:07:55 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.174]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bWjxk0DJmz6B9m6; Tue,  1 Jul
	2025 13:07:54 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63~OHtLRTmHW3228232282epcas5p3d;
	Tue,  1 Jul 2025 11:59:55 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701115952epsmtip1c46584c57e4a72ad1d06026394084dbd~OHtITE5Zt1373113731epsmtip1r;
	Tue,  1 Jul 2025 11:59:52 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	neil.armstrong@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Date: Tue,  1 Jul 2025 17:37:01 +0530
Message-Id: <20250701120706.2219355-2-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701120706.2219355-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701115955epcas5p320cfe73ca33522cd2f9f7970cfde1c63@epcas5p3.samsung.com>

Add a dedicated compatible string for USB HS phy found in this SoC.
The SoC requires two clocks, named "phy" and "ref" (same as clocks
required by Exynos850).

It also requires various power supplies (regulators) for the internal
circuitry to work. The required voltages are:
* avdd075_usb - 0.75v
* avdd18_usb20 - 1.8v
* avdd33_usb20 - 3.3v

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e906403208c0..2e29ff749bba 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-phy
 
   clocks:
     minItems: 1
@@ -110,6 +111,15 @@ properties:
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
+  avdd075_usb-supply:
+    description: 0.75V power supply for USB phy
+
+  avdd18_usb20-supply:
+    description: 1.8V power supply for USB phy
+
+  avdd33_usb20-supply:
+    description: 3.3V power supply for USB phy
+
 required:
   - compatible
   - clocks
@@ -235,6 +245,33 @@ allOf:
 
         reg-names:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynosautov920-usbdrd-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: phy
+            - const: ref
+
+        reg:
+          maxItems: 1
+
+        reg-names:
+          maxItems: 1
+
+      required:
+        - avdd075_usb-supply
+        - avdd18_usb20-supply
+        - avdd33_usb20-supply
 
 unevaluatedProperties: false
 
-- 
2.34.1

