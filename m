Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DB729B200;
	Thu, 12 Jun 2025 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741561; cv=none; b=PguZMKcM95Y/oRD0iWDReYPBI+0ZTV+L0sEogSHkgfDbNQ2Oa7oApVrxvURizIRAwnSjp13g9paTDHMvIShFtqZ+rgrjReJIH4yVHQBYQxTICe+84oQ77hrvbPb6+4PFWhyVoavGB7d5FG7+xtgabVfgbJFumUkS1BdTQdRMoj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741561; c=relaxed/simple;
	bh=1kh3o0Zg2OgFE1AeIrSo+/Y1+ID8/xr1+Tks+z9lCwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nrc2JCRt6hgkj9TSb+l40hImJ1TRjhXY45qHOmBBXY8j1b74TQjA35tF7KqrnOcz9L9N7kAuEg8KdSyuLpzh7kKVf6zebju8eL97efgU2h7OQvZnjCSVeE123rkIbR6t5/YK0wUtwslcJYsBkA8LvIY+fajctOATwJkdFPIbE4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HiYgz5GB; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HiYgz5GB"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 39C2725C22;
	Thu, 12 Jun 2025 17:19:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLqkjyRdqJEb; Thu, 12 Jun 2025 17:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741556; bh=1kh3o0Zg2OgFE1AeIrSo+/Y1+ID8/xr1+Tks+z9lCwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HiYgz5GBSvVBv3dVsQFNiFwg8cY69U2M9/+FUv3lR2CU6NrinmsRL/kIAbjXcZkM9
	 ZvXwnROxabgrzndSQUwXxL9ny9DU68nwyU3ZWA9hA+9i7HBOwzXJLNttZ6LitG1lwx
	 hx0ggXdWI4G+luuHmas1/rLVNI+wTuvHCP4ntL+JHNb7mVtRw5VsaT/CZXraj5/nN/
	 7KLJmtXCyObwnVmiSvHHbpZ0bRsy5xCWpcbB6uqAMemu2bCBWkfj3IgPLlx3F+iLfP
	 i4XDja33NB6s+4vtUfaIu1Org9cSgsj3GOBYSDLbS3xXXPaVWcBja4OMKV9i018I37
	 NaQkRR4hpZMDA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:09 +0530
Subject: [PATCH 05/12] drm/bridge: samsung-dsim: allow configuring the
 MAIN_VSA offset
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-5-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=4240;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=1kh3o0Zg2OgFE1AeIrSo+/Y1+ID8/xr1+Tks+z9lCwM=;
 b=7UbOrF3u+T2eYtJgWnSLNX3k2nFIoNtFWAjCozLluvbwc/rmGoUEqJ+qZKNCrSFrJhr4sPzun
 WGZvH8a3DTCCyuPMCUl1WKeueP8dXIA8Ij9OiNfgCOPWjSr/49RiREX
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

The MAIN_VSA offset of DSIM_MSYNC is hardcoded to a 22-bit offset, but
Exynos7870's DSIM has it in a 16-bit offset as per the downstream kernel
sources.

In order to support both, move this offset value to the driver data
struct and define it for every driver compatible. Reference the value
from there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 13 ++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index dbd30b2a10c3c0abf49117db7ebc9a47ff0ea08a..104fc4ad7967f90868cd6923048816792beb0009 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -123,9 +123,9 @@
 #define DSIM_MAIN_HBP_MASK		((0xffff) << 0)
 
 /* DSIM_MSYNC */
-#define DSIM_MAIN_VSA(x)		((x) << 22)
+#define DSIM_MAIN_VSA(x, offset)	((x) << offset)
 #define DSIM_MAIN_HSA(x)		((x) << 0)
-#define DSIM_MAIN_VSA_MASK		((0x3ff) << 22)
+#define DSIM_MAIN_VSA_MASK(offset)	((0x3ff) << offset)
 #define DSIM_MAIN_HSA_MASK		((0xffff) << 0)
 
 /* DSIM_SDRESOL */
@@ -421,6 +421,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -446,6 +447,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -469,6 +471,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -492,6 +495,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -515,6 +519,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.main_vsa_offset = 22,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
 	.pll_fin_max = 12,
@@ -542,6 +547,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
 	 */
 	.pll_p_offset = 14,
+	.main_vsa_offset = 22,
 	.reg_values = imx8mm_dsim_reg_values,
 	.pll_fin_min = 2,
 	.pll_fin_max = 30,
@@ -1033,6 +1039,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 {
 	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
+	unsigned int main_vsa_offset = dsi->driver_data->main_vsa_offset;
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
@@ -1059,7 +1066,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 		reg = DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
 		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
-		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
+		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start, main_vsa_offset)
 			| DSIM_MAIN_HSA(hsa);
 		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 8938eccf78730019e0404101c855dc2d7d225668..a5f13f224b0817fe3135edd77276c4e715219cda 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -69,6 +69,7 @@ struct samsung_dsim_driver_data {
 	unsigned int lane_esc_clk_bit;
 	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
+	unsigned int main_vsa_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;
 	unsigned int pll_fin_max;

-- 
2.49.0

