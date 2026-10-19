Received: from mail-m3275.qiye.163.com (mail-m3275.qiye.163.com [220.197.32.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFEB49AA38;
	Mon, 19 Oct 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400358; cv=none; b=AoXFFx1ob+EVVFMk9iz6qHvPcSYXtYsgDFlXpsftEp+U8UUowvLqqmeg8b60WBeEQ4pyhghzGcH/l6ZBWK1Q1mT6eBkRl/1u7RQghJCt/S0Ob9tRWeXcamXGuPMFxRXNyAOKpEO0gcaRqqsQWchQllbPdrBZp1VgDesMl9W3UPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400358; c=relaxed/simple;
	bh=lmd+vtbsIk2d1KqtYddBoNLn3lcegkMiT3tVHXn41ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lcbdP3Em+eGZ+r/yX+NPDQeTTAVeOJ3lgh+MYJZVboWHIOmtHk3EnJ6FL+t0MXzT7JOlm/EEJQnxjIMo/KRR8bH7b+bO540rY70olKn8i48SRWjJBR/XpIcCru9Kj953gdI9UUfVHcvi5TZkMCG1nlzJobJAFFsMZNsi/775+cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Clej9k4I; arc=none smtp.client-ip=220.197.32.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Clej9k4I"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5189b85e7;
	Mon, 19 Oct 2026 16:59:05 +0800 (GMT+08:00)
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
Subject: [PATCH v4 04/14] drm/bridge: analogix_dp: Extend clear_hotplug_interrupts to accept IRQ bitmask
Date: Mon, 19 Oct 2026 16:58:26 +0800
Message-Id: <20261019085836.3065008-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019085836.3065008-1-damon.ding@rock-chips.com>
References: <20261019085836.3065008-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa15362c81903a8kunm6ee755052eac10
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0MeVkgaTR9LTUhMTR5LGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Clej9k4IdOig0ysPU1w2UKKegGxjf8FGjVKnBJSeCtdJ3IYKfSqgnn9MC9Qc5Sh11H2Bh8sYxhNWafY2s20ru0nvZdJMERx2W7vrRk3zXZaEauuEt8PUeZw4NnMzBhHd9ANBvVncBavKMVuXHDf/X30mgiRLjRsVgosLN56myKA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=F65PdF+O4TnaiCPbi/wJyx/pQHrDgW8OY44OG/TvwMs=;
	h=date:mime-version:subject:message-id:from;

Update analogix_dp_clear_hotplug_interrupts() to take an irq_type
bitmask argument. Instead of clearing all hotplug interrupt bits
unconditionally, only clear the interrupt flags corresponding to the
triggered events.

Pass the detected IRQ bitmask from the irq thread handler, and use the
full HPD_IRQ_ALL mask during HPD initialization.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Add separate patch for IRQF_ONESHOT to resolve interrupt mask issues
  triggered by interrupt preemption.(Sashiko)

Changes in v3:
- Rename newly added macro HPD_IRQ to HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  2 +-
 .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 28 +++++++++++++------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 974be5b702dc..f88e3263ba0e 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -717,7 +717,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type)
-		analogix_dp_clear_hotplug_interrupts(dp);
+		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
 	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 3f40d95757c5..88fa538a5949 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -196,7 +196,7 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
 u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp);
-void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
+void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq_type);
 void analogix_dp_reset_aux(struct analogix_dp_device *dp);
 void analogix_dp_init_aux(struct analogix_dp_device *dp);
 int analogix_dp_get_plug_in_status(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 49c1961e4326..2c1d4655114b 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -24,6 +24,11 @@
 #define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
 #define INT_STA_MASK		INT_HPD
 
+#define HPD_IRQ_ALL		(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
+				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
+#define COMMON_INT_4_HPD_IRQ	(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
+				 DP_IRQ_TYPE_HP_CHANGE)
+
 void analogix_dp_enable_video_mute(struct analogix_dp_device *dp, bool enable)
 {
 	u32 reg;
@@ -375,18 +380,25 @@ int analogix_dp_init_analog_func(struct analogix_dp_device *dp)
 	return 0;
 }
 
-void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp)
+void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp, u32 irq_type)
 {
-	u32 reg;
+	u32 reg = 0;
 
-	if (dp->hpd_gpiod)
+	if (dp->hpd_gpiod || !irq_type)
 		return;
 
-	reg = HOTPLUG_CHG | HPD_LOST | PLUG;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+	if (irq_type & COMMON_INT_4_HPD_IRQ) {
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN)
+			reg |= PLUG;
+		if (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT)
+			reg |= HPD_LOST;
+		if (irq_type & DP_IRQ_TYPE_HP_CHANGE)
+			reg |= HOTPLUG_CHG;
+		writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
+	}
 
-	reg = INT_HPD;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA);
+	if (irq_type & DP_IRQ_TYPE_IRQ_HPD)
+		writel(INT_HPD, dp->reg_base + ANALOGIX_DP_INT_STA);
 }
 
 void analogix_dp_init_hpd(struct analogix_dp_device *dp)
@@ -396,7 +408,7 @@ void analogix_dp_init_hpd(struct analogix_dp_device *dp)
 	if (dp->hpd_gpiod)
 		return;
 
-	analogix_dp_clear_hotplug_interrupts(dp);
+	analogix_dp_clear_hotplug_interrupts(dp, HPD_IRQ_ALL);
 
 	reg = readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
 	reg &= ~(F_HPD | HPD_CTRL);
-- 
2.34.1

