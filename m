Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B39274B5E
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375300; cv=none; b=qwcfyF1+tIThtdyuPDAdhWcvBp42Vi6k5b1XlA0Qrp/9gmSSt5GkJfKvXVfM7drAVn5I6BObE18yPpucSVaZBt3FSdyzfRRdaeodNd7ZKcWZNgzY2P5wUxRlSImLgwpyaY6U9K8BwcBD9vVS8LPLXqM2GN8BJj+tsJFzoVRu3BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375300; c=relaxed/simple;
	bh=fwEXZ2vcv3xXMfBBmX94hX1enBc8ZaZug3xf8S/Vpzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=SZmTh7+S20QR0oMWsgRNbGeJNcprqhaH8LjwBMq6l+Ac8fSJZ/NGpTyhBAINJhwZGRvPT1Ycgp+pNuMzXSb418G4iabDn7yPUjf2itxnx+jon2K/9Bf5OFetMP5hHx/UF5bEJRBQbU90qSrY3J67c4veZGwoYlyyPpAFX+pGovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mA2tEYM+; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="mA2tEYM+"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250701130816epoutp02269b265f0aed1a92f95f98abeddf0e6f~OIo190Vc10679006790epoutp02p
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:08:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250701130816epoutp02269b265f0aed1a92f95f98abeddf0e6f~OIo190Vc10679006790epoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751375296;
	bh=RSiRk+FOT4DNKqboAFamlYzH4Uom4Urrgp6xmTmHgRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mA2tEYM+jXhlIO9Hc0oizFlLK21VASQmoBBzkUAjKz97MZXEFK4rpqphQR8t8zrzi
	 1VjGcpIFbyA2PybuW7awaRmQBB7fHdvoT4T8EJLqqMcz4Kks7NkLk/zptObhu+ABhb
	 dAvR1wEWVtS/XW1e9GXYKmoYl1xVn2BRCqX0Fpxc=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250701130815epcas5p2a6c34c804d9dc216064f6315c128ff85~OIo03E2Xk2226922269epcas5p2X;
	Tue,  1 Jul 2025 13:08:15 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.178]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bWjy50DQ9z3hhT4; Tue,  1 Jul
	2025 13:08:13 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb~OHtXw9dpn2412624126epcas5p4R;
	Tue,  1 Jul 2025 12:00:09 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701120006epsmtip18b4477dd17fd0b164ffd5e6b5429271b~OHtU0vI6c1563115631epsmtip1i;
	Tue,  1 Jul 2025 12:00:06 +0000 (GMT)
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
	selvarasu.g@samsung.com
Subject: [PATCH v4 5/6] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 combo SS phy
Date: Tue,  1 Jul 2025 17:37:05 +0530
Message-Id: <20250701120706.2219355-6-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701120706.2219355-1-pritam.sutar@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb
References: <20250701120706.2219355-1-pritam.sutar@samsung.com>
	<CGME20250701120009epcas5p46bc2870446c499f9c0008c1d396650bb@epcas5p4.samsung.com>

This phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is required
to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
These two phys are combined to form a combo phy.

Add a dedicated compatible string for USB combo SS phy found in this
SoC. The SoC requires two clocks, named "phy" and "ref" and various
power supplies (regulators) for the internal circuitry to work.
The required voltages are:
* avdd075_usb - 0.75v
* avdd18_usb20 - 1.8v
* avdd33_usb20 - 3.3v

Add schema only for 'USB3.1 SSP+' SS phy in this commit.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index b024339b5acc..b43b2ecbc132 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -34,6 +34,7 @@ properties:
       - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
       - samsung,exynos990-usbdrd-phy
+      - samsung,exynosautov920-usb31drd-combo-ssphy
       - samsung,exynosautov920-usbdrd-combo-hsphy
       - samsung,exynosautov920-usbdrd-phy
 
@@ -251,6 +252,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - samsung,exynosautov920-usb31drd-combo-ssphy
               - samsung,exynosautov920-usbdrd-combo-hsphy
               - samsung,exynosautov920-usbdrd-phy
     then:
-- 
2.34.1

