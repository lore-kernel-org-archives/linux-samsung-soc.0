Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023075;
	b=VkA93jOhWqtKSP0XdqrZoggnUWsXkUejhHjFnzX55VBE7h+B4Uk6WzgFHDFtPY59jRAl
	 /ugLEQ4i94Z+lQjVveZgDAD7Et+Af4Bdpz2g09OCwBKZ6Ef3eCam36xtyJmkGytWO6qvL
	 EMNsGeSdaL5wri0BCy9/pFzRJYJ3Nu23dcTgI3ohGTEFLzvRvz4PrfehkzFs59jyRxuBr
	 KQ/GssVOpzhBwr3NVHBidjRkgTaWdMo4mbx93MnhfUQ5kbYezmJejleREtHJH5t4JiwYN
	 BOA+ZW1qVAeHJtlh6RpBX6tEhxP9tl3gDD7iAvDhHCeQUstz+6OjdNxY60AyOiERpNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023075;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:CMS-TYPE:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=adIdtnlCMMqgB92EkRoohcRf2XzhG2GPZV5HSQQgJFw=;
	b=4UtLf5yU0lWLyjPh/fNv0ijGROyHDU6k5O9lqV17D3c86AXauwG66ayopwGQ28dCt/1P
	 ptPYog1RBgAcCMazAOLm4LtaRlmStociiTMXX9AXbqHt90WhIEXxqfn+0ldek+j3Pyz90
	 kDxL6KsxenpGTDLayHHahGXa/JvkgIByitGxiSWZNocDHHtF8kWBcgQJKBnCpPagaqSnA
	 PeGR8UtgMCPxufkHd4J3YJI2XLkzARBx9AWQIlIOsLIbsxm2RZQNwwhH0vJ65m4Wct8JP
	 sXQ+ydrit3SMPI6Js0T9hR206f+oYNdhXqbMw0zti7vemGCX3rjOupEJgoSCyq+jF/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XPrgrbuE;
	arc=none smtp.remote-ip=203.254.224.33
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B39606A31E
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B39606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=XPrgrbuE
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261026135751epoutp03b442347880f249e02b9c9b02d33fdf53~iGPu_AjDz1206312063epoutp03h
	for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2026 13:57:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261026135751epoutp03b442347880f249e02b9c9b02d33fdf53~iGPu_AjDz1206312063epoutp03h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793023071;
	bh=adIdtnlCMMqgB92EkRoohcRf2XzhG2GPZV5HSQQgJFw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XPrgrbuEsxKKz63wFIJclOiQU2ADz8C3mkb80tctYqEOecHcf4c4fZD1sBFjPCejx
	 etFT5FLolWlM4c2CXknvExLXcRJ0gJPwgeynm+FUtMDrw0elprGeGl/wwHpcwuoOIZ
	 cn/nhqrUwNqkZIq5q26uh4ckBNMPbus7PfTLe7eA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261026135750epcas5p1bf3d46de8f85e51a17826201f6e49eab~iGPuDbjpt0764807648epcas5p1p;
	Mon, 26 Oct 2026 13:57:50 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jCwDs3Q5Mz3hhT8; Mon, 26 Oct
	2026 13:57:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261026135748epcas5p4b33d010f9bf35a6fcbbc1ae2cc9a6276~iGPsoV9-c1260612606epcas5p44;
	Mon, 26 Oct 2026 13:57:48 +0000 (GMT)
Received: from vega.samsungds.net (unknown [107.108.73.84]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026135745epsmtip29c8ecd39ba6a4b3b57ca6895d18f1a9b~iGPpxhzSS1131311313epsmtip2X;
	Mon, 26 Oct 2026 13:57:45 +0000 (GMT)
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.griffin@linaro.org, alim.akhtar@samsung.com,
	Thinh.Nguyen@synopsys.com, selvarasu.g@samsung.com,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, h10.kim@samsung.com, dh10.jung@samsung.com,
	akash.m5@samsung.com, hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, muhammed.ali@samsung.com, thiagu.r@samsung.com
Subject: [PATCH v4 0/2] Add USB DWC3 support for Samsung Exynos8855
Date: Mon, 26 Oct 2026 19:27:13 +0530
Message-Id: <20261026135715.33071-1-selvarasu.g@samsung.com>
X-Mailer: git-send-email 2.17.1
X-CMS-MailID: 20261026135748epcas5p4b33d010f9bf35a6fcbbc1ae2cc9a6276
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261026135748epcas5p4b33d010f9bf35a6fcbbc1ae2cc9a6276
References: <CGME20261026135748epcas5p4b33d010f9bf35a6fcbbc1ae2cc9a6276@epcas5p4.samsung.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list

The Samsung Exynos8855 SoC implements a Synopsys DesignWare USB3 DRD
controller. The DWC3 core on the Exynos8855 is instantiated with the
generic DWC3 platform driver using a flattened model, where the
controller is directly addressable without a separate glue layer.

This is the first Samsung Exynos binding using the flattened
representation, and this series adds the device tree binding and
platform driver support for this configuration.

Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
---

Changes in v4:
- Drop redundant "binding" from the subject.
- Reorder properties, interrupts after clocks, power-domains after
  interrupts. 
- Reorder interrupt property in the example as well.
- List clocks with per item descriptions.
- Link to v3:
  https://lore.kernel.org/all/20261023131501.3157463-1-selvarasu.g@samsung.com/

Changes in v3:
- Drop the MAINTAINERS patch.
- Drop the samsung,snps-dwc3 generic fallback compatible. The binding
  now uses the SoC specific compatible samsung,exynos8855-dwc3 only.
- Binding file is renamed to match the compatible string.
- Remove the "select" from the binding.
- List the clocks (ref, bus) explicitly and drop the redundant if/then
  block.
- Update the driver patch to use the new compatible string.
- Drop the v2 Reviewed-by (Alim Akhtar) and Acked-by (Thinh Nguyen)
  tags as the patches changed. re-requesting them.
- Link to v2:
  https://lore.kernel.org/all/20260916122229.2604003-1-selvarasu.g@samsung.com/

Changes in v2:
- Commit 2/3: Clarify this is the first Samsung Exynos binding using
  the flattened node representation.
- Commit 3/3: Add the compatible entry in alphabetical order in the
  of_match_table.
- Link to v1:
  https://lore.kernel.org/all/20260903071250.3421499-1-selvarasu.g@samsung.com/

Selvarasu Ganesan (2):
  dt-bindings: usb: Add Samsung Exynos8855 DWC3 controller
  usb: dwc3: Add Exynos8855 to the generic platform driver

 .../bindings/usb/samsung,exynos8855-dwc3.yaml | 71 +++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c          |  5 +-
 2 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos8855-dwc3.yaml

-- 
2.17.1

