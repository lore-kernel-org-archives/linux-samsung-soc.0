Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6E29E0E3;
	Sun,  6 Jul 2025 18:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826370; cv=none; b=XEzrhq4k14eyRpeYapia7SJIXJb0taP+4hMWmsqs4Gw8YVi2VFaViIWhbpFPiCmCfyR8FhxBEoWXz0gHiw8o64ThaL51FlU5lg9aZuewmpxQfh9DjKdioJ5bSpnnJu8Zj42U0jN5zPXR9fhb0+nYSR4b9FdslXNZkPUWfyDfJmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826370; c=relaxed/simple;
	bh=3+vm7iL4YxeQBqkYH0pzMX1sP4BS6s4QthWdNBrsH5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9ilXX/wx08qLRgZh2GwLc7U1UT7LoN/OarEOJPiP5P09qax7WwdTC9kcBR7Gft/dF+8IR8+O0rgE8n5lFSG9p4wg2zVhukRzRzCZSQwSTRs+pD4hIkAD3X3ZnctEPwmWfcIZuaZHFcGJ3Y6l/d8pmfF7IKSA+jkv76qQbC08Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=D1jXqUPE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="D1jXqUPE"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2844F20E83;
	Sun,  6 Jul 2025 20:26:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8w2O4mm5w3t; Sun,  6 Jul 2025 20:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826365; bh=3+vm7iL4YxeQBqkYH0pzMX1sP4BS6s4QthWdNBrsH5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D1jXqUPEZubQQsLzI6hTvN2mY9f04AZlv+TBmWP8aymUXbY0mOdwht7C4TzG/PIjp
	 LYYANp5epFZlOqJnvs1bLgbb96j9QO3pmjuXocI6TGM3ccvijrSBr0YPgh2EpMuOnJ
	 63DDCqRry19JA5+IUQQsMH5nRxB1zmJjYsEKG0YdDVWUjprylnUTldzspgqnIw4AsV
	 1OJYUK7evAUuyLqIHxlitMEI5L3NGvqyxKs+ZI6EIAnNTC+bn7EoEDh1uQ5ZtOcnie
	 M6CX3IgzLrD6ErID/KksSFtWL7x4hV3X43DZg+gL5uVl67gogW53v8mgbVH1X/TT46
	 R/hsexQkk5RYg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:35 +0530
Subject: [PATCH v3 01/13] drm/bridge: samsung-dsim: support separate LINK
 and DPHY status registers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-1-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=4978;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=3+vm7iL4YxeQBqkYH0pzMX1sP4BS6s4QthWdNBrsH5A=;
 b=dc4BfCEAV7fGcT4lRM/RcmpmWodN3OAhoQq4Ka5r0EOaDkmg2QdBfV/MTo+epFmDvryOvfbq1
 U2eTd2rTP58ABcWhWRYs4oXspPwUz+xr7z0y+o0MIla9dKbxwZcI/sm
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's DSIM has separate registers for LINK and DPHY status. This
is in contrast to older variants in the driver which use a single
register for both.

Add a driver data flag which indicates that the device variant supports
the legacy status register. Change the register read calls
appropriately.

Suggested-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++----
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c4997795db18280903570646b0a5b2c03b666307..0b061ad0ecec158f994846da08fae59f74bfa091 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -31,7 +31,7 @@
 /* returns true iff both arguments logically differs */
 #define NEQV(a, b) (!(a) ^ !(b))
 
-/* DSIM_STATUS */
+/* DSIM_STATUS or DSIM_DPHY_STATUS */
 #define DSIM_STOP_STATE_DAT(x)		(((x) & 0xf) << 0)
 #define DSIM_STOP_STATE_CLK		BIT(8)
 #define DSIM_TX_READY_HS_CLK		BIT(10)
@@ -240,7 +240,9 @@ enum samsung_dsim_transfer_type {
 };
 
 enum reg_idx {
-	DSIM_STATUS_REG,	/* Status register */
+	DSIM_STATUS_REG,	/* Status register (legacy) */
+	DSIM_LINK_STATUS_REG,	/* Link status register */
+	DSIM_DPHY_STATUS_REG,	/* D-PHY status register */
 	DSIM_SWRST_REG,		/* Software reset register */
 	DSIM_CLKCTRL_REG,	/* Clock control register */
 	DSIM_TIMEOUT_REG,	/* Time out register */
@@ -405,6 +407,7 @@ static const unsigned int imx8mm_dsim_reg_values[] = {
 static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
+	.has_legacy_status_reg = 1,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
@@ -424,6 +427,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x50,
+	.has_legacy_status_reg = 1,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
@@ -443,6 +447,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
+	.has_legacy_status_reg = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
 	.wait_for_reset = 1,
@@ -459,6 +464,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
+	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 5,
 	.max_freq = 1500,
@@ -476,6 +482,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
+	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1500,
@@ -493,6 +500,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
+	.has_legacy_status_reg = 1,
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 2100,
@@ -688,7 +696,10 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 			dev_err(dsi->dev, "PLL failed to stabilize\n");
 			return 0;
 		}
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		if (driver_data->has_legacy_status_reg)
+			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		else
+			reg = samsung_dsim_read(dsi, DSIM_LINK_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
 	dsi->hs_clock = fout;
@@ -962,7 +973,10 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 			return -EFAULT;
 		}
 
-		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		if (driver_data->has_legacy_status_reg)
+			reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
+		else
+			reg = samsung_dsim_read(dsi, DSIM_DPHY_STATUS_REG);
 		if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
 		    != DSIM_STOP_STATE_DAT(lanes_mask))
 			continue;
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 9764d6eb5beb98b5b9427c5c4775c37b24dd6e17..d7877191bad155e877b2812daeb81ac0be6f735c 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -53,6 +53,7 @@ struct samsung_dsim_transfer {
 struct samsung_dsim_driver_data {
 	const unsigned int *reg_ofs;
 	unsigned int plltmr_reg;
+	unsigned int has_legacy_status_reg:1;
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;

-- 
2.49.0

