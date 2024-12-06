Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1AA20E315
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480226; cv=none; b=OHhvsJyAlUI8SGi9PI3QRAFWRziyfPA8C8oZCF3w2Gny6lO/mzQNMKHgQIomtAufyGygYnXPvuOwGbEh/u28EsT8PPHcDjCuCnVrVsa6LeXwCSLGwuufaGFAsiyNbTWNxR5VHJ5bIZVRrWUnp07H1wmD/d1V8RRFbqzPYEChU6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480226; c=relaxed/simple;
	bh=PRnZq4B5Ktw6BMnqK7ttcTjo3h2X+ci9xQT/AomNEvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o0W0tGsWsFMKXtmvvxE/CzclMRGBbby5OCqJAq7VGZE9FKyrKzQXaLiyMu/7NymYYgqc15g4OckWsLoo826Tk3isOqtEVU6eYpsZP/VNdErDeVnw8zmedNCg/oGV6+AaBwm0/nQmwE5k+egjyeOkYZzmLWh0H3fJS8VWa84xcn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHnoZO4j; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHnoZO4j"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53de880c77eso1989114e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480222; x=1734085022; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7E9JcfGQDN6ZUBFwEUPgAGm2RBAtRtCRdkRTCVbrXmE=;
        b=UHnoZO4jkU2xE/rYHTJrzjAyzA15yp+VE0n+Hxo8Xgwy5oxT//grTgrs7SYYA+UwSB
         zQVJc2VptprVCtB9m0ix9GRUaSo7qfyA3Rzm/9xcKlDsgqvJvqKKR55+eaw5ghJ6Sl8f
         2O8QtZnbGvAu9DaWzV01I7NfE5YGj8gHOKTtivLsdd3a/HL3dGtGp+3at++vcTJGykob
         GLnBQBcGhVg5lnp4Osbi9ywEQctMNvuv4bD6SYNyFm7gu3VbEmoBp1XRNGqsXaF8NAye
         Bgt1dQuWb7231oPAHeo/BMpUoOHylLM1pimKV3sKCXwm0kgCp34mUBRqxe3KuxnLLooq
         oyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480222; x=1734085022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E9JcfGQDN6ZUBFwEUPgAGm2RBAtRtCRdkRTCVbrXmE=;
        b=L0vmgH9uc6HisH1P7PDLXLbFlbuq0p0m6o58Uv6l0y8x/cDsXmGugFaQAMvkni1jb2
         ey8+NN5D7HmECQfgzhxfVhVm8r0tDiO2QQd+zfRDZz6Z19oTtsnjATj388QF9iah3rBc
         ByMqgxUkBHegtDCR+7ySjUrKVlLRI8SWu9Le27zKVf8TZWEoJjG/52YFyYJ0QPatA5SQ
         P++ODjVRVdZn9A4ifGpCyq5lD68OgaTavWimQcK29PdI+uB1/5gk+qRRCFH5UVrPuczY
         eCdDbmiDwq+4J9qQPGTtR/SuKwoIdVc9/gLQ8gWpywEZMzwpMcMNkHcbJPYy1iuve/ti
         4DQg==
X-Forwarded-Encrypted: i=1; AJvYcCVziLw1thbN3mhDXNgWPfmT873tnZUhUVYjM2D7PMgs6gyIlqCZfKWZu8V8K3TcxGz4ZR0uy27jBQN2zkphNHdsZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfhFa1MG8VXaVjs8eT0XS/wiX7grP/iEM+LzBUiFYON0wnIFz
	87/FW0r7Jp8ulecpbtv3pJ0HfZXy80qCCe8BJANqXjAfkaQQleOXaB3coVVYftc=
X-Gm-Gg: ASbGnctGeL0GJOz3m0HfN+2sxu6BrllYpY2XnQCQpy9Hk8SXuw6OZNUzmJrbFbo6Nwp
	5i6I2P+DJp7i7ka/rw2P5kMdKsq2ptCjiPsgXsuJk6dNWcIzxq4+G4bouEHJqzfiq0sUjYheQhG
	UQFVtkZE8miWl82GjDc5fmIgA/Rmk23BuxM6nQHP1VF3JGqW0qBafFmda0qxx8UjdnbMVkzVeVz
	Gtv73m+7lUqC0dyP8sJJMbMB6KSNEwKnfkU02hVKdvPKAcpR3TWvBfuRA==
X-Google-Smtp-Source: AGHT+IEC2BVOX/DQIuiiNOp1QiVCCXdIrMaFCzPJw0ZdKhdICHTciEnz1T4dSSvDlr0mcfJh/iz2YA==
X-Received: by 2002:a05:6512:3caa:b0:53e:20d4:334a with SMTP id 2adb3069b0e04-53e2c2b5cd8mr720361e87.14.1733480221912;
        Fri, 06 Dec 2024 02:17:01 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:17:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:02 +0200
Subject: [PATCH v6 08/10] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-8-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6786;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=PRnZq4B5Ktw6BMnqK7ttcTjo3h2X+ci9xQT/AomNEvo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8KVLoDRWj7WH319W1w/RLnRtHsbGLHohYKm
 YKafWEqVteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1ZlpB/4p+HFTN+BLlwyeSaGSzwPfl2wlqAF1r0NTeHzTV/JwWEKIDfnYREmyj0YrVnGYlEG1JqL
 qdPqJAlp/ja/+cPL9zZ/iGOLkCUGL4V8VcP7EfYLMaZ+Yk6IIeOumHBGR5bGFL65k406ZWvOhzd
 3eBO0Qhz2sn5sXYvbbrOs/TbsGaxxWtbuoW+ztbMXLku5aWUd1OuTnxPP9st2MZPL216+Ew8m8D
 6h6LdN+VwtNtTZPJ/Dhcq4IyGr6R9r3BhW8wGL8yEX6FFU+iQrRjvVMXcaDwENCg1FpQ/Zla/af
 XmPA4WHMWIDyS24iXKlpWn6wxM0LmiRGftyAsw/pkUiQSLH4
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop driver-specific implementation and use the generic HDMI Codec
framework in order to implement the HDMI audio support.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 69 ++++++++++--------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  2 --
 2 files changed, 16 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f98617b8bf6cf9d92a806e35584e8f8ab0ac9f96..e5ab42f72f618b90f956482db6c9c8074c1e3bf1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -609,6 +609,10 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_connector_hdmi_codec_init(connector, dev->dev, 8, false, -1);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -1707,9 +1711,12 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	return MODE_OK;
 }
 
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs;
+
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= vc4_hdmi_connector_clock_valid,
 	.write_infoframe	= vc4_hdmi_write_infoframe,
+	.codec_funcs		= &vc4_hdmi_codec_funcs,
 };
 
 #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
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
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs = {
 	.prepare = vc4_hdmi_audio_prepare,
 	.audio_shutdown = vc4_hdmi_audio_shutdown,
 	.audio_startup = vc4_hdmi_audio_startup,
 };
 
-static struct hdmi_codec_pdata vc4_hdmi_codec_pdata = {
-	.ops = &vc4_hdmi_codec_ops,
-	.max_i2s_channels = 8,
-	.i2s = 1,
-};
-
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
+	dai_link->codecs->name = dev_name(&vc4_hdmi->connector.hdmi_codec.codec_pdev->dev);
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

