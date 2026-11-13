Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558212;
	b=wdA0ZuJE4EFlWj38dPqhTbbVBNwZGJH+BRgf9/btpOOM3sWCdrYeo3syszB9xaqCBVXH
	 otnR3YjXeRfciCufRaJlE4lMErxzRb4ZtsKjo1oQgn26IuwTUVa8euxNpKRXltrRlg9m4
	 1NmFQUCxaENH4H+ntZ+kb4X6pCk4hrVihYysx39MaEiL5Pbeu52QserUWpvbTcT7BA2Bn
	 4pw7rJKhYocxfu0BIH/7XxJnF/MTndh2NR2aTwGrcmSQTWvgkBL3flVi9DtqD3tUnOk1Z
	 iKH5xbmlsZjhU00M6CfYTOG+1A6ui6eQsWkDmmNklTaDt0/1+pXxWa1gZ/XU8XgLsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558212;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=G/kiDScfnY0OYjEod2cKdTuMee7XEGUq6FrfIROTexM=;
	b=sz6Y20AAA71Q2oOqakZiRaZ5F9bj+qkVprUTr0P45yGiATRbo2XKTaoxS6SvRg8jqdpB
	 LEpB8/c2sgy/G8E1b75hXHqxhX+Sq64QJtlbHx73E1+8YRcJmwZPemUCm+R7g5Y0Vlurc
	 Ori9P1gKHf+LEXG0zo6A3UBhmeUPg24mxbyxDwyzOyp2NpzuoW37vUyZzp2cv+x8dYW3E
	 nBG5KHfiMIhhIK+1yf2xEFClzSDFFDTzxmFGQwPMLRUF6TLOzyduz+kI55tYDHAvgc8TY
	 /kstWJL/uM/5NPHYq04kmvqbP7gVZv9N1o0j8v/Q1E2l3P9PRCeMhbWjxBK3Vl1rUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=k0aPymII;
	arc=none smtp.remote-ip=210.79.60.88
Received: from mail-m6088.netease.com (mail-m6088.netease.com [210.79.60.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C053C60A3825;
	Fri, 13 Nov 2026 08:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C053C60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=k0aPymII
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be22;
	Fri, 13 Nov 2026 16:23:21 +0800 (GMT+08:00)
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
Subject: [PATCH v6 04/18] drm/bridge: analogix_dp: Return bitmask from analogix_dp_get_irq_type()
Date: Fri, 13 Nov 2026 16:22:51 +0800
Message-Id: <20261113082305.541652-5-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d4010e2203a8kunm073aab0481a4b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUlOVklCGR8fTx1OQk5KGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=k0aPymIIZbkGIzGUxq0OBQD9fYwvdXTdZrm3KRdv21bZ4Gqob08Mfzt2Hy62FYvNFMAeia15XrDfjycug+yT0acQqTauvOivdFKgS14GeDeTl6v4E4c6kgwlH4YHTwxEHpLesoInlr1nLNdMS21GXfq/d8ug7xvsNK5cz5NaWpg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=G/kiDScfnY0OYjEod2cKdTuMee7XEGUq6FrfIROTexM=;
	h=date:mime-version:subject:message-id:from;

Analogix DP controllers support two sets of interrupts for hotplug
detection: HOTPLUG_CHG, and the pair PLUG / HPD_LOST.  The current
driver logic relies on PLUG/HPD_LOST only, and
analogix_dp_get_irq_type() returns on the first matched interrupt
flag, so the hardirq handler unconditionally mutes all HPD
interrupts, including HOTPLUG_CHG and INT_HPD.

To prepare fine-grained interrupt handling, convert the return type
from enum dp_irq_type to a u32 bitmask, accumulate all pending
interrupt flags instead of returning early, add detection for
DP_IRQ_TYPE_IRQ_HPD, and use zero instead of the DP_IRQ_TYPE_UNKNOWN
sentinel to indicate no pending interrupts.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Simplify the commit msg.

Changes in v6:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  8 ++++----
 .../gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c  | 18 ++++++++++--------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 35b273a803a0..a3871f28b835 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -704,10 +704,10 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	irqreturn_t ret = IRQ_NONE;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_mute_hpd_interrupt(dp);
 		ret = IRQ_WAKE_THREAD;
 	}
@@ -718,7 +718,7 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
@@ -728,7 +728,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_clear_hotplug_interrupts(dp);
 		analogix_dp_unmute_hpd_interrupt(dp);
 	}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 64aaba67e669..dc189f0b7a19 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -120,7 +120,7 @@ enum dp_irq_type {
 	DP_IRQ_TYPE_HP_CABLE_IN  = BIT(0),
 	DP_IRQ_TYPE_HP_CABLE_OUT = BIT(1),
 	DP_IRQ_TYPE_HP_CHANGE    = BIT(2),
-	DP_IRQ_TYPE_UNKNOWN      = BIT(3),
+	DP_IRQ_TYPE_IRQ_HPD      = BIT(3),
 };
 
 struct video_info {
@@ -196,7 +196,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp);
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp);
 void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
 void analogix_dp_reset_aux(struct analogix_dp_device *dp);
 void analogix_dp_init_aux(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index c1344a3f013a..49c1961e4326 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -412,8 +412,9 @@ void analogix_dp_force_hpd(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
 }
 
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 {
+	u32 irq_type = 0;
 	u32 reg;
 
 	if (dp->hpd_gpiod) {
@@ -425,17 +426,18 @@ enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 	} else {
 		/* Parse hotplug interrupt status register */
 		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
-
 		if (reg & PLUG)
-			return DP_IRQ_TYPE_HP_CABLE_IN;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_IN;
 		if (reg & HPD_LOST)
-			return DP_IRQ_TYPE_HP_CABLE_OUT;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_OUT;
 		if (reg & HOTPLUG_CHG)
-			return DP_IRQ_TYPE_HP_CHANGE;
+			irq_type |= DP_IRQ_TYPE_HP_CHANGE;
+
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+		if (reg & INT_HPD)
+			irq_type |= DP_IRQ_TYPE_IRQ_HPD;
 
-		return DP_IRQ_TYPE_UNKNOWN;
+		return irq_type;
 	}
 }
 
-- 
2.34.1

