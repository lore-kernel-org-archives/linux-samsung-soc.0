Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF227467B
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798590; cv=none; b=UjMNgUydEL6uIJg/RBeMoFxlfalYgnbLwwSxnH1Qj/p6+p/LeADVdFHtoaC2L2hcQpYtqceP3wTfV0/UguF8qXyZu+NojVEw+7xHGHUSD5MLz6NuyBxmO96DEAh2tLhe0q6Rn2fK9h6OSzRzlgaHaNaQ/ScXK+i9YoceDulM5NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798590; c=relaxed/simple;
	bh=A2AVZN9C/tIrY1UksQGKGEhCAjFh+dDkHnVihJr26kM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=SieH4B/owXQbq/2pjZuFmRurCXL9tR7+w/7UHjeqECciW6AInzfeLFzDahg/JGq99eUVxA6SldATz5FP5xGGlZ2LOosIP6emcLnSHWCsmhKwCtheUPSGXnAosV96UpALQyB9P+uKlf2QH0nqDjchRyko03AfZUHCeacoIq4SCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jyTD4352; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jyTD4352"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250613070945epoutp032fc4c2e862ece69a70a322ab52611728~IiIrVgVNL2274022740epoutp03a
	for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Jun 2025 07:09:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250613070945epoutp032fc4c2e862ece69a70a322ab52611728~IiIrVgVNL2274022740epoutp03a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749798585;
	bh=4rxJOsSbzAi1rSx7tMZfzuZ5keXxRr4NSOqYZdfrDVM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jyTD43520uGklfDpW55D2tlDHzRZA+aQFXHVto3oYxgJBDppzeEH28bnU7Rz/u3Zc
	 ChPe3w+iqO6K770s22AiGMEUl2iuLfSENZilkyxm3pCTPuZ2l3Szw98THP+CdpC7MJ
	 J6U1Ty9beKRRTVVSidDTxP6EgbbmGGgjSTolp/AI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250613070944epcas5p4fb9a3a1ac8efd5fe761a87bdd3bdb9a7~IiIqrYOum3162531625epcas5p4I;
	Fri, 13 Jun 2025 07:09:44 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.177]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bJVrk3S8Sz2SSL3; Fri, 13 Jun
	2025 07:09:42 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee~IhDlgAhv32498524985epcas5p1P;
	Fri, 13 Jun 2025 05:50:37 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250613055034epsmtip10250c53b0f9deb8cb30d93844ecf5c91~IhDixE4HP0217702177epsmtip1f;
	Fri, 13 Jun 2025 05:50:34 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, pritam.sutar@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com
Subject: [PATCH v3 0/9] initial usbdrd phy support for Exynosautov920 soc
Date: Fri, 13 Jun 2025 11:26:04 +0530
Message-Id: <20250613055613.866909-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee
References: <CGME20250613055037epcas5p1ce00fda1b535dbeb9a98458d1f0a28ee@epcas5p1.samsung.com>

This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only
DRD phy controllers

  - Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
    compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
    to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data 
    rates. These two phys are combined to form a combo phy as mentioned
    below.
 
   USB30DRD_0 port

     +-----------------------------------------------------+
     |                                                     |
     |           (combo) USB PHY controller                |
     |     +-----------------------------------------+     |
     |     |               USB HSPHY                 |     |
     |     |  (samsung,exynosautov920-usbdrd-hsphy)  |     |
     |     +-----------------------------------------+     |
     |                                                     |
     |   +---------------------------------------------+   |
     |   |               USB SSPHY                     |   |
     |   |   (samsung,exynosautov920-usb31drd-ssphy)   |   |
     |   +---------------------------------------------+   |
     |                                                     |
     +-----------------------------------------------------+
     |                                                     |
     |                USBDRD30 Link                        |
     |                  Controller                         |
     |                                                     |
     +-----------------------------------------------------+

  - USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
    is very similar to the existing Exynos850 support in this driver.

    USB20DRD_0/1/2 ports

 
      +---------------------------------------------------+
      |                                                   |
      |                USB PHY controller                 |
      |    +-----------------------------------------+    |
      |    |              USB HSPHY                  |    |
      |    |  (samsung,exynosautov920-usbdrd-phy)    |    |
      |    +-----------------------------------------+    |
      |                                                   |
      +---------------------------------------------------+
      |                                                   |
      |             USBDRD20_* Link                       |
      |                Controller                         |
      |                                                   |
      +---------------------------------------------------+

This patchset only supports device mode and same is verified with
as NCM device with below configfs commands

changelog
----------
Changes in v2:
- Used standard GENMASK() and FIELD_GET() to get the major version
  from controller version register.
  link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar@samsung.com/

Changes in v3:
- Updated dt-bindings for USB2.0 only.
- Added dt-bindings for combo phy.
- Added implementation for combo phy (SS and HS phy).
- Added added DTS nodes for all the phys.
  link for v2: https://lore.kernel.org/linux-phy/20250516102650.2144487-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (9):
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
    compatible
  phy: exyons5-usbdrd: support HS phy for ExynosAutov920
  arm64: dts: exynos: ExynosAutov920: add USB and USB-phy nodes
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo HS
    phy
  phy: exyons5-usbdrd: support HS combo phy for ExynosAutov920
  arm64: dts: exynos: ExynosAutov920: add USB and USB HS combo phy nodes
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo SS
    phy
  phy: exyons5-usbdrd: support SS combo phy for ExynosAutov920
  arm64: dts: exynos: ExynosAutov920: add USB and USB SS combo phy nodes

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |   6 +
 .../boot/dts/exynos/exynosautov920-sadk.dts   |  53 ++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 155 +++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 529 ++++++++++++++++++
 4 files changed, 743 insertions(+)

-- 
2.34.1

