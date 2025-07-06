Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B052BCF67;
	Sun,  6 Jul 2025 18:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826387; cv=none; b=bGfEaJczMjfLprHZ6lYmfL5v02VI6LQsRub3evswrxXwtZCgos34rqEZx71zTQhbTBHo0J5PC5edJ0JdAjnK1tp7GMg3mIefSGtPSLrIJMVvD1zVLup1U+jPZkVD12M9tAETpW9YzJqcmPBOomwLeJ6N2stUngz13LOZsxG6b+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826387; c=relaxed/simple;
	bh=9ukz1J1hpyoS4t+3L56en0gtBgQTrz9vCaRlVq/nDU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YenxShL1/uGY+AHYwwudAuYe32odI5Qz4d498+g0dyBZV2eaLYzqsX1dPghtvebvLaD4UPYbqVH6dCUtt4VnrSe7LJC1I20LpWlTLPzKbHVWvmDTYuEutHIdRQkhUm735pHUC88sjLP1YcWLnKssuKG3Dad3v7aqRPlYoGQh8lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=I53m653J; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="I53m653J"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 77EB420D0D;
	Sun,  6 Jul 2025 20:26:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O6wthDKFcM8y; Sun,  6 Jul 2025 20:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826383; bh=9ukz1J1hpyoS4t+3L56en0gtBgQTrz9vCaRlVq/nDU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I53m653JSLlMVpKhfXIL/INukUGcP3l2QVTY08CkChgdRyHakBTFGEllc0UYgWNvw
	 utHvMc5FSOQ4Au9v+B795EUIZ7aEUpvlmwLqILHkSiVJ/RKfJGhMPQCyuPv7Wo6rtD
	 8Cs7v6RdxYTT4rSrnuT8c7Y1+N9NMu5astMSqYEU1O56m0GcyB7IqQ60Jg1if2CFNJ
	 zry3aFWerisutCkc4nBMS0feUSrCZi/SZvJYetOcrWAYhtkCj4uVlVlK3sosvS+LJI
	 OgiBxh+DmNVvsjJ8qO3XioTZzmHlYQGfYEtB0tl43my/RtL+xfStXGeYqxnEuP9KmH
	 lFBlVBY+X7b8A==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:37 +0530
Subject: [PATCH v3 03/13] drm/bridge: samsung-dsim: add flag to control
 header FIFO wait
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-3-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=3620;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=9ukz1J1hpyoS4t+3L56en0gtBgQTrz9vCaRlVq/nDU0=;
 b=8Q8sNrH93Z5Tn1bADFeyu70w3ruBWFrgwoNwT+m6XOLoQiLsiE4t/o8kUymdL8qVp9Rih5rpS
 ps6UI9M6CMWCuLb+v4IjPPdhp1gPTNtxnPkJ6XA6FcsYy2re1A/84yg
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's DSIM device doesn't require waiting for the header FIFO
during a MIPI DSI transfer. Add a flag in the driver data in order to
control said behavior.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index dca3939dd99fa07aee309067b93e652bc9a9b78f..84af24171b6856cbcf95b9077b997ee587fc0409 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -418,6 +418,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -438,6 +439,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -456,6 +458,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.has_legacy_status_reg = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -474,6 +477,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 5,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -492,6 +496,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -510,6 +515,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 2100,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	/*
@@ -1117,6 +1123,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 {
 	struct device *dev = dsi->dev;
 	struct mipi_dsi_packet *pkt = &xfer->packet;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const u8 *payload = pkt->payload + xfer->tx_done;
 	u16 length = pkt->payload_length - xfer->tx_done;
 	bool first = !xfer->tx_done;
@@ -1157,9 +1164,11 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 		return;
 
 	reg = get_unaligned_le32(pkt->header);
-	if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
-		dev_err(dev, "waiting for header FIFO timed out\n");
-		return;
+	if (driver_data->wait_for_hdr_fifo) {
+		if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
+			dev_err(dev, "waiting for header FIFO timed out\n");
+			return;
+		}
 	}
 
 	if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index f0c1e5c5ed490afe0bcfd06830f52471710b29ea..62c07952bd00f9c2c287a6a998f0e243dd4032a9 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -61,6 +61,7 @@ struct samsung_dsim_driver_data {
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
+	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;

-- 
2.49.0

