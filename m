Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A212120E709
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480228; cv=none; b=k9dQDRMCHadbaoZ/23X7+ZzgST2JSTq0EqT5fOH4JCI12aIQadu5ScLuHS9nF7TH1EFtQV/S3BW9Kj/6oEaO1AzWM6zvcIP3AHJW7RE00RQxKvrFh+t1STgOxqtQ4fK9Abpxbu23JCAK1FElmlJlG9j+L1fitx+IkYS01qqYWNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480228; c=relaxed/simple;
	bh=j2kemq017HscgmDjZnV9e0NQWZYYUNRM9WTXAZ5h3gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fpoqae2a+lxsgNgxoumfVZcSPPDyrFKY9oYwXTcAl2gfP3rZ1E9Wbtli4GghTRJlb50XBBDSMw4wuienix0PhHGXZdoOosFtcA/1Z7o8xKOQwSohitnFsaDyUs1vE21Rnf/ck+NT8jZpCiiifEGsXP1dA6CPiMJXj5/IFyysrqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l5o4RNKP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l5o4RNKP"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de79c2be4so1966807e87.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480225; x=1734085025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=;
        b=l5o4RNKPbbfiM00a8JsWqapG4SMHPNGbT6XUo3r8iP1X4CtkMUiBxP53rCEaiHdVFB
         7yMumDhbYs8rphUnDZ80u+eWKhMFxuJBW3ABYZqJSn7TneD+2xzQ11xHr2x0mA+BBB//
         bpe/eoX1n0ZudgSKJkAnzxv+oZljvcIpp4M0hJ/vYve3KNde/vQRKZRQZxiyGzwbWsMs
         XW04dTEPDCiCxU7FHuwJY6usyIqTMQD40kmqrJHbgXJQZAqyq5MxDQwz8lztBXDBsYbT
         c3R9wCPVJLmupOiBVe0k5sws+Rt3Bi24ShNHpyYrHus+bE2qiiqZEsU0CkBYj4LGiD5x
         w+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480225; x=1734085025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFa29zGokenJpe5mqg9zveoS4Rwgzi3mBzBv5L26SAE=;
        b=uDPgU6r21FTJ6pfRCcOX0WuhR4D7B5DMJD/Rbz/T3altcon+Fu4rIEl/zlV1ndy/Jg
         heZ+Ri5+1UKfK3LPcBssUXT3P89WjjIzgo3gzVeB+ObPqAlI1C+A0LjNJK7qJJw2yIL8
         R/L3uYu1AwPc/El+00hZPHyv/C/pdL/OmME2IHggkPW+gV9fsrhOpnG1ZfaICX90Gs5F
         Trbp3t4eiP1oDnvhCnU9wErRma/ajulrzg/xFAHTB7CabbFOc/qH1x9YvSQ7zFc53kmW
         ipzZYEBrVrrDqlFxdeQPDEp/7nIc1Vk31DjlAmwyM8+ZiWGgLG2sxT7yIEaDEN1uH4X1
         iAMg==
X-Forwarded-Encrypted: i=1; AJvYcCVkmB6s69u8XQs0/yZIv50KcSOdh/8IDL0V4YEAiPfxsISbZIbe6PYv6hJft2Pp8b2/b06vA5/IyIQ4mlgWUBVlGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmEabVGDsdJspknXEN4C2bnOrP8KXcklSmjIrzdt3Y5XSTnKk
	rlGCWsxCSp2j3bZ0gk97cyzpj2dQq3nuMGzbAQ55/hTd0Sipv8bdrLsQNBe2dEk=
X-Gm-Gg: ASbGncsRTkLcTMJEX8QUfCwB9UlwkXQ8orSvdLD9Q6tEJt/xL43ZmPMXSpvEBjTkz/G
	MQRBkvMuf/SbB9EK92y7X2QQ4tXlAt6zOhNdJfI1XC8t1ZhNJjEWc6XYu7zHfAADfixuXUTHcuy
	w7oMg2fHiDxb/r9slPpeI38sUANmzMi4aY61JBrJCt1U0pks1mNXThddDf2xOQMlVlOkiSGHkZd
	I3WED2sAfTHkArvUTCIw9cnCuDC4qPZyOlCyx3WfzemoVtUDeY9ZkyWIA==
X-Google-Smtp-Source: AGHT+IHNpBuRwgKK1CNP9DRuR/Gs67kp3cCMnKwV+VXX45IVym/LnbP/Ke7fYrgOf+QZmiMXYQapcQ==
X-Received: by 2002:a05:6512:6cd:b0:53d:d17f:9c82 with SMTP id 2adb3069b0e04-53e2c2eb825mr792722e87.41.1733480224767;
        Fri, 06 Dec 2024 02:17:04 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:17:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:03 +0200
Subject: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=j2kemq017HscgmDjZnV9e0NQWZYYUNRM9WTXAZ5h3gA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8K05s0noSk+VgReu16bZ6zGhMIKEKZYWvMH
 cWDBoC5MeeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1egSB/0eK1psxHQsYpRADr6zCNmEK9ALrprmuzg9K5OGMiQy4CeKh8wWSI8ng+ZMiQrN0gysIOa
 gP4xcWyhTKvzseLul6LUz7vNnN2oLBaT6a9kOqq7zHzZ5BC1htBwJHDvvs6gyNE328fVF96Vz1X
 o1rKdI0JsvDb7LgVYbZkcTMIWCAQjEs/CRHfthdOxmJLdTMad0FkWzEOQfDpKEXyPfaSLg3PpFX
 6Vso3jxPVmBwM97QKw3Y/jVXRDBDC/Ltjr/SR4rwzm+rasXspSzT4DM52M5bK4BhVxBYMiNjtv4
 TzyaS5rLJ4DQdUBsTW0TJ+Y66IYpoCUW/OdPh+fArsVpGgLm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f02926300ffceb75c69 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
-	const struct drm_edid *drm_edid;
 	int ret = 0;
 
-	/*
-	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
-	 * results in reentrancy issues since cec_s_phys_addr() might call
-	 * .adap_enable, which leads to that funtion being called with our mutex
-	 * held.
-	 *
-	 * Concurrency isn't an issue at the moment since we don't share
-	 * any state with any of the other frameworks so we can ignore
-	 * the lock for now.
-	 */
-
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
-	drm_edid_connector_update(connector, drm_edid);
-	cec_s_phys_addr(vc4_hdmi->cec_adap,
-			connector->display_info.source_physical_address, false);
-	if (!drm_edid)
-		return 0;
-
 	ret = drm_edid_connector_add_modes(connector);
-	drm_edid_free(drm_edid);
 
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
 		struct drm_device *drm = connector->dev;

-- 
2.39.5

