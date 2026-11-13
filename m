Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558222;
	b=tdFUtmq+xWIA4svDpX7eLcOE3mXIypwT5g4G/mE3gtZRfiFNvLeW65GKnsdjBDEFI/bP
	 U7Ceb1igD0/Ka/9ytNxJ0kcS/bKipImVZNbDEUeUKFd3FKpOzIlxFZz959FETBIyqOMjF
	 cVcqbib3ddRRdxSIamWZ2R9iK27mBPY6bexHdZdYwt+tOk198ZeNwNO/WItXhsPJ6ahjG
	 fQLPBeLkq065zxZbXYGxOlJU7FBzI6Yx068tnA2eaoF71MiUjwrBhB8reO1BCCJwZbLpL
	 aQ6wki+uAID1OQn+4FGv5eCQaP3qbMd54by/YTsS+isaXW7pKPMNfsblASk7JagpH8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558222;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=NpSdJF7uqr29I40DlGvfphIx7cVw5m7rMDFUgKXR+ps=;
	b=vdSg4m+Hf65tjucNfuh5RFtEhLsSKqvnwxIFu7dZ+5yPW2lLurhbM9+/iVyrcYfMC98i
	 dE7dg7T/GrxeX6B2Maa6PXE8C60iCQ7yx309rLImDt4NVmiiMB/htxP64XXuhSds0bbH8
	 95lXOnXPRuC/RbBNWFYrKMDb+TR3zq2CwOTRYQuZPcbeDab5+Di3UlhrvO9DTMYLxRbKU
	 3LiApaljPe9+VNTDRnTLLxvD4M8UhtTUpooqLr7t9zKOyRsgMSy8ovPIOYXSvH9LUiTxM
	 1L9VcvtW3Q61C446RFd1x+K2sEeRQ5fYv29K4ujzConuv0gWKuvv41hRqpbEBAcqsJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=krs7HqU9;
	arc=none smtp.remote-ip=160.236.53.75
Received: from mail-m1602365375.xmail.ntesmail.com (mail-m1602365375.xmail.ntesmail.com [160.236.53.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A79606BDE5;
	Fri, 13 Nov 2026 08:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A79606BDE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=krs7HqU9
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be5f;
	Fri, 13 Nov 2026 16:23:30 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 11/18] drm/bridge: analogix_dp: Skip native HPD interrupt ops for GPIO HPD
Date: Fri, 13 Nov 2026 16:22:58 +0800
Message-Id: <20261113082305.541652-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d40132b403a8kunm073aab0481ab7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHhpLVhpJHUtDTEtNSRlKQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=krs7HqU98dvw+83Hrezy4KFEVXAahYl8uLWYSaJF/drLyS27ajBFQ3+OVymEpbrDIrAsltOEeFaxEK991E/C1W+SLNx8xP74XVln9q9mi6OerqIUdeQ7k7JACyz91ng06H1Y46XU9FwIxH5l4qsnSNRSl+SsSdkah78e+GDLg2U=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=NpSdJF7uqr29I40DlGvfphIx7cVw5m7rMDFUgKXR+ps=;
	h=date:mime-version:subject:message-id:from;

GPIO HPD does not rely on DP controller internal native HPD interrupts.
Skip native HPD register manipulations to avoid irrelevant operations.

Move the hpd_gpiod guard to its caller so the helper operates purely on
the given bitmask, and mute all native HPD interrupts for GPIO mode.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Adapt to the newly added IRQF_ONESHOT related commit and expand the
  commit msg.

Changes in v3:
- Reorganize the branch layout for hpd_gpiod check.
- Simplify the commit msg.

Changes in v4:
- Add Tested-by tag.

Changes in v6:
- Add Tested-by tag.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c  | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index db0aefaf6754..b14a8aa12394 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -720,7 +720,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type)
+	if (!dp->hpd_gpiod && irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
 	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 025da25463a8..af5e5a8ec88d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -193,6 +193,11 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
+	if (dp->hpd_gpiod) {
+		analogix_dp_mute_hpd_interrupt(dp, HPD_IRQ_ALL);
+		return;
+	}
+
 	/*
 	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
 	 * pair can be used to implement hotplug detection.
@@ -415,7 +420,7 @@ void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq
 {
 	u32 reg;
 
-	if (dp->hpd_gpiod || !irq_type)
+	if (!irq_type)
 		return;
 
 	reg = analogix_dp_irq_type_to_common_int_sta4(irq_type);
-- 
2.34.1

