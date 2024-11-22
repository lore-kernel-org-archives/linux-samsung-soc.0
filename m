Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C452318654
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Nov 2024 00:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732236468; cv=none; b=Dm8S1Z+kErTKFw8S3rrTH65JqQhiWnO35x7y1TDcgKHLqa1PdIoqREN6AS2/bRBycSKkvXynDoaZi3xyJpOn+Baws0eiwHdInK5vvs71ddhLOnR4DkS5E6gyA++LpH+y0JAL2wnVygOnID+h6iPl1fw7CFktjgbrSt3p8lCqkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732236468; c=relaxed/simple;
	bh=QgvPV95aCKZk0jjfModEdw/2ZuJp4AQ4+MiWPaLAiFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bSIwI7+GTQUwpLZobW9uKvlLAL/TMxD9wPrA6fhS23Y0WfUczb2Td1yAU5NjSY4A3Rk2y7w1MqWlkSuWjuj1oukTx1S6ZT45bWSdE4GPZ5pAOCHCeD63n16BE/q4JNAEhNzbHiugIMKxTC8sAdqpu1OM52ILR1yVEcrq66Z/v/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMCtDb0+; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMCtDb0+"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso27992021fa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Nov 2024 16:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732236465; x=1732841265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak8gRHgoBR7wXxN3OTsHJhxEAFWfUvaDSuz/ZDqmUPU=;
        b=mMCtDb0+41D4T94av+DouhcTVfbLkfcEqPmb8VlGlx3w80d6MURHgN3Rv95Gfrc9ot
         K1XVOfdl/zO5DWL3Ov9MkaNpc6yd7FfeyAfUnI7lRaxRcY8BU7Z2uM29dZClfQwQaS4E
         ybZlW/RBUWOnEcqndyNEDpkg95VYfLVxjWyIqLu1CR3nygyOQYw3/KiNuwJvI2LeEb49
         mPdqUIihK7xYadJ3CprDnpjoFJJgg8Gi3TcKb1zIyDG1aoR6OptTckRDeUPzakxaHW81
         5Pyr24S5s05lid3kxGK2x+8KoOa/1mLxqqn0DiD4uiNW9P6fP0A5+RC3/+7X3JfZwLkI
         8JQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732236465; x=1732841265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak8gRHgoBR7wXxN3OTsHJhxEAFWfUvaDSuz/ZDqmUPU=;
        b=jHwcZraAdE/HvL1G8aSuFvg909wx1NVFT/f6f7d9wHaXLvIc1ikBWVnUfZlD5ekvI+
         N44DoyQsjEnL695DnCUDozf2facPPnbspsZdLJsZdrGMxII6JEpTcXyp86fWqNx29EX0
         IET5s0vI5CDgnlfGkM6CMBGHWPBpPn86fry3i7XwTYd+AZ+4iQglRfg+/QV56DR6SZNM
         yJCg1rvwqrvgIi5xHPC/4W5TOZYmVMNfFT+jDinSnYdLhdrr68tpTHleZFVfSTpUbjIh
         4Aer0FAkoj63SWyuQ4lHeB318mPiG/d4/rjzhyvHCafq+5gUFNNqmcnij+Plq9k47Pkd
         TXtA==
X-Forwarded-Encrypted: i=1; AJvYcCV00U9QW1DZZvPEZ07Wk2gDBPwWEfpSz9fyglIiFsn/JBL8Cuzx0zK1pqJApnIyhESpPYOlzew2rVqTvxH4BmpB8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaw1tLobojSGEoiz4v9EaguCeBVJUk4TCDJwOmVtSIFPkfcOdR
	nkfT7f/794ue4YHPJNt5vbBjGYcA3EauWsMnWwpaKPtx9EV7XpxsShAgG6xOWfE=
X-Gm-Gg: ASbGncv0mlTGJzI/e/wlQyd/1RKyuqO7go+P834iXlSkP/K7I6xvw1Ny3JlqwEBwCqE
	qX9WT+lb05pBKRuqO1eOJ6vFfIuS3mZSi4u2kBsKNof5ydFEZAf4OnVPMk476FlHdNOtkhKnCxB
	vmsi558W64mVy9hU9+EKhYhYlbaDzt8vsLTc1xqJgXZHX7R/dhXooh/pUiSBGQsIhd258rFW1Pj
	3iz6fFZ8G3z+z4AB7L0pS4szGAsibLeQ97IGTxvkxIzlfO5HL/DlAmZSw==
X-Google-Smtp-Source: AGHT+IGmZbXKNzuaVctS0Pej9crIvWrOV7VdQgJgHI3Iy10PqIaNo/7gHPJCX3fH8j0NUWfmoyf6NA==
X-Received: by 2002:a05:651c:985:b0:2ff:95d7:9ed2 with SMTP id 38308e7fff4ca-2ffa716ed4fmr6047761fa.32.1732236464826;
        Thu, 21 Nov 2024 16:47:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375caesm1083071fa.85.2024.11.21.16.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 16:47:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 02:47:32 +0200
Subject: [PATCH v4 2/7] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-drm-bridge-hdmi-connector-v4-2-b4d69d6e3bd9@linaro.org>
References: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
In-Reply-To: <20241122-drm-bridge-hdmi-connector-v4-0-b4d69d6e3bd9@linaro.org>
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
 Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8709;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=QgvPV95aCKZk0jjfModEdw/2ZuJp4AQ4+MiWPaLAiFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnP9SoX/WmdVL8hw73RcqrNT84gccFs0OOWDEXZ
 w3h4HUZ23+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZz/UqAAKCRCLPIo+Aiko
 1QMmB/0dJ0r46o68jwO2QWL6u3ieZBudls3bPrbQFSj3kdlVf4OzvJiHRbz3uIg+R6fVdURhqax
 40uuRhOaV/URnc2TQK1U/JprQosppitU8ihj6YuNOIe2Z9OUE4afZhKnTeWFAROF/nPrWAQuupM
 Z8ZwVvXukodqTzRDxbLTrGa0bZ5gILu71rza7D4pXqkg/wZErRmQ/ewRVaaXMk+phLcwGB5Q0Wp
 9wcLj4k2+2xuYvYFkB4DZstDx0s+cbvFRt3gpodNiEpHRaeY0/oMhKcvgXL/kpOl6P9XX9qGSJV
 qrX/rlQv98PaJj4uN8xLqNNFKmSTFTNR4RX6rby8CFsrYTpL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The no_capture_mute flag might differ from platform to platform,
especially in the case of the wrapping implementations, like the
upcoming DRM HDMI Codec framework. Move the flag next to all other flags
in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ite-it66121.c   | 2 +-
 drivers/gpu/drm/bridge/sii902x.c       | 2 +-
 drivers/gpu/drm/exynos/exynos_hdmi.c   | 2 +-
 drivers/gpu/drm/i2c/tda998x_drv.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_dp.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c    | 2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 drivers/gpu/drm/sti/sti_hdmi.c         | 2 +-
 include/sound/hdmi-codec.h             | 4 +---
 sound/soc/codecs/hdmi-codec.c          | 2 +-
 10 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 35ae3f0e8f51f768229e055a086b53a419ffcd9f..98669470d1e955fef36bb4592795fed6ca97139c 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1464,7 +1464,6 @@ static const struct hdmi_codec_ops it66121_audio_codec_ops = {
 	.audio_shutdown = it66121_audio_shutdown,
 	.mute_stream = it66121_audio_mute,
 	.get_eld = it66121_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
@@ -1474,6 +1473,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 		.i2s = 1, /* Only i2s support for now */
 		.spdif = 0,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dev_dbg(dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index f0be803cc2274ca2199ed7661cf752b0a91434b6..5248676b0036a7e8f2142bd2f099c36efb529471 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -841,7 +841,6 @@ static const struct hdmi_codec_ops sii902x_audio_codec_ops = {
 	.mute_stream = sii902x_audio_mute,
 	.get_eld = sii902x_audio_get_eld,
 	.get_dai_id = sii902x_audio_get_dai_id,
-	.no_capture_mute = 1,
 };
 
 static int sii902x_audio_codec_init(struct sii902x *sii902x,
@@ -864,6 +863,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		.i2s = 1, /* Only i2s support for now. */
 		.spdif = 0,
 		.max_i2s_channels = 0,
+		.no_capture_mute = 1,
 	};
 	u8 lanes[4];
 	int num_lanes, i;
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index c9d4b9146df95bb46cb6bea4849c331616c2b463..2a74396ac846dc34d87fadea700c387d597ba307 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1658,7 +1658,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int hdmi_register_audio_device(struct hdmi_context *hdata)
@@ -1667,6 +1666,7 @@ static int hdmi_register_audio_device(struct hdmi_context *hdata)
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 6,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	hdata->audio.pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 2160f05bbd16d2346e27365e5549b75ad26fdcb9..10a4195d667ff577183788f8fc7ca806660e2b9c 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1165,7 +1165,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = tda998x_audio_shutdown,
 	.mute_stream = tda998x_audio_mute_stream,
 	.get_eld = tda998x_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int tda998x_audio_codec_init(struct tda998x_priv *priv,
@@ -1176,6 +1175,7 @@ static int tda998x_audio_codec_init(struct tda998x_priv *priv,
 		.max_i2s_channels = 2,
 		.no_i2s_capture = 1,
 		.no_spdif_capture = 1,
+		.no_capture_mute = 1,
 	};
 
 	if (priv->audio_port_enable[AUDIO_ROUTE_I2S])
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b164713d71461a0b2ad370032a14604be6..6a42459792ec75692fadb45a75b138fc43cc37a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2615,7 +2615,6 @@ static const struct hdmi_codec_ops mtk_dp_audio_codec_ops = {
 	.audio_shutdown = mtk_dp_audio_shutdown,
 	.get_eld = mtk_dp_audio_get_eld,
 	.hook_plugged_cb = mtk_dp_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int mtk_dp_register_audio_driver(struct device *dev)
@@ -2626,6 +2625,7 @@ static int mtk_dp_register_audio_driver(struct device *dev)
 		.max_i2s_channels = 8,
 		.i2s = 1,
 		.data = mtk_dp,
+		.no_capture_mute = 1,
 	};
 
 	mtk_dp->audio_pdev = platform_device_register_data(dev,
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 7687f673964ec7df0d76328a43ed76d71b192350..a4b144b3bda8362a6c6c303723c6d3eef9ca338e 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1660,7 +1660,6 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.mute_stream = mtk_hdmi_audio_mute,
 	.get_eld = mtk_hdmi_audio_get_eld,
 	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int mtk_hdmi_register_audio_driver(struct device *dev)
@@ -1671,6 +1670,7 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 		.max_i2s_channels = 2,
 		.i2s = 1,
 		.data = hdmi,
+		.no_capture_mute = 1,
 	};
 	struct platform_device *pdev;
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index f576b1aa86d1434d75b3770e08d91537aca4f5c4..5c2c124a7a38fbadaec554f08797020260e29045 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -885,7 +885,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.mute_stream = cdn_dp_audio_mute_stream,
 	.get_eld = cdn_dp_audio_get_eld,
 	.hook_plugged_cb = cdn_dp_audio_hook_plugged_cb,
-	.no_capture_mute = 1,
 };
 
 static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
@@ -896,6 +895,7 @@ static int cdn_dp_audio_codec_init(struct cdn_dp_device *dp,
 		.spdif = 1,
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dp->audio_pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 847470f747c0efad61c2ebdc3fb3746a7a13a863..dfb8e2887fae10cf3275e8f8427f39279982c5e6 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1235,7 +1235,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int sti_hdmi_register_audio_driver(struct device *dev,
@@ -1245,6 +1244,7 @@ static int sti_hdmi_register_audio_driver(struct device *dev,
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 8,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	DRM_DEBUG_DRIVER("\n");
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index b3407b47b4a7878532ecf3b08eeecd443d6fdb07..b220072cfa1baf503efbe2d530d7e8392dc16603 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -115,9 +115,6 @@ struct hdmi_codec_ops {
 	int (*hook_plugged_cb)(struct device *dev, void *data,
 			       hdmi_codec_plugged_cb fn,
 			       struct device *codec_dev);
-
-	/* bit field */
-	unsigned int no_capture_mute:1;
 };
 
 /* HDMI codec initalization data */
@@ -129,6 +126,7 @@ struct hdmi_codec_pdata {
 	uint spdif:1;
 	uint no_spdif_playback:1;
 	uint no_spdif_capture:1;
+	uint no_capture_mute:1;
 	int max_i2s_channels;
 	void *data;
 };
diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index abd7c9b0fda9ee6fa6c4efde1f583af667716611..e8aac8069587785bcd2bd09b5f9e0140304fb8fb 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -700,7 +700,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
 	 */
 	if (hcp->hcd.ops->mute_stream &&
 	    (direction == SNDRV_PCM_STREAM_PLAYBACK ||
-	     !hcp->hcd.ops->no_capture_mute))
+	     !hcp->hcd.no_capture_mute))
 		return hcp->hcd.ops->mute_stream(dai->dev->parent,
 						 hcp->hcd.data,
 						 mute, direction);

-- 
2.39.5

