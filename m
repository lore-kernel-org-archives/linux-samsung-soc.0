Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FA14B955
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735182716; cv=none; b=oEc1J2XeN4UiJQIY7qi4v2mYv8VOno09ChkWBqEpfTLcrKtAetnHCFfuYFAzUXdIB6G5DHU5E/eFoUa8tiLnwMBSJTTFaXdUT6cndjmo3v+aFwjsX2GVMn7lXtDkDydUosfqXh/Ud0lbGewOkfipyEWct+r4IqzaMHWnCVffFjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735182716; c=relaxed/simple;
	bh=MM76ScnOwtCKacvVm7xHioS/0Bcm/fQ+Y9jfdZ00H9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=ECWuEeJ/EilZ2yJmNBcTWgXKSrixVrMIYSIbAj5pPNs08NBLc0TMQqym2rC4yUUEdNtIwJiHMFLOYEtI7NlXCW75ewFI7ogQ/GG7hTuYpm0fEN3vJSX3/48GiJXdbNrPYiLG6kF8c3MUSLAc/HUWBfxegEH/Tl4Vbv9S5wwqSOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kpBuDRSK; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kpBuDRSK"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241226031147epoutp04fdd71a1368269a5f64c3b16f0df7f1dc~Um3qRMfUg3127131271epoutp04B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2024 03:11:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241226031147epoutp04fdd71a1368269a5f64c3b16f0df7f1dc~Um3qRMfUg3127131271epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735182707;
	bh=he8Zgs43OrcnUKIV3fdObE7JDFU5rtd8tyoC9IVLaRA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=kpBuDRSKFJwyzb5kWgw79lNtpuw3HHSC5RO9tPESHRoGEns/7rtiq1npqN167K5Y4
	 blytVqIz22SWOcts2GzoAZGHp7XJ8R8C2j6xfqPZ1msabQRwEgpKVOBgLIlrdwzQC/
	 6YIR4TEAI3FQY+vywYpgN1eqQtLWj/PkBg7adNHs=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241226031146epcas2p17b078b94d5d968f4b955eaefee47fa58~Um3pr9EWA1308013080epcas2p1y;
	Thu, 26 Dec 2024 03:11:46 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4YJYZ95LKCz4x9Q1; Thu, 26 Dec
	2024 03:11:45 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8D.06.22938.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6~Um3oj5sHI0117601176epcas2p4o;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241226031145epsmtrp116e2e5fb7037ec998f5fa869c2e09f9a~Um3ojHzoA1343613436epsmtrp15;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
X-AuditID: b6c32a43-0b1e27000000599a-2c-676cc971c63e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BD.DA.18949.179CC676; Thu, 26 Dec 2024 12:11:45 +0900 (KST)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241226031145epsmtip2cf093dbef64193824f2ebd8b9efcddbc~Um3oSsBkD2916129161epsmtip2_;
	Thu, 26 Dec 2024 03:11:45 +0000 (GMT)
From: Sowon Na <sowon.na@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com
Subject: [PATCH v4 0/3] Support ExynosAutov920 ufs phy driver
Date: Thu, 26 Dec 2024 12:11:35 +0900
Message-ID: <20241226031142.1764652-1-sowon.na@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdljTXLfwZE66wZpdGhYP5m1js1iz9xyT
	xfwj51gtjrb+Z7Z4Oesem8X58xvYLS7vmsNmMeP8PiaL/3t2sFv8/nmIyWLnnRPMDtwem1Z1
	snn0bVnF6PF5k1wAc1S2TUZqYkpqkUJqXnJ+SmZeuq2Sd3C8c7ypmYGhrqGlhbmSQl5ibqqt
	kotPgK5bZg7QQUoKZYk5pUChgMTiYiV9O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9
	vNQSK0MDAyNToMKE7IwV166xFNznqrh+YypbA+MJji5GTg4JAROJg6ePsYHYQgI7GCWmX4np
	YuQCsj8xSuzatZYdwvnGKHHzSzMrTMe7Ka+YIRJ7GSW2tDcyQTi/GCXef53N0sXIwcEmoCpx
	raEKxBQRqJSYu8wZpIRZoJdRov/OWhaQQcICthKHT15jArFZgMpXdr0FW8ArYC3xY10nO8Qy
	eYmLa56zQcQFJU7OfALWywwUb946G+wICYF77BLXW5YyQjS4SNy43MIEYQtLvDq+BWqQlMTL
	/jYoO19i/cO7bBB2hcTdQ/9ZIGx7iUVnfrKDHM0soCmxfpc+iCkhoCxx5BbUWj6JjsN/2SHC
	vBIdbUIQjUoSHefnQC2VkFj1YjLUcA+JD//72CGBGyuxadV29gmM8rOQPDMLyTOzEPYuYGRe
	xSiWWlCcm56abFRgCI/S5PzcTYzgFKnlvIPxyvx/eocYmTgYDzFKcDArifAeEspMF+JNSays
	Si3Kjy8qzUktPsRoCgzeicxSosn5wCSdVxJvaGJpYGJmZmhuZGpgriTOe691boqQQHpiSWp2
	ampBahFMHxMHp1QD0zmbHUueLU2+W7jZ+56n5xJZ9ZMhTeuVMsLkWI5sLX1YItv79NWa0O5J
	+00KeD803X1QWmrq7MSzPr38/8GATZaG7iY9Nvfnn7p5/+9KdqcSqXn7g/7c7Ijd8bVk87T6
	KP27jOWavAz6jZU6bAkK7V8UPigYKtov5HsvdWsSu5Vfx8/Vmw5OEDcNnnFmxeNMDtb6zR+T
	trfPNVrippy3pfWNbVlatNz0587TDiV2LrFaddji/bGFz31UTwrNnzR/+okj2zRdvzmmt05i
	6P+v9zXwDUsBR33GX8UoDR1lq7NvCt7aTHjlaOn7+11evNzfFImuOoO3X7U2OV95oXd6okDm
	XNmmryE7qhqcPn57pcRSnJFoqMVcVJwIANMSNfIaBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWy7bCSvG7hyZx0g7PXuSwezNvGZrFm7zkm
	i/lHzrFaHG39z2zxctY9Novz5zewW1zeNYfNYsb5fUwW//fsYLf4/fMQk8XOOyeYHbg9Nq3q
	ZPPo27KK0ePzJrkA5igum5TUnMyy1CJ9uwSujBXXrrEU3OequH5jKlsD4wmOLkZODgkBE4l3
	U14xdzFycQgJ7GaUeHrnGDtEQkLi25s9TBC2sMT9liOsEEU/GCUunlkF5HBwsAmoSlxrqAKJ
	iwg0Mko8/zAZbBKzwERGifPzjoBNEhawlTh88hrYJBaghpVdb1lBbF4Ba4kf6zqhtslLXFzz
	nA0iLihxcuYTFhCbGSjevHU28wRGvllIUrOQpBYwMq1ilEwtKM5Nzy02LDDKSy3XK07MLS7N
	S9dLzs/dxAgOXi2tHYx7Vn3QO8TIxMF4iFGCg1lJhPeQUGa6EG9KYmVValF+fFFpTmrxIUZp
	DhYlcd5vr3tThATSE0tSs1NTC1KLYLJMHJxSDUyiim+eCXDInz+flT3/KnPi6yieBR2TTL4K
	e+/5t0pMiovJUS/27NWd/2ws8uo3G8x7GWe3SllXg/OdzXqB7mVfG/mfXeFViFls+HeHwHcv
	/X8pcu4vjt1WMTi/2NniW8/ZFYUNf2vsVV0eFq5mv73b+fJssZccS9+m92a9uFN/5WOKmK/n
	6RfufHOud555fVv16v597p9ur3GdvSOd1Sx7z6rT7yw4Dq/bcZVzulD7D/4e7W4V56Nr387+
	ra1raD9Vhs0p8eUfM/lXIRc/e0fqzjTeJ9wZfOpxgkCTeW/Sq0WF65PM1Yx2Tvp/+cxx24NG
	d0QdDF2vbLoWcoV3y+6bEm8b1k39JXLikbrZYv7LSizFGYmGWsxFxYkA3/nOs80CAAA=
X-CMS-MailID: 20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6
References: <CGME20241226031145epcas2p4fa41b44749a7f675364437856d01a4c6@epcas2p4.samsung.com>

This patchset introduces ExynosAuto v920 SoC ufs phy driver as
Generic PHY driver framework.

Changes from v3:
- Use lower case for all addresses
- Add empty line between macro and function

Changes from v2:
- simplify function name from samsung_exynosautov920_ufs_phy_wait_cdr_lock
  to exynosautov920_ufs_phy_wait_cdr_lock
- return immediately after getting the CDR lock
- add comment for wait CDR lock

Changes from v1:
- use exynosautov920 instead of exynosauto to specify
- remove obvious comment
- change soc name as ExynosAutov920 to keep consistent
- use macros instead of magic numbers
- specify function name
- add error handling for CDR lock failure


Sowon Na (3):
  dt-bindings: phy: Add ExynosAutov920 UFS PHY bindings
  phy: samsung-ufs: support ExynosAutov920 ufs phy driver
  arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC

 .../bindings/phy/samsung,ufs-phy.yaml         |   1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  11 ++
 drivers/phy/samsung/Makefile                  |   1 +
 drivers/phy/samsung/phy-exynosautov920-ufs.c  | 168 ++++++++++++++++++
 drivers/phy/samsung/phy-samsung-ufs.c         |   9 +-
 drivers/phy/samsung/phy-samsung-ufs.h         |   4 +
 6 files changed, 191 insertions(+), 3 deletions(-)
 create mode 100644 drivers/phy/samsung/phy-exynosautov920-ufs.c

-- 
2.45.2

