Received: from mail-m127162.xmail.ntesmail.com (mail-m127162.xmail.ntesmail.com [115.236.127.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139948F01D;
	Mon, 28 Sep 2026 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587851; cv=none; b=W5Yl4EavYezCVHWShnTe3obch+JiPXksbsKeXGvXpKrjCyblKx6WftOG6er8dmmbQxArBNJ9csfa46WJJUbSeZCvxmUYQzMxhf4UlmK0HX/l+AmjI3i0CUpku0gK0JKJcwt0Dt7z/eYr1K5HWtUVHJ1uvGzJ84ROSozC+rnfGxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587851; c=relaxed/simple;
	bh=QfxPITENy2U6ojm7wIy6exXOKnlaV3obKxwLB4O4yJw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EPJOIryaCmgpVWglKcZ3sUGJGw7M4yyElHBUZElASe7/i5M3XgUvwWgWGLJaCnMcxvJJwmdzarouNdLALcFjf7mLHI9zn6ILsm6em/a7TotxuME2BxBSuK1KlCxNjDZQsok0Z8qg8qEFpUchaIYEJzMqFIJBfZ9GKws3j51Nqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Wfr60wMv; arc=none smtp.client-ip=115.236.127.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Wfr60wMv"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5398e5f;
	Mon, 28 Sep 2026 16:15:05 +0800 (GMT+08:00)
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
Subject: [PATCH v3 03/14] drm/bridge: analogix_dp: Add IRQF_ONESHOT and simplify IRQ handling
Date: Mon, 28 Sep 2026 16:14:07 +0800
Message-Id: <20260928081418.3605775-4-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa0e714f49203a8kunm323e2b5437cf1f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUlOVkIaSUpNGB4ZGEsaQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Wfr60wMvG2J8qXhOo+zFzALi2vXZTHnXnItUIGi80sunqP3uXezqTn20pSNXseZJpW14EPUORahf2X8lmgkjMQy2T0E3haipumge3QtefnLqRgtXcBC66qN5HZikwDMj0wARqUkZXwgFCjtPTlDh5i1Tyse4Ml1PBRn1DthkrPU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=TeGRKIo9zN3ch77zMT+V+rC/6To7Yk8YMsagDBLa1v4=;
	h=date:mime-version:subject:message-id:from;

The threaded IRQ is requested without IRQF_ONESHOT, allowing hardirq to
preempt the threaded handler. This creates a read-modify-write race on
HPD interrupt mask registers between the hardirq mute and thread unmute
operations.

Add IRQF_ONESHOT to keep the IRQ line masked during thread execution,
which eliminates the race and makes the per-event mute/unmute calls in
hardirq and thread handlers redundant. Move interrupt status clearing
to the beginning of the threaded handler, before
drm_helper_hpd_irq_event(), to avoid losing events that arrive during
the event handling.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Split out a separate commit to improve the return value checking for
  &analogix_dp_device.irq.(Sashiko)
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c  | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 27c9a764e25f..974be5b702dc 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -704,10 +704,8 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type) {
-		analogix_dp_mute_hpd_interrupt(dp);
+	if (irq_type)
 		ret = IRQ_WAKE_THREAD;
-	}
 
 	return ret;
 }
@@ -718,6 +716,9 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
+	if (irq_type)
+		analogix_dp_clear_hotplug_interrupts(dp);
+
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
 	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
@@ -725,11 +726,6 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type) {
-		analogix_dp_clear_hotplug_interrupts(dp);
-		analogix_dp_unmute_hpd_interrupt(dp);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -1474,10 +1470,11 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		 * that we can get the current state of the GPIO.
 		 */
 		dp->irq = gpiod_to_irq(dp->hpd_gpiod);
-		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN;
+		irq_flags = IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN |
+			    IRQF_ONESHOT;
 	} else {
 		dp->irq = platform_get_irq(pdev, 0);
-		irq_flags = IRQF_NO_AUTOEN;
+		irq_flags = IRQF_NO_AUTOEN | IRQF_ONESHOT;
 	}
 
 	if (dp->irq < 0) {
-- 
2.34.1

