Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC43164BD
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152794; cv=none; b=s9cUyQkClbNlBjujZ+xOb0tFq62iIoIOiQRZ6Ib8EeSXkfOm0Joel8CQj0nbMsxyi8nrfOnHfwmshUZgwAECDx5iKQMZQY+8DLbkvoKrEQP/IexbfNIn6Sbrawlmg+8e6KpGjh2j03Elm8r1ws1aDZ73Gm3Tr/YNJKgHI8awM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152794; c=relaxed/simple;
	bh=miBQxTkZj+hqCngl8k96M49oliTTt8OXH4+GTBMR8KY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=BJQMVl6iUtEmDQob+uvgK+Tmr3HIGh4d2hRy3m1BA9KX3Esaiw+pkZ1fQcOzXu7NmFe8CCMqq9/PlBZy3JmGWCYzKaNUcgjY4CNRnDFRApNqD63ntui3CU8jo5CiVz0vGrTztyqFrMvuDHGiI5XHVUgwpzl+V3GCBx6UIrLtlpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=j/IPcRSB; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="j/IPcRSB"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251126102628euoutp013759d9b914f5133f824eb389d8f4dd56~7h50l9dVa1440114401euoutp01A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251126102628euoutp013759d9b914f5133f824eb389d8f4dd56~7h50l9dVa1440114401euoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764152788;
	bh=Oaupeil7bOty9HCAXvENJ45+5GJFRdAYUqDOZseF/3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j/IPcRSB6S0K3D/X3ZM2oXvDVDVT0cjYMtGU8OuHOmO2ufssYSXZYTmc4a2EMwEqc
	 6gXAZsLOK+frGfCYkYtEhIuoT9Vb+pVeJ/+8lG3vKhuYLcwT84ZtVTXji1VPCNBgi1
	 nxlshT253nTTZfgG7LZQhppFiJSVCSbo8oxOrrtY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251126102627eucas1p1cc818b539afabab0a397ba632e60e559~7h50YBxEJ2319823198eucas1p1h;
	Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102627eusmtip2a6d4246712d815150293a10fa01b62e2~7h50Derm61217212172eusmtip2D;
	Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 3/4] ARM: dts: samsung: exynos4210-trats: turn off SDIO
 WLAN chip during system suspend
Date: Wed, 26 Nov 2025 11:26:17 +0100
Message-Id: <20251126102618.3103517-4-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102618.3103517-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126102627eucas1p1cc818b539afabab0a397ba632e60e559
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251126102627eucas1p1cc818b539afabab0a397ba632e60e559
X-EPHeader: CA
X-CMS-RootMailID: 20251126102627eucas1p1cc818b539afabab0a397ba632e60e559
References: <20251126102618.3103517-1-m.szyprowski@samsung.com>
	<CGME20251126102627eucas1p1cc818b539afabab0a397ba632e60e559@eucas1p1.samsung.com>

Commit 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board
requires it") changed default behavior of the BRCMFMAC driver, which now
keeps SDIO card powered during system suspend to enable optional support
for WOWL. This feature is not supported by the legacy Exynos4 based
boards and leads to WLAN disfunction after system suspend/resume cycle.
Fix this by annotating SDIO host used by WLAN chip with
'cap-power-off-card' property, which should have been there from the
beginning.

Fixes: a19f6efc01df ("ARM: dts: exynos: Enable WLAN support for the Trats board")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos4210-trats.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-trats.dts b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
index 95e0e01b6ff6..6bd902cb8f4a 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-trats.dts
@@ -518,6 +518,7 @@ &sdhci_3 {
 	#size-cells = <0>;
 
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&tflash_reg>;
-- 
2.34.1

