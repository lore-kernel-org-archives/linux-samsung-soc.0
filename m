Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFEE1917FB;
	Sun,  6 Jul 2025 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826415; cv=none; b=YXe0gXPra62T/8egU3sVg3PxubPWlQ9uUeTPiXKcrzfcioFogDgrS0c3nFeifuTqd6rD6JIFFYbBczyWBybf+Ax+kqyeYGH6mf+l+LWnGX2S2yT1ffhlKLuiZDElzo2IRRmgTyesubNgSsVbJ5B8QV5n3z4NvxUHGMbEAYtp0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826415; c=relaxed/simple;
	bh=TFs9OPHOosFYWTnp2fAs3vWT3qirSqqYVvnyedlNNXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6Dx9c/zZvUOtb0XD9p9kWXGlhk0A4Qvt49PId0kCm5giTGpPYAuZAfXDKjmGX10/6NaWAiSt8Jj2njFCqUmo+5+tHZV52YTjpqeq88nAqguoirE+ecK9GUXCKqL9DEq2Yioha+L5yz6iD+89CrvNnFzrLTpEoxCMeH/3IUq0KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=XyjsH6to; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="XyjsH6to"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B3DF520D0D;
	Sun,  6 Jul 2025 20:26:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ObE6sqDiy88z; Sun,  6 Jul 2025 20:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826410; bh=TFs9OPHOosFYWTnp2fAs3vWT3qirSqqYVvnyedlNNXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XyjsH6toNrhKHSJBpqkYjmfYDV3zRzavQExYF6ObhrO8Sfm5tdKXhIZTWDJ/my5nT
	 lg0GOLOtM87RdYAuhIz3+PhvqM31QkDQbEb3dpj1rWKUXaNys7NdL0rrasQTRF4Uko
	 HK0i/JVpKgqXK1b/Fj0chYwQ9rmrFO3ZMFb21g+LUP2FIelgv1qvbieVrL6CUUGVf3
	 /Hg9KgIB05Gp2pHbz5iiQRr3MQKpFmZdPp1rW+BNaYZcEn/pfhda2D87TpXlnislce
	 X/TejSFJIOyKRysEOqOuSpdjI/eo3a0cqRmjSyRSg38sTc7CTZeATYN4WJGmP+8XNF
	 r0srSAnPVXwvQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:40 +0530
Subject: [PATCH v3 06/13] drm/bridge: samsung-dsim: allow configuring the
 VIDEO_MODE bit
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-6-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=3602;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=TFs9OPHOosFYWTnp2fAs3vWT3qirSqqYVvnyedlNNXA=;
 b=YecbciqzmlT5nvlVtRZ1Gqrwf3JtgFBXIm8NbKbtE2yVNbsTewE64z7HQ5po+/oJwDFSqIyPC
 mY6gJJHwGyTAvJ/ytq9PGoz9ZSV8lDHrjkevGnbdwhWdG4gAavLMHhN
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

The VIDEO_MODE bit of DSIM_CONFIG is hardcoded to BIT(25), but
Exynos7870's DSIM has it in BIT(18) as per downstream kernel sources.

In order to support both, move this bit value to the driver data struct
and define it for every driver compatible. Reference the value from
there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++++--
 include/drm/bridge/samsung-dsim.h     | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 89ece3e6f200c710e4c9204efd84c84b9260456b..4ef052ea819cf9fdec9f72c920c04ecd4469e90c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -87,7 +87,6 @@
  */
 #define DSIM_HSE_DISABLE_MODE		BIT(23)
 #define DSIM_AUTO_MODE			BIT(24)
-#define DSIM_VIDEO_MODE			BIT(25)
 #define DSIM_BURST_MODE			BIT(26)
 #define DSIM_SYNC_INFORM		BIT(27)
 #define DSIM_EOT_DISABLE		BIT(28)
@@ -417,6 +416,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -444,6 +444,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -469,6 +470,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -494,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -519,6 +522,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -544,6 +548,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
+	.video_mode_bit = 25,
 	.esc_clken_bit = 28,
 	.byte_clken_bit = 24,
 	.tx_req_hsclk_bit = 31,
@@ -952,7 +957,7 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 	 * mode, otherwise it will support command mode.
 	 */
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		reg |= DSIM_VIDEO_MODE;
+		reg |= BIT(driver_data->video_mode_bit);
 
 		/*
 		 * The user manual describes that following bits are ignored in
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 7f6d353f34af14f156e864c624f6eb980296c32d..9d11c3e39fe532b83d4bc3d7f950645bbb8970b3 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -64,6 +64,7 @@ struct samsung_dsim_driver_data {
 	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
+	unsigned int video_mode_bit;
 	unsigned int esc_clken_bit;
 	unsigned int byte_clken_bit;
 	unsigned int tx_req_hsclk_bit;

-- 
2.49.0

