Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605748;
	b=11W38B0qfevb3a1uHqNKRqZJJT6zyN8O2PEeuMWQL/oVegcoCxvKeAByQUvIhNN1rLKw
	 DQJxE53Wl012wGA/03ItFbTs7zbaFQPkC4Py2Q0/Ntw2yStFU5oc03JT4WAH1d/oM/7fB
	 3Z+0wH5P6ldTK3mDBNe4qCXzvbDKB+Uk7YcKbQhsoU8aZFqIEbgLhB3AeoIRwOb2I5tm9
	 X2mBPqYjYu9IufBMeLu68UaCV3dCCDHN55fKjgsMfMTr+QAV9sg6rhZ/tCvptUSOqZnn0
	 gMqnbFEq3hc9IvBhxwE3MsI+ZO50UjS3qMBokB7qKkw0wcpOmgfawVTkUsWu735WxuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605748;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=yJpWCGGrUZ0AbmDD4n3+FWT0/Ek4ax64gyEdD+uV6j8=;
	b=J4HPvoM08ghX4ik2keo3Jc3pA0fg2bgDTtxWjgHLfazqy8nJ256OTypi6hNG30Q9XxKr
	 taMR0ZyWC/n5+Y42tai8zzVDeg2mE738q0idrVCWiUUz3d/fyC5sh30Gwj9RqlgJZ40l1
	 Ab5UrnGKwkkmi5AzTDfiPpuiwKaNFR3lkKoTRo7M1OBZuSwaMmIbDFn6ABCD/yXJI+Xgw
	 GRBrNPYS7cYxd718Wc9o2xmTUlCOOcY3tRldvxTDBv280uW1jdDW7Wawvy9aUohcShpUf
	 VUA+uKQqs5Hc3+98BnPR2Uz71z/Y59UqOx/7A8PJbDrSkaFx+6oFO2aEFy+Ju2E3hNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dQJ1o7BZ;
	arc=none smtp.remote-ip=160.236.53.164
Received: from mail-m16023653164.xmail.ntesmail.com (mail-m16023653164.xmail.ntesmail.com [160.236.53.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31160A2609;
	Wed, 25 Nov 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC31160A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=dQJ1o7BZ
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816077;
	Wed, 25 Nov 2026 19:22:16 +0800 (GMT+08:00)
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
Subject: [PATCH v7 17/20] drm/bridge: analogix_dp: Manage pm runtime and IRQ for native HPD pin detection
Date: Wed, 25 Nov 2026 19:21:38 +0800
Message-Id: <20261125112141.1434903-18-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
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
X-HM-Tid: 0aa212712d8e03a8kunm17c230507758e8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0JJVk8aTU9PQk9IHx8dTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=dQJ1o7BZhP00R560/Ul7QEFagOEmOLknsHif25y6xamls1exm1eerYEwnmKMOCIVt0fIGJu+tQri1g4+X/FTH7QilZdRD8zEfo2Rxp3fsHNPrR9PKDO6z0mfUJL48DogADLciY1USwUjRxKFdlJMNXAWk5+7EdyD4jmRAKLbDKg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=yJpWCGGrUZ0AbmDD4n3+FWT0/Ek4ax64gyEdD+uV6j8=;
	h=date:mime-version:subject:message-id:from;

This commit holds the runtime PM reference across the bind/unbind
lifecycle on the RK3576 and RK3588 platforms, which rely on the native
controller interrupt for hotplug detection. The hotplug IRQ is enabled
only for the platforms which support hotplug detection, i.e., the GPIO
HPD mode or the native HPD mode on RK3576 and RK3588, so that the IRQ
thread is not run on the platforms without hotplug support.

The force-connected and force-HPD modes are excluded from the hotplug
detection support, since the HPD events shall not be reported for the
fixed panels.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Split IRQ enable/disable logic, handle native HPD pin and
  GPIO/force-HPD modes separately to avoid unbalanced enable_irq()
  calls. (Sashiko)

Changes in v3:
- Modify the commit msg according to the previous commit for moving IRQ
  enabling/disabling.

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Limit the runtime PM holding to the RK3576/RK3588 platforms, which
  are the only ones confirmed to support the DP mode hotplug
  detection, and exclude the boards with a fixed panel, so that the
  runtime suspend still works when the screen is blanked. (Sashiko)
- Add a new commit declaring DRM_BRIDGE_OP_HPD on the Analogix DP
  bridge and reporting the hotplug events via drm_bridge_hpd_notify().
  (Sashiko)

Changes in v6:
- Enable the hotplug IRQ only for the platforms which support hotplug
  detection (the GPIO HPD mode, or the native HPD mode on RK3576 and
  RK3588). (Sashiko)
- Exclude the force-connected and force-HPD modes from the hotplug
  detection support check. (Sashiko)
- Simplify the commit msg.
- Add Tested-by tag.

Changes in v7:
- Derive analogix_dp_require_pm_for_hpd_irq() from
  analogix_dp_supports_hpd().
- Track the hotplug IRQ enable state for an idempotent enable/disable,
  and gate the IRQ around the runtime PM transitions only for the
  platforms which hold the runtime PM reference. (Sashiko)
- Drop the Tested-by tags, as the design of this patch changed
  significantly in this version.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 57 ++++++++++++++++++-
 .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 46433ea73d67..cda6e4c5cbc8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -42,6 +42,33 @@
 
 static const bool verify_fast_training;
 
+/*
+ * The hotplug events are reported either through the optional GPIO HPD
+ * pin or through the native controller interrupt, which is confirmed
+ * to work only on the RK3576 and RK3588 platforms.
+ */
+static bool analogix_dp_supports_hpd(struct analogix_dp_device *dp)
+{
+	if (dp->force_connected_mode || dp->force_hpd)
+		return false;
+
+	if (dp->hpd_gpiod)
+		return true;
+
+	return dp->plat_data->dev_type == RK3576_EDP || dp->plat_data->dev_type == RK3588_EDP;
+}
+
+/*
+ * The native HPD interrupt relies on the controller staying powered
+ * and clocked to report the hotplug events, so a runtime PM reference
+ * is held for it.  The GPIO HPD mode needs no such reference, as it
+ * reads the GPIO level directly.
+ */
+static bool analogix_dp_require_pm_for_hpd_irq(struct analogix_dp_device *dp)
+{
+	return analogix_dp_supports_hpd(dp) && !dp->hpd_gpiod;
+}
+
 static void analogix_dp_init_dp(struct analogix_dp_device *dp)
 {
 	analogix_dp_reset(dp);
@@ -1547,6 +1574,11 @@ EXPORT_SYMBOL_GPL(analogix_dp_probe);
 
 int analogix_dp_suspend(struct analogix_dp_device *dp)
 {
+	if (analogix_dp_require_pm_for_hpd_irq(dp) && dp->hpd_irq_enabled) {
+		disable_irq(dp->irq);
+		dp->hpd_irq_enabled = false;
+	}
+
 	phy_power_off(dp->phy);
 
 	if (dp->plat_data->power_off)
@@ -1576,6 +1608,11 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 
 	analogix_dp_init_dp(dp);
 
+	if (analogix_dp_require_pm_for_hpd_irq(dp) && !dp->hpd_irq_enabled) {
+		enable_irq(dp->irq);
+		dp->hpd_irq_enabled = true;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
@@ -1609,7 +1646,16 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_unregister_aux;
 	}
 
-	enable_irq(dp->irq);
+	if (analogix_dp_require_pm_for_hpd_irq(dp)) {
+		ret = pm_runtime_resume_and_get(dp->dev);
+		if (ret)
+			goto err_unregister_aux;
+	}
+
+	if (analogix_dp_supports_hpd(dp) && !dp->hpd_irq_enabled) {
+		enable_irq(dp->irq);
+		dp->hpd_irq_enabled = true;
+	}
 
 	return 0;
 
@@ -1622,7 +1668,14 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
-	disable_irq(dp->irq);
+	if (dp->hpd_irq_enabled) {
+		disable_irq(dp->irq);
+		dp->hpd_irq_enabled = false;
+	}
+
+	if (analogix_dp_require_pm_for_hpd_irq(dp))
+		pm_runtime_put_sync(dp->dev);
+
 	drm_dp_aux_unregister(&dp->aux);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_unbind);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 2ac92b2bac0a..17ebb96d66ca 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -171,6 +171,7 @@ struct analogix_dp_device {
 	bool			fast_train_enable;
 	bool			psr_supported;
 	bool			force_connected_mode;
+	bool			hpd_irq_enabled;
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 
-- 
2.34.1

