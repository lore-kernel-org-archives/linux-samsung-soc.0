Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB15A14A604
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004896; cv=none; b=d2tRoy8AK1UMukL/Q60nYvv3yD0wrGGkkS34eJhlFErnBsqwDYogL/jUo+3Ll+wu1+89bn8ahoNub92QrxDrDVOBgxNT+wVQw86m9L95+90wAtW80F8YCa2+2twNE6TE0Q6J4v5ocnbmZOdnSy9Tf++0ben3SkmHoBhlNqYbjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004896; c=relaxed/simple;
	bh=Tn9moe68HFeRWD7EdE6eUAywX+jvch/OLQEqavawxVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVRbkgwgG7V+6a9+Omf+80V3SQBPQCwwrPPK3qg3cYeSErp/hWhd+lAiVz3AxggqpA+58ugg7koo1jkYfW9KAxmfqtJ7J8MVQsQ4TpVkKVmvi6hnFLiy2QqiszO/Ub18ketzS1vPMWZuzSJMkCBQJKvG6ma13EPXuHEpjVnASWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jxK8gHDa; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jxK8gHDa"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a227b82so4376312e87.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004892; x=1735609692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyDrM1RcHSjAWZSRwQxavMgceh/Ar6qfKQgipfSX8T8=;
        b=jxK8gHDaFqmhtafk/E4Ce/lREPCjgR8rCc3e+iyWGjMAPOM9wrmT+dl81mfLKzjhXr
         BiXuGKQGPojacXaU4AtB0n1mi2Q5Hz/Amz5oSuzMa35UYBBeFbk+V95ED4PSrdXwAflC
         m/j5kuqOUCU0Exd5q7uinGatECt196X7LxhKO/G6RKBEPShr2O/K9hp6QFvHMw6nBfen
         5v/Szm+FLgG3XZM9St2UQyuUUeX1pEtt/QpWxHvRQfXdTG0ZPbtkr8TQpGUu/m3N8Wul
         lvuITLcoRv3k4fm4I1yV+eYKCcOj1egLO48sjTRLIuC7/8kT4GOkdhyMTjOw/VIgo4bF
         3Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004892; x=1735609692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyDrM1RcHSjAWZSRwQxavMgceh/Ar6qfKQgipfSX8T8=;
        b=bZI8k86OCASeEE5kUra8V0H6vOqM6M1aEYCHNKrYda9GeUamrYgIA8LQpjSnjO2qKJ
         qROwIznEi7i7+srFBRYUt+wwECON2sXIpnbZab1dWVf/gxRVqxgdVl1Iu+jQRX+YOoQ3
         iE1YWaOwNIJ0NiHDaU/d9KrWmnREJiFYd6++uDF64VbAl5TzR503hLctfEfAghmJHchr
         3HtudP8Dx0XXTFmQIeeoouvG8Nt8cXY6XCuz4lbQil/CuPCcNPcZ/fkzqufbY9SXS5B0
         Msf4QHqpuGAMPLDGgOqmoAJ4RMcUsNMpOKOplfzom691y/hbi3E7WtziXfP7dpd42P5H
         yPIA==
X-Forwarded-Encrypted: i=1; AJvYcCUlbDkyM1Pqu3GeljDJ1cb7FKeMnEWh+VJBPEAoWD19W6Tl3II7OyZNWTk3zrOiTnBp/caqdjVBmZTPtzQdqRlO+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzve+g/cUj1NPtGdTB2U1Eu7Ro37kl0IfVT4K9Npoyjt42hsqcZ
	HGIRItTsI4iviAyqRf5t8b4qzrHLDEajCU1JtApNA03HQB8GQLCLxgFkjkQfSQc=
X-Gm-Gg: ASbGncsMERSdK/fforK2/elepzKXfnHfHw1AVjobHkR8KeUwhEnVu1CcglBCriSSgJs
	9ubJaFTIo268wTB+8zKQrOa7oUFbVTcRsS+fErZzYcXGFtuB7afWZUZ6thlFMOvk93HG8n2GmXT
	ZyDB9uJQrmRw+UeJYbGBxhxCxj5uo75O5fU29Tl9gzYkDq/kYydveD3kR5K9hJCriZqDwvrrj7S
	SdEcM6KOnNsIs9DbonpsNcglbMz4XoBiPYnIq7jv79uJ1fFf62HlX9/TumybDrv
X-Google-Smtp-Source: AGHT+IHHS6vHbtvISgS4yCjpBzBCIllZ4JsjFOeRTEUXok4WGQMMqVKuapoSk/RMG23Hz2S0/9Ct5Q==
X-Received: by 2002:a05:6512:b86:b0:542:1b63:2e52 with SMTP id 2adb3069b0e04-542295229f2mr4550672e87.6.1735004892426;
        Mon, 23 Dec 2024 17:48:12 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:57 +0200
Subject: [PATCH v10 05/10] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-5-dc89577cd438@linaro.org>
References: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
In-Reply-To: <20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7914;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Tn9moe68HFeRWD7EdE6eUAywX+jvch/OLQEqavawxVA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLN1gnvqF+i/WzNK2WosFwBDOxDTnWfm6FkP
 2YAGc76uvCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1aZBB/42CikusEf6aNXa+62qlYaHBfCTuEUrxrRAlBm97hslb1unHL3hEb9J+O2pZgi9QlkMKIM
 FiobbRW6Cjxi2gou5OYhe3ahU5G1pyZBzpfqlWVqe3lrS23MeR6hjsuQRUQE4yWfhOGeTVE82wk
 qBWYVjomRD6yC4FHo8RGE3lLyGhre8bdOJYBf3LXJJYkP+blC7V9F8FLa2xvOvc4oJ7uPME6TNL
 GhNwMkQqtWFMvWEVW1AsER8eV3xKu8cfELH2zg44Du9Q3YDO5q94T3JO/4dyYLGFLCLx3zaxOps
 3cVvu3RiwfdMupRY+rs4OOE/RNde+jW0t/bkXohKh68vcSqG
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make the Lontium LT9611 DSI-to-HDMI bridge driver use the DRM HDMI Codec
framework. This enables programming of Audio InfoFrames using the HDMI
Connector interface and also enables support for the missing features,
including the ELD retrieval and better hotplug support.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 170 +++++++++++++-------------------
 1 file changed, 68 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 698a9a01783d28edc734b6932a7768978de65ffc..11331e1d48a87c9acb048db5130bf635ec834fe0 100644
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
 
+static int lt9611_hdmi_audio_startup(struct drm_connector *connector,
+				     struct drm_bridge *bridge)
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
+static int lt9611_hdmi_audio_prepare(struct drm_connector *connector,
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
+static void lt9611_hdmi_audio_shutdown(struct drm_connector *connector,
+				       struct drm_bridge *bridge)
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
+	.hdmi_audio_startup = lt9611_hdmi_audio_startup,
+	.hdmi_audio_prepare = lt9611_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = lt9611_hdmi_audio_shutdown,
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
+	lt9611->bridge.hdmi_audio_dev = dev;
+	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
+	lt9611->bridge.hdmi_audio_dai_port = 2;
 
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

