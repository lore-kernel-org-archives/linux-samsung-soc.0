Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38470C2E0
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760079645; cv=none; b=b4u7WA17PKYhZ4ouFUeu/Sefy+BwxvPbzNVasav67gBrlyn5iy2Rt0dgMdwJ6MOipZRfXf4EKwN9Fsksro187T9FA4H7q18TUgiab+R3HPElw7nR+2BQLvS2+ki+2mHWSFbJDezM0tYOZiGdbG8pSJe06Rh5jXRcDs/lQWfBxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760079645; c=relaxed/simple;
	bh=ft4QpakIX9Lsh9bFpBL2StqQB+oy2cr2aqO38XNphrk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=nl2JsxrUMrIhVmymuYpdCJvTdLTJePCZ4dwLW4hLJX2hLsSoTxB0z4WUzLknoV8V4DFOwU4qM7FbmTjO+XMY4P8ww5Y7HlMxlRXUGF4XTZpY9h8NCmFr3Q8UjbkoPDiNM1AW87tnDWMfFq4xJwXLHbYLb/ZEGmvFuBLutgzk2us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cJTyB1GY; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cJTyB1GY"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20251010070040epoutp025b643caf5fee414eeb038986d76c1fa2~tDxuAEYdp1340113401epoutp02N
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 07:00:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20251010070040epoutp025b643caf5fee414eeb038986d76c1fa2~tDxuAEYdp1340113401epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760079640;
	bh=QXzCySDMsLPOWPk1/ehWODhwuQnPLHfbfcfvLoCBoVs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cJTyB1GYUPzrdCgvyhCu85PH5+GgeZxm8aZ0tIU3uEeYec+Iz5RJpqYiGfkVbbocv
	 xHHadOMql0dwBOWYmiJkOu7OMIRLwopBkXlwMQc9MBvlBfcQxSkAestRpDLhR9DVeX
	 2dh+WnXG6P+OXq9Doa3UaRVEgNuHTE9BmFXvxQ6Q=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20251010070039epcas5p365d8b9497e4fbe067a999399242611f6~tDxtMgYoQ0258502585epcas5p3M;
	Fri, 10 Oct 2025 07:00:39 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4cjd1L1l2Yz3hhT8; Fri, 10 Oct
	2025 07:00:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595~tDxrrWZ6U0238902389epcas5p3K;
	Fri, 10 Oct 2025 07:00:37 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251010070032epsmtip2270fb4fefc89fb59ce578734ce60bab9~tDxnTTLUz0572805728epsmtip2d;
	Fri, 10 Oct 2025 07:00:32 +0000 (GMT)
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
	selvarasu.g@samsung.com
Subject: [PATCH v9 0/6] initial usbdrd phy support for Exynosautov920 soc
Date: Fri, 10 Oct 2025 12:39:06 +0530
Message-Id: <20251010070912.3758334-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595
References: <CGME20251010070037epcas5p312b0463a6a757e9b0c03aed6adc48595@epcas5p3.samsung.com>

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
Changes in v9:
- added RB tags those were given in v7 [1] and v8.
- updated commit message in patch no.1 by adding supplies' 
  names those are taken from phy User Manual [2]
  link for v8: https://lore.kernel.org/linux-phy/20250903073827.3015662-1-pritam.sutar@samsung.com/
[1]: https://lore.kernel.org/linux-phy/20250824-mustang-of-glorious-sufficiency-b55bf4@kuoka/
[2]: https://lore.kernel.org/linux-phy/02ef5180-ad56-45f0-a56f-87f442bf6793@kernel.org/

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

