Received: from mail-m12797.qiye.163.com (mail-m12797.qiye.163.com [115.236.127.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E045FFC8;
	Mon, 28 Sep 2026 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587860; cv=none; b=XKKJvcUJICEG7ifqB4Up/2f9jOfbaCFIb+lN1ILeFN7j77cOaS2T9ptMMnncTyqJ12G6WEbz0pERm4JTsYER1Qs9kVSZec3o9szs8rpANK0i3NIPTwIefzJslz29bsAsFAtnsleyG6qv6+Hvyi5URqkzdbKNZv0OfXUpnaRhK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587860; c=relaxed/simple;
	bh=pLPlzzdpwwDbdG4JlQdO21dAMQM8L0lBijxtT+eSBFo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EBnxBPPIVbh3mn2YGFLwEY80R8OcRPY9PwlrMOXeJyxMhJD+bSHBrlRdwj9umdRs4CfyFL5dldI6dcGOSnHoxWq7pXwJp6fOdOUXJ13lOLPs1ZS8158GOPaYgqjRtThKpn2U+V9jC5/flHp9ChsjJDkMD+DBYnQhY5bXu2E/yNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=NM26liGJ; arc=none smtp.client-ip=115.236.127.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="NM26liGJ"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5398e74;
	Mon, 28 Sep 2026 16:15:07 +0800 (GMT+08:00)
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v3 05/14] drm/bridge: analogix_dp: Extend mute/unmute HPD interrupts to accept irq bitmask
Date: Mon, 28 Sep 2026 16:14:09 +0800
Message-Id: <20260928081418.3605775-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928081418.3605775-1-damon.ding@rock-chips.com>
References: <20260928081418.3605775-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e714fe4803a8kunm323e2b5437cf39
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQkwdVh9LT0odHU1CHx4aH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NM26liGJePRuJW6MDBwFXDS82IbFn9Wnpu2k6TXL/Ow6y0iKqHwp66WDQZg+a4PJQvkSQ9u2V+GdtArCXtJJwZL0nr9lLBMKy9xqCjpn9Ht/soyNaUROOvtv9YEoszU4/a9274Ns8BItMPSTEZNbvYzWCWfwJ0efUxbIOo1rXKs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Qy4pxby9NM7jaee0yCfCeAMpArU4GaC85GrNjCNpwBM=;
	h=date:mime-version:subject:message-id:from;

Update the HPD interrupt mute/unmute routines to accept an irq_type
bitmask parameter, allowing selective per-bit mask control instead of
operating on all HPD interrupt bits unconditionally.

With IRQF_ONESHOT handling IRQ line masking during threaded handler
execution, these helpers are no longer needed in the runtime IRQ path.
They are retained for init-time use by analogix_dp_config_interrupt()
to configure platform-specific HPD interrupt masks.

Also extract the irq_type-to-COMMON_INT_STA_4 bit mapping into a shared
helper to avoid duplication in the clear/mute/unmute paths, and drop
the now unused COMMON_INT_4_HPD_IRQ macro.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Update commit messages to align with newly added IRQF_ONESHOT related
  commit.

Changes in v3:
- Extract the irq_type bit mapping into a shared helper and document
  the mask register polarity once.
- Drop the unused COMMON_INT_4_HPD_IRQ macro.
---
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 80 ++++++++++++-------
 2 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 88fa538a5949..6a3566b2e8de 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -185,8 +185,8 @@ void analogix_dp_init_interrupt(struct analogix_dp_device *dp);
 void analogix_dp_reset(struct analogix_dp_device *dp);
 void analogix_dp_swreset(struct analogix_dp_device *dp);
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp);
-void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp);
-void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp);
+void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type);
+void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type);
 int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp);
 void analogix_dp_set_pll_power_down(struct analogix_dp_device *dp, bool enable);
 void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 2c1d4655114b..6ac03a1aa512 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -26,8 +26,20 @@
 
 #define HPD_IRQ_ALL		(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
 				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
-#define COMMON_INT_4_HPD_IRQ	(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
-				 DP_IRQ_TYPE_HP_CHANGE)
+
+static u32 analogix_dp_irq_type_to_common_int_sta4(u32 irq_type)
+{
+	u32 reg = 0;
+
+	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN)
+		reg |= PLUG;
+	if (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT)
+		reg |= HPD_LOST;
+	if (irq_type & DP_IRQ_TYPE_HP_CHANGE)
+		reg |= HOTPLUG_CHG;
+
+	return reg;
+}
 
 void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool enable)
 {
@@ -196,30 +208,50 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
 }
 
-void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp)
+/*
+ * Both ANALOGIX_DP_COMMON_INT_MASK_4 and ANALOGIX_DP_INT_STA_MASK use
+ * 0 to mask and 1 to unmask the corresponding interrupt sources.
+ */
+void analogix_dp_mute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
 {
-	u32 reg;
+	u32 reg, mask;
 
-	/* 0: mask, 1: unmask */
-	reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
-	reg &= ~COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	if (!irq_type)
+		return;
 
-	reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
-	reg &= ~INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	mask = analogix_dp_irq_type_to_common_int_sta4(irq_type);
+	if (mask) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+		reg &= ~mask;
+		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	}
+
+	if (irq_type & DP_IRQ_TYPE_IRQ_HPD) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+		reg &= ~INT_HPD;
+		writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	}
 }
 
-void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp)
+void analogix_dp_unmute_hpd_interrupt(struct analogix_dp_device *dp, u32 irq_type)
 {
-	u32 reg;
+	u32 reg, mask;
 
-	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	if (!irq_type)
+		return;
 
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	mask = analogix_dp_irq_type_to_common_int_sta4(irq_type);
+	if (mask) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+		reg |= mask;
+		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	}
+
+	if (irq_type & DP_IRQ_TYPE_IRQ_HPD) {
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+		reg |= INT_HPD;
+		writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	}
 }
 
 int analogix_dp_wait_pll_locked(struct analogix_dp_device *dp)
@@ -382,20 +414,14 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 
 void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq_type)
 {
-	u32 reg = 0;
+	u32 reg;
 
 	if (dp->hpd_gpiod || !irq_type)
 		return;
 
-	if (irq_type & COMMON_INT_4_HPD_IRQ) {
-		if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN)
-			reg |= PLUG;
-		if (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT)
-			reg |= HPD_LOST;
-		if (irq_type & DP_IRQ_TYPE_HP_CHANGE)
-			reg |= HOTPLUG_CHG;
+	reg = analogix_dp_irq_type_to_common_int_sta4(irq_type);
+	if (reg)
 		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
-	}
 
 	if (irq_type & DP_IRQ_TYPE_IRQ_HPD)
 		writel(INT_HPD, dp->reg_base + ANALOGIX_DP_INT_STA);
-- 
2.34.1

