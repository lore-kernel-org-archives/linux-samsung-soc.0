Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558211;
	b=N6cn2ERr1aeBkjMmuoZMBBgvrOm3uwzcKfdD8FWOpwjCzj335JwvPxZQTJeSHtqJ5riZ
	 de+/LY5aRYui6a3ozNhVZOlPQPXyj5avjXcau6wNo1wBm4tPES0bPw2o4V4yb//T6iZIC
	 VDzYomS8li/BJoqIKhbSfs9TXq9mxByyJpSDQwn1AJRKwrbQhJs7N46SkCmNHGBZ/R70n
	 cbNpdc3ayvtXlZhZSuq/s7xeVbUdMcigHmBlhikfGpq4a4dfc143VJjt/j/uRDlEHOD94
	 egIImWU08S76ehNpZO8pRjDTHt2iPhwcZSriiVP7N0SsSfpFFxiEm9OIwqGWlpEnCTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558211;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=jSks95ZE3i1RDHGKi/bStGEXhqlCzTh16bDXopdHu0k=;
	b=GxXQ3eBquZiUkanEoxoDfwsy78BBURL8HtMzKpvM3D/Q1tPsVtUPjigIaBLg7Ypwin+g
	 s7e/bZJ1M15yxX+ghkBDStTDtK6LwuodEBMr52ztgU+heep2rWlmYr6RdJyViudVFgte1
	 CXbXZkHiVanBs2LJfWK6vqpmcDepGCpeVhfhLYFCRQSbJ5z8RReGVlDP5Io1SSeD9/ID6
	 5uFM88RSIzLCp13oqGT95WfsyuD51bcxdfYWexFj9TQ/9Sdyp+kr+2fEZvendEwy1NTWe
	 4U1B6gA04cuYBFABU1exM8dAQY+c78YuuXEJZX2wh1teEFW2HTfP7B5m0rtrAPevrvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=A51LpazW;
	arc=none smtp.remote-ip=160.236.53.81
Received: from mail-m1602365381.xmail.ntesmail.com (mail-m1602365381.xmail.ntesmail.com [160.236.53.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FE606A89E;
	Fri, 13 Nov 2026 08:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C8FE606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=A51LpazW
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be12;
	Fri, 13 Nov 2026 16:23:19 +0800 (GMT+08:00)
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
Subject: [PATCH v6 03/18] drm/bridge: analogix_dp: Restrict forced connected status to panel endpoints
Date: Fri, 13 Nov 2026 16:22:50 +0800
Message-Id: <20261113082305.541652-4-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d401085903a8kunm073aab0481a34
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHh1CVhkYSElMHRoeTE1DGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=A51LpazWWjdtIzwLbwmguZU/0XnbrG/0x6I79EHRl0IzI0W3ppcJlhpBGj0WoYjVlhAhPsKiPX/q1u3DhgIUX4khX63jquj/6jpY2jAny4NA/FaPsJmVVEUQ0fqiJp7dxaXvI4LZcmf539glyoz0diSvkT3jhrWRpo345ugZ0k8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=jSks95ZE3i1RDHGKi/bStGEXhqlCzTh16bDXopdHu0k=;
	h=date:mime-version:subject:message-id:from;

Limit the forced connected status so that it only applies when the
bridge chain ends with a panel and no downstream bridge supports
DRM_BRIDGE_OP_DETECT, which is tracked by the new
&analogix_dp_device.force_connected_mode.  For all the other cases,
rely on analogix_dp_detect_hpd() to report the accurate hotplug
state.

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
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Add missing drm_bridge_put() after drm_bridge_chain_get_last_bridge()
  to fix a reference count leak. (Sashiko)
- Report panel endpoints as always connected from
  analogix_dp_get_plug_in_status() via newly added
  &analogix_dp_device.force_connected_mode.

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Move the force_connected_mode check from
  analogix_dp_get_plug_in_status() to analogix_dp_bridge_detect(), as
  the hardware status reader is also used by the force HPD fallback
  and the AUX HPD waiting paths. (Sashiko)
- Hold a runtime PM reference in analogix_dp_bridge_detect(), since
  analogix_dp_detect_hpd() may access the registers while the device
  is runtime suspended. (Sashiko)

Changes in v6:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 37 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 19f3cec5a691..35b273a803a0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -904,16 +904,42 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 {
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
+	int ret;
 
-	if (dp->bridge.next_bridge)
+	if (dp->force_connected_mode)
 		return connector_status_connected;
 
+	ret = pm_runtime_resume_and_get(dp->dev);
+	if (ret)
+		return connector_status_unknown;
+
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
 
+	pm_runtime_mark_last_busy(dp->dev);
+	pm_runtime_put_autosuspend(dp->dev);
+
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
@@ -933,6 +959,15 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
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
index 4560597604ad..64aaba67e669 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -170,6 +170,7 @@ struct analogix_dp_device {
 	bool			force_hpd;
 	bool			fast_train_enable;
 	bool			psr_supported;
+	bool			force_connected_mode;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-- 
2.34.1

