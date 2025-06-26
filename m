Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E26E2F2C4E;
	Thu, 26 Jun 2025 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966778; cv=none; b=D3AHbTzquo861AlS9H+niKomSmjtKqOUf5wo8lCt59wQrAQdDdysAamNbuVdRm9Vu7RRBBGuUJttscxbnOVE/AUvwhuMQqh2a0oqwFR+pCkF1uRS8o5mqCigKTxubtBEyNQAcxYBdr/OXmEX+XuYklyS0RhLfmjHzD6i+GpS88A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966778; c=relaxed/simple;
	bh=aN4FJ+kPhDscp3zmowYTWHdafim80a5zODRFZFCM9S4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxPlxfbrxym7a+v4RlHkuGGX5Lq6ObA7M3UtXqJZFCXxdW0BN+7abwQ4L1Sov9d9cCUBPqPeGEE+rBK/cmkq/lY8RqhDzHm7yWf6sTgaY3qvmzHPlPeK7lRKFgCCw3zQTLSlyGm1zDX0Cr0jFNK4KGbt6MBOWxpeZyOqGPP594A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=iix8Y7hT; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="iix8Y7hT"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 3A2A3219F5;
	Thu, 26 Jun 2025 21:39:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etz7SfeO7cfX; Thu, 26 Jun 2025 21:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750966774; bh=aN4FJ+kPhDscp3zmowYTWHdafim80a5zODRFZFCM9S4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iix8Y7hT0b85XahP4OBNiLanPlVK5yGvSMVh3/v/CZQYsSVwK01SdJw1gAMC+bY6G
	 WnTT2AXJR2sLzpd6bLsuCXmHIDfio/9X2BmB/mh8yrORo2+fkLihUprYUUNPrrsZo+
	 7/DRYsM99h9PSg4tKpqNI+u+twkTTVwjq0iPiEeiJOuXLQod3CYu9DAUIpBZA2iiVU
	 ZOxVQG0Go2U7Pl2QnWvkdiEfAVwXn9/ykIJwIyklZWGjolbcR86oB6+k3YwQQfzIEP
	 VDTnYGxpyOy/0PHYb2iQCanp5Nj3Q/0n7a5nnI902pL3OGXFtgiKnDQ84U9Hw8gj8i
	 ke5CndHyZJIIA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:51 +0530
Subject: [PATCH v2 02/13] drm/bridge: samsung-dsim: add SFRCTRL register
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-2-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=2917;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=aN4FJ+kPhDscp3zmowYTWHdafim80a5zODRFZFCM9S4=;
 b=2ooZ5v9WZmOF4ZFhM8p/BIgUpVpcq4TXaN2D2Wqe+Lv5VL9aO2vcx+SQH3bvawd2gINGElozN
 saBPyEYYB9cCMOFbU8qn/1koHrsYqyCzHPxYXrJRrgRaAGNzXzQeAF6
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
index 7fd4c34cdc3170d363942f98feec048097da3c06..3c716334f1a21bf446ebe17f810d5258dd9a4c24 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -156,6 +156,11 @@
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
@@ -255,6 +260,7 @@ enum reg_idx {
 	DSIM_PKTHDR_REG,	/* Packet Header FIFO register */
 	DSIM_PAYLOAD_REG,	/* Payload FIFO register */
 	DSIM_RXFIFO_REG,	/* Read FIFO register */
+	DSIM_SFRCTRL_REG,	/* SFR standby and shadow control register */
 	DSIM_FIFOCTRL_REG,	/* FIFO status and control register */
 	DSIM_PLLCTRL_REG,	/* PLL control register */
 	DSIM_PHYCTRL_REG,
@@ -1030,6 +1036,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 
 static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enable)
 {
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	u32 reg;
 
 	reg = samsung_dsim_read(dsi, DSIM_MDRESOL_REG);
@@ -1038,6 +1045,15 @@ static void samsung_dsim_set_display_enable(struct samsung_dsim *dsi, bool enabl
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
index 9764d6eb5beb98b5b9427c5c4775c37b24dd6e17..a50e4f521b9d9561f6a3b9fe3e174c0e140849a2 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -56,6 +56,7 @@ struct samsung_dsim_driver_data {
 	unsigned int has_freqband:1;
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;
+	unsigned int has_sfrctrl:1;
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;

-- 
2.49.0

