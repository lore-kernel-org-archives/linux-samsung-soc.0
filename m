Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D3C190462
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922763; cv=none; b=OixeRQQTl30j9mFw8kCg6CcuQJ5B8s7v+lGU6B14vtwyV2GxQJTs+YCfE6+swnMZESsci6YSGCl2weaxZLRUhAyD6507YT6+CEGjNMw1b95E5onbUrDeW7cGOPFm3Nx31YeAzcDG6dKRsZ1lWl7WXu14N/jpWq4Wd0ZHYb+/ZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922763; c=relaxed/simple;
	bh=FQQ7Ux5POC+XmasT6HD/kMeYFfKPQf2L4EdJSjEp530=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ho1RTA7FVa3IHomkxdYxfv8wv4oD0ll+8h53ad9ZoAl8Snpx0X5d80nFkmCeetx6qZgpJH0pOvXDLPZgbJCyOIeRXxV6sptHUZE5hVOrn49DvQTTd41F0k7SjcEZpJV8AMQtaiZ3BBTX9UR0nSEM6R4Hqe+TFakPFmN/htHfngQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HvYdY3hD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HvYdY3hD"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54025432becso3967499e87.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 18:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922760; x=1735527560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIOMv/ZX7DfnjB481tjdJsECxraC80hKmeHfTaJarPE=;
        b=HvYdY3hDzn5/paMOTstaxWgBYdNpQk8OUu/y9vQwJ1MCXvcda0cKS336S+qmxhexj+
         vc8GPvE7C6iLZ4vNgR9OxhhCvdCUv9bkkSnqyNVDFeQZ6b4GDNkrlvtVp/HQGqfiSYdZ
         rJ/nC50AbneKCV5VcIPXsmRdMT0nkUssTPvS2bqBnBNh4GHCvsWZTWUEALDKPAW3BVJP
         lIulC80iBKL2oRYnDqIUWVWAiCmYVOVPxsvlOv77yEO8Gn10uxccGI6OKioq4Orzml1b
         JN+hfkhSbkf9BUNF0kMvfDUpw4HJ5SW4ML3qHvDhinb14uh4+FUIxAruxlgsP/xwYy4m
         MGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922760; x=1735527560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIOMv/ZX7DfnjB481tjdJsECxraC80hKmeHfTaJarPE=;
        b=LxYw04eJQ3gHyc4tGefvSxRD28ImIIewrDik/PLy963ivPznDbwTNxb0mk2eyaWDAe
         8b4fMfpB1erQcU+PEtX5CWjOhVdAB1rz4g65NSpy0PZHQojjRfPON4wg0ClPo8p2r/7x
         qwGhZ+HyNeikv6GldLjXw0/TBX7/aIEbiLwpulCjQs2eE792XmQ4luqu9bHl//VCucox
         SG1577bnOwj6QFaypZf/zjQpBDrd/mqibRaFMKaSFEVVklbTitaBtzAVQlZIffJ8BrV9
         pSbzMif9VfJ8CflLKO8U39b/GBPwfHtEHyxwi0SuUQhd9ak9Bz0Xnbc4M/omT/A5mTlg
         Sp/w==
X-Forwarded-Encrypted: i=1; AJvYcCVD57huYyHbrczEU2sMoW59vN5eQ6+0Oa+/RaHal7B7JigZ/NcohDKrgx5fpwxZrpunsXcLGvW8FUfFi7Bef061Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeXWgk/x+70LLeM5HMhuDkprxOTy8E2cDPlTcRX1STBnDHsoN2
	uzWFGOXwkRhjIkJoe2mXVWAquzqJVQYQSHXw2zK/CgwM7S7cNxdnj648Lkc/bO8=
X-Gm-Gg: ASbGncv53IHDj5eBqKILv8btilALVtSLpbnVCPJkbcclOm3pMbIsgZKDj93f6J/lGgV
	cD5Kuq2VZaTBCGPkZcmgBrWCkssyCoxSsykvuRMuliuyBpSdsTU1dQGVw0JeAuJbC4RrKY1F8JO
	tmX8AzVJAi5lEzJgKMjaCQrljqcfoa3UiDBbyzigljlmEyyIaxJs2gB8UCnMMtGUrOpaLo5crvd
	zw3sMjcFKNjZfHE4jDnbTndxfTGaiZbCQ0rF/Dblo2/1K2uP1oWLJVFkOLIS8dQ
X-Google-Smtp-Source: AGHT+IF29fGSwjDuO2lT/HKPdLTtxV1DjZjhv/UHw/U7a5hJJxzd/nVxbT5mqutiPlcJSuC/BdRjKQ==
X-Received: by 2002:a05:6512:10c3:b0:542:23a9:bd2f with SMTP id 2adb3069b0e04-5422954d7fbmr2800003e87.29.1734922759686;
        Sun, 22 Dec 2024 18:59:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:58:59 +0200
Subject: [PATCH v9 08/10] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-8-6ce16bcedb8b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FQQ7Ux5POC+XmasT6HD/kMeYFfKPQf2L4EdJSjEp530=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHx5S6dCQLh7PjI3tkAt37A/fwO3ghHt/Z+K
 AmXGpTG1h2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1eyUB/9CSmk94x8hc7aV/34jscAVeqoxLoOP2faD/9JVeuU0/TAT9fAFG/NE6lC/uwazgcImECf
 FdWa8PwGfz1d6aGJKKOiGKrg2tsVAJMc+38rQQSwM692YnHVseqJMB0uW9ImP3gaE8yK/rTX4TM
 jRHKmhHVV+MSzSFAOSKEogY+jTzdpll3zVmv+D0ZNTuMR3IGKraIVJde1BNfT6d7P6OphO/kX30
 8U2gtCoY2yjCyn4FZyaOv+1cFApkgKMQNJSvzMEHGhRXv2PXthM1R3b47TMwW/d2tWEk60K3Va4
 lN8m8Ltfocm0FMQufbJfXCt8wk9nlsAhcb6u1gtZK96Meh5c
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/Kconfig    |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 73 +++++++++++-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 3 files changed, 19 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index c5f30b317698a1285ae14c07c0f12a2ceb08dde4..6cc7b7e6294a1bfa54137ca65296cd47e46b1e1e 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -10,6 +10,7 @@ config DRM_VC4
 	depends on COMMON_CLK
 	depends on PM
 	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
 	select DRM_DISPLAY_HELPER
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 203293a8beca738dbfeaaf15f350026e263e646b..24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -584,6 +584,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
@@ -609,6 +610,12 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
+					    &vc4_hdmi_audio_funcs,
+					    8, false, -1);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -1921,9 +1928,9 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
 	return true;
 }
 
-static int vc4_hdmi_audio_startup(struct device *dev, void *data)
+static int vc4_hdmi_audio_startup(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int ret = 0;
@@ -1985,9 +1992,9 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
 	spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
 }
 
-static void vc4_hdmi_audio_shutdown(struct device *dev, void *data)
+static void vc4_hdmi_audio_shutdown(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	unsigned long flags;
 	int idx;
@@ -2057,13 +2064,12 @@ static int sample_rate_to_mai_fmt(int samplerate)
 }
 
 /* HDMI audio codec callbacks */
-static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
+static int vc4_hdmi_audio_prepare(struct drm_connector *connector,
 				  struct hdmi_codec_daifmt *daifmt,
 				  struct hdmi_codec_params *params)
 {
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
+	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct drm_device *drm = vc4_hdmi->connector.dev;
-	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	unsigned int sample_rate = params->sample_rate;
 	unsigned int channels = params->channels;
@@ -2075,7 +2081,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	int ret = 0;
 	int idx;
 
-	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+	dev_dbg(&vc4_hdmi->pdev->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -2214,40 +2220,12 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
-static int vc4_hdmi_audio_get_eld(struct device *dev, void *data,
-				  uint8_t *buf, size_t len)
-{
-	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
-	struct drm_connector *connector = &vc4_hdmi->connector;
-
-	mutex_lock(&connector->eld_mutex);
-	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
-	mutex_unlock(&connector->eld_mutex);
-
-	return 0;
-}
-
-static const struct hdmi_codec_ops vc4_hdmi_codec_ops = {
-	.get_eld = vc4_hdmi_audio_get_eld,
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs = {
+	.startup = vc4_hdmi_audio_startup,
 	.prepare = vc4_hdmi_audio_prepare,
-	.audio_shutdown = vc4_hdmi_audio_shutdown,
-	.audio_startup = vc4_hdmi_audio_startup,
-};
-
-static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
-	.ops = &vc4_hdmi_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
+	.shutdown = vc4_hdmi_audio_shutdown,
 };
 
-static void vc4_hdmi_audio_codec_release(void *ptr)
-{
-	struct vc4_hdmi *vc4_hdmi = ptr;
-
-	platform_device_unregister(vc4_hdmi->audio.codec_pdev);
-	vc4_hdmi->audio.codec_pdev = NULL;
-}
-
 static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 {
 	const struct vc4_hdmi_register *mai_data =
@@ -2255,7 +2233,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index, len;
 	int ret;
@@ -2348,20 +2325,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
-	codec_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-						   PLATFORM_DEVID_AUTO,
-						   &vc4_hdmi_codec_pdata,
-						   sizeof(vc4_hdmi_codec_pdata));
-	if (IS_ERR(codec_pdev)) {
-		dev_err(dev, "Couldn't register the HDMI codec: %ld\n", PTR_ERR(codec_pdev));
-		return PTR_ERR(codec_pdev);
-	}
-	vc4_hdmi->audio.codec_pdev = codec_pdev;
-
-	ret = devm_add_action_or_reset(dev, vc4_hdmi_audio_codec_release, vc4_hdmi);
-	if (ret)
-		return ret;
-
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;
@@ -2374,7 +2337,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	dai_link->stream_name = "MAI PCM";
 	dai_link->codecs->dai_name = "i2s-hifi";
 	dai_link->cpus->dai_name = dev_name(dev);
-	dai_link->codecs->name = dev_name(&codec_pdev->dev);
+	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_audio.codec_pdev->dev);
 	dai_link->platforms->name = dev_name(dev);
 
 	card->dai_link = dai_link;
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index b2424a21da230db99db207efa293417faccd254d..e3d989ca302b72533c374dfa3fd0d5bd7fe64a82 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -104,8 +104,6 @@ struct vc4_hdmi_audio {
 	struct snd_soc_dai_link_component codec;
 	struct snd_soc_dai_link_component platform;
 	struct snd_dmaengine_dai_dma_data dma_data;
-	struct hdmi_audio_infoframe infoframe;
-	struct platform_device *codec_pdev;
 	bool streaming;
 };
 

-- 
2.39.5

