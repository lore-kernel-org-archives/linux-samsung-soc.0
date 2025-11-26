Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DE82E54CC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152790; cv=none; b=WotKOARQC1BItHUC7RQqHMxsjOhEx8P/qlkY8nNkNEdECxtPEPQEmpT6/ygvx+meGfYOyFU4VzaUr1Vrj3mwKvON1QY+tPK5oFvk+9ov4StmcPM2GIXHudbAGTmdYWzsKFzqJh2UhAzKhUa8XMCqS6lOv+twDzs4jHgLk5Jpr5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152790; c=relaxed/simple;
	bh=CWtH9NuB8GBaYcnD+xzN4MNqhUX5mOC+WbDO1MFBHcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Ui1nXL0QvdHVSKfyK82XA7fBVmDUiZKV69YTS751AUgnZHINC4uQ0Cz8wRmU7aiR7AKF4k8k9+1ywxH2CbYULoUQGN0RECKe3ijdxnY7M99fH0PwOzX6gmoc3ENsUG57CpU8m/TODPRQyihttI7h9h1fvsh9KUcSxuAocgcuFLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=B0OofCjr; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="B0OofCjr"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251126102627euoutp01381a7542eec1606750b30a9c432d6324~7h50ZUbev1434314343euoutp01M
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251126102627euoutp01381a7542eec1606750b30a9c432d6324~7h50ZUbev1434314343euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1764152787;
	bh=p4v5cbW54H7er7ByBgdYHFJjk+bk0LEerXc0QO5wU7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B0OofCjriVYwuLXDfr9GFjp5PzJo/HT0lM/IquLbAglJsiDQurzLhGxOgkVLOj72M
	 Pa3qDRVvNuIGNC5OHFcxaThSroYYyZbKjf7oFlu2/359jl9OqM2hVN/wfXgtVnBP9+
	 Olh+NaFioO1RsQphLFb2VfjvKfjsGbPhoXP2/wX4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102627eucas1p2471d88bc0599f3c3869a465de888daaa~7h5z9qQH41140711407eucas1p2r;
	Wed, 26 Nov 2025 10:26:27 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251126102627eusmtip224151978809cbe6dd3521a29a8d36b1d~7h5znboti1041610416eusmtip2x;
	Wed, 26 Nov 2025 10:26:26 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Subject: [PATCH v2 2/4] ARM: dts: samsung: exynos4210-i9100: turn off SDIO
 WLAN chip during system suspend
Date: Wed, 26 Nov 2025 11:26:16 +0100
Message-Id: <20251126102618.3103517-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251126102618.3103517-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251126102627eucas1p2471d88bc0599f3c3869a465de888daaa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251126102627eucas1p2471d88bc0599f3c3869a465de888daaa
X-EPHeader: CA
X-CMS-RootMailID: 20251126102627eucas1p2471d88bc0599f3c3869a465de888daaa
References: <20251126102618.3103517-1-m.szyprowski@samsung.com>
	<CGME20251126102627eucas1p2471d88bc0599f3c3869a465de888daaa@eucas1p2.samsung.com>

Commit 8c3170628a9c ("wifi: brcmfmac: keep power during suspend if board
requires it") changed default behavior of the BRCMFMAC driver, which now
keeps SDIO card powered during system suspend to enable optional support
for WOWL. This feature is not supported by the legacy Exynos4 based
boards and leads to WLAN disfunction after system suspend/resume cycle.
Fix this by annotating SDIO host used by WLAN chip with
'cap-power-off-card' property, which should have been there from the
beginning.

Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the Galaxy S2")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
index df229fb8a16b..8a635bee59fa 100644
--- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
+++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
@@ -853,6 +853,7 @@ &sdhci_3 {
 	#size-cells = <0>;
 
 	non-removable;
+	cap-power-off-card;
 	bus-width = <4>;
 	mmc-pwrseq = <&wlan_pwrseq>;
 	vmmc-supply = <&vtf_reg>;
-- 
2.34.1

