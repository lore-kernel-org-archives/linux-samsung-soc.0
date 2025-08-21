Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197422E9EBB
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755761299; cv=none; b=meU+4d+rpOnY9SAbp1RLzZk4aWQY0iOKqdD2AJI7mZthx7dL67wUlJwNCPjPdBFemh+nmySwXRdq0G90HUOaFFdcT5cIGe0NMbOcyFsdwJP6Bg+8/S7jTwgoPvFRJY55rLh0Ko8+2zIC0YXiJvtcDTNghF8CwnHc2XSeBkbv/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755761299; c=relaxed/simple;
	bh=6GebNM2o1GXDgSXOm0UyZPXUQCpsIjxC6vVx2gHkp+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CqNdXXGmWuH1OaCVerkYpvZvbEaGSeFiXjiB/JzYFeZWGhhCEGqjwZHD94KIgBb5XC4T2NcUI8JqPb1hqeYRBRqln+TEu95INzWc5xkNPuRE4qDMECNI4qXU4At5cYXPprsZfrScsF491ffA1myQZgy/Q7rEc+G1epqzxzy7Idc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=I/WfWG+3; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="I/WfWG+3"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250821072814epoutp02c2e08695564b2c6d18bfa523322233e1~dt5hMmHEl0050400504epoutp02k
	for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:28:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250821072814epoutp02c2e08695564b2c6d18bfa523322233e1~dt5hMmHEl0050400504epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755761294;
	bh=8CcZrXnG1JviyezbOmZi9lSul/m6IUwEsJI7r8Fbjqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/WfWG+3EjERIh9WVuqGA1VcU3S3Rm5/vM0bfBjy3rDyCeAj6SFU8vqS1PmgbDyzF
	 JJs4/y8UJxFX4vloZccmcxhOykr33UPEzBroBf3e6XSztaJBfwLqmpQneZZlVl3wpB
	 XskMnM5R43wdxehgAB/EdHkj+YrxI10iADjnVI7Y=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250821072813epcas5p2be30a2e1791496db24bf1b776fef2982~dt5gQoFvb0277302773epcas5p2A;
	Thu, 21 Aug 2025 07:28:13 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c6w0D3bBYz3hhT4; Thu, 21 Aug
	2025 07:28:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250821072811epcas5p39b60f480203e26e99dec09321951d4ea~dt5ekTiYF3130531305epcas5p39;
	Thu, 21 Aug 2025 07:28:11 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250821072808epsmtip146a924be7482a7eabe6e861e42181b6e~dt5bXKxno0625606256epsmtip1c;
	Thu, 21 Aug 2025 07:28:08 +0000 (GMT)
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
Subject: [PATCH v6 3/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo hsphy
Date: Thu, 21 Aug 2025 13:07:00 +0530
Message-Id: <20250821073703.2498302-4-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821073703.2498302-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250821072811epcas5p39b60f480203e26e99dec09321951d4ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250821072811epcas5p39b60f480203e26e99dec09321951d4ea
References: <20250821073703.2498302-1-pritam.sutar@samsung.com>
	<CGME20250821072811epcas5p39b60f480203e26e99dec09321951d4ea@epcas5p3.samsung.com>

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

