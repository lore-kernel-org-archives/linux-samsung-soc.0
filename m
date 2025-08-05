Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398621F582F
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 17:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754414540; cv=none; b=eogkoe7xiJz8dqSC0iVk2orueWaaUlT996bdj8aRuE/j41b2api4k8RHgQ12hXSFVRl5Eqz+b119eFXGqwDMJh/6GJX0wL3X2cFLyRqX3lzDMOh00gxISDQKtrjbNdGly7KzNUcXU3LhY2gqRkbEYhNHgp3t+OGod5/bN8L9s4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754414540; c=relaxed/simple;
	bh=zkejJQGsucBjn8FTzlnbTMRminSezPhSkYOLjzKedTg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=iZ9lKO4RlZu6X7me7cbUrjSRkWLUBfpBReuQA3KF2tLUkopwFHJfa/gkK67TN2q1ErgsoaJL9w9jB7y1tUmC/tkf/GITMUWfzhI0RWSWoOJRmx70ovWMGH7pqg4e/k0zxBLsdKd0R1vIXhGm/vTXaEOZxMPZxn7ktYMeoefBV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VJeeclnk; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VJeeclnk"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250805172210epoutp04446fb04c4671303808967db72a964ee9~Y7rh6za0t3270732707epoutp04f
	for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Aug 2025 17:22:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250805172210epoutp04446fb04c4671303808967db72a964ee9~Y7rh6za0t3270732707epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754414531;
	bh=3NWT4mKOZNdlidQlsy7YVyOqci6Cq0pxcFhWUe0hI/k=;
	h=From:To:Cc:Subject:Date:References:From;
	b=VJeeclnkExY7awXzIfdrX8Ks5JanYHPRBb9IN8rjjmFOiWbyz7qy+ERRc12Q754/D
	 fLTdg4Vy08pkOROpCSIdzk9A9hXEbxk1ivi72K3eVao3hVrCM61b5YIfC766cgg8z0
	 +A1ER82rrmqUnIShG5RjpUarBtCQGsSp6aWwbkEY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250805172210epcas5p3bc2aeda341a6c1f21643e6d976843297~Y7rhLyOma1679616796epcas5p30;
	Tue,  5 Aug 2025 17:22:10 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxKwx3Sz9z3hhT3; Tue,  5 Aug
	2025 17:22:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250805114303epcas5p4c88843b7e38d86b722e60e386c637160~Y3DbswWTk1917319173epcas5p4L;
	Tue,  5 Aug 2025 11:43:03 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250805114300epsmtip154a84efe22ffd7b56289c339abd25a90~Y3DYxqakz1387413874epsmtip1h;
	Tue,  5 Aug 2025 11:43:00 +0000 (GMT)
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
Subject: [PATCH v5 0/6] initial usbdrd phy support for Exynosautov920 soc
Date: Tue,  5 Aug 2025 17:22:10 +0530
Message-Id: <20250805115216.3798121-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250805114303epcas5p4c88843b7e38d86b722e60e386c637160
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250805114303epcas5p4c88843b7e38d86b722e60e386c637160
References: <CGME20250805114303epcas5p4c88843b7e38d86b722e60e386c637160@epcas5p4.samsung.com>

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
      |             USBDRD20_* Link                       |
      |                Controller                         |
      +---------------------------------------------------+

The "USB20 phy output isolation" is shared across the USB20 phys.
We have to bypass isolation when any one of the USBs is configured
and enable it when all are turned off. The "USB31 phy isolation"
is seperate for USB31 phy.

There are 3 types of the phys in this SoC as mentioned in above
above block diagram.    
 - one is simmilar with exynos850 as mentioned in patch no.1.
 - second supports only USB2.0 HS as in patch no 3.
 - third supports only USB3.1 SSP+ and denoted in patch no 5.
 
These three phys(usbdrd-phy, combo-hsphy, combo-ssphy) are totally
deferent, "NOT" same, hence added three compatible for three phys.

This patchset only supports device mode and same is verified with
as NCM device.

changelog
----------
Changes in v5:
- removed "Reviewed-by" tag.
- addressed comments from v4 patchset.
  - DTS style is corrected and added required supplies in code 
    and schema.
  - new schema block added for supplies to resolve below failure 
    during 'dtbs_check'.
    Unevaluated properties are not allowed ('dvdd075-usb-supply', 'vdd18-usb20-supply', 'vdd33-usb20-supply' were unexpected.
  - removed usage_counter(will take this later in subsequent patch-sets)
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

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  41 ++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 652 ++++++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |   3 +
 3 files changed, 696 insertions(+)

-- 
2.34.1

