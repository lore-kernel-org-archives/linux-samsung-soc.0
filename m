Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CE30F93E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306029; cv=none; b=ZOWpgRwwN3rPvzVEBtvLXsp1EmTwSErNcYo9hfDUP7K9JiUf/ptZmVRDE6HSIQhotINz8E4wp8evP2fgecSJNE7Zdv+m5AjjVU+MrW1gkUrFKAos75HMEOt0CAqUYPfqA1aRrzYCQ1k7dBsWJZfqhk0hCV7EoSB/uET2lwTZwvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306029; c=relaxed/simple;
	bh=yzJJuDikND7f52ceU2msuVWajNtaFwvH51hrXMFqQyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=UyZA8iN36EN4p7h/2t1GYhMJJeqP5D2Q5r53PxcwpwzmSUc5jWV5leJp8Io53me1S2bhwkYQukZUfv9yhBcBjXNMjh/G/7hJA8tzZFUxsIVibi5YKbocjLUlxFZe469TC/F1DwIFDLyTMDB0uuu1tp4Ok55BXriKuPsh2Csj9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Soy+HB/6; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Soy+HB/6"
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251024114019epoutp04000cbff526e583bf5e63631d34c1a698~xan48XTbU0825108251epoutp04V
	for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Oct 2025 11:40:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251024114019epoutp04000cbff526e583bf5e63631d34c1a698~xan48XTbU0825108251epoutp04V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761306019;
	bh=jgD4FE835KaeZjVVwGrOvcS2NoefLZfY/9wEtmAm6Z0=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Soy+HB/6fzz11glCO37ATJv7u0hjoZKmpqiTxjQQm4pI6bDaskxEUBgbPcnQjPIpL
	 TSuQU6g4eb4VywHVZ+mCMuzBj+fKe8w9I8Mn9pATI/MkUDgJa0yaU1qON/g1Vtbv1Y
	 GUCSguONvfkf47s8hJWPw27z4ANdAvRYPGX0/ub8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20251024114019epcas5p4d53ff7d6db9e242ee2c83851b6dcc4ff~xan4ZNeMk0125301253epcas5p4y;
	Fri, 24 Oct 2025 11:40:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.91]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ctLYZ4w0Fz2SSKZ; Fri, 24 Oct
	2025 11:40:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284~xan3aYEnJ0616806168epcas5p4R;
	Fri, 24 Oct 2025 11:40:18 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251024114009epsmtip1e974e301bfbcf3d88e036be7c602a0c4~xanvadepJ0283702837epsmtip1B;
	Fri, 24 Oct 2025 11:40:08 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rosa.pila@samsung.com, dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH 0/3] Add and enable USB nodes for ExynosAutov920 SoC
Date: Fri, 24 Oct 2025 17:18:42 +0530
Message-Id: <20251024114845.2395166-1-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284
References: <CGME20251024114018epcas5p4e09ca8ea47ff2295a08a162864a47284@epcas5p4.samsung.com>

This SoC has 2 USB typeC and 2 typeA ports those are DWC3 DRD
controllers and amoung them, one is USB3.1 DRD combo phy and three
USB2.0 phy controllers. This patchset adds and enables USB and
USB-PHY nodes in dts.

PMIC driver is not implmented yet, we rely on USB LDOs being enabled 
by the bootloader and used dummy regulators for now.

To drive vbus for host mode, it needs GPIO pin to enable vbus regulator.
GPIO expander is present in the dts, we used it to enable the vbus 
regulator using GPIO.

USB ports are configured as OTG, and default mode is configured as
peripheral. These configurations might be changed based on requirements.

This patchset has dependancy on schema and driver implementation[1]
and role switch control from userspace[2] patches.
[1]: https://lore.kernel.org/linux-phy/20251010070912.3758334-1-pritam.sutar@samsung.com/
[2]: https://lore.kernel.org/linux-usb/20251024085455.789555-1-pritam.sutar@samsung.com/

Pritam Manohar Sutar (3):
  arm64: dts: exynos: ExynosAutov920: Add USB and USB-phy nodes
  arm64: dts: exynos: ExynosAutov920: Add regulators for the USB
  arm64: dts: exynos: ExynosAutov920: Enable USB nodes

 .../boot/dts/exynos/exynosautov920-sadk.dts   | 160 +++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 162 ++++++++++++++++++
 2 files changed, 322 insertions(+)

-- 
2.34.1

