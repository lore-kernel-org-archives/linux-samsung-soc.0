Received: from mail-m118211.qiye.163.com (mail-m118211.qiye.163.com [115.236.118.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861034B2049;
	Mon, 19 Oct 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.118.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402493; cv=none; b=L0Z+gwcz4JJEwz37TR3dWuN/3ghJ4KVV9kT2MVO+yHx2bH+2j+xhcmlvvremhM7+aIvywdK7K0siDdhqAhrb23MSAgO1KwSabAadLVYTw20RCrop3rnjEbQMwxoUuMaQOAGVkZjTn7Mxin9NYCJrgw/UTQJJrapmipwb/BIvYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402493; c=relaxed/simple;
	bh=Lp6RlazYar263GmKsacGFL1gNOb5VRLSFFsnuTAEOmM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UQaPj2Cfy2XtdAN98lUZAzIkSlyfhWcW8lpOsozpMRck5UnD8vLBBKrHNxMd94pqIb1AY7clRkHfAit9dRWbcIUwTFEgxg+8/jqvWUB3QaUmklPWaHj6f7DqCJZElDQ2DP9gYTqj+Nyo1MP6VJHvMmy/VvDU1JvlJLuQ8zRYl+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YsfDjbb+; arc=none smtp.client-ip=115.236.118.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YsfDjbb+"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5189b8616;
	Mon, 19 Oct 2026 16:59:12 +0800 (GMT+08:00)
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
Subject: [PATCH v4 10/14] drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin detection
Date: Mon, 19 Oct 2026 16:58:32 +0800
Message-Id: <20261019085836.3065008-11-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa15362e62e03a8kunm6ee755052eac58
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT09JVkxJTkofSx0ZQh5IGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=YsfDjbb+HKBUER3A+xp0g2EB5tn+QWGXNROKcDiTfZswwvhnv1We+ZFf3o11z7zHn41938/7B34fLadBNcTUuHtiwafhxjQs88CbgbKEE3g+kq89iQfXQOSYyghQRnVqwltWVtMav4RZ7cSOQUI58jz06/iqVtoM28aU0jypBbM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=+5MlEIEZVG92Lo+4M47TC7gQ3SSNa5CfdWfNhXsiZa4=;
	h=date:mime-version:subject:message-id:from;

On Rockchip platforms, the Analogix DP native HPD pin IRQ requires the
DP controller to remain powered and clocked to generate plug/unplug
interrupts. Without a runtime PM reference, the controller suspends
when the display pipeline is inactive, disabling HPD detection.

Acquire a runtime PM reference in analogix_dp_bind() and release it in
analogix_dp_unbind() for native HPD pin mode. This keeps the controller
alive throughout the device lifecycle for continuous hotplug detection.

Persistent power is only necessary for native HPD pin mode. It is not
required for force-HPD or GPIO HPD modes, where hotplug detection does
not depend on the DP controller's internal interrupt logic. Add helper
analogix_dp_require_pm_for_hpd_irq() to identify Rockchip native HPD
pin configurations (non-GPIO, non-force-HPD).

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Split IRQ enable/disable logic, handle native HPD pin and
  GPIO/force-HPD modes separately to avoid unbalanced enable_irq()
  calls.(Sashiko)

Changes in v3:
- Modify the commit msg according to the previous commit for moving IRQ
  enabling/disabling.

Changes in v4:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index addd319719de..38857508d939 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -39,6 +39,12 @@
 
 static const bool verify_fast_training;
 
+static bool analogix_dp_require_pm_for_hpd_irq(struct analogix_dp_device *dp)
+{
+	return analogix_dp_is_rockchip(dp->plat_data->dev_type) && !dp->hpd_gpiod &&
+	       !dp->force_hpd;
+}
+
 static void analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
 	analogix_dp_reset(dp);
@@ -1571,6 +1577,12 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_unregister_aux;
 	}
 
+	if (analogix_dp_require_pm_for_hpd_irq(dp)) {
+		ret = pm_runtime_resume_and_get(dp->dev);
+		if (ret)
+			goto err_unregister_aux;
+	}
+
 	enable_irq(dp->irq);
 
 	return 0;
@@ -1585,6 +1597,10 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
 	disable_irq(dp->irq);
+
+	if (analogix_dp_require_pm_for_hpd_irq(dp))
+		pm_runtime_put_sync(dp->dev);
+
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1

