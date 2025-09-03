Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322242DAFB7
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884582; cv=none; b=G77EKVde8xWFnLTHp5sPn18347LDyC8SvpSXxbtZ6+jXpay2pRTCexfMfoDlXkAmlCtSv6BRptJc/MoXcXRA5pHmyz6qEA2XH1zI5QUr/WYFGb6L4qvGaE9ueTbbhSsVFRzyBEM+7P/Vsq0DQJhZLhSP3Ds+DPSUPSCVwJXiH2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884582; c=relaxed/simple;
	bh=bFt6jL4kEFlBZHpeBFoJe56AqoPQYxsapeRdhRFGED4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=PRa278ySPfZn2xDnpsAbwUJ1N7/G2xid7fgWpfHjJ7g0kWNmwACt7JKoqheWm84KsOxsGgbCctbULfhf2se4RQw71NgLTwSaerukoXaDpM5lZJKhpwbIGf/HpRXiIz96nS4vh98wIZB7/JfNHHIr6ZqHRBy4Bmo8mY0QwBQqn94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VXzdXXjE; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VXzdXXjE"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250903072935epoutp0310990e0fd34dd0a922f8710b9d5226c5~htTZu-8dF2591125911epoutp03F
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:29:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250903072935epoutp0310990e0fd34dd0a922f8710b9d5226c5~htTZu-8dF2591125911epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756884575;
	bh=Nl/95CQP0kAhBPJy4ztV09wUy+3E/X4uiZmgYlv0GDo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VXzdXXjEuHobmPk2m8QGmBAfvNXpqWQKRnxdWk44mKZA6v3GlaJyLvzoog9Yo3uAs
	 MIK7lt4QtSLffmwyNDXdIbI0skBaSDN7H+ZxIIB0LxrCMP4sH4eSV/dm1OdQvQSbMZ
	 fA0Tn0vwLLkSE3P6jUjajSOa5UAn7B0/2G3xo6mU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250903072934epcas5p4a89ecaedff3e84dedb577b2f17f80533~htTZO5ZF71574115741epcas5p4A;
	Wed,  3 Sep 2025 07:29:34 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.86]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cGvPn3BpJz2SSKX; Wed,  3 Sep
	2025 07:29:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250903072932epcas5p4dc5b5ada87f09f6f0c4e1b750874fc85~htTXnbSsB2774827748epcas5p4m;
	Wed,  3 Sep 2025 07:29:32 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250903072929epsmtip2e6060834bb0b8ccb4d7f883fedad7be4~htTUshDhh2487024870epsmtip2Z;
	Wed,  3 Sep 2025 07:29:29 +0000 (GMT)
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
Subject: [PATCH v8 0/6] initial usbdrd phy support for Exynosautov920 soc
Date: Wed,  3 Sep 2025 13:08:21 +0530
Message-Id: <20250903073827.3015662-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250903072932epcas5p4dc5b5ada87f09f6f0c4e1b750874fc85
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903072932epcas5p4dc5b5ada87f09f6f0c4e1b750874fc85
References: <CGME20250903072932epcas5p4dc5b5ada87f09f6f0c4e1b750874fc85@epcas5p4.samsung.com>

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
as NCM device

changelog
----------
Changes in v8:
- modified supplies' names in schema and driver.
- Since supplies' names are changed, modified patch no 5. to
  fix warnings in dtbs_check dt_binding_check.
- updated commit message for patch no. 1, 3 and 5 to describe
  hardware details.
  link for v7: https://lore.kernel.org/linux-phy/20250822093845.1179395-1-pritam.sutar@samsung.com/

Changes in v7:
- added fixes for driver build warnings
  link for v6: https://lore.kernel.org/linux-phy/20250821073703.2498302-1-pritam.sutar@samsung.com/

Changes in v6:
- added else part for new supplies in schemas those are only
  supported for exynosautov920.
- addressed comments for driver given in v5.
  link for v5: https://lore.kernel.org/linux-phy/20250805115216.3798121-1-pritam.sutar@samsung.com/

Changes in v5:
- significant changes were added in v4, removed "Reviewed-by" tag.
- addressed comments from v4 patchset.
  - patch (1/6)
    - DTS style is corrected and added required supplies in code/schema.
    - schema block added to resolve below failure during 'dtbs_check'.
      Unevaluated properties are not allowed ('dvdd075-usb-supply', 'vdd18-usb20-supply', 'vdd33-usb20-supply' were unexpected.
  - patch (2/6)
    - removed usage_counter(take this later in subsequent patch-sets)
  - patch (3/6)
    - There are 3 types of the phys in this SoC.
      - one is simmilar with exynos850 as mentioned in patch no.1.
      - second supports only USB3.1 SSP+ and denoted in patch no 5
      - third supports only USB2.0 HS as in patch3.
    - hs phy in combo phy is "NOT" same as phy. (in patch no. 1)
    - These three phys(usbdrd-phy, combo-hsphy, combo-ssphy) are totally
      deferent, "NOT" same, hence added three compatible for three phys.
  - patch (5/6)
    - Since there are two phys in combo phy, explaination is given
      in each patch.
  link for v4: https://lore.kernel.org/linux-phy/20250701120706.2219355-1-pritam.sutar@samsung.com/

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
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo hsphy
  phy: exynos5-usbdrd: support HS combo phy for ExynosAutov920
  dt-bindings: phy: samsung,usb3-drd-phy: add ExynosAutov920 combo ssphy
  phy: exynos5-usbdrd: support SS combo phy for ExynosAutov920

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  48 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 651 ++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 3 files changed, 702 insertions(+)

-- 
2.34.1

