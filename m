Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558219;
	b=mtz3rQAlCzfwSUm9RgW1vdklv58OummThWS/BbsHauEEXNDCOLQ8+lKZdZ4XZTeamJab
	 l3Y9+VlfXjux5kKLrfPvmVg/K5GjsUmrvxQETl786RNY0A29XV6MFkTWSth0j0qJVgwIp
	 uie3azFllutLSVvg4g89p4vGzbI3UBOjFt9wifvm6/1Wnyxf0DRxBw8oVUvj4HCJCzuQR
	 EPFaEtND6Efxqy5zbpQV8+2Dy1IjRIZ6aPmzmFLdlqeDmSGfokMg/AhvXRv8Tc3glyhic
	 8O93W7WDTokwET7fnJRJj9ggZkqyfXyVwsYGFxksZLWaFafeXaUCnt/r8hDgzYnoB9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558219;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=ut3BDmCWOauFsURzlyD7adGSwi9BnGWrMNMiar1oKBY=;
	b=ljeZdOlI49rKnPxZc7GgXK2nK8Iv7JqVJneuU9o8KwfUTcuyuAIhmGEKE86CyaXikDqj
	 9KDc5tOGguO3ddiqVWOgPhAIYOVHtpxoMqZqGAHNF3f7LOwFdKh1F+2F3OVHvYLZuIvhX
	 X55oSiSlyMX9WhPlns7PZGzULNlE1dUQIyrG4DOdLM0NipL2Hj1YdWncTFTU7loqNp/Ir
	 YA8L86x9tmRA1O0h39fLXe0yznJ6G3xBVPhS2Wc1V61McgkSNxPukxCkZ3irPaaYsdOB4
	 T1Jazv5YDNbJTmPRgXZ+RlWlg+IVl/gWXtEmmc1hPJCCf61W1znc0OaImUZaipwqVRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=WG6g1gcX;
	arc=none smtp.remote-ip=210.79.60.64
Received: from mail-m6064.netease.com (mail-m6064.netease.com [210.79.60.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02BE60A6F65;
	Fri, 13 Nov 2026 08:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02BE60A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=WG6g1gcX
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be77;
	Fri, 13 Nov 2026 16:23:34 +0800 (GMT+08:00)
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
Subject: [PATCH v6 14/18] drm/bridge: analogix_dp: Move IRQ enable/disable to bind/unbind
Date: Fri, 13 Nov 2026 16:23:01 +0800
Message-Id: <20261113082305.541652-15-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa1d401420c03a8kunm073aab0481adf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTBkYVksYTk5MTUhCGB4dTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=WG6g1gcXu+aUNJ1ZRCs7jXip7vt+pv0FuHYVMYkbQSGeSSkic5/SfedWsaQpGUGI6mMViNhGvgC5rfQVmUCE7Zs896Sx3qRRI0C1F7ACZjSdOYrk8Yca0LG1vpc/2AUroBcpxATAcnsdCNjlqWfVQhORCY8Wa45FMaErimcc73w=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ut3BDmCWOauFsURzlyD7adGSwi9BnGWrMNMiar1oKBY=;
	h=date:mime-version:subject:message-id:from;

Move enable_irq()/disable_irq() from bridge enable/disable handlers
into analogix_dp_bind()/analogix_dp_unbind(). This keeps the IRQ
active throughout the device lifecycle rather than only during display
activity, which is a prerequisite for supporting HPD detection while
the display pipeline is inactive.

Make the interrupt fully threaded and hold a runtime PM reference in
the threaded handler, so that no register is accessed while the
controller is runtime suspended.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Move this patch after mute/unmute related modification and detail the
  commit msg.

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Use a pure threaded IRQ handler and hold a runtime PM reference in
  it, so that no MMIO happens on the unclocked controller after
  runtime suspend. (Sashiko)
- Add prep patches to call analogix_dp_unbind() when
  drm_bridge_connector_init() fails, so that the IRQ enabled across
  the bind lifetime gets properly disabled on bind failures. (Sashiko)

Changes in v6:
- Skip the runtime PM reference in the IRQ thread for the GPIO HPD
  mode, since it only reads the GPIO level. (Sashiko)
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 40 +++++++++++--------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b14a8aa12394..7f6346d45a01 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -700,24 +700,25 @@ static int analogix_dp_enable_scramble(struct analogix_dp_device *dp,
 	return ret < 0 ? ret : 0;
 }
 
-static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
-{
-	struct analogix_dp_device *dp = arg;
-	irqreturn_t ret = IRQ_NONE;
-	u32 irq_type;
-
-	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type)
-		ret = IRQ_WAKE_THREAD;
-
-	return ret;
-}
-
 static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	u32 irq_type;
 	bool hpd_detected;
+	int ret;
+
+	/*
+	 * The device may have been runtime suspended since the interrupt was
+	 * raised. Hold a runtime PM reference before touching the registers,
+	 * as the controller clocks are only guaranteed to be enabled while
+	 * the device is runtime PM active. The GPIO HPD mode needs no such
+	 * reference, since it only reads the GPIO level.
+	 */
+	if (!dp->hpd_gpiod) {
+		ret = pm_runtime_resume_and_get(dp->dev);
+		if (ret)
+			return IRQ_HANDLED;
+	}
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (!dp->hpd_gpiod && irq_type)
@@ -734,6 +735,11 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
+	if (!dp->hpd_gpiod) {
+		pm_runtime_mark_last_busy(dp->dev);
+		pm_runtime_put_autosuspend(dp->dev);
+	}
+
 	return IRQ_HANDLED;
 }
 
@@ -1056,7 +1062,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 		goto out_dp_init;
 	}
 
-	enable_irq(dp->irq);
 	return 0;
 
 out_dp_init:
@@ -1198,8 +1203,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
-	disable_irq(dp->irq);
-
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
 
 	pm_runtime_put_sync(dp->dev);
@@ -1527,7 +1530,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
-					analogix_dp_hardirq,
+					NULL,
 					analogix_dp_irq_thread,
 					irq_flags, "analogix-dp", dp);
 	if (ret)
@@ -1613,6 +1616,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_unregister_aux;
 	}
 
+	enable_irq(dp->irq);
+
 	return 0;
 
 err_unregister_aux:
@@ -1624,6 +1629,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
+	disable_irq(dp->irq);
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1

