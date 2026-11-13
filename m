Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558220;
	b=1xmOhZ9TxNoHw/Rs0G1JMMfzUfhGjjFnBJfqWuwb4qJOqDT0tWz8W55pj/1yzYEKk1FP
	 oR4ASbqTCbZYgF6hKQ8t5fko8E1bhx3MKmp5MQN63ljITKqFCoz9kFaSt/gqozfcH4gid
	 4QQKYTsa1bwzyyz5cIPHTwj5mHZWSMkYSJm4OjY54ccIfDZWTuuutNDnRLxFybdZib4Qd
	 YW0X0HFP/gB6Cz1n6f9AVelCSzVzcEagmMyDvraZEpJTkhveNV9NyiLrFeHyA+W5YDZwR
	 la//CYqgD9GkE4tMcHhDpPZBmwNVZCX3pFE7YDuTLGpaQZ57rDgZqoU8PuPI0/Tx4pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558220;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=0pTqIw06cz1oq6av8MIl6KLpJkIrNghqCcHA6i8QKLc=;
	b=d6Xa+2ZxM9HVViV3DMMueHeAxjUVkeiudFenk2QzKl4ewphMDqs2o+RxtN8MCPeA6XTi
	 K7toMNlVUwUIQJmdsHWPBtorFi3OHgdjbLhK6IWTRJeYhReIyS7iPhuQ/MtMkJUM/D0dv
	 wQYWkBwVWvG8jKL7mqfLPXAfOUBYMR/IbOjqkZeipduJLSHYvhXKop/Ew4Vzt8OFyAX2j
	 Abf9GyCabD/ooOAnAKS2KTOv/I9rLIaHQv89YkIVb5v/JBYosassptrtXvkdnj/1ZxOal
	 KUIQiewifQiTTytwcwDZHYf7eU8ddN1uDWjbDXoU4F8gl/0K0pehxoZ9bbVMtu75Nkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=WC4IkIOf;
	arc=none smtp.remote-ip=160.236.53.79
Received: from mail-m1602365379.xmail.ntesmail.com (mail-m1602365379.xmail.ntesmail.com [160.236.53.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3D60A6F70;
	Fri, 13 Nov 2026 08:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D3D60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=WC4IkIOf
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be48;
	Fri, 13 Nov 2026 16:23:26 +0800 (GMT+08:00)
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
Subject: [PATCH v6 08/18] drm/bridge: analogix_dp: Extend mute/unmute HPD interrupts to accept irq bitmask
Date: Fri, 13 Nov 2026 16:22:55 +0800
Message-Id: <20261113082305.541652-9-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d401234903a8kunm073aab0481a88
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGU9OVkkYGh1KTUxCH0MdSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=WC4IkIOfmQ74tYoPIr3UtvxKnsXM0Lu1mM1OxY0adncp9WdeMnplSLm9g+ZhLtYTK9UCmF+7U3PL6J6hlzWSuE/pNHCu/a0HHnPgWZBfNqkGqXOWGG9xJiPPj8iFnGkGs0mVob6ipgvaABV0Sq/bVcugEA1c2/Kd81dqhnYIJmc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=0pTqIw06cz1oq6av8MIl6KLpJkIrNghqCcHA6i8QKLc=;
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

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Update commit messages to align with newly added IRQF_ONESHOT related
  commit.

Changes in v3:
- Extract the irq_type bit mapping into a shared helper and document
  the mask register polarity once.
- Drop the unused COMMON_INT_4_HPD_IRQ macro.

Changes in v4:
- Add Tested-by tag.

Changes in v6:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.h    |  4 +-
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 80 ++++++++++++-------
 2 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 068be3464521..2ac92b2bac0a 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -186,8 +186,8 @@ void analogix_dp_init_interrupt(struct analogix_dp_device *dp);
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

