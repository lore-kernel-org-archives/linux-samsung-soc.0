Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82752D73B4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884488; cv=none; b=tS1FgcWS3Zj5LyBfSqCzHrJVYEduBXzozGGcW5tDKfL5cRAuYgmEcStyIjW9ke4xkgJ9ifM1KmIIMezUEJS9YMpH1WfoQyzSHQDXhu6KCb8sMKvmzA0pjtwTOb5ayG5t5yud/ZW9nTctuqFAwa45Nbr+ZGkx7SxubaUi64T4ZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884488; c=relaxed/simple;
	bh=7gcQw7FbIiJo3iJ+fuHTuQo7HyMAPDNUNBl/8HU+sbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=VC+yb5h/s74UuG3WhvTPx/ZgqKiKL4SegkmfLMpliZl74t08GGRCcY1+p+wblbyUCGHdmzZiVZBBN4AI6hkbsIP+jOLvlplI8lglGbg9krpPbx8kD0JxKNp68Xa0gcn9SxRbCuokltQSHPPgXbvlLz9a8vzV2xRONmTTunL98oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XZDYIfJw; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XZDYIfJw"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260212082119epoutp04283c09a2c128df1c4bd1712b9600d6e9~Tcg0XAiot1816618166epoutp04J
	for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:21:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260212082119epoutp04283c09a2c128df1c4bd1712b9600d6e9~Tcg0XAiot1816618166epoutp04J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770884479;
	bh=jq+7d+WH907G/sC72dBql4EeICkftJSTEn0lJUay7qs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=XZDYIfJwI10eXCIBvMXvfcr2mnmXSCKQ/rqccSq7kbXZ8bT37HuzPUm5AxvAOv1vq
	 rpGJNr98hb7wa6zs0voQuVRm01a4HaRaObjfFTvtQPfogGJZZTVSBT5QLC5Z6R04nI
	 VsqO2TRZI683eka1pTTbytImiJh45b6KUwA0oQNk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20260212082118epcas2p32103198bb7805f633677ab604cd5da4f~Tcgz5wPNP2198121981epcas2p3e;
	Thu, 12 Feb 2026 08:21:18 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.206]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4fBStk0fDDz3hhT7; Thu, 12 Feb
	2026 08:21:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20260212082117epcas2p1d77535385304e28d140c1254ab305511~TcgzDqxP_0985509855epcas2p1X;
	Thu, 12 Feb 2026 08:21:17 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260212082117epsmtip1d33214a4fe5e4052e8cfb17b4aeb1bda~Tcgy8iyVS2155921559epsmtip1G;
	Thu, 12 Feb 2026 08:21:17 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	sowon.na@samsung.com, Sanghoon Bae <sh86.bae@samsung.com>
Subject: [PATCH v2 0/2] Add ExynosAutov920 hsi0 support to exynos-sysreg
Date: Thu, 12 Feb 2026 17:21:02 +0900
Message-ID: <20260212082105.1878720-1-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260212082117epcas2p1d77535385304e28d140c1254ab305511
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260212082117epcas2p1d77535385304e28d140c1254ab305511
References: <CGME20260212082117epcas2p1d77535385304e28d140c1254ab305511@epcas2p1.samsung.com>

The ExynosAutov920 SoC includes a PCIe IP and a hsi0 register block that
is mapped in the exynos-sysreg.

To manage PCIe PHY power, configure the PCIe PLL, and set the device direction,
the hsi0 registers need to be defined in exynos-sysreg.

This patch must be applied before the ExynosAutov920 PCIe PHY is enabled.

Sanghoon Bae (2):
  dt-bindings: soc: samsung: exynos-sysreg: Add hsi0 for ExynosAutov920
  arm64: dts: exynosautov920: Add hsi0 syscon node for PCIe PHY

 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 1 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi              | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.45.2

