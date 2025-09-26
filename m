Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242F291C11
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758872439; cv=none; b=aplIsnmzqLxLcMKHDpZQcEbPBW3VYIcpg503gssSsYQTPQK35cywWauaWk30O2p0yHEw/gItPR4uxHlPU4MoMRofKHuo78Dgpxf57QZpn1A4bfadobsvo6Rj3m2GzckO3SWsjB2dyJIJutPLMAwuaTcA6dcgrerWE911qCE9MHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758872439; c=relaxed/simple;
	bh=RMTdSl1EReIsDbu7gTRVqEIhBEgJjesg9JQOWQIRlcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=nhpXUuCSQ5O9VZqNC00eEDzV1mD2RmIxM4W5NoD2XYB7mLirpW4aU8I6lk4osEk0u0TXeVF17oqUdATbwfNKm82W80KRaJRvxmOor78djhudTdQpNmRAcKO9EHThpHF38yepxIIjRG1Y9rKpqhGzswKiCfiT93XyHKxVkKaMojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ooBcemBw; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ooBcemBw"
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250926074035epoutp029878a75fef36f5611361fa28a29e9afe~oxSkzCgRX1904519045epoutp02V
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Sep 2025 07:40:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250926074035epoutp029878a75fef36f5611361fa28a29e9afe~oxSkzCgRX1904519045epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758872435;
	bh=Ed+5kxoNWx3Jwxxg6b5MJ/fr9ca6CEUeMaFTMyUKs7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ooBcemBwJFZTI1CGR//6gGzFHvHxARnloqJ618aRTs036fyD+m3cJDd/qUy3pU8f8
	 4sUDV8YHBp7HiHXl8HkOYlKMF/G19QNMALGyOWh9pEQf6NDbXmGHgaDoMXgSXgSUqI
	 0aVhLKBHX84JL5wDVY7HLgogx1It5osgyVHQicKw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250926074034epcas2p43be6732f342e5bec135b40966271129b~oxSkPl-K33226632266epcas2p4e;
	Fri, 26 Sep 2025 07:40:34 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.68]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cY2Yt0VLsz6B9mF; Fri, 26 Sep
	2025 07:40:34 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250926074033epcas2p371d57850f46c9ecb307f3ea8c6d4a57f~oxSi8tEpt1589115891epcas2p3A;
	Fri, 26 Sep 2025 07:40:33 +0000 (GMT)
Received: from asswp146.dsn.sec.samsung.com (unknown [10.229.19.146]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250926074033epsmtip29387fe8aacfb676855f5efede978805c~oxSi3pQiI1189511895epsmtip22;
	Fri, 26 Sep 2025 07:40:33 +0000 (GMT)
From: Sanghoon Bae <sh86.bae@samsung.com>
To: robh@kernel.org, krzk@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	alim.akhtar@samsung.com, kishon@kernel.org, m.szyprowski@samsung.com,
	jh80.chung@samsung.com, shradha.t@samsung.com
Cc: krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	sh86.bae@samsung.com
Subject: [PATCH 0/4] Add support for ExynosAutov920 PCIe PHY
Date: Fri, 26 Sep 2025 16:39:20 +0900
Message-ID: <20250926073921.1000866-6-sh86.bae@samsung.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250926073921.1000866-1-sh86.bae@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250926074033epcas2p371d57850f46c9ecb307f3ea8c6d4a57f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250926074033epcas2p371d57850f46c9ecb307f3ea8c6d4a57f
References: <20250926073921.1000866-1-sh86.bae@samsung.com>
	<CGME20250926074033epcas2p371d57850f46c9ecb307f3ea8c6d4a57f@epcas2p3.samsung.com>

The ExynosAutov920 SoC has two instances of DesignWare-based PCIe PHY IP.
Each PHY has a different lane specification: one is a 4-lane PHY and
the other is a 2-lane PHY.

Each PHY can be used by separate controllers through the bifurcation
option. Therefore, from 2 up to 4 PCIe controllers can be supported
and connected with this PHY driver.

Most of the PHY structure and registers are identical, but some aspects
need to be distinguished. For this, PCIe lane number added for each PHY
properties only in ExynosAutov920.

This patchset includes:
- DT bindings for ExynosAutov920 FSYS0 sysreg
- DT bindings for ExynosAutov920 PCIe PHY
- PCIe PHY properties for ExynosAutov920 in the device tree
- PHY driver for ExynosAutov920 PCIe

Note that this patchset does not enable PCIe0 and PCIe2.
Enabling them requires additional patches for the ExynosAutov920 PCIe
RC driver, which will be applied later.

Please note that these patch set depends on the Shradha Todi's patchset
https://lore.kernel.org/lkml/20250811154638.95732-1-shradha.t@samsung.com/
so need to apply on top of that series, because that adds
the patches to make Exynos PHY common for all.

Sanghoon Bae (4):
  dt-bindings: soc: samsung: exynos-sysreg: add hsi0 for ExynosAutov920
  dt-bindings: phy: Add PCIe PHY support for ExynosAutov920 SoC
  arm64: dts: ExynosAutov920: add PCIe PHY DT nodes
  phy: exynos: Add PCIe PHY support for ExynosAutov920 SoC

 .../bindings/phy/samsung,exynos-pcie-phy.yaml |  14 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |   1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  28 +++
 drivers/phy/samsung/phy-exynos-pcie.c         | 231 ++++++++++++++++++
 4 files changed, 274 insertions(+)

-- 
2.45.2

