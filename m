Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379522F94A7;
	Thu, 26 Jun 2025 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966860; cv=none; b=DKKLxd80wGdU1anmvgdAzT8YkT+SDQwjiweQxxmwxn+7Dy26wOa/1D4mqHI4VEAoytWKMvxIaxVZRT+iuVCjea3/FM6ezKSOVt2O5/vFcnJ7xuOgFH630kdDjc6TaOOfFe2QTu6OnhXGUKWFKfuisJkl2x8OtnY1p6gGVfIxi9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966860; c=relaxed/simple;
	bh=GRwQfaXR9PqlUd5qkwAM/K2L0RzAamSmwPUgcvhLXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kWf3+rSVTlaeofCtpjZcEyxgUh/c+j9iQ2fpyogiKbiiLSpQ+AxE/kbft3ruiH4wxe45mesnnwtfHUcj6rhZixZK3WUnBVoki2dbBs4K4z6Uw8BUC8F74lI3FyWL2clsG5DuzfI6rsZiWVl2F2/l1RQTQE8Kz1hPpqn5Id0RYyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OYvTEa9A; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OYvTEa9A"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 035D825AFA;
	Thu, 26 Jun 2025 21:40:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udfKIfnW7R9o; Thu, 26 Jun 2025 21:40:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966852; bh=GRwQfaXR9PqlUd5qkwAM/K2L0RzAamSmwPUgcvhLXFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OYvTEa9ADlUIivh0fEl0ruh2UjkM25tSXD7TKdzRWVC6JYlj5shjZjAflmrO/hirV
	 fvdNUrTnZ31vKtco96bIoLUY+RXBPmUvQ3iVEXF1F/JvzC/TjoI71gsvDG6k50e4mT
	 Z6+rJhe6ZBhrQLTcTsJHqBT7nlvNWtwXungs+uYG2Ii+8sCWtXKg/Nzqqt6+xtwfcv
	 wHblWVSJNTtg6sPdzwr7Uv016+VBok0fDu/ZP5dud42sD+CGTXJCa1zgKEx5G6cV4L
	 zEDn4DeG0BenaQQNZQHKA8ElJfaTRTpM8dYBAf4sDdllzsgUeGU8vqsq7Yrk9xrqTJ
	 OpMpPs9C4AtEQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:57 +0530
Subject: [PATCH v2 08/13] drm/bridge: samsung-dsim: allow configuring the
 PLL_STABLE bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-8-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=3549;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=GRwQfaXR9PqlUd5qkwAM/K2L0RzAamSmwPUgcvhLXFc=;
 b=zY+YgxeevIU30zCR9B5D+wDMKGvoc7kvreewF/G/zMFvqB/UkKcPqSmFQOPmzB+oXBKdgWYzv
 O4kKpXVN71PA1N+YYAPlltJoOT34v46g6HrPwlYIHYJnOjCCnuJn4sF
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

The PLL_STABLE bit of DSIM_DPHY_STATUS is hardcoded to BIT(31), but
Exynos7870's DSIM has it in BIT(24) as per downstream kernel sources.

In order to support both, move this bit value to the driver data struct
and define it for every driver compatible. Reference the value from
there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++--
 include/drm/bridge/samsung-dsim.h     | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5993f8ef5d3641f69e557a79819ce0ba54762efb..739e1d1e6d239d06896daa131b692309cfeda843 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -34,7 +34,6 @@
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
-#define DSIM_PLL_STABLE			BIT(31)
 
 /* DSIM_SWRST */
 #define DSIM_FUNCRST			BIT(16)
@@ -414,6 +413,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -443,6 +443,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -470,6 +471,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -497,6 +499,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -524,6 +527,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -551,6 +555,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.video_mode_bit = 25,
+	.pll_stable_bit = 31,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -754,7 +759,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			return 0;
 		}
 		reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
-	} while ((reg & DSIM_PLL_STABLE) == 0);
+	} while ((reg & BIT(driver_data->pll_stable_bit)) == 0);
 
 	dsi->hs_clock = fout;
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index def9b4c6ef28eede8175aaa84c495c5444d0f103..2dd63032d83ab5df0e1780a692789c340c2126dc 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -64,6 +64,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int video_mode_bit;
+	unsigned int pll_stable_bit;
 	unsigned int esc_clken_bit;
 	unsigned int byte_clken_bit;
 	unsigned int tx_req_hsclk_bit;

-- 
2.49.0

