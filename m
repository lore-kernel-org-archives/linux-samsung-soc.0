Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.224.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107726;
	b=jbYZOOhj73pSYrr7+5IdyJN1E52xX/ueT0xWWKknkmj47lFDS/f8CH9I4dNgEnTb7k9k
	 yE9VvQMT+dbIz3yFikllZYY34mps3tu2b8/uL7kLaletvIs/a6dd6CCw6YSSLP2+G7sO2
	 v34wiJZyu9m9ea0gsLna/cJnGflDnVHAOTdUV33YWBoB+1SjhNYC8G8tEw1RuiqhmT+q9
	 10TuWnf40nBVV3A4dSrlTZOiJbN7DNX0XQ82kisLjb7l5HDqHXDfmqIjLPhQHUVTPVG0T
	 N0Zt9Bc8x/8WYS10qq6iDusD/330w7xswyTeRlldOP9+8/IuNWQrlooH1pb2mj0N7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107726;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=OZLecs9ULaW3R1e0H0Cp/hBp2cEn1xWlIbXGia1G9b8=;
	b=yx3jdQSv4Lo6sqEDcTtW1PXHdBO22qTrQfLlY/YZvXFsgBEsUmfreOey3tEm/KOBAALQ
	 R7yjaxhZczvg+ffK4ohgsj2eRg3ujOxXd3tzz0Kq8snrnVzKiXc+iK1qSrU41whKdJUsr
	 8J5Et7C4jLAOMdGTGxkez5IJdM/eSDQAvXuUM8RWTRayQwlVgWhGs892E1xaCU5a8HNzC
	 J8iXxQwiMxhrsRDYgaURlmKWmJoUbsozGYCCKk93tmvu9O3um7xvFz4oSNE5olHpwZG1n
	 vBf8LQiUui/hc4Vgi7p2uc6euIlegGxCnYN+wne6t8ZSkQKw3Y5jf8GTe+pbFjrwXEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cn5cnMUx;
	arc=none smtp.remote-ip=156.224.82.170
Received: from mail-m82170.xmail.ntesmail.com (mail-m82170.xmail.ntesmail.com [156.224.82.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E5060A2601;
	Tue, 27 Oct 2026 13:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E5060A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cn5cnMUx
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a45;
	Tue, 27 Oct 2026 21:28:34 +0800 (GMT+08:00)
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
	Sandy Huang <hjc@rock-chips.com>
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
Subject: [PATCH v5 16/18] drm/bridge: analogix_dp: Declare DRM_BRIDGE_OP_HPD for hotplug reporting
Date: Tue, 27 Oct 2026 21:28:08 +0800
Message-Id: <20261027132810.1746118-17-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa17d8c61a003a8kunm87c266213d573a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaThlNVktKGUxITElJTktIT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cn5cnMUxh+tZTsig1iD2lQuSkdIGiC0kgc/4tU5mfTr/mpDNBFkratkKfz9mtQDTVNwCpBE7VrlcRBgQFGW00WXH88y3yH/fqMA2+VvKOnztqoaS7JNVik65gW2OQofxUvXKWLDsqr3ngTaDqqvudLg/qv+p7ffQsS7NIG9rv/A=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=OZLecs9ULaW3R1e0H0Cp/hBp2cEn1xWlIbXGia1G9b8=;
	h=date:mime-version:subject:message-id:from;

The connector created by drm_bridge_connector_init() only gets
DRM_CONNECTOR_POLL_HPD when a bridge in the chain declares
DRM_BRIDGE_OP_HPD.  Without it, the HPD events reported from the IRQ
thread were silently dropped and the connection state was only
refreshed by the periodic poll worker.

Declare DRM_BRIDGE_OP_HPD on the Analogix DP bridge, implement the
no-op .hpd_enable/.hpd_disable callbacks, and report the hotplug
events via drm_bridge_hpd_notify() with the status read from the
hardware.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 009567da5f17..938c70dc8e15 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -31,7 +31,6 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
-#include <drm/drm_probe_helper.h>
 
 #include <video/of_display_timing.h>
 
@@ -741,9 +740,13 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 		hpd_detected = (irq_type & DP_IRQ_TYPE_HP_CABLE_IN) ||
 			       (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT);
 	if (hpd_detected) {
+		enum drm_connector_status status;
+
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
-		if (dp->drm_dev)
-			drm_helper_hpd_irq_event(dp->drm_dev);
+
+		status = analogix_dp_get_plug_in_status(dp) == 0 ? connector_status_connected :
+								   connector_status_disconnected;
+		drm_bridge_hpd_notify(&dp->bridge, status);
 	}
 
 	pm_runtime_mark_last_busy(dp->dev);
@@ -1280,6 +1283,14 @@ static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		DRM_ERROR("Failed to enable psr (%d)\n", ret);
 }
 
+static void analogix_dp_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+}
+
+static void analogix_dp_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+}
+
 static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1292,6 +1303,8 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.attach = analogix_dp_bridge_attach,
 	.edid_read = analogix_dp_bridge_edid_read,
 	.detect = analogix_dp_bridge_detect,
+	.hpd_enable = analogix_dp_bridge_hpd_enable,
+	.hpd_disable = analogix_dp_bridge_hpd_disable,
 };
 
 static int analogix_dp_dt_parse_lanes_map(struct analogix_dp_device *dp)
@@ -1612,7 +1625,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		return ret;
 	}
 
-	bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
+		      DRM_BRIDGE_OP_HPD;
 	bridge->of_node = dp->dev->of_node;
 	bridge->type = DRM_MODE_CONNECTOR_eDP;
 	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
-- 
2.34.1

