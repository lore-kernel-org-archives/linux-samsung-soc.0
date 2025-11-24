Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F62FB60A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763981856; cv=none; b=GPVeL+XK9EeX7nRULj7QxHM74nfWw6IzErI7i2yR7jPG8TkQ5dAP3u+Y0I0/NBHqcI3nBsJTcD0rAn1b/7yBGWqFbOC81SAdO6PHSNw//8+W0pNIqOpKbDz2DjfEl79yCJOI8XQhSDNVTfvRogBkQ+U0GzQCHa1M8w6uNh8IbCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763981856; c=relaxed/simple;
	bh=Wpi4i6urYuijC9Ryi9fYX7dGUAfvdi1FTlV4yZyxEXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=nioGppCZ7ExM/CCMldOZiQdBweTYgPl+7LrZ2v76JzMpuhnfSf52zOLhYpgyF0so6uXknWR+d+GYti1L/jLC3A9XUbzHBLWswpBW/TFXyFQAXC7/UbAjR/OTNZz4rbufNhyh6WilxbJoak/PzL6h51DGPNXZY1QVsmHkGieYVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EI5KVkf2; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="EI5KVkf2"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251124105733epoutp049a4ba7d433804f96ff618e700ce96bf1~67CY8p4yK0685606856epoutp04b
	for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Nov 2025 10:57:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251124105733epoutp049a4ba7d433804f96ff618e700ce96bf1~67CY8p4yK0685606856epoutp04b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1763981853;
	bh=bneXz0UXyWELCYVPOmpF4qxJSf87G5fA54r2uU05uns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EI5KVkf2sHTn2kBn7iapmbPpFaj8XhhgXNHqmfOcKrZM2g/NQfZzLcILUXY7KLTWH
	 N1PoBrM5BWNGkfPiONpRHuHxj7MLHeAfnIFQiWRN1VWToIkPgZbd1J036/hLuG6zXm
	 5/pDfRpHZm1b/j4V/WoqvT+ZvrvEnanUMAYgo5nM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251124105732epcas5p31daef2b58d8bd6f9d185eceb98bee055~67CYFE4Hj3134531345epcas5p3p;
	Mon, 24 Nov 2025 10:57:32 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4dFN7v10GHz3hhT3; Mon, 24 Nov
	2025 10:57:31 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb~67CWf8AoK0294702947epcas5p4G;
	Mon, 24 Nov 2025 10:57:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251124105712epsmtip250e75102a55672c00f589a366fdbdb9d~67CF9ItDi1199111991epsmtip2c;
	Mon, 24 Nov 2025 10:57:12 +0000 (GMT)
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
	selvarasu.g@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Mon, 24 Nov 2025 16:34:50 +0530
Message-Id: <20251124110453.2887437-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251124110453.2887437-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb
References: <20251124110453.2887437-1-pritam.sutar@samsung.com>
	<CGME20251124105730epcas5p470ed41a27f27776b9cd0c2c99a18e4eb@epcas5p4.samsung.com>

The USBDRD31 5nm controller consists of Synopsys USB2.0 femptophy and
USBSS combophy. Add-on USB20 femptophy is required to support USB20 data
rates along with USBSS phy. Document support for the USB2.0 femptophy
found on combophy of the this SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 1e9dc21b585a..15e75b0f66f1 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
   clocks:
@@ -231,6 +232,7 @@ allOf:
               - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
               - samsung,exynos990-usbdrd-phy
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       properties:
@@ -254,6 +256,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
       required:
-- 
2.34.1

