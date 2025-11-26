Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A29315D4E
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152792; cv=none; b=MRgaVy1RTLrgmo2Z7R1J8/b0rHPg5SIkzyzqYUCULp5KOOAW39NwRcLfYgJ7K/rO+CxZyYYeIqUcEMFz1BPyOKrRU8nC4evt1dwauegvo8FFj5W3PG4a2c24sAf2ijZuSf1i01VLAgg2gmXZhhDaj0NrCGQt2atg4ZaMfLkt3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152792; c=relaxed/simple;
	bh=GkpxMct2pxziYF5amtENJ5j801wKxt+JP9R2UWaUXgU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=RcBTByUTv67WyVKUIHxSHQV8GWCKTyCIucICQn4kgsphySfBTl4+RGSkWzrKDMg7T5BUmoFGN3792G1JUyNv5LytLxafgAtShg5BPMbTV8sRsd7hmUCjnDL1GheTpYu7VsU6N0NVkVZGJnHTkC5bQZ2bHFmGRjFhV4qBZGfxoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OeErG7yL; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OeErG7yL"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251126102629euoutp028e5d4eda4a0f2ea82fcc302bbfaae5c7~7h51eLTHg1674916749euoutp02D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251126102629euoutp028e5d4eda4a0f2ea82fcc302bbfaae5c7~7h51eLTHg1674916749euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764152789;
	bh=XVhGE4oF0BQ3DKJayYVNO1zbT77N65b4WbCFzXhmgL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OeErG7yLfuiRBPNYU3PYyaXqEWjO/daU75g6LyWbE1Ftxw4bsrfCm5N3xj77b+VM2
	 vSPHy/yj/dLC6AYw9GEioQG6xAj7Qoiogget3czfLDBRt0aKewLtySJgM48xHKihFX
	 hczxYYRp5ioCAK+Xa6+VfyluB6WQJJHDoO3HARmI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102628eucas1p2d311e0b7aafd9c6a8916cbbab35b6912~7h50yXqsU0872308723eucas1p21;
	Wed, 26 Nov 2025 10:26:28 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102627eusmtip2593a9bd048cb63d20d76fc7fddd85dc7~7h50dsLCZ1041610416eusmtip2y;
	Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 4/4] ARM: dts: samsung: exynos4412-midas: turn off SDIO
 WLAN chip during system suspend
Date: Wed, 26 Nov 2025 11:26:18 +0100
Message-Id: <20251126102618.3103517-5-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102618.3103517-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126102628eucas1p2d311e0b7aafd9c6a8916cbbab35b6912
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251126102628eucas1p2d311e0b7aafd9c6a8916cbbab35b6912
X-EPHeader: CA
X-CMS-RootMailID: 20251126102628eucas1p2d311e0b7aafd9c6a8916cbbab35b6912
References: <20251126102618.3103517-1-m.szyprowski@samsung.com>
	<CGME20251126102628eucas1p2d311e0b7aafd9c6a8916cbbab35b6912@eucas1p2.samsung.com>

Commit 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board
requires it") changed default behavior of the BRCMFMAC driver, which now
keeps SDIO card powered during system suspend to enable optional support
for WOWL. This feature is not supported by the legacy Exynos4 based
boards and leads to WLAN disfunction after system suspend/resume cycle.
Fix this by annotating SDIO host used by WLAN chip with
'cap-power-off-card' property, which should have been there from the
beginning.

Fixes: f77cbb9a3e5d ("ARM: dts: exynos: Add bcm4334 device node to Trats2")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 05ddddb565ee..48245b1665a6 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -1440,6 +1440,7 @@ &sdhci_3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 
 	mmc-pwrseq = <&wlan_pwrseq>;
-- 
2.34.1

