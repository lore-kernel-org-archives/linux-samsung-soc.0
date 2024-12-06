Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA68320ADED
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480220; cv=none; b=FenRJPigzTr1uqL07bJ9wQLo/rivuqKvH4Ul7INtVQ6T9msnQHR3JoTE6k2aUjLV4n1KgCjhGg29GjkXdFEoPddF6Fq0gjlx23NBzr/KF2pNYjBNdaV0TvVxrUbH8QFXZitoVpr6pb0cA9+zARjIA6JJWCV25quYmbT2Um4HkI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480220; c=relaxed/simple;
	bh=+67Db5QR/nsja/ue4a+VGF3IOxdNSnDuXouI0gIrYtg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UsCu5OmueIZF/PhsRtHvLV2JDP+ttn3S3wG+hTM09Qcb08SFNDzgzWx4EuzzRpk3zdYJD95APqX3tf+5ZIHHPVWtS0iY+PqaTuTi+XICQ2lvHUOk5VVMftYeYM34ryPWPM8hUXg9gVNZ+pI4jk4tC7cxQiDDeF71JhLx5auOGgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELgbiB8F; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELgbiB8F"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e384e3481so93783e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480216; x=1734085016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=;
        b=ELgbiB8FJ9VbMvcfjhCr3zAKyLT/CLMsdPipb7cn7OGNkgh+6iLTZ+/WNiiwuvw2XL
         BDjzOwohqMoBX3eArctWa0Lc8DTn9/vxzh1Ti+RnGxkCAYxVLgqaB4fIMqOkafnlnQc4
         jS936WPx5SWwHWKolTRxD7dJrA+PtIw0pAvySysAm4dlcMvs9FxVy3e46irHdY1hhiLb
         f/44FoW0zwQsZ5xUMTIdP/Ny/x3j4L8LhcI25iKNbeepFy/rADyyz/e1DU2Kvq081nNf
         aJwV0NUP5S+vbOvJsChw2ndWv6xTDwCHm8BiGoooU/9m+29We0SxQMhlsP6fbHyD4eRK
         eFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480216; x=1734085016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdhbM8g3M0NP93FMRv6ZaSecbbnwku8p9d6VdNVGSLw=;
        b=XlB83PUb4L/MKBMOfE0JZxgrP+f1yJxMLroREnWfreGDa7mQIAaqndIQYeQf6jnGjS
         Dz86JYJkLrx59fjvrVSefD4kTnp41E08DEa7y/wXrHdUeSoxCXMNPzrPtMuspb2v7KLQ
         iCe5d2kRZm7cwsAgBDN8/MpAA5eQ8kF7kgoZziT7g6mIqJ/u9UapwuxFAO8of+g19akB
         PG9QMxm+zNVuN9q+BLHCBJclNCq78rEzpEo0nXhXngs+6inASqf1wyOamvKNCT8n5JWw
         ZLkavoFTq5r7ZUCd/OZJ2mkJWqy+wcDqu1k2JKJaV2pz6/9vpBU+nx6ynCES+/c6uwHN
         tSYQ==
X-Forwarded-Encrypted: i=1; AJvYcCViDnKrxoo6swgGyXnHRJgbkOMhp0KbTbp697zrSEX/MHTQuvqTNaJrcRax9pZ5OS+Sjp016xqDxPhyhNb7y8cBXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqec5ov19yzD/uDdOgI6rT50qvglXnKKoCE8KxiIay10K0qbFN
	CT7Nr30/r0RJ0BpyVO3Euv9ep41bEfz2PXh5VV+n10l7Iix2gUUvj1slajasiNR0iu/3KmxAGU8
	x
X-Gm-Gg: ASbGncuwdzBn4ONGt+XwMAi8GAISNT5hdjTmfssXv9zPXvAUO7ennpfrP7ympKapxF7
	6IIvTU2loXWXT1B08FnP05ecX5rKUSa0wHlXJwySVZPC2e2upXhIcjhQTckd7ovuE4X8XQCryqz
	RjIxoSpH82EGj9eW2zTI5rMhoBWs5oSyOqIMt2N83RFHMyJ3PnXj6oV1zUp2lgkIJAIAXXbN2wH
	KewOjMLS+VEz8IXSZDobY5k7UMThx+CIf6g8Kk3UdTOOGjaIANgiQSV3A==
X-Google-Smtp-Source: AGHT+IHLAMrwNntawycHSzAoyVtOkC7Gtw6N52xdlcAMQPWcfc0l+WCOL0Lh45bakS9i5aF/g9qeYQ==
X-Received: by 2002:a05:6512:1594:b0:53e:284a:70e9 with SMTP id 2adb3069b0e04-53e2c2f0085mr1211346e87.57.1733480215645;
        Fri, 06 Dec 2024 02:16:55 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:16:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:15:59 +0200
Subject: [PATCH v6 05/10] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-5-50dc145a9c06@linaro.org>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7839;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+67Db5QR/nsja/ue4a+VGF3IOxdNSnDuXouI0gIrYtg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQeU6JW1urPoTcvv+n0cF5DfM82cKPquzdU2UEp+a8d
 Xf1P5rdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJvOZg/6d1qv6zrv4+PZEE
 XnYWXQmH3C3vpBjnH3v4oaFKQqV17vf7M6fdfj33n6dt8K/mlGMhuj166gWtkdkBXt3foyT3pE0
 +XbWplHXd7EApkYa+IimTfR1KB9/UiE83Sr7Lpf+hNnhidYbSWVnf/k3zki80N78496XvfxGXxQ
 nvg6aVUxbMlWOoXc682meZS7L3D0HeAl/d7bdktOf5XHerm/9IjXHmzGO3dp5/p3SiNUJRXaP29
 iSFl4fui7s4J4vJLv8md+OMxNJZ79qS2n6e/et2cFaHW2aOBFMkr5cpj7BH5fTjAs89rD55bb4z
 aaq+S7G76c3nMowSK8SWMz1b8tUxpdjxWoH3GvUC1ccMAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
framework. This enables programming of Audio InfoFrames using the HDMI
Connector interface and also enables support for the missing features,
including the ELD retrieval and better hotplug support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 170 +++++++++++++-------------------
 1 file changed, 68 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 60b7305c0fd1935e35742713c78937392b7faa79..63aa751c412fb90d6edb4b5331138e94f19de37d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -45,7 +45,6 @@ struct lt9611 {
 	struct device_node *dsi1_node;
 	struct mipi_dsi_device *dsi0;
 	struct mipi_dsi_device *dsi1;
-	struct platform_device *audio_pdev;
 
 	bool ac_mode;
 
@@ -864,6 +863,10 @@ static int lt9611_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	unsigned int mask;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		break;
@@ -897,6 +900,11 @@ static int lt9611_hdmi_write_infoframe(struct drm_bridge *bridge,
 	int i;
 
 	switch (type) {
+	case HDMI_INFOFRAME_TYPE_AUDIO:
+		mask = LT9611_INFOFRAME_AUDIO;
+		addr = 0x84b2;
+		break;
+
 	case HDMI_INFOFRAME_TYPE_AVI:
 		mask = LT9611_INFOFRAME_AVI;
 		addr = 0x8440;
@@ -940,6 +948,55 @@ lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int lt9611_hdmi_codec_audio_startup(struct drm_connector *connector,
+					   struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
+	regmap_write(lt9611->regmap, 0x82d7, 0x04);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x08);
+	regmap_write(lt9611->regmap, 0x8407, 0x10);
+
+	regmap_write(lt9611->regmap, 0x8434, 0xd5);
+
+	return 0;
+}
+
+static int lt9611_hdmi_codec_prepare(struct drm_connector *connector,
+				     struct drm_bridge *bridge,
+				     struct hdmi_codec_daifmt *fmt,
+				     struct hdmi_codec_params *hparms)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	if (hparms->sample_rate == 48000)
+		regmap_write(lt9611->regmap, 0x840f, 0x2b);
+	else if (hparms->sample_rate == 96000)
+		regmap_write(lt9611->regmap, 0x840f, 0xab);
+	else
+		return -EINVAL;
+
+	regmap_write(lt9611->regmap, 0x8435, 0x00);
+	regmap_write(lt9611->regmap, 0x8436, 0x18);
+	regmap_write(lt9611->regmap, 0x8437, 0x00);
+
+	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								       &hparms->cea);
+}
+
+static void lt9611_hdmi_codec_audio_shutdown(struct drm_connector *connector,
+					     struct drm_bridge *bridge)
+{
+	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+
+	drm_atomic_helper_connector_hdmi_clear_audio_infoframe(connector);
+
+	regmap_write(lt9611->regmap, 0x8406, 0x00);
+	regmap_write(lt9611->regmap, 0x8407, 0x00);
+}
+
 static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.mode_valid = lt9611_bridge_mode_valid,
@@ -960,6 +1017,10 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_infoframe = lt9611_hdmi_write_infoframe,
 	.hdmi_clear_infoframe = lt9611_hdmi_clear_infoframe,
+
+	.hdmi_codec_audio_startup = lt9611_hdmi_codec_audio_startup,
+	.hdmi_codec_prepare = lt9611_hdmi_codec_prepare,
+	.hdmi_codec_audio_shutdown = lt9611_hdmi_codec_audio_shutdown,
 };
 
 static int lt9611_parse_dt(struct device *dev,
@@ -1013,102 +1074,6 @@ static int lt9611_read_device_rev(struct lt9611 *lt9611)
 	return ret;
 }
 
-static int lt9611_hdmi_hw_params(struct device *dev, void *data,
-				 struct hdmi_codec_daifmt *fmt,
-				 struct hdmi_codec_params *hparms)
-{
-	struct lt9611 *lt9611 = data;
-
-	if (hparms->sample_rate == 48000)
-		regmap_write(lt9611->regmap, 0x840f, 0x2b);
-	else if (hparms->sample_rate == 96000)
-		regmap_write(lt9611->regmap, 0x840f, 0xab);
-	else
-		return -EINVAL;
-
-	regmap_write(lt9611->regmap, 0x8435, 0x00);
-	regmap_write(lt9611->regmap, 0x8436, 0x18);
-	regmap_write(lt9611->regmap, 0x8437, 0x00);
-
-	return 0;
-}
-
-static int lt9611_audio_startup(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x82d6, 0x8c);
-	regmap_write(lt9611->regmap, 0x82d7, 0x04);
-
-	regmap_write(lt9611->regmap, 0x8406, 0x08);
-	regmap_write(lt9611->regmap, 0x8407, 0x10);
-
-	regmap_write(lt9611->regmap, 0x8434, 0xd5);
-
-	return 0;
-}
-
-static void lt9611_audio_shutdown(struct device *dev, void *data)
-{
-	struct lt9611 *lt9611 = data;
-
-	regmap_write(lt9611->regmap, 0x8406, 0x00);
-	regmap_write(lt9611->regmap, 0x8407, 0x00);
-}
-
-static int lt9611_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
-				      struct device_node *endpoint,
-				      void *data)
-{
-	struct of_endpoint of_ep;
-	int ret;
-
-	ret = of_graph_parse_endpoint(endpoint, &of_ep);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * HDMI sound should be located as reg = <2>
-	 * Then, it is sound port 0
-	 */
-	if (of_ep.port == 2)
-		return 0;
-
-	return -EINVAL;
-}
-
-static const struct hdmi_codec_ops lt9611_codec_ops = {
-	.hw_params	= lt9611_hdmi_hw_params,
-	.audio_shutdown = lt9611_audio_shutdown,
-	.audio_startup	= lt9611_audio_startup,
-	.get_dai_id	= lt9611_hdmi_i2s_get_dai_id,
-};
-
-static struct hdmi_codec_pdata codec_data = {
-	.ops = &lt9611_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
-static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
-{
-	codec_data.data = lt9611;
-	lt9611->audio_pdev =
-		platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					      PLATFORM_DEVID_AUTO,
-					      &codec_data, sizeof(codec_data));
-
-	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
-}
-
-static void lt9611_audio_exit(struct lt9611 *lt9611)
-{
-	if (lt9611->audio_pdev) {
-		platform_device_unregister(lt9611->audio_pdev);
-		lt9611->audio_pdev = NULL;
-	}
-}
-
 static int lt9611_probe(struct i2c_client *client)
 {
 	struct lt9611 *lt9611;
@@ -1172,6 +1137,9 @@ static int lt9611_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, lt9611);
 
+	/* Disable Audio InfoFrame, enabled by default */
+	regmap_update_bits(lt9611->regmap, 0x843d, LT9611_INFOFRAME_AUDIO, 0);
+
 	lt9611->bridge.funcs = &lt9611_bridge_funcs;
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
@@ -1180,6 +1148,9 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
+	lt9611->bridge.hdmi_codec_dev = dev;
+	lt9611->bridge.hdmi_codec_max_i2s_playback_channels = 8;
+	lt9611->bridge.hdmi_codec_dai_port = 2;
 
 	drm_bridge_add(&lt9611->bridge);
 
@@ -1201,10 +1172,6 @@ static int lt9611_probe(struct i2c_client *client)
 
 	lt9611_enable_hpd_interrupts(lt9611);
 
-	ret = lt9611_audio_init(dev, lt9611);
-	if (ret)
-		goto err_remove_bridge;
-
 	return 0;
 
 err_remove_bridge:
@@ -1225,7 +1192,6 @@ static void lt9611_remove(struct i2c_client *client)
 	struct lt9611 *lt9611 = i2c_get_clientdata(client);
 
 	disable_irq(client->irq);
-	lt9611_audio_exit(lt9611);
 	drm_bridge_remove(&lt9611->bridge);
 
 	regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);

-- 
2.39.5

