Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BF62FC865
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152790; cv=none; b=FLJsbZN01Uf8HYoDAtr0N185hY6eNtutz2QOzrlAvjAN/qsWzMFq4B0DWKwRRKuQtIKDwHkt7dnzModbaRqpcWhBW5Y/ZUy867XzzeISMOydlaMcj48ph67Pugyeny2g8eeM0a1OJI7+jCCusmqceiFohSi0hfsnSj3Tm30WwTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152790; c=relaxed/simple;
	bh=AzJhcYD029ln0Aq2+p0ZkdDA8FumTzOgwMg18061Ui0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=E+Er/21myshuGDJMBQR+YtjJ8Z9mWRm5pwubJCarW5VDvcqjV0iZZQro/mYLh8wroXt7cSD0E0XdEU7f2PdmWA542ZMP0MSyVaX1QKiQiyFMJwAumioyTVYC8WO8B5W9rCke1yQZ8lH+PRElkBYmcrljJwZO9CRcVnSURybiMOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=dITJZzHj; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dITJZzHj"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251126102627euoutp01b5dfa9df38aebdeadd4b3d65a0a76912~7h5z86bOL1433714337euoutp01H
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251126102627euoutp01b5dfa9df38aebdeadd4b3d65a0a76912~7h5z86bOL1433714337euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764152787;
	bh=QVaBixP3DRbLOS72QGO+IEP76liWzoUObdxW9zj8eeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dITJZzHjDv6o8RSBH15cd+m5DOZGCC34XG4COu25xvDcasKAs+9a1zBqnAvXkykdD
	 NX5TakIV6QzwFLnB1tGLLc1AjbjBApGW73wCCkAhEDmXs5zGG/LgHnLwj+cqKWjv1S
	 ZvotyoJni4U+YU+9eSzlQnyh96dCC4yM9xkU3y4M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102626eucas1p257e17fa27a34005e3169eaaff2c28743~7h5zhpv5a0435404354eucas1p2I;
	Wed, 26 Nov 2025 10:26:26 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102626eusmtip2ea5c3d2d1172f82e807f963a9d184c5e~7h5zMqyKw1041610416eusmtip2w;
	Wed, 26 Nov 2025 10:26:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 1/4] ARM: dts: samsung: universal_c210: turn off SDIO
 WLAN chip during system suspend
Date: Wed, 26 Nov 2025 11:26:15 +0100
Message-Id: <20251126102618.3103517-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102618.3103517-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126102626eucas1p257e17fa27a34005e3169eaaff2c28743
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251126102626eucas1p257e17fa27a34005e3169eaaff2c28743
X-EPHeader: CA
X-CMS-RootMailID: 20251126102626eucas1p257e17fa27a34005e3169eaaff2c28743
References: <20251126102618.3103517-1-m.szyprowski@samsung.com>
	<CGME20251126102626eucas1p257e17fa27a34005e3169eaaff2c28743@eucas1p2.samsung.com>

Commit 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board
requires it") changed default behavior of the BRCMFMAC driver, which now
keeps SDIO card powered during system suspend to enable optional support
for WOWL. This feature is not supported by the legacy Exynos4 based
boards and leads to WLAN disfunction after system suspend/resume cycle.
Fix this by annotating SDIO host used by WLAN chip with
'cap-power-off-card' property, which should have been there from the
beginning.

Fixes: f1b0ffaa686f ("ARM: dts: exynos: Enable WLAN support for the UniversalC210 board")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
index bdc30f8cf748..91490693432b 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-universal_c210.dts
@@ -610,6 +610,7 @@ &sdhci_3 {
 	#size-cells = <0>;
 
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&ldo5_reg>;
-- 
2.34.1

