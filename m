Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726E18950A
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922755; cv=none; b=eKXEoVk5+AkiI//YLopv0QlVa7jx98d/mvI/tHzeApTMHPIg9xuL1z5MHHqoHLImy49OK59MbcvN9Zz/trcs7seRqycxGGqm+Pux9Tp7CcruMy7e8hGdEL49ihJe0Aj47Z440rbiQ5uaHZEGRj2vEwnPEhX5mN/0TNX1lDZANwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922755; c=relaxed/simple;
	bh=Tn9moe68HFeRWD7EdE6eUAywX+jvch/OLQEqavawxVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K8pH399X+VllQ23u05UEKxKU06ae3XXGZF60Eojos0K3udOQqitJvz0lhbYJOL/ecJLE4Y3cCSuoRV5TRLVtOM9geBc6quOkE4jKLcIhnVriZ7ezfllr1+xkltfqjWvjoAkf2pr9fcVzSDQPxByn18lzPF2wZ4WXldykfPpKI/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aRmUoYoq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aRmUoYoq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso48239971fa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 18:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922752; x=1735527552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyDrM1RcHSjAWZSRwQxavMgceh/Ar6qfKQgipfSX8T8=;
        b=aRmUoYoq3WZ/uaLYXPGb9gnK3wHVtYF6fiSJ1zy1rXNNzjJVU0mUhWrzgoTMJZ/lMx
         ITpbzn4tOjh0h4TAD1D8h8czkOU4GC2t6RSTYvaG6WpAbWFFCp0sVHkE6KheDbNEYUbu
         wYGnTxcvLqUsJiuOAiOLNBteKqC4FA1YmpGpOZZobzILtJahYzTusoRlsGKckb7qylhP
         IEYxQpurhbtNLTn+rKH/YfUBg0JcFvsw14hHLwBmWJ+jBQbWyCh1yXa6gQ6oVPXlIksy
         MEKEU7zvUUJCikMlEsvDKxqTusdQ75672UlGQOvjZg134ydIKHlA30LSSLvRlqwZ1ACi
         f6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922752; x=1735527552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyDrM1RcHSjAWZSRwQxavMgceh/Ar6qfKQgipfSX8T8=;
        b=nvYRoG8/pBf88xbDJsfihLL2kRC9mzumIxehQnrWdMyiDW4j1eRtPibrKsd7PNldyI
         qvmwl+Na19TbzzVMl4RvPPbnaKABqz8X/O1XeKYLE5MBqPr+e2aEeiLE+yq+smOtJbHm
         O7f3sNzum8eFsLhnn+wn28Hm/WfBq6FkkDneL5SzzC0HqSyoC3UTgUY2XQ9nyIXGtuj0
         K1kpAM9jxT/9mkyd/h5lIG4EHxyT4k28My3DQmYcfKn0t3Qef554P25xhh+QnFs2dHJx
         J70Kk33N2h0b/XJUZQ8rfYS8JKX+K3+jsB3Vcx7yCcr801gVlR6okPKzIiL7NXQvNFMO
         VxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQd1mDm4l4dQ8haIm3S3+pxlfXG/QpCetoELlHoU7G4UhtmjK0hUQ5S+r+VoMYcU8h+e4Zlxtq0u8hSj3sGgdkaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw089OF5BdyPGmDKktzR+h8G51Mf+PBdtGVLvBX4HiymwJEQzg
	r3eD4ljegnDE8rDeK8AueOIlGde+345Z2Dd3d7lxJYVMRPZID7hoi2FQFWDol7k=
X-Gm-Gg: ASbGncsdcmupv/Nc5QBsFjnT3sAp37pBxVAeV6AKuZm6U27XUZo8P4HG2vfM46SxWk0
	IY7Zj+eDATK7Hwu/aZXxDTBDW6piQc7DYBO8crznbKVvFwq6zRYo9J6fdfSFMrHPqQL8PnJGI0u
	5jl4E4N4p8b45EXku3OxMIoKS3ynhfraH43YcJTwRX1ZvZmNvPMwqd6sAfBI4dSgjsUKwsJYDAg
	g80bTCR4PyUKI6FDjTiGq/xrLsb5YmjDSts9bO3rQ7j09k2N2pQgYjEOnu9jFBI
X-Google-Smtp-Source: AGHT+IGrFJVUiXgLyEJOBdin3wLziuSZVuIX5haQJZzyCsTMCvTFyYpDV5GqAwIBHzn/kW5nMF8F6g==
X-Received: by 2002:a05:6512:3d10:b0:53e:350a:72a0 with SMTP id 2adb3069b0e04-54229598a27mr3672433e87.51.1734922751901;
        Sun, 22 Dec 2024 18:59:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:56 +0200
Subject: [PATCH v9 05/10] drm/bridge: lt9611: switch to using the DRM HDMI
 codec framework
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-5-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHwJq9VFU/QYL0ycQ0aedouCB9ao/RybvZ+c
 NX5b8QRE02JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8AAKCRCLPIo+Aiko
 1aPXB/4tiEKNiIFQbd52X4uqgasOxcH5rpAc5++XAyGQubrrS55wLoq77Ztk0aP1sErN4A1GkGN
 mVXafXCXbyllTDUibDHXYrZLXuBorHnFS6mslF3kLj8xblPJ+90abbBUaRsdG7CgNk59w8ySNFp
 z14LIXIScXwVK4FspLvHpYI/wLup8WExwiE6DnlmFtiiR/TsSvTC7NOJXmRoDUVeKqlTAUBefzq
 OC1PZSxH5PNSkYOX/RZNUOEmFhm/3t3czZmdt7X7fo8XGK9KQXlGF9YPhWlyBBiV7ZaweaxEC2r
 3BrjEQbOQC9AYh4crEBUWusn4f/DbHMRvD8BnJBk60Sfw/mZ
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

