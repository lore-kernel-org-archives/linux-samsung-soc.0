Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79672618
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375277; cv=none; b=lqK5I4qQ3KQDFPhK86WJ9L1q8dfCRhQres1lQsv+1STVQPXB3CIOXZXnVmTHcausqSt2YNizYa8Q9wzR2KZ2LyN6Ugkz7amEYJAbroJP2wuH9LQq7kRP00UrLwd2iPhMooj2/8fNFbV3T8l8LBfRn4fz2g8zg/UsGK7yfLg3MJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375277; c=relaxed/simple;
	bh=WIJdkYqKtrcViiIXwsJLxScB7I5D16SkZuE6zs6hhFU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=KF0JXvmEOOC1Ngy/cvY0YjrW4/bKikyldJXe5PPPLscXb+TxRgWdXXZx8LBTSTwO/vq4mrjqPoD2lkeWZJJR2nTVt5lg3LehOx7XzmFpJTkm6T+FN/aCEagSpeBtMCzjB21aD5oHGCh7XF6hsFyQMYhP5NYadqjDLbBSIhW7Ajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GNKD2UAS; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GNKD2UAS"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250701130752epoutp03f424ba3d19337110405ff322a14c973d~OIogS40pq1261412614epoutp03I
	for <linux-samsung-soc@vger.kernel.org>; Tue,  1 Jul 2025 13:07:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250701130752epoutp03f424ba3d19337110405ff322a14c973d~OIogS40pq1261412614epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751375272;
	bh=ObH5DJitgZXW8lqh+xl02VpDheA5zjcm24mvoxIsz4Q=;
	h=From:To:Cc:Subject:Date:References:From;
	b=GNKD2UASnlj5yCOj2L2BTRKb/peI+2ARKeppVMDqhSr6W+VlG+9cUAr+O/zujHWw9
	 aa6YSXR/0+SCViu1QAJDG+5tK3DacDLZar3tfWNNDy/XmlY3QbWFD1BamNo82y/REP
	 6N/LiWC3+DXdpCp8w0+TnQtgertQPl7kUke3Q8oo=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250701130751epcas5p2fbecf3d5591ca59a2180ba9495b8d1d5~OIofFpRWk2226922269epcas5p2R;
	Tue,  1 Jul 2025 13:07:51 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bWjxd6GsWz6B9m5; Tue,  1 Jul
	2025 13:07:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250701115952epcas5p27badecc600886088875ead6297807228~OHtIISdOl0496404964epcas5p2a;
	Tue,  1 Jul 2025 11:59:52 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701115949epsmtip14fd77a9718da964f285ee4a2232165d8~OHtFMpxtN1373213732epsmtip1t;
	Tue,  1 Jul 2025 11:59:49 +0000 (GMT)
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
Subject: [PATCH v4 0/6] initial usbdrd phy support for Exynosautov920 soc
Date: Tue,  1 Jul 2025 17:37:00 +0530
Message-Id: <20250701120706.2219355-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250701115952epcas5p27badecc600886088875ead6297807228
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250701115952epcas5p27badecc600886088875ead6297807228
References: <CGME20250701115952epcas5p27badecc600886088875ead6297807228@epcas5p2.samsung.com>

This SoC has a single USB 3.1 DRD combo phy and three USB2.0 only
DRD phy controllers as mentined below

  * Combo phy supports USB3.1 SSP+(10Gbps) protocol and is backwards
    compatible to the USB3.0 SS(5Gbps). 'Add-on USB2.0' phy is added
    to support USB2.0 HS(480Mbps), FS(12Mbps) and LS(1.5Mbps) data rates.
    These two phys are combined to form a combo phy as mentioned below.


   USB30DRD_0 port

 +------------------------------------------------------------+
 |                                                            |
 |                (combo) USB phy controller                  |
 |      +----------------------------------------------+      |
 |      |                  USB HSPHY                   |      |
 |      |  (samsung,exynosautov920-usbdrd-combo-hsphy) |      |
 |      +----------------------------------------------+      |
 |                                                            |
 |    +--------------------------------------------------+    |
 |    |                   USB SSPHY                      |    |
 |    |   (samsung,exynosautov920-usb31drd-combo-ssphy)  |    |
 |    +--------------------------------------------------+-   |
 |                                                            |
 +------------------------------------------------------------+
 |                                                            |
 |                     USBDRD30 Link                          |
 |                       Controller                           |
 +------------------------------------------------------------+

  * USB2.0 phy supports only UTMI+ interface. USB2.0DRD phy
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

The "USB20 phy output isolation" is shared across the USB20 phys.
We have to bypass isolation when any one of the USBs is configured
and enable it when all are turned off. The "USB31 phy isolation"
is seperate for USB31 phy.

This patchset only supports device mode and same is verified with
as NCM device with below configfs commands

changelog
----------
Changes in v4:
- addressed comments from v3 patchset
  - removed dts related patches, to be posted in new patchset.
  - added regulator, pmu and power sequences.
  - phy isol is shared across USBs, added usage counter to bypass or
    enable phy isolation.
  - modified schemas with hs and combo phy compatible names
    (used "combo" to denote combo phy) and regulators
- modified code to work with binding and unbinding devices/drivers
- added "Reviewed-by" tag.
  link for v3: https://lore.kernel.org/linux-phy/20250613055613.866909-1-pritam.sutar@samsung.com/

Changes in v3:
- Updated dt-bindings for USB2.0 only.
- Added dt-bindings for combo phy.
- Added implementation for combo phy (SS and HS phy).
- Added added DTS nodes for all the phys
  link for v2: https://lore.kernel.org/linux-phy/20250516102650.2144487-1-pritam.sutar@samsung.com/

Changes in v2:
- Used standard GENMASK() and FIELD_GET() to get the major version
  from controller version register.
  link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (6):
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 HS phy
    compatible
  phy: exynos5-usbdrd: support HS phy for ExynosAutov920
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo HS
    phy
  phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo SS
    phy
  phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  41 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 662 ++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 3 files changed, 706 insertions(+)

-- 
2.34.1

