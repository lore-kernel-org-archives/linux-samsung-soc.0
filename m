Received: from mail-m12771.qiye.163.com (mail-m12771.qiye.163.com [115.236.127.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8FB49BB58;
	Mon, 19 Oct 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400362; cv=none; b=dPzqhZtQUovfTrG+zxvMQ4U3avhwOy9FZVIYO8eP172uKH9GhhvexMZ8XsCZidlY07RvuS81RVmcHVKzXwazYkyqUO3hGjHXAwlFtomcUzho3ofI27wHNShCbG6Ikl24PluQUAyQtMC7V1oZhUAfbTXnbzJVPEHCfXdEVyyF5S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400362; c=relaxed/simple;
	bh=AUWj32Ez9Q2NWsegwPIeljv9jowrjDtVcFUxxvZvdeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kkS2kuc51vkhXVgeCkZyLrUNyze9sV3sf5UBWxeK8f7co2N1wbkTO8AnxLY8bclgO+xSJIRML4NXyE4lu45+I1b+nvpenrkeF37TrzHm0cAeDVB/IDcymHrqS1Ek7Qh975M005+jYloEc21SrHTXMScnxqzDUQAaorAQQXzqR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=h3UYlKJP; arc=none smtp.client-ip=115.236.127.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="h3UYlKJP"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5189b8626;
	Mon, 19 Oct 2026 16:59:15 +0800 (GMT+08:00)
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
Subject: [PATCH v4 12/14] drm/bridge: analogix_dp: Restrict forced connected status to panel endpoints
Date: Mon, 19 Oct 2026 16:58:34 +0800
Message-Id: <20261019085836.3065008-13-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa15362efdb03a8kunm6ee755052eac72
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTU4aVhlMTU9KQ0JCSExCS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQkpVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=h3UYlKJPns3OgCaXOBuzXqxn/3yMyXVIOeStWyF6Vx61b6e6kL+YVND3w/rojHNfqLKNmPAxYw/7Q8fyVp4rPcxGf5wm5dA3rpJ/OVm8qp6LucgJTqnydFCwHh8CgwSHTUcb/8ZwK9/R3zGIsY1rlPNLMHZTG2V5qCN/FTs4Drc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ZbaoMMpaK5ymhBKqqVS1AwEyVBJ5neq5y7a/vVr8le0=;
	h=date:mime-version:subject:message-id:from;

Limit the shortcut which unconditionally returns connected status when
a next bridge exists. Only apply this logic if the last bridge in the
chain is a panel and the bridges attached after Analogix DP bridge lack
DRM_BRIDGE_OP_DETECT, which called 'force_connected_mode'. For all
other cases, rely on analogix_dp_detect_hpd() to report accurate
hotplug state.

Background for the special handling:
- If the chain ends with a DP connector bridge, the connector relies
  on Analogix DP to perform detection. We must avoid hardcoding
  connected status here.
- For intermediate bridges such as PS8625 / PTN3460 without detect
  support [1], historically the bridge connector defaults to connected
  via drm_helper_probe_detect() when no per-bridge detect callback
  exists.

[1] https://lore.kernel.org/all/4939d55e-b560-4235-8295-adf8e48d9b74@samsung.com/

Reported-by: Heiko Stuebner <heiko@sntech.de>
Link: https://lore.kernel.org/all/5209243.oAaWjsssbx@diego/
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Add missing drm_bridge_put() after drm_bridge_chain_get_last_bridge()
  to fix a reference count leak.(Sashiko)
- Report panel endpoints as always connected from
  analogix_dp_get_plug_in_status() via newly added
  &analogix_dp_device.force_connected_mode.

Changes in v4:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 30 +++++++++++++++++--
 .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  3 ++
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 853b6a6a7fe4..df898f314254 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -912,15 +912,30 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->bridge.next_bridge)
-		return connector_status_connected;
-
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
 
 	return status;
 }
 
+static bool analogix_dp_bridge_force_connected(struct analogix_dp_device *dp)
+{
+	struct drm_bridge *last_bridge;
+	bool force_connected = false;
+
+	drm_for_each_bridge_in_chain_from(dp->bridge.next_bridge, bridge) {
+		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
+			return false;
+	}
+
+	last_bridge = drm_bridge_chain_get_last_bridge(dp->encoder);
+	if (last_bridge)
+		force_connected = drm_bridge_is_panel(last_bridge);
+	drm_bridge_put(last_bridge);
+
+	return force_connected;
+}
+
 static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
@@ -940,6 +955,15 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 			dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
 			return ret;
 		}
+
+		/*
+		 * Only assume connected when the bridge chain ends with a panel.
+		 * Panel bridges lack a detect callback and historically rely on
+		 * this shortcut. For other next bridge types (e.g., DP connector
+		 * bridges), fall back to analogix_dp_detect_hpd() to report
+		 * accurate hotplug state.
+		 */
+		dp->force_connected_mode = analogix_dp_bridge_force_connected(dp);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 6a3566b2e8de..5f5698c73d88 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -170,6 +170,7 @@ struct analogix_dp_device {
 	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
+	bool			force_connected_mode;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index af5e5a8ec88d..abbcdba1a438 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -533,6 +533,9 @@ int analogix_dp_get_plug_in_status(struct analogix_dp_device *dp)
 {
 	u32 reg;
 
+	if (dp->force_connected_mode)
+		return 0;
+
 	if (dp->hpd_gpiod) {
 		if (gpiod_get_value(dp->hpd_gpiod))
 			return 0;
-- 
2.34.1

