Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.79.60.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107723;
	b=Ag9fbDXGZH20WSWJDxnVfOvTB1wWTjal+m9bWH4YdbVXE0W137YpJtYxeRzERO9pmN3v
	 yoD9gY/LBxXrhUG0JnQs1mIPEBvrjZK72auYUrpMTvZM5O/dXMIsFsGFD4SEKTW/mZ0MB
	 KPPZHZAVpCGuFeaw5YMKao8KCveYlkgoXLuPltnZwk89/qEw6u7I0okE2HDZ2R8DQ7GcO
	 YWUpYfyte7wZ5fheoraDvgd+Aj0aXgtThQICMvfzmpfAQmUvknU3hNtNrAL9SJL4i49q8
	 456OrCEGa9ftemGucoNAtiiyDJQ9f0AII+IZh07pvyipbsfdeEq7hbhpAPdBKSs83kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107723;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=CPRNv59LSKg39ljucKIlyyWQzf5H+FkrOdW9GxkpoMc=;
	b=VByQBYyg8bnK9eelI4srBvbfD+9HnGOR5woTk1AgaRhgBKPnIvmJgbQ23+9r0gKTOFZh
	 5THRJmnRbmnwAcTEw4thXYmf3sYWyThjmkWtaU6mezZ1YF+b+aJP7oD7u2dMPp7V9RDtW
	 B8s1uzN7fb0buVrHpADQp12zZcRdwtzxMLcDGIUtglI0CZEzDKJSr8HeN5fJXGW/Yodaq
	 rrG8aLx48KiQseZu4X5AdRsPf9vMPW1tQykUi6Dyeb6rScesbdaZwVC7z+n/ewt31hYFh
	 IEcMJxCPpGZc16gxBmG8/TdMjFHmGqXt3ascFr05LkABgFpOGHu+2oB79WYN7PVVp7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ucb8hwS9;
	arc=none smtp.remote-ip=210.79.60.227
Received: from mail-m60227.netease.com (mail-m60227.netease.com [210.79.60.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B1F60A381E;
	Tue, 27 Oct 2026 13:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B1F60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ucb8hwS9
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a40;
	Tue, 27 Oct 2026 21:28:31 +0800 (GMT+08:00)
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
Subject: [PATCH v5 14/18] drm/bridge: analogix_dp: Move IRQ enable/disable to bind/unbind
Date: Tue, 27 Oct 2026 21:28:06 +0800
Message-Id: <20261027132810.1746118-15-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa17d8c57b803a8kunm87c266213d5728
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBpMVkhCGBpOHR9OSUhPH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ucb8hwS99DsETGy/HvfHCfSmyF2FtYCYZDqDT8FDDoSVoPGi1BfERd11N0wcsGHAfXuVjCJmWp5Kups8r3JsOV4bAiOJbGlOkRr01hNZlR8vsAFAt263ka7ZCrwx+6KbX1xwAMcry/URPMmTKF4D8iT5pfMhgtGxSV3qgCwy8iU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CPRNv59LSKg39ljucKIlyyWQzf5H+FkrOdW9GxkpoMc=;
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
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 35 ++++++++++---------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b14a8aa12394..50177d1ccb5c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -700,24 +700,22 @@ static int analogix_dp_enable_scramble(struct analogix_dp_device *dp,
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
+	 * The device may have been runtime suspended since the interrupt
+	 * was raised. Hold a runtime PM reference before touching the
+	 * registers, as the controller clocks are only guaranteed to be
+	 * enabled while the device is runtime PM active.
+	 */
+	ret = pm_runtime_resume_and_get(dp->dev);
+	if (ret)
+		return IRQ_HANDLED;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (!dp->hpd_gpiod && irq_type)
@@ -734,6 +732,9 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
+	pm_runtime_mark_last_busy(dp->dev);
+	pm_runtime_put_autosuspend(dp->dev);
+
 	return IRQ_HANDLED;
 }
 
@@ -1056,7 +1057,6 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 		goto out_dp_init;
 	}
 
-	enable_irq(dp->irq);
 	return 0;
 
 out_dp_init:
@@ -1198,8 +1198,6 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
-	disable_irq(dp->irq);
-
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
 
 	pm_runtime_put_sync(dp->dev);
@@ -1527,7 +1525,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	}
 
 	ret = devm_request_threaded_irq(&pdev->dev, dp->irq,
-					analogix_dp_hardirq,
+					NULL,
 					analogix_dp_irq_thread,
 					irq_flags, "analogix-dp", dp);
 	if (ret)
@@ -1613,6 +1611,8 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_unregister_aux;
 	}
 
+	enable_irq(dp->irq);
+
 	return 0;
 
 err_unregister_aux:
@@ -1624,6 +1624,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
+	disable_irq(dp->irq);
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
-- 
2.34.1

