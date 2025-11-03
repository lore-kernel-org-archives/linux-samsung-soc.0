Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141E2248BE
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762178781; cv=none; b=SRcXbwAn+LV0VGHsk3z8gs4dKHWSDtkM3e7lZyo+WcxWN75tByvCtOljzV/eVQidWnW3+nimrkMHFZ/p/E5oxwhTnWZYPT8DdPJLCWZo/oIQ/Xh0hgbsxtowlLj0C7s6Ft+hwjp9x7disR/5T8mfpW4/l7MD7fdVVh98hqakIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762178781; c=relaxed/simple;
	bh=zprGEGlENkcdGID+jnKB6GwFEhKVasGWXxIjdFskYg4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=IXeF58+ug2lZ6zAJDBSvcSkM5fnPf8cM/MAUTjX+OFyde9cvGoYKFIos1CZXh241Rg/vIJTc6vRS89m3XltmkAXJDntvK9ihyUr4tGkRFRDA3rGJNM60kJ6CPQ7g9Ncxr3s89EMSOGwopcyum5szH3j8vK7Rf1jcsl+FdpXjB/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NWC0P7xU; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NWC0P7xU"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251103140610euoutp01b8f836d97dbd73182913286ad8449d63~0hEF3laSL2482124821euoutp01S
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Nov 2025 14:06:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251103140610euoutp01b8f836d97dbd73182913286ad8449d63~0hEF3laSL2482124821euoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1762178770;
	bh=4MiJ+uy+WW1fJ9ZLuo2A9d/Q1LZuPXcBGuooHhjDd94=;
	h=From:To:Cc:Subject:Date:References:From;
	b=NWC0P7xUOh9tJE6Y9eTwgDZNPpqmK+LqgT4QgzfCajM+KVM6nRDGAto1MV6u9K+08
	 B3CkIz1fLlNGYhO5fX6msXowHOPlylsILZTU18Dz8K1NEwtMm55dqWaWr/T6BXQbpW
	 Tz/jZvbVsq/UGTamH2w8TBJmrIfcnhH6XxQCLuCQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14~0hEFaEb1A1895618956eucas1p23;
	Mon,  3 Nov 2025 14:06:10 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251103140609eusmtip1ac49a7f18256bfb2c28aefa578567e59~0hEE_iGSn0790907909eusmtip1R;
	Mon,  3 Nov 2025 14:06:09 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Alim Akhtar
	<alim.akhtar@samsung.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] ARM: exynos_defconfig: Enable RESET_GPIO driver
Date: Mon,  3 Nov 2025 15:06:02 +0100
Message-Id: <20251103140602.2359058-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14
X-EPHeader: CA
X-CMS-RootMailID: 20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14
References: <CGME20251103140610eucas1p2ddb79e5a3cb47af66713e61a246f9f14@eucas1p2.samsung.com>

Commit 25d4d4604d01 ("reset: always bail out on missing RESET_GPIO
driver") reworked GPIO-based reset controller initialization, so now
RESET_GPIO driver is required to properly instantiate MMC device for
most of WLAN and SDIO chips.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 84070e9698e8..75e84958c279 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -328,6 +328,8 @@ CONFIG_AK8975=y
 CONFIG_SENSORS_ISL29018=y
 CONFIG_PWM=y
 CONFIG_PWM_SAMSUNG=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_RESET_GPIO=y
 CONFIG_PHY_EXYNOS5250_SATA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT4_FS=y
-- 
2.34.1

