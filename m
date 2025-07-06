Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2241EB1AF;
	Sun,  6 Jul 2025 18:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751826381; cv=none; b=QbHlre1cpDMnnT0gDl3KKtO3MMqkF5WLdtwnO4Q2H4MsOUqcI/aQWxjoiy6E2Lb6gl15Y3m6rIL0PqfpcALXUbj8BA2P0zxOG4KwjCg86Dntgi/6VaLpkO9ARlCYSzpd6Plb3ot2wRcLzz6/u2pezXgWU13L9pglUMO2qmsdENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751826381; c=relaxed/simple;
	bh=/yVlBK3lzKHbYCYl0PZiqbYZGWExt3hrCNM7yAG5SKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PHpMeZlktJ1dyCKkgrH7LLDyb6FydhWpk0ECO6NNqeFKirumqnJ97zSLAxlbAWbWSq9OwfU0aDIptJNohTQua8voOzmc8iAvHH2TOIM5uoInzE9UwT4kDLEF2qkqLyI6om/ZJ3JVKNll+94r3CMlJpvdVbUQx1vUcOI3BJ12OoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PuuZk7/B; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PuuZk7/B"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CDDE420F29;
	Sun,  6 Jul 2025 20:26:17 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rl7io2hTU7H8; Sun,  6 Jul 2025 20:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751826374; bh=/yVlBK3lzKHbYCYl0PZiqbYZGWExt3hrCNM7yAG5SKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PuuZk7/B9sYzIT6Sa12YMRpWqZAaCdVieFegUzi1E4tyKp4RGPNzGK15e/6Z6WVL0
	 pxI2xevy0jNmx5H8drznvGt89zc6lsNqH0IU24A35OOcbo3xY9Ds9BZ9b/A23IqRh4
	 r1ij9hUeA0N6kepk0apZ3Q2op24gyf0xLS0LIiNQ7aLZ9PRDLSLkDk7Y8oOCKjC+MP
	 RBKtSHP10g/4zSQfrIlIKlRz19kxgvj8Yx9ZxzHimJWS/uXucTQ4CieMjOILg/Cmnv
	 hgSZB2dMqUClI+XGoA1FV+i8LGHH+KK+a1rOXx9B4uUUIwh41Rhh5iclmJaCS6Hukb
	 qyD4iRGo2CM8Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:36 +0530
Subject: [PATCH v3 02/13] drm/bridge: samsung-dsim: add SFRCTRL register
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-2-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=2917;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=/yVlBK3lzKHbYCYl0PZiqbYZGWExt3hrCNM7yAG5SKs=;
 b=rg0Z6iPqzouiWIlP5bus/OmhjJawqb+W/hjlGRJWv3GSvNiAY+vrpywOhafwiijLkIXX9P0xf
 26UKrMhccV4BXBuAKAbT3WgoSNcY87qZ0klfqXZg1Uiqjo3VsDXegQJ
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

On Exynos7870 devices, enabling the display requires disabling
standby by writing to the SFRCTRL register. Add the register and related
bit values. Since this behavior isn't available on other SoCs, implement
a flag in the driver data struct indicating the availability of this
feature.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0b061ad0ecec158f994846da08fae59f74bfa091..dca3939dd99fa07aee309067b93e652bc9a9b78f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -157,6 +157,11 @@
 #define DSIM_INT_RX_ECC_ERR		BIT(15)
 #define DSIM_INT_RX_CRC_ERR		BIT(14)
 
+/* DSIM_SFRCTRL */
+#define DSIM_SFR_CTRL_STAND_BY		BIT(4)
+#define DSIM_SFR_CTRL_SHADOW_UPDATE	BIT(1)
+#define DSIM_SFR_CTRL_SHADOW_EN		BIT(0)
+
 /* DSIM_FIFOCTRL */
 #define DSIM_RX_DATA_FULL		BIT(25)
 #define DSIM_RX_DATA_EMPTY		BIT(24)
@@ -257,6 +262,7 @@ enum reg_idx {
 	DSIM_PKTHDR_REG,	/* Packet Header FIFO register */
 	DSIM_PAYLOAD_REG,	/* Payload FIFO register */
 	DSIM_RXFIFO_REG,	/* Read FIFO register */
+	DSIM_SFRCTRL_REG,	/* SFR standby and shadow control register */
 	DSIM_FIFOCTRL_REG,	/* FIFO status and control register */
 	DSIM_PLLCTRL_REG,	/* PLL control register */
 	DSIM_PHYCTRL_REG,
@@ -1037,6 +1043,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 
 static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enable)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	u32 reg;
 
 	reg = samsung_dsim_read(dsi, DSIM_MDRESOL_REG);
@@ -1045,6 +1052,15 @@ static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enabl
 	else
 		reg &= ~DSIM_MAIN_STAND_BY;
 	samsung_dsim_write(dsi, DSIM_MDRESOL_REG, reg);
+
+	if (driver_data->has_sfrctrl) {
+		reg = samsung_dsim_read(dsi, DSIM_SFRCTRL_REG);
+		if (enable)
+			reg |= DSIM_SFR_CTRL_STAND_BY;
+		else
+			reg &= ~DSIM_SFR_CTRL_STAND_BY;
+		samsung_dsim_write(dsi, DSIM_SFRCTRL_REG, reg);
+	}
 }
 
 static int samsung_dsim_wait_for_hdr_fifo(struct samsung_dsim *dsi)
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index d7877191bad155e877b2812daeb81ac0be6f735c..f0c1e5c5ed490afe0bcfd06830f52471710b29ea 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -57,6 +57,7 @@ struct samsung_dsim_driver_data {
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;
+	unsigned int has_sfrctrl:1;
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;

-- 
2.49.0

