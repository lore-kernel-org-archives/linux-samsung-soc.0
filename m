Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A4B3A7F52
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769086299; cv=none; b=s3/rabdaBaqD1lRSli0jezAdiehDGkLqbvXYGEq0VrnR7Lwk5TCtk3B9ORvFM+LqyKKBL1jSDO6+OuOgTAfhDJXBvGW/uoED1Npiub8hg8A8pjzDM2BT0AfXOzqPURZNcpGOA5voWf3xHpjfRfvHWXNri1AZBhhJef1+CGhqU8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769086299; c=relaxed/simple;
	bh=8LwI9l35aWFCznA9tYtPt7+sdhTJwEuqglb7Ot9Jl68=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=tXsiT41BbkKfhMmHJVdwfbpIdBB3B1TbHsCxmW8UwgA43lZhZ4ITvI7pZb8YL1WH60gw8lEJ8EMrLuifRpDQkEcHg6ogmuDAK0Nx6ss0p/GrxBNR+6imqlagPt5LEzIEytmVQ1GjkCAUrr3977MxLBnYCt7Rai9dAcCN+s4gV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XsD2TwKO; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XsD2TwKO"
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260122125132epoutp049cad3ac838e0d21619ad7521246627b5~NDpwsET032512425124epoutp04p
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Jan 2026 12:51:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260122125132epoutp049cad3ac838e0d21619ad7521246627b5~NDpwsET032512425124epoutp04p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1769086292;
	bh=1YEdIuy+mVK4BJTKeVyMQ8ipqgyiyzWXJoHQTOrtzcA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XsD2TwKOve6Ati77Wwp+/RvQEfcOw+eTOzWSbk+crGiOixRiSjmryWmQrJTqnyNJn
	 RGLbmKuP5akum2YfUsisN/opU0gjC1NRR68FV/cKsJT+KMwyrrOmjpOL7Ofu3/DOYG
	 jYbJM6KXI59XWw4fRgSch8NAFRP3GJS4TF3F8Dvg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260122125131epcas5p4f312c87b94c2c65a742b0199a077c0d7~NDpv4ZN_q1352113521epcas5p4S;
	Thu, 22 Jan 2026 12:51:31 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4dxgtB55j9z2SSKY; Thu, 22 Jan
	2026 12:51:30 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2~NDpuh5Hhf1109211092epcas5p4b;
	Thu, 22 Jan 2026 12:51:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260122125128epsmtip1fdc3cb93ecb73e4058921f2ecf8443a7~NDpsvxkan0713007130epsmtip1R;
	Thu, 22 Jan 2026 12:51:28 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Thu, 22 Jan 2026 18:37:18 +0530
Message-Id: <20260122130721.205664-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2
References: <CGME20260122125130epcas5p4ac37f540c609f3016ff02f5708e897a2@epcas5p4.samsung.com>

This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
controllers and among them, one single USB3.1 DRD combo phy and three
USB2.0 only phy controllers. This patchset adds and enables USB and
USB-PHY nodes in dts.

PMIC is not implemented yet, we rely on USB LDOs being enabled by the
bootloader and used dummy regulators for now.

To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
GPIO expander is present in the dts, we used it to enable the regulator
using GPIO.

USB ports are configured as OTG, and default mode is configured as
peripheral. It will be changed based on requirements.

changelog
----------
Changes in v2:
- As v1 was pushed 3 months back, resending this patchset.
- Since dependencies are merged, removed links from coverletter.
  link for v1: https://lore.kernel.org/linux-devicetree/20251024114845.2395166-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (3):
  arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
  arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
  arm64: dts: exynos: ExynosAutov920: Enable USB nodes

 .../boot/dts/exynos/exynosautov920-sadk.dts   | 160 +++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 2 files changed, 322 insertions(+)

-- 
2.34.1

