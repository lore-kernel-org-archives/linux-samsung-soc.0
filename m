Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E431186E46
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004904; cv=none; b=WxImkaLMaR9FSpFRfKawnfkm8aFHm8LwYXKTwOiOMSLr7atj5vREEqgK1vgVmI4djwGN/+wxs6ahmPHyGBsqMdsEbeE50Yu26lAMRh0TRzwaPLmEdP49FdFmODkISbXllGGkRdbi/00U3whgjl3hl12WXDYInn1pPiGDBjvYJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004904; c=relaxed/simple;
	bh=n/24qvqqwFGUzmoaHOxX+WZSX99nmL45qjtItCdBJCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q03gABm5sLggt9MkSDvZw0MzG6apcvl/2pwRM03JWPFHw6NoYjIuFCHTCkZTr8qj8vOzb7EUtH94JApG8H9D7NAij2aEIyR6G+Mxz+eBP5nZHlqDGfN9T8rcAg4NxOPiNHBdjrL9Js000nU/Z30mAe6eAmfa7J2S4bVbhNdvM/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPpEsJ5a; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPpEsJ5a"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3022c61557cso59194441fa.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004900; x=1735609700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pT8kLYrCB5PCEoycFNDmtbXGVBvLDjFx+TZSQpeiF7Y=;
        b=xPpEsJ5aeBIiRohieLvKpBi3YorLDUi97WX1EQ7NqPzXYvGPi8C/3hKVDjd+2XfhY4
         Scj60Tdl+FmwQtFhh7oli4FebmSI6jw+4tufOIAOzBLVd7wfTy1s8zEIjeiMVmBw3brk
         Qm9aJ1JYbY7/RV27mo2EOYjCGaCPj0qVEFCMW6r2+EGLh/09I18Q2bHWYh3h+s0hdJMv
         Y+wAZIdNN3uy1U93oQ/A/2SdqPAaoKHEOliYSbOSuaZzteRwj+XBfNogevV4F6hdYxXB
         qgBHnUjSgILiFDMwv9OcHiIrDF2AS7UMkBW55aAnkH5WW51WV1fG+UHgGtlgOkQxbiDP
         JrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004900; x=1735609700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT8kLYrCB5PCEoycFNDmtbXGVBvLDjFx+TZSQpeiF7Y=;
        b=Xu2JBGGGJexaRbavalr5AkPyPrEqF3t77vlSqXOBiEm6PsWjBQmxHljjOBI24NSoAb
         VooGDsOJObjWi57cs7NHKwWukFIrxLz+p8B34w8jCoHJG9+QMeWDtBxciOAc0mNMwUNC
         1QBucoR+yRGnqXTyPNNfJ+lcCYUVICVLp5c+rQMslM6ZxK9s6PpNcBO7+oqhIgxMmMk+
         SmQpGM5dSn9rJKRzzeCQtB85F+t+Nqx3gQmv+eto/yuVing9Tt0ROX3SX5cEcMBOyfdu
         2AsuJnfvVDWXhUJ8I709pnVF8kxJc5h4iGZmYFu6h5SFHtGOciWIrYLbXr7/U8rj8xk+
         MZhw==
X-Forwarded-Encrypted: i=1; AJvYcCVWTp2klroIzHJwrzXEwZQFOOtzkAgneZ6W+iSMIlBSXRVmKfuRajGSJBKwaORdbB7mj+ndHiARQg7NLhQJMjIL0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQsHSJsXPbYsTpvg4s0rSxf3OFIdRGYj6Ete+U05069PIPMBAY
	nD0jMzZM/8aYSPWiRmjm7CEjwXIW0JyZ56/DkhIqldAeGQYaVKSgl3AsfLOgPZQ=
X-Gm-Gg: ASbGncu8KQPGXgK6KJMPmh2OXoaQs2wtda/MDH/uMGvY1unYV53YMFONey0vjMkaMpW
	QZk164Z7awbPrW8Pa14itTNc1npSrKI1f4ipYuQU9BcWa3Ou1E4G3YMfbVQ+wifEdO9U3P9aZvg
	wTXQLZyD3hH3e/uqkeTtqxEeW/NoPohgNo0lQLEzZgj4pewu5547u1hve3/gSaxwJIfNqsC27Bi
	H1UZNhgL2AIC/iFm5Mw4xCv8J7ZyYrx3O7OiDOi8QGQAqwu1sPGHvXUKdl9xJpw
X-Google-Smtp-Source: AGHT+IG8vUOhmVgUkB9r/gtmSUaisua3uAUV44IRvqJS3Ig+fU7HeUAYMWthZ0/qn2QCu92dmtuOfA==
X-Received: by 2002:ac2:4c50:0:b0:542:29ec:d338 with SMTP id 2adb3069b0e04-54229ecd495mr3659153e87.39.1735004900269;
        Mon, 23 Dec 2024 17:48:20 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:00 +0200
Subject: [PATCH v10 08/10] drm/vc4: hdmi: switch to using generic HDMI
 Codec infrastructure
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-8-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7670;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=n/24qvqqwFGUzmoaHOxX+WZSX99nmL45qjtItCdBJCU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNmcYqJbEfLmk/qt27tPnj07jedcXRSONtc
 OZ6G9BnP0yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1fdhB/9/GqduXlVyjS7Vjei5Ktt9LoM5qPGcPkMe8CPP1Xv2BWCQ4oiuAqONFomZxkuwYAbf1DB
 sbQ/FaiGhry11RMVTpYmPA2YqOZ5kITVf8u464UfHZ38Cthi4VfXzkwr5wAQfnPvQaJQETnQO5S
 FVmUfyBkrcVdXRwVp6331Okqicc/xyR1jhgYnqtckc/N8IJ7XVHwpwmumbrcHqnXAlx/aw85OeC
 zjEmknWLbnTXgcTgOtDqvUjMEizr2eZBZJoYYEsDcnAbP/QsMCAxxGUoXI4zVH1rzcKm+0eckJF
 qJVgzGhmqUXZreAmQyJeTEO59lSyhO/4BoD9OsrgDVoZgr1w
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/Kconfig    |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 74 +++++++++++-------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 3 files changed, 20 insertions(+), 57 deletions(-)

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
index 203293a8beca738dbfeaaf15f350026e263e646b..cc5fdb23f76f4a4730ab9eff9b47f5d1507aac8f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -31,6 +31,7 @@
  * encoder block has CEC support.
  */
 
+#include <drm/display/drm_hdmi_audio_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/display/drm_scdc_helper.h>
@@ -584,6 +585,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
+static const struct drm_connector_hdmi_audio_funcs vc4_hdmi_audio_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
@@ -609,6 +611,12 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
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
@@ -1921,9 +1929,9 @@ static bool vc4_hdmi_audio_can_stream(struct vc4_hdmi *vc4_hdmi)
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
@@ -1985,9 +1993,9 @@ static void vc4_hdmi_audio_reset(struct vc4_hdmi *vc4_hdmi)
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
@@ -2057,13 +2065,12 @@ static int sample_rate_to_mai_fmt(int samplerate)
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
@@ -2075,7 +2082,7 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 	int ret = 0;
 	int idx;
 
-	dev_dbg(dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+	dev_dbg(&vc4_hdmi->pdev->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
 		sample_rate, params->sample_width, channels);
 
 	mutex_lock(&vc4_hdmi->mutex);
@@ -2214,40 +2221,12 @@ static const struct snd_dmaengine_pcm_config pcm_conf = {
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
@@ -2255,7 +2234,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	struct snd_soc_dai_link *dai_link = &vc4_hdmi->audio.link;
 	struct snd_soc_card *card = &vc4_hdmi->audio.card;
 	struct device *dev = &vc4_hdmi->pdev->dev;
-	struct platform_device *codec_pdev;
 	const __be32 *addr;
 	int index, len;
 	int ret;
@@ -2348,20 +2326,6 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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
@@ -2374,7 +2338,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
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

