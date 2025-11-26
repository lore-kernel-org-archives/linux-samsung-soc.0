Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C7330E846
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152790; cv=none; b=ucoglo136wjyCyaloK7YNJ2hVPm1a8HAFXBV+YyTEP1G1sE5Hui/sz0gTYp8yzKPvjb2Ce7PuPDHEhSenOToudGWxg8W3tuko6cNXxN7nCf1zgsYguzUqa2Jtv12b9sF0Vwu23V66FdT9o3tcHy78QAN0hkjfvsuEdm817j/viI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152790; c=relaxed/simple;
	bh=oduIPP6Pb5x85glLjuZcfFO3YpqoPYHoIJMyWUwkgEA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=mSIQzeBNUghGqwjxDxLkRnOF9C8y166PU33bKjugSKxPvl0LQPoZzZ3aqFcy1Ni72PPBevI3a8KnWZievjq14otjpKwgYuvEvvAtJwtsTX1lk56brIb9uKf9daQE4Wt95xIS46wwEoNe3cvk9GYj9+zjRgq0YB5rMmMg+wxMVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Fpyq1xZz; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Fpyq1xZz"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251126102627euoutp01c64274c6c74c75aff87d4d42b363ba96~7h50AdTDX1535915359euoutp015
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251126102627euoutp01c64274c6c74c75aff87d4d42b363ba96~7h50AdTDX1535915359euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764152787;
	bh=UVDnzQIpzKeNbxOXO7pLYkiTwCuBfXwjAeqRg2uKXzY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Fpyq1xZzA9v3wRyakd6DbXUSuJZUnO47V5huS7vruOmOItEGYNKw17m7JvPurMs59
	 Wv5mlPM/U0Y/ngHIS2lOQwMGtWcoEDyTwULh5kG4ss07OmG6cxeZHLG/KUmhboMCqN
	 FwKKF1BtTNaqUd00s8M2+E3r0Li4/iLDXpFTfYD8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251126102626eucas1p1ff6379819c325f0dfcf067ca0588ff5c~7h5zKnNtS2317223172eucas1p1j;
	Wed, 26 Nov 2025 10:26:26 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102626eusmtip25cc901f7cb4d473c8b0a27c2d66610e8~7h5yxqasm1041610416eusmtip2v;
	Wed, 26 Nov 2025 10:26:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 0/4] Exynos4: turn off SDIO WLAN chip during system
 suspend
Date: Wed, 26 Nov 2025 11:26:14 +0100
Message-Id: <20251126102618.3103517-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126102626eucas1p1ff6379819c325f0dfcf067ca0588ff5c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251126102626eucas1p1ff6379819c325f0dfcf067ca0588ff5c
X-EPHeader: CA
X-CMS-RootMailID: 20251126102626eucas1p1ff6379819c325f0dfcf067ca0588ff5c
References: <CGME20251126102626eucas1p1ff6379819c325f0dfcf067ca0588ff5c@eucas1p1.samsung.com>

Commit 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board
requires it") changed default behavior of the BRCMFMAC driver, which now
keeps SDIO card powered during system suspend to enable optional support
for WOWL. This feature is not supported by the legacy Exynos4 based
boards and leads to WLAN disfunction after system suspend/resume cycle.
Fix this by annotating SDIO host used by WLAN chip with
'cap-power-off-card' property, which should have been there from the
beginning.

This fixes the following issue observed after system suspend/resume cycle:

brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
brcmfmac: brcmf_sdio_dpc: failed backplane access over SDIO, halting operation
brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
brcmfmac: brcmf_sdio_dpc: failed backplane access over SDIO, halting operation
brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
brcmfmac: brcmf_sdio_dpc: failed backplane access over SDIO, halting operation
brcmfmac: brcmf_sdio_htclk: HT Avail request error: -110
brcmfmac: brcmf_sdio_dpc: failed backplane access over SDIO, halting operation

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland


Changelog:
v2:
- separate patch for each board

v1: https://lore.kernel.org/all/20251126093652.3101226-1-m.szyprowski@samsung.com/


Patch summary:

Marek Szyprowski (4):
  ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during
    system suspend
  ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during
    system suspend
  ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during
    system suspend
  ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during
    system suspend

 arch/arm/boot/dts/samsung/exynos4210-i9100.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-trats.dts          | 1 +
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 1 +
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi         | 1 +
 4 files changed, 4 insertions(+)

-- 
2.34.1

