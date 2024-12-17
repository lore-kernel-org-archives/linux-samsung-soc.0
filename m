Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C581474CF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396052; cv=none; b=AUhEXDvWEfZ2W6LbrJk8hO1CqY7OSePYG9BDvvcVf3jrxLNZSdsFvf4m9KxMAA8Cbr9tKYvGc8eYzetGym7FiaY8u4iHpXAwW5EzhOCctCY+KIUQ6G2mA/p8dGEmT8Fqm8cBwKX+ewLPzwMQUXTewkdrriql4KBrbmZLBwSy9Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396052; c=relaxed/simple;
	bh=6Y1sm65Qo2Q/7xl+pyz1/J9UMGUgCYPyoG1qbt4lRyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LoJTa+1j30wgI4amJEyalYB3odP9bP9nHGcV0RUjJT607a3/abdpA1K354lW5/AfUfVZBeRWpDv1g5A+n2qdsf90HFLvoz/CVAkH2ZB6TWCix4akmLjLTSgrdE7SyGWM7mms1B514IUT+VWQgSD4OnTh7QmfkhhspumzSyPy2TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AxjT0fKA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AxjT0fKA"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401e6efffcso5499124e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396048; x=1735000848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paTb+2HTrTNp9hvm1OCA2iLmtmvZyo4+owE4qzdFaRE=;
        b=AxjT0fKA+YT6kqNdrUnCjYBHhlSZQ2H7XwbgWxXGLmsA1609rf5D2OYB5NLHTrECB7
         gYcZyRYlOMaBEBu/MrwdFMYlQcpD7BcTguiT1GagboXIxt5qYS+U9F4/2sasazDRn2nD
         dWOtOUBSCuPgV02DJUDyh67OrkmfuixAJEhjDD0UEvRR+8V5Mh6y0dJauKNjo6iLKfGM
         quLt3Cbcd0JGUgx6UjFPrALdjE80Oh+9WCzRNS9MsqiHbnD3/F3I6y98k0ucE7/80gul
         YMTnJltgp/PK1qzVRgqyxqGcKhATtRvvyQqYi0+k92SWRcDjMRB0ub+3V1tBUaHP52S8
         qvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396048; x=1735000848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=paTb+2HTrTNp9hvm1OCA2iLmtmvZyo4+owE4qzdFaRE=;
        b=C9BNNnfZiT67MMWNrFT1/lwoE/ySjTCZ8IFzSD2FjFjlWeftYuw8uPpJuGHX2ebi+9
         7Lu1R3ccNquSapm9BK3uGwUl7GP7EmEXeshIHQBWcwd5TIKASwxkQqFN5Ge+K6+mdsbX
         Ruoiseuc8K+UAy9ITqTncdE3N9PqxW6yK1muoEilxKkJzI0CzW6w400o62lGOhn9RIs2
         8uYnD8O1So0sbVloRZRDwLcjdpvekMe3arc+SGSOzjg08Gwhp6bJ8A/5D+df3Id3ZYXT
         IySorKVx7z+QgXxfWScQd9Kajx4RZMA1uQBjBFnpMsBPrjIhB2HuKugpIqMHZCVGOyaH
         ZNHg==
X-Forwarded-Encrypted: i=1; AJvYcCU1zknTgry+7Q5h5qaEhGudIP4AWvDB9r2mTggUODfdR9UnnVRbPQkN2IxMtEeaVFOrjwUiROUqoxTSmRguf35VwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0zyrMa/u0ptCZgUhf51NSMX0olUyJ94aVAyDnt3EKdEgMkU/
	sdGbW9gtTbEbihEYMx9y9tBcIUHaK4SiAIZbXD/HksIQnqIPqS2fbDbDWq81WdY=
X-Gm-Gg: ASbGncvk6Fv2QI4dKymENUZcefvf8OLhe/jLJpS+cVuF+nQU/IZjRzV0c8TUlYjrx/2
	+yFuqZIInvnGFwwWjtr1y2Nb9VJcFX0Cuc/j2mPW16jjCxw2qZLGwM4FId2j8rS3V4g5/YvLFYK
	rsJWo2PheznX6xnla/CXIjVOQxp1RpOpdV5ol7xR94zqOBGQl9BjsLu2613L24QsZXAyvruIZ3d
	47rtHL37Mu/8ed5Oo4e1M8504NrUECqOt56ieNcfmY4AO7stp+jmEBTsa/Egf/o
X-Google-Smtp-Source: AGHT+IH4tL02rlsAd817EjeB0oQHTErm5C29t27CuFjcVt+3R8fvkOnGop7QdrSYReMUeYzTeVvb4Q==
X-Received: by 2002:a05:6512:3049:b0:540:1b41:c75f with SMTP id 2adb3069b0e04-5409054bf54mr5505928e87.16.1734396048212;
        Mon, 16 Dec 2024 16:40:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:30 +0200
Subject: [PATCH v7 08/10] drm/vc4: hdmi: switch to using generic HDMI Codec
 infrastructure
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-8-cb9df2b6a515@linaro.org>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
In-Reply-To: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6709;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6Y1sm65Qo2Q/7xl+pyz1/J9UMGUgCYPyoG1qbt4lRyk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh5fP0aFF2grOUxQSROkIswl03VxBNpkLqR7
 4wtYX6ownOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeQAKCRCLPIo+Aiko
 1fzWB/4r9PIwuX0nnImWs9/4IvVacPdvBIoD9XK2Fw8ymXagQsGGDCIIEaTAMHCA5Ixtz288OM9
 LdxorGylln4TDSQeSM4om3ulO7DaHvOOxOUg+B79Jkdkz6uTjlvs7gYgCfektpZ8Y5UZHjHLC1t
 37rV6Y8PU+FCeOgZwPTA238IvVuKnXsw7vSP0HzjOf3NOwS94l+avMAOM/eSDPWY1+PySDLXRtQ
 UcqOO7k/epIOpu0vV0tNxGP/JcuN9/eD8WMXZO3go0ikLl78tlETnlmdWnEBx9blxml4PRcHwJl
 OEJ7xDq5LYdZ+Samj/H2FJrcvs5d9kFatiZViv6YSJX1vZkk
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
index 203293a8beca738dbfeaaf15f350026e263e646b..2a2aca7017994779a7163935df3fc87ca312d6dd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -584,6 +584,7 @@ static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs =
 };
 
 static const struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs;
+static const struct drm_connector_hdmi_codec_funcs vc4_hdmi_codec_funcs;
 
 static int vc4_hdmi_connector_init(struct drm_device *dev,
 				   struct vc4_hdmi *vc4_hdmi)
@@ -609,6 +610,12 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
+					    &vc4_hdmi_codec_funcs,
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

