Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DF02E0927
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884595; cv=none; b=IjUlLdOYx4oHgiNMMkd3PuimcSUGZbwk+yt6KxXzg6zrn/RP1hHYkYmpsHD4MV58ux4hbx43F0cMp208wflyq54w6nW7JwbL85rLuDkNDg2P5OaMEcH6NflS3Nst/CD6VUkgtP7w43090gE4CwDRL4wYHiGWrAWtSU0TBi0doyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884595; c=relaxed/simple;
	bh=NnwsCIAo9crWwevyth/UDVKqxje3frkUx9ImbIZzwgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=msgtvXUhjC66gxoZToXnifDaVRE/tyVyDXj5rCJ1vQ6zB+q8a1ZUs+oyVuMak2Mx4ImemlbL/0sXPCXMxS9aZa0JsT4hvOsj2sI4j8kq9+2ThmQ7aMy9LA/P1QMDXgxbUQkuYugy8L4ECWycc4SJR3C5CSOMlHCeDbFyqCp4EjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=UCk+SPk4; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UCk+SPk4"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250903072952epoutp01692e228a9c84f0dbcee501404c830c10~htTpr6cA31337313373epoutp01z
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:29:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250903072952epoutp01692e228a9c84f0dbcee501404c830c10~htTpr6cA31337313373epoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756884592;
	bh=TpuYL4TT61lQI9x+lJB1ZTckMbvty0pgE6VMnOCTsnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UCk+SPk4mku7KQMh1sLhcUfFM2ajMqPk/yMDVugl1jV3cekR+2xgLU7x3ITPx9iYC
	 KHMQ/CqBTudMpS711QDqN2sdTdp9yma0d6/EEiF+Sp5+lnInykCvFQ44l1bxNM3hl1
	 jOvWseO9n3YK2+bwbCrnfr41O3DS86QcXoRFFrzc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250903072951epcas5p2532bcdf559d1db330fdc8619e96a8460~htTo9aiZS1205312053epcas5p2I;
	Wed,  3 Sep 2025 07:29:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cGvQ62bDHz3hhTS; Wed,  3 Sep
	2025 07:29:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250903072949epcas5p11a1e474fad83ff3036be2c443ed5bc35~htTnHrOau2114721147epcas5p1K;
	Wed,  3 Sep 2025 07:29:49 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250903072946epsmtip2c4c26661b9c4e852e257cab46c8c124e~htTkPc_AO2480024800epsmtip2T;
	Wed,  3 Sep 2025 07:29:46 +0000 (GMT)
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
Subject: [PATCH v8 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo ssphy
Date: Wed,  3 Sep 2025 13:08:26 +0530
Message-Id: <20250903073827.3015662-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903073827.3015662-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250903072949epcas5p11a1e474fad83ff3036be2c443ed5bc35
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072949epcas5p11a1e474fad83ff3036be2c443ed5bc35
References: <20250903073827.3015662-1-pritam.sutar@samsung.com>
	<CGME20250903072949epcas5p11a1e474fad83ff3036be2c443ed5bc35@epcas5p1.samsung.com>

The USBDRD31 5nm controller consists of Synopsys USB20 femptoPhy and
USB31 SSP+ combophy. Document support for the USB31 SSP+ phy found on
combophy of the ExynosAutov920 SoC.

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

