Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DB49641
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004888; cv=none; b=NsxEbPk/FYbMdw5jj26KHH3SEHMDRClDXn7ZwFqZKk8o6TMuvYErcTHK6p/RMxtVElicldOvgc3sPXxptQHb/i5JG3LyuMCh23NEeCEHTdhYh7W0iJCxb3TU36p8/zIh/x1xIld45Zp8h+Ys9tm6FId+ykc1gvZCA5XOlFZ9CsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004888; c=relaxed/simple;
	bh=4x3WE8jIo4dGlgjNgRW+abdLUVzUkBd2jnaFvquNyDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjzSRywRDXDC/LvWGKLQBFgNM0DoScTAbrCdaCaf7qKwELp89tDFkWE9Wnt6VFOinUA2rvYksxiy3BNtKqzTyIUuZ8DudPpVn33W/sKXNasGWfb4pjqyUvzhSNMN0ybZjAosM+FUiH7iuAHJvHj41TXvuO7yN/KgziWicqCWphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TvwmIHct; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TvwmIHct"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4907657e87.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004885; x=1735609685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYV7kK36HwiOA+RpcyU15B/Jn/hRSBrDhd14bQdBbvA=;
        b=TvwmIHctbd2DyqFKoBrub8dlbQaVXnLNojO8Kma5aEu//WTPK7qcTq7mlchrpfLuTr
         pPY+1JlDOXWTvzt+3FVfpN7rtMOKT66OASn73bFa5W38ogxrK6TwOJ8QaNtpdKu4AW+A
         4ArHj1trAP86SMsNoJjazByDG2QoKG1iP7n4lG47zlPSv+EiJ5sSHALiV9doHf3aRsG9
         g8zxCU9yKuRJsA/MxBzrfXBfwIY1IJ1yZBU96CQS7cBuiO9z+6BXr6fwzWhU/4eN/FEB
         0zPz8yY8/Yf/AzNfgvgHOMoWQv9opBeEnnLlQdKXgTXQ3zN63ZF+h4Juds7WadJxAJhX
         ux0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004885; x=1735609685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYV7kK36HwiOA+RpcyU15B/Jn/hRSBrDhd14bQdBbvA=;
        b=iBjP6Ph1zomKg91XZ7lIvSiPEqW5KO4YZSvi5cVRRcKeU7Db7u100bhlDzj2ZEzFiF
         Fnli4J42oP8OeZypLJukcoO8ESwGv/6ve7F/huVGU9uO4wSBgTWmURUfOD2lWDCJwdL1
         pkJ55MUI5YUMi1TDYWzFrmkq7PowP+tiBlD6LoA2X2FXXv0r05F6PuroFXpk0G/O8pgu
         MV2SpPjSgFYezfUiBajHIigpqON0sq7ZVw5OpDWcJjLVVDNt3PBlIuqFCEcAvReNrH6F
         hWvAk6YWe8b6p9ngngA2y7CINdHgb+93WdDaUsK5LjBgt6r6ObSPfZIUiOyGs2TnM1Qy
         X1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU/ICZ/rwDad6Cp8GBiAZkE07P3n1XdWZvhPLdPv3M0Z/VFyFPZYGHwW31VUpROc/0M/V0dlV2LblbgWcjjCagFrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgagcfDwsHD+fLEShyFDhjZkbNMuK4ERQZPoimzWJ61AWGVxKb
	OcL9hM1YL7zi1DrfqUM+tWuOrQmbe4uFKdRJH3l5QsyOJR7sTBZZR8x0vzXdC7s=
X-Gm-Gg: ASbGncsDLfwbXaot5sBCRy6TBr16Kk88TlAe6R9VOjubbcw6Bj/D2D1Ea7NzI+Yp1na
	R9lYFYJ2SnyGhSVGmozyhGVkUBMmMel9sDHDQtrb/Rh6gj+10KB2izegO5aRiEgxZIEzdw0bR5y
	Ps+rQlhrC6/aeP3p5NSFsdGeMoS9UltmwJWL8iMoqXXTMAZcgJKYtXQkpfSHhf89X2yFve2RYH8
	tm0hHZj5+dpI8EDtG5WoA1hjoCvga8RyN/yuob3lf18S54ct923lNO6K/UIpzns
X-Google-Smtp-Source: AGHT+IFnBzijj64l9QlWWB+dsL7TyLQ25deweVBkgF/OOsF042SeOQe+XinnnHNr0JczwC080m3eLg==
X-Received: by 2002:a05:6512:230d:b0:53f:8c46:42bb with SMTP id 2adb3069b0e04-5422955ff80mr3938751e87.40.1735004884953;
        Mon, 23 Dec 2024 17:48:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:47:54 +0200
Subject: [PATCH v10 02/10] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-2-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8769;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4x3WE8jIo4dGlgjNgRW+abdLUVzUkBd2jnaFvquNyDU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLMeItBm2w6argDC2ztPumwQMsC5Xwy/8wwu
 myNvu0+B6yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzAAKCRCLPIo+Aiko
 1WONCACeKI07jCCvDLpij6mVxyaa95y+h8WiVILowKjBL67H6i6bjbhtnPr9Imr+lQDetJbCwdl
 GZ2cpZK9ZlM4tdqV7Hru+aaJwzxyLM8pwwDSAdXIvAGTiE/VKB8ESIZiRQoDr3oOEDDUSRrvEbl
 /18KMf+yMNUccNPz+z1cSzLn3cDUHfT/S5KakJyO0vmCB6iByCJ6LqQu/sRJG1v7Cb8AqyPGJ2w
 KshIxQji1EW5KgO5XtQqrU++K0lGhieyhP+JxDeQYkvpneoQcNf0ua9741pNopRDOCKOjPcTUwP
 gi1d7HjL3gkcGpAmKmxoXAIfHM21Fi621yoS3Q0svu44MBhS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The no_capture_mute flag might differ from platform to platform,
especially in the case of the wrapping implementations, like the
upcoming DRM HDMI Codec framework. Move the flag next to all other flags
in struct hdmi_codec_pdata.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
index 940083e5d2ddbfc56f14e2bdc6ddd0b9dd50b1f8..7734e389ca7692f7880aa9b8650e45aab228c7fd 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1466,7 +1466,6 @@ static const struct hdmi_codec_ops it66121_audio_codec_ops = {
 	.audio_shutdown = it66121_audio_shutdown,
 	.mute_stream = it66121_audio_mute,
 	.get_eld = it66121_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
@@ -1476,6 +1475,7 @@ static int it66121_audio_codec_init(struct it66121_ctx *ctx, struct device *dev)
 		.i2s = 1, /* Only i2s support for now */
 		.spdif = 0,
 		.max_i2s_channels = 8,
+		.no_capture_mute = 1,
 	};
 
 	dev_dbg(dev, "%s\n", __func__);
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index a02d30c0ba4221d7fee0eb50892ab4d8e8436004..2a0af0f09defa2994ddece755ecf9742b418473b 100644
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
index 7a57d4a23e410db1d4d3a11bb9285d34c784f2d5..176fd88717597c37824fbf825ca6b893b083e0ca 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1660,7 +1660,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int hdmi_register_audio_device(struct hdmi_context *hdata)
@@ -1669,6 +1668,7 @@ static int hdmi_register_audio_device(struct hdmi_context *hdata)
 		.ops = &audio_codec_ops,
 		.max_i2s_channels = 6,
 		.i2s = 1,
+		.no_capture_mute = 1,
 	};
 
 	hdata->audio.pdev = platform_device_register_data(
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index 57ce77c2be2458fff5b752332ae51e016582ddca..82d4a4e206a584e045a8fcd593fc12b7c1257bfe 100644
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
index 36713c176cfcf1af2d365280700d06f4c1239e09..5c805094daf6d4678355fec43648552b34508bec 100644
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
index 70dc1d4460adfc04b5c40263d11184aae826c658..ca82bc829cb96446d4d34eeef45848df03bd716b 100644
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
index b76337f690ec2fdfbf4dac08a04aa4de4eff257f..b17de83b988b1f1afb2f6d12b1d155761ff9ca50 100644
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
index f8bbae6393ef8c0bd1deb75d1e131c1d83c1ebfe..ca2fe17de4a5d1e0199e59a97e6c7601e139ed9e 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1237,7 +1237,6 @@ static const struct hdmi_codec_ops audio_codec_ops = {
 	.audio_shutdown = hdmi_audio_shutdown,
 	.mute_stream = hdmi_audio_mute,
 	.get_eld = hdmi_audio_get_eld,
-	.no_capture_mute = 1,
 };
 
 static int sti_hdmi_register_audio_driver(struct device *dev,
@@ -1247,6 +1246,7 @@ static int sti_hdmi_register_audio_driver(struct device *dev,
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
index f536ca60e162dca6b50b37854ca6de2c114bc2a1..69f98975e14ae367f482862724a358eb138ebf6a 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -714,7 +714,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
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

