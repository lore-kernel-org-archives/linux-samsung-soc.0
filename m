Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2063224AE6
	for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 19:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722239; cv=none; b=rG422fwJVc9iyFm0fA4uwTn/bEu0pAO23RedTPvCzxZShgyM/vBGvMZ9UKOK6uq4K6ml9gpTtLjj4CtSwLRl0GC2mutXGrnBinawWBP+1vHz3kNQ2eTdgmX5QZkxfqzYgVkmvOPkH081wNBk15Qv/lTWGXphRpr+kxpFHxXNWsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722239; c=relaxed/simple;
	bh=KtVCj/xUBLV4wZJzUKolmw1QEEcWzPfuViJ5cG4UZ3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tbxCOh88qokh0hSkIVRSX9JInCvW77X0TLps4rvlb+q/3vA83hnKa01s4uhA7PrQ03iy6K78Q7RyKli2i2zWii7JhRRqh1GqeKIykFQ9iLxpFPPwUiNCgs0d+Aznb9YjmkwxK1XQUG415WjMPxPLgl3Nnq/dvQ2SByUznztQicw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F0aDnzOk; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F0aDnzOk"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3022c6155edso24569421fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722235; x=1735327035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtyXrfJ5pqhPLkmkME79eUqW3K3NXKRcXic2kx7bGYo=;
        b=F0aDnzOkuysO52MQipeTEe4ndhNrRJ+jlS6eyRjPRSCPrzYjauN2jYjRyvm9qKXQM6
         5hdLYUrxf70Wg4aCKJqP3ENA93atGO0ZPFyUhSAxRFRci4z1PpwXxb468D8pof8KX8KM
         KLo/ZjKAdK6xA6V0NsqtStfMMzwb2T/KXiFwHHTj0LgIhxAL1ICd0r87IYlQMqbVPcP+
         7Or4IbZvM/R7Dh9obPDAl60vgtYbx7xMSphvnUgNJZ91df0letiuD6AjCT6T2XRENSNk
         HS/B3B16JUff9wiExERMavXa7nz8pixTgr6rqqpGG1QNtNLg0yc60sWF5UmxV9Bcphdf
         8bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722235; x=1735327035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtyXrfJ5pqhPLkmkME79eUqW3K3NXKRcXic2kx7bGYo=;
        b=edaqa/LM9dA75LUDDQ0l3qPwyiYrm/m4TL5FHaQu53It8nS4dD8BwSKiJd/NwjNxhx
         XlDn18JvkqamCgT64EqkqOwy0Ge38tgAP5BbP3q/gWeNDco9hyePxd25HCHq0LdeWn/T
         TN6x3Mk/L3W4gusLj1npAbTxqB70aZuTtOiI1ZfndypsaSvAX0MYNRazsZd3IlD4VdaA
         c+p8rIwUA7Ne86kFnDjVeylsY4h9qoDBqQW5V/QBFvd6WrBDHTQQbyaao6RjPVLeoz8Z
         vdVc8+eRYBWbQfVvNiR9vP2amYBS0JFAWWHIuHJEv7QHzcUZF+042KfaFr1j+H322oHo
         g75A==
X-Forwarded-Encrypted: i=1; AJvYcCVliNPg5CxwgYtULcQukXVKMMg91FqAWz8iucVfE/12JBeOraaBzkbzZOz+2/2SWINMGALQIJnakmK3ti5RHodESw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUOnQelJ5cu87VuETZXWFWUk/dWjBUpuqQYu9NYQOLTJzBblR
	IW0HxGnSf4J4pIn/g4JFAGNCXVRO1ZyS6IHYwZSJWUVOZiQdSjYSPeq2GX0YK4E=
X-Gm-Gg: ASbGncuBzREktsENJ2IPJn96qTNoeaiqAwftwYlboPhMkcmUDRrBGAvV0Vx5LsaHcJ2
	Fo86Or5klgR1PsbO1JMzN92bSchLoE9cOsnexypocxX8J0FKYaRMPhQrYXfXlvWZlzcyRqDCzmr
	Fi+6ONZZ4QMoc0agLoEIBBBBDBp4YvEZAVKroCv7KzSPKc3RO0zz6Vot7IG1fYefPxrsUjiw9Rs
	O3/xvM0LGtaktiW7dpBrjs60hwddC0J11iBhtgnDR+kXcD5v0fML+lutMpxjFKt
X-Google-Smtp-Source: AGHT+IEp4MqBmWj4vKlCgFzi6Or73N5k4zEg89WrY0wueSSKNZLB1vXNdV/MuVceY/Z8MCSC09q4Ug==
X-Received: by 2002:a05:6512:438c:b0:542:2990:84ab with SMTP id 2adb3069b0e04-54229908932mr1365170e87.20.1734722235025;
        Fri, 20 Dec 2024 11:17:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813877sm545141e87.149.2024.12.20.11.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:17:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 21:17:01 +0200
Subject: [PATCH v8 04/10] drm/bridge: connector: add support for HDMI codec
 framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-drm-bridge-hdmi-connector-v8-4-2399dbae2990@linaro.org>
References: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
In-Reply-To: <20241220-drm-bridge-hdmi-connector-v8-0-2399dbae2990@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14276;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KtVCj/xUBLV4wZJzUKolmw1QEEcWzPfuViJ5cG4UZ3s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZcKu98OOevwn0M++CUbJ90TaRO9MZxkYUxfCx
 yjKLf03TRKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2XCrgAKCRCLPIo+Aiko
 1WDSB/9BGErgKzD0fWlv4O1bVexuHICGUzpzDN/TWrl1HdUIoP+qvwIm3PCWrgEmeyMYcv1KuSw
 1GG8zNQShuBHW0ZMHjHCy4CW0JLFOnI4EagKLPpXQWn3BhuFrmeucCrrhrHs0jjOLsm8nbm1ec8
 w09PHzlCU8ZpbZ8SWdFquDz8WvuLNd3Lf12jqVy+ddCfctoyV4weCmlSs429o91kkoLFZJ+Uw8/
 o8+b3xi/MLGf1e6MRKbqBw3497WfEWP9+NwTWzvw6ai7HI+KYVIQNyvPr+oIxGB7vGgIgukKYIo
 B+aHvRxq4Jbv3/T6Q9kcUF3z9QZBxyxvEJVgP0f6SA3c3CNb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add necessary glue code to be able to use new HDMI codec framework from
the DRM bridge drivers. The drm_bridge implements a limited set of the
hdmi_codec_ops interface, with the functions accepting both
drm_connector and drm_bridge instead of just a generic void pointer.

This framework is integrated with the DRM HDMI Connector framework, but
can also be used for DisplayPort connectors.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 98 ++++++++++++++++++++++++--
 drivers/gpu/drm/drm_connector.c                |  6 +-
 drivers/gpu/drm/drm_connector_hdmi_audio.c     | 42 +++++------
 include/drm/drm_bridge.h                       | 74 +++++++++++++++++++
 include/drm/drm_connector.h                    |  2 +-
 5 files changed, 193 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 512ced87ea18c74e182a558a686ddd83de891814..cc955ee008d843d73fedb891e97143a4168fd311 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -374,6 +374,75 @@ static const struct drm_connector_hdmi_funcs drm_bridge_connector_hdmi_funcs = {
 	.write_infoframe = drm_bridge_connector_write_infoframe,
 };
 
+static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (!bridge->funcs->hdmi_audio_startup)
+		return 0;
+
+	return bridge->funcs->hdmi_audio_startup(connector, bridge);
+}
+
+static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
+					      struct hdmi_codec_daifmt *fmt,
+					      struct hdmi_codec_params *hparms)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+}
+
+static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return;
+
+	bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+}
+
+static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connector,
+					    bool enable, int direction)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *bridge;
+
+	bridge = bridge_connector->bridge_hdmi;
+	if (!bridge)
+		return -EINVAL;
+
+	if (bridge->funcs->hdmi_audio_mute_stream)
+		return bridge->funcs->hdmi_audio_mute_stream(connector, bridge,
+							     enable, direction);
+	else
+		return -ENOTSUPP;
+}
+
+static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_audio_funcs = {
+	.startup = drm_bridge_connector_audio_startup,
+	.prepare = drm_bridge_connector_audio_prepare,
+	.shutdown = drm_bridge_connector_audio_shutdown,
+	.mute_stream = drm_bridge_connector_audio_mute_stream,
+};
+
 /* -----------------------------------------------------------------------------
  * Bridge Connector Initialisation
  */
@@ -473,7 +542,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (connector_type == DRM_MODE_CONNECTOR_Unknown)
 		return ERR_PTR(-EINVAL);
 
-	if (bridge_connector->bridge_hdmi)
+	if (bridge_connector->bridge_hdmi) {
+		bridge = bridge_connector->bridge_hdmi;
+
 		ret = drmm_connector_hdmi_init(drm, connector,
 					       bridge_connector->bridge_hdmi->vendor,
 					       bridge_connector->bridge_hdmi->product,
@@ -482,12 +553,31 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       connector_type, ddc,
 					       supported_formats,
 					       max_bpc);
-	else
+		if (ret)
+			return ERR_PTR(ret);
+
+		if (bridge->hdmi_audio_max_i2s_playback_channels ||
+		    bridge->hdmi_audio_spdif_playback) {
+			if (!bridge->funcs->hdmi_audio_prepare ||
+			    !bridge->funcs->hdmi_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			ret = drm_connector_hdmi_audio_init(connector,
+							    bridge->hdmi_audio_dev,
+							    &drm_bridge_connector_hdmi_audio_funcs,
+							    bridge->hdmi_audio_max_i2s_playback_channels,
+							    bridge->hdmi_audio_spdif_playback,
+							    bridge->hdmi_audio_dai_port);
+			if (ret)
+				return ERR_PTR(ret);
+		}
+	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
 					  connector_type, ddc);
-	if (ret)
-		return ERR_PTR(ret);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 0669e0d9521c9d80efef1296180f23d6b38835b7..1383fa9fff9bcf31488453e209a36c6fe97be2f1 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -282,7 +282,7 @@ static int drm_connector_init_only(struct drm_device *dev,
 	mutex_init(&connector->eld_mutex);
 	mutex_init(&connector->edid_override_mutex);
 	mutex_init(&connector->hdmi.infoframes.lock);
-	mutex_init(&connector->hdmi_codec.lock);
+	mutex_init(&connector->hdmi_audio.lock);
 	connector->edid_blob_ptr = NULL;
 	connector->epoch_counter = 0;
 	connector->tile_blob_ptr = NULL;
@@ -716,7 +716,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		    DRM_CONNECTOR_REGISTERED))
 		drm_connector_unregister(connector);
 
-	platform_device_unregister(connector->hdmi_codec.codec_pdev);
+	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
@@ -754,7 +754,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
 		connector->funcs->atomic_destroy_state(connector,
 						       connector->state);
 
-	mutex_destroy(&connector->hdmi_codec.lock);
+	mutex_destroy(&connector->hdmi_audio.lock);
 	mutex_destroy(&connector->hdmi.infoframes.lock);
 	mutex_destroy(&connector->mutex);
 
diff --git a/drivers/gpu/drm/drm_connector_hdmi_audio.c b/drivers/gpu/drm/drm_connector_hdmi_audio.c
index bd7aab2fdfd3530d1f812ea058f5f6fd9d1c3b27..cda9403e49ec35e9d9c118705934908b3ca925b0 100644
--- a/drivers/gpu/drm/drm_connector_hdmi_audio.c
+++ b/drivers/gpu/drm/drm_connector_hdmi_audio.c
@@ -16,7 +16,7 @@ static int drm_connector_hdmi_audio_startup(struct device *dev, void *data)
 {
 	struct drm_connector *connector = data;
 	const struct drm_connector_hdmi_audio_funcs *funcs =
-		connector->hdmi_codec.funcs;
+		connector->hdmi_audio.funcs;
 
 	if (funcs->startup)
 		return funcs->startup(connector);
@@ -30,7 +30,7 @@ static int drm_connector_hdmi_audio_prepare(struct device *dev, void *data,
 {
 	struct drm_connector *connector = data;
 	const struct drm_connector_hdmi_audio_funcs *funcs =
-		connector->hdmi_codec.funcs;
+		connector->hdmi_audio.funcs;
 
 	return funcs->prepare(connector, fmt, hparms);
 }
@@ -39,7 +39,7 @@ static void drm_connector_hdmi_audio_shutdown(struct device *dev, void *data)
 {
 	struct drm_connector *connector = data;
 	const struct drm_connector_hdmi_audio_funcs *funcs =
-		connector->hdmi_codec.funcs;
+		connector->hdmi_audio.funcs;
 
 	return funcs->shutdown(connector);
 }
@@ -49,7 +49,7 @@ static int drm_connector_hdmi_audio_mute_stream(struct device *dev, void *data,
 {
 	struct drm_connector *connector = data;
 	const struct drm_connector_hdmi_audio_funcs *funcs =
-		connector->hdmi_codec.funcs;
+		connector->hdmi_audio.funcs;
 
 	if (funcs->mute_stream)
 		return funcs->mute_stream(connector, enable, direction);
@@ -65,14 +65,14 @@ static int drm_connector_hdmi_audio_get_dai_id(struct snd_soc_component *comment
 	struct of_endpoint of_ep;
 	int ret;
 
-	if (connector->hdmi_codec.dai_port < 0)
+	if (connector->hdmi_audio.dai_port < 0)
 		return -ENOTSUPP;
 
 	ret = of_graph_parse_endpoint(endpoint, &of_ep);
 	if (ret < 0)
 		return ret;
 
-	if (of_ep.port == connector->hdmi_codec.dai_port)
+	if (of_ep.port == connector->hdmi_audio.dai_port)
 		return 0;
 
 	return -EINVAL;
@@ -97,14 +97,14 @@ static int drm_connector_hdmi_audio_hook_plugged_cb(struct device *dev,
 {
 	struct drm_connector *connector = data;
 
-	mutex_lock(&connector->hdmi_codec.lock);
+	mutex_lock(&connector->hdmi_audio.lock);
 
-	connector->hdmi_codec.plugged_cb = fn;
-	connector->hdmi_codec.plugged_cb_dev = codec_dev;
+	connector->hdmi_audio.plugged_cb = fn;
+	connector->hdmi_audio.plugged_cb_dev = codec_dev;
 
-	fn(codec_dev, connector->hdmi_codec.last_state);
+	fn(codec_dev, connector->hdmi_audio.last_state);
 
-	mutex_unlock(&connector->hdmi_codec.lock);
+	mutex_unlock(&connector->hdmi_audio.lock);
 
 	return 0;
 }
@@ -112,16 +112,16 @@ static int drm_connector_hdmi_audio_hook_plugged_cb(struct device *dev,
 void drm_connector_hdmi_audio_plugged_notify(struct drm_connector *connector,
 					     bool plugged)
 {
-	mutex_lock(&connector->hdmi_codec.lock);
+	mutex_lock(&connector->hdmi_audio.lock);
 
-	connector->hdmi_codec.last_state = plugged;
+	connector->hdmi_audio.last_state = plugged;
 
-	if (connector->hdmi_codec.plugged_cb &&
-	    connector->hdmi_codec.plugged_cb_dev)
-		connector->hdmi_codec.plugged_cb(connector->hdmi_codec.plugged_cb_dev,
-						 connector->hdmi_codec.last_state);
+	if (connector->hdmi_audio.plugged_cb &&
+	    connector->hdmi_audio.plugged_cb_dev)
+		connector->hdmi_audio.plugged_cb(connector->hdmi_audio.plugged_cb_dev,
+						 connector->hdmi_audio.last_state);
 
-	mutex_unlock(&connector->hdmi_codec.lock);
+	mutex_unlock(&connector->hdmi_audio.lock);
 }
 EXPORT_SYMBOL(drm_connector_hdmi_audio_plugged_notify);
 
@@ -172,8 +172,8 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	    !funcs->shutdown)
 		return -EINVAL;
 
-	connector->hdmi_codec.funcs = funcs;
-	connector->hdmi_codec.dai_port = dai_port;
+	connector->hdmi_audio.funcs = funcs;
+	connector->hdmi_audio.dai_port = dai_port;
 
 	pdev = platform_device_register_data(hdmi_codec_dev,
 					     HDMI_CODEC_DRV_NAME,
@@ -182,7 +182,7 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	if (IS_ERR(pdev))
 		return PTR_ERR(pdev);
 
-	connector->hdmi_codec.codec_pdev = pdev;
+	connector->hdmi_audio.codec_pdev = pdev;
 
 	return 0;
 }
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..4b84faf14e368310dd20aa964e8178ec80aa6fa7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -41,6 +41,8 @@ struct drm_display_info;
 struct drm_minor;
 struct drm_panel;
 struct edid;
+struct hdmi_codec_daifmt;
+struct hdmi_codec_params;
 struct i2c_adapter;
 
 /**
@@ -676,6 +678,57 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	/**
+	 * @hdmi_audio_startup:
+	 *
+	 * Called when ASoC starts an audio stream setup. The
+	 * @hdmi_audio_startup() is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_startup)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	/**
+	 * @prepare:
+	 * Configures HDMI-encoder for audio stream. Can be called multiple
+	 * times for each setup. Mandatory if HDMI audio is enabled in the
+	 * bridge's configuration.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	/**
+	 * @hdmi_audio_shutdown:
+	 *
+	 * Shut down the audio stream. Mandatory if HDMI audio is enabled in
+	 * the bridge's configuration.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*hdmi_audio_shutdown)(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
+
+	/**
+	 * @hdmi_audio_mute_stream:
+	 *
+	 * Mute/unmute HDMI audio stream. The @hdmi_audio_mute_stream callback
+	 * is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*hdmi_audio_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -859,6 +912,27 @@ struct drm_bridge {
 	 * @DRM_BRIDGE_OP_HDMI is set.
 	 */
 	unsigned int max_bpc;
+
+	/**
+	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 */
+	struct device *hdmi_audio_dev;
+
+	/**
+	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
+	 * I2S channels for the HDMI codec
+	 */
+	int hdmi_audio_max_i2s_playback_channels;
+
+	/**
+	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
+	 */
+	unsigned int hdmi_audio_spdif_playback : 1;
+
+	/**
+	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
+	 */
+	int hdmi_audio_dai_port;
 };
 
 static inline struct drm_bridge *
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index bdd8637196a608319e81fb3aee286ce0fd22cd9c..ecd3dce94ffcfefacdb554efdc00ea19d6c18f24 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2236,7 +2236,7 @@ struct drm_connector {
 	/**
 	 * @hdmi_codec: HDMI codec properties and non-DRM state.
 	 */
-	struct drm_connector_hdmi_audio hdmi_codec;
+	struct drm_connector_hdmi_audio hdmi_audio;
 };
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)

-- 
2.39.5

