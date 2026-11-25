Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605742;
	b=xh6XYgobmBWwR37yCKQFhLfB01SWqid4oN1EXhtkVH5NmlncklMJsuhUGZwmuPSRNbrN
	 MDKezslvsbKXZlHOah2Ug5u9Ghat5gVcIpJSEmqiWfqIlb7docT6eRNU0QGsMQubBmI4v
	 4mDtbVEYsQ5mNGvY4bPi98DnxO/AOYD9/XW+Hw7UrHnx2hPqSKgXf9EWxIsx1ev8Xf3CF
	 WIDfRG3VKc5gWe7UjP7t7Vo7zeZeRTrRgb87FjRYHFMK+m1EwBy1EveH5C9bs6504wUtm
	 kmS7cKLkDPIK9EwqkSudgxDdz/+kg4mvxYzrw+4/yw45GyzO0fn1AnwcYIG0PFubeOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605742;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=yJfwowSwayhxCpawoZETPFWdGrZbg2EIrLO/hgmWeIs=;
	b=Nww98rJvElgaya7tDmKXZ34DZYELq1BgYdMw/r28t9YvW9k/a+iI93YWf7wfb59SZcN4
	 DIhX6FOUK2PGBUfqGLf8UC1y8fRpbn4mUBGFFOumeybnmZ+DFKHcAJc1udLew5JEpT2Fz
	 kZ4qv+LWvRBTJ7lMOgJA8u4KRq7w4laIJPhOrSAQF7oC3IB/vg6uEFO7uF8lAikBR08eo
	 XlLOVf3qK0ccXvLl9/9+nlmUFPxo7sdlarP/riIsdfwiYpF4+TCnht/L8Vpkah37BYmcU
	 Q4YYHHjJ8bnzvcMRQuCiJeNid2CUWnsMV6XLznO1KSUg9ZxMMJtfA/g53QknaUxTEfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bb94nihG;
	arc=none smtp.remote-ip=47.88.81.169
Received: from mail-m81169.netease.com (mail-m81169.netease.com [47.88.81.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0460A262F;
	Wed, 25 Nov 2026 11:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B0460A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=bb94nihG
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f81605f;
	Wed, 25 Nov 2026 19:22:10 +0800 (GMT+08:00)
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
Subject: [PATCH v7 12/20] drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
Date: Wed, 25 Nov 2026 19:21:33 +0800
Message-Id: <20261125112141.1434903-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa2127113c003a8kunm17c230507758bf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUxJVkpCQk9NTRpNQk9DGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=bb94nihG2ZCQ15jI9TQASQtrkqRdwQ9eP9IJBl0/5GT02T1yjj5eQuMQCp+edxI9P6aXkUa0NGXT5WqmnaG6KfBSEp9FSCk0KHfpFHqtMkeK+q9O+GZVRpGZ4IDeogSGVF5eNeqNfSAIl2TMiXUmglpGV97gy1tXtzAWRJ9EXMs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=yJfwowSwayhxCpawoZETPFWdGrZbg2EIrLO/hgmWeIs=;
	h=date:mime-version:subject:message-id:from;

The Analogix DP controller provides two sets of interrupt sources for
hotplug detection: HOTPLUG_CHG for any HPD level change, and the
PLUG/HPD_LOST pair for connect/disconnect transitions respectively.

On Rockchip platforms, configure the HPD deglitch filter and use
HOTPLUG_CHG interrupt for hotplug detection. Other platforms retain the
original PLUG + HPD_LOST scheme with unchanged deglitch values.

Move the HPD deglitch configuration into analogix_dp_reset() so that
platform-specific values are set alongside the existing register
defaults in a single location. Update the threaded IRQ handler to check
the corresponding interrupt flag based on platform type.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Move ANALOGIX_DP_HPD_DEGLITCH_L/ANALOGIX_DP_HPD_DEGLITCH_H configs to
  analogix_dp_reset().

Changes in v3:
- Modify the commit msg.
- Replace macro HPD_IRQ with HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.

Changes in v6:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  9 ++++++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 22 ++++++++++++++++---
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 44ccdf496bac..f2ffa30e335f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -717,13 +717,18 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	u32 irq_type;
+	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
-	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
-	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
+	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		hpd_detected = irq_type & DP_IRQ_TYPE_HP_CHANGE;
+	else
+		hpd_detected = (irq_type & DP_IRQ_TYPE_HP_CABLE_IN) ||
+			       (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT);
+	if (hpd_detected) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
 		if (dp->drm_dev)
 			drm_helper_hpd_irq_event(dp->drm_dev);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 0f1406e4a5d3..025da25463a8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -160,8 +160,13 @@ void analogix_dp_reset(struct analogix_dp_device *dp)
 	writel(0x0, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
 	writel(0x0, dp->reg_base + ANALOGIX_DP_HDCP_CTL);
 
-	writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
-	writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
+		writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	} else {
+		writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	}
 
 	writel(0x10, dp->reg_base + ANALOGIX_DP_LINK_DEBUG_CTL);
 
@@ -188,7 +193,18 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
+	/*
+	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+	 * pair can be used to implement hotplug detection.
+	 *
+	 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+	 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+	 * as a better solution via engineering verification.
+	 */
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+	else
+		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
 }
 
 /*
-- 
2.34.1

