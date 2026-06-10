Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8511371D0F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781067823; cv=none; b=fvm7mSXWNF1g5M0mV1Dzvv+m7itHBznfbxSJr233dKlm7PjMo14CCRxEn9kOUlJpeNxdpeohBZQaQfQoRE8mJIiJwDeDyhFGKbwjjxrAOKVqUyS8ZoNPezxH+kwoD4FflX+WrpwRsLsNLZH9onQmE6Tb1/FPaIxXr2zNdSmD1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781067823; c=relaxed/simple;
	bh=6+LdkKchSz4QiBF4wEyjhZrrmYq/2In6m0vhW+fMsLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=ARc9gvDgojqPwPIhjo8Gwwo05KrX1RXjZ0OrMghRVg7/9H8/Pl1I4S9muWs3d7Wt5aFdFadkxY85+xnbAaMwT9dOlG/Rk/1kJ7TLK5fuDjEUkLm8tl1XyR47Ja7q88oXWK/lQymdIp689z2d+JpXW8uSBvDBGiqqxYmmscm77cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kTyD4Xni; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kTyD4Xni"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260610050334epoutp02fc7e66f5ce6949d2d40d2ee162d10c80~3n72Yiaxw2192321923epoutp02b
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jun 2026 05:03:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260610050334epoutp02fc7e66f5ce6949d2d40d2ee162d10c80~3n72Yiaxw2192321923epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781067814;
	bh=w0rfj44pzK6uCavvb+j8L9p+5QSuBoPORAdrkd5H7qY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=kTyD4XnitsJ8wQR9FW6WPKjv4Er3V6EgIy/ttrIdkxEULH0FkbRCHrUU9zpNV9usC
	 XvIfu3m1AEkhjHjLOx7axHMmgbbSLBZmh3n6LKiWIbtBD5LkLwdZP1DygabyoMUXBQ
	 BpIYf4tW6SCQR7fSi4IGe5HM/2AUuN/qdGtTvo8Y=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260610050333epcas2p3de74fefcdd6aa3c57c6afe4449ed8a10~3n71jRxDk1025210252epcas2p32;
	Wed, 10 Jun 2026 05:03:33 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.200]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gZtw50ZmBz3hhT9; Wed, 10 Jun
	2026 05:03:33 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260610050332epcas2p32ed8c6f7b410a295a43054a28b711ddb~3n70sHRMf1005110051epcas2p3D;
	Wed, 10 Jun 2026 05:03:32 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [12.81.221.119]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260610050332epsmtip202006736dc7e42d5045a5454abc841fa~3n70lMf2c1155711557epsmtip2a;
	Wed, 10 Jun 2026 05:03:32 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH v3 0/2] Add ExynosAutov920 hsi0 support to exynos-sysreg
Date: Wed, 10 Jun 2026 14:03:24 +0900
Message-ID: <20260610050326.2903402-1-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260610050332epcas2p32ed8c6f7b410a295a43054a28b711ddb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260610050332epcas2p32ed8c6f7b410a295a43054a28b711ddb
References: <CGME20260610050332epcas2p32ed8c6f7b410a295a43054a28b711ddb@epcas2p3.samsung.com>

The ExynosAutov920 SoC includes a PCIe IP and a hsi0 register block that
is mapped in the exynos-sysreg.

To manage PCIe PHY power, configure the PCIe PLL, and set the device direction,
the hsi0 registers need to be defined in exynos-sysreg.

This patch must be applied before the ExynosAutov920 PCIe PHY is enabled.

Changes in v3:
- Rebased on top of origin/next/dt (no functional changes)

Changes in v2:
- Add exynosautov920-hsi0-sysreg DT node as a binding user (patch 0002)

Sanghoon Bae (2):
  dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov920
  arm64: dts: exynosautov920: Add hsi0 syscon node for PCIe PHY

 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 1 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi              | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.45.2

