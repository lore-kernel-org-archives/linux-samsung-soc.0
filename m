Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6104D284691
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 15:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667799; cv=none; b=dIKOvKzGbWdazj3ktBcS1k6R3X3XF0VMN/F2Ru3YiCp6vaCCS8TqH7YjvFkbaQRzRFUnwO8shTldXbRvvkTrBwaCBY+Gy9JXmnJ9rCGXEfK5kvBglVz4Qu0vsmFbMK2FJjSyHZjMkh6NANaBy5bv7CWdKYinnhhI0sne6y6X95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667799; c=relaxed/simple;
	bh=5q3uIgP+yjKH81MVjcSqSMJF1250QvkUhRgQZrFOmts=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=tgVIC28Xn2z6UHti2PbPLrOzOlQ++5Gupo1aiXHvx3guGbRfJiou3Hm0HVl14L67rus3ivawOS7xy56bL/ElMxAXfW6j+S0feusaN+vgSsC2C5lqzicbRelGDvyGSFKFT838ieYVF70Q9Ke+ezvX7VVGQf5DD5mG9szU+7u6LdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=cAGdWTsm; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cAGdWTsm"
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250519151635epoutp014af3d00a1dc717337788ad488063360d~A9pmo-jzq0532805328epoutp012
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 15:16:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250519151635epoutp014af3d00a1dc717337788ad488063360d~A9pmo-jzq0532805328epoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747667795;
	bh=NjSkcG8Ba/+tj528MW2v7RcxXouxjFYRzu2bxrG2VTY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cAGdWTsmBTvkJZG4Rh2DK0TdJyhfL2xVFApt7LQTUtNpuQer0CMUAv1iOtsz2W6Lz
	 sfYawBTRqBcCjbkaQZ2a55kidC+tjQebeLBy0bw+7IOE5Z5QVZRuIROxpKdA6mRKcd
	 hCY53q/ZdmecxSfJi4PXa5NdEgY/Mto4lZHPD4m4=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250519151634epcas5p3a0e08112510553d5309c072da7dd2c71~A9pmKlQ4x1584715847epcas5p3D;
	Mon, 19 May 2025 15:16:34 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4b1Lr06k48z3hhT7; Mon, 19 May
	2025 15:16:32 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250516101757epcas5p368f98b909ff50c91700358f65228e066~-_pAvExL71920919209epcas5p3O;
	Fri, 16 May 2025 10:17:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250516101757epsmtrp22c1f07f88793cc19be819e06f3b2827b~-_pAt9LXe1867418674epsmtrp21;
	Fri, 16 May 2025 10:17:57 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-37-682710d51bb8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	33.2F.08766.5D017286; Fri, 16 May 2025 19:17:57 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101754epsmtip21f528a17cdd4b1f7f3d12e2cedac85fa~-_o91PBMW2836328363epsmtip2c;
	Fri, 16 May 2025 10:17:54 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 0/2] initial usbdrd phy support for Exynosautov920 soc
Date: Fri, 16 May 2025 15:56:48 +0530
Message-Id: <20250516102650.2144487-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRmVeSWpSXmKPExsWy7bCSvO5VAfUMg9evpSwezNvGZrHl1WYW
	izV7zzFZ3NuxjN1i/pFzrBbXbixkt/jz7zybxdHW/8wWL2fdY7PY9Pgaq8XlXXPYLCas+sZi
	MeP8PiaLtUfuslucf9HFarFhxj8Wi2f3VrBZ/N+zg93iy88HzBaH37SzWhxZ/pHJYuedE8wO
	Yh4n121m8ti0qpPN4861PWwem5fUe/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG2id2BUfZ
	K6YsvcnawDiJrYuRk0NCwERi0rMPTF2MXBxCArsZJWa3zGWBSMhIPJq2kRXCFpZY+e85O0TR
	W0aJ72/PAiU4ONgETCUm7kkAiYsI9DBJPL36gw3EYRY4zSSx4eMMdpBuYQFPiZ0X5jCC2CwC
	qhI3+1qYQGxeAXuJN6fmQW2Ql9h/8CwzRFxQ4uTMJ2BXMAPFm7fOZp7AyDcLSWoWktQCRqZV
	jJKpBcW56bnFhgWGeanlesWJucWleel6yfm5mxjBUaSluYNx+6oPeocYmTgYDzFKcDArifBe
	z1LOEOJNSaysSi3Kjy8qzUktPsQozcGiJM4r/qI3RUggPbEkNTs1tSC1CCbLxMEp1cC0o9rK
	/UOg2+ZsnbwXdjsNGmpDBd6lHt0+scnmW96aT0u2xl1hWi1kutD9R/W1vVMYeA8uudmyepWI
	pVXqtTkbZUOuzf9jKrTadXqS+LsA0+zJdv332ZYsSf+v9szrxw/5ixcsp/nwF98uWX5C1ci9
	8+LU98+OM4eIaxVd0Pj3SoC/dlqvclVAZUD2nmOLVNzPTjgvu8W38sCO5cEdvUJ3X95eOevY
	wq2/ZH8827zm7/5LT3OjzDlyeRfHh04JkmI0q05n9jR7LpeVJMUXGN2af1S7W8qrYV3lmWUB
	T/3++OsqVEgmLGVgXLJt+fyJiazHeJNUWmVuCnPMdHSYOlPx4XW5O8t7j61okV3QYLRFiaU4
	I9FQi7moOBEAVMSI6hEDAAA=
X-CMS-MailID: 20250516101757epcas5p368f98b909ff50c91700358f65228e066
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101757epcas5p368f98b909ff50c91700358f65228e066
References: <CGME20250516101757epcas5p368f98b909ff50c91700358f65228e066@epcas5p3.samsung.com>

This SoC has a single USB 3.1 DRD combo phy and three USB2.0
DRD phy controllers that only support the UTMI+ interface. 
This SoC is very similar to the existing Exynos850 support
in this driver. We have supported only UTMI+ in this patchset.

The difference is that combo phy supports both UTMI+(HS) and 
PIPE3(SS) and is out of scope in this patchset.

changelog
----------
Changes in v2:
- Used standard GENMASK() and FIELD_GET() to get the major version 
  from controller version register.
  link for v1: https://lore.kernel.org/linux-phy/20250514134813.380807-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (2):
  dt-bindings: phy: samsung,usb3-drd-phy: add dt-schema for
    ExynosAutov920
  phy: exyons5-usbdrd: support HS phy for ExynosAutov920

 .../bindings/phy/samsung,usb3-drd-phy.yaml    | 27 ++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 85 +++++++++++++++++++
 2 files changed, 112 insertions(+)

-- 
2.34.1

