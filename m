Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ADE18DF60
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004906; cv=none; b=CaqJSf/DVDW3e37F0UbPaj3W68pE4QDqdOn7PcK51MozGtrC4a3EQGz1uMUB3UfiBXXc9iqq1Mk+GsBFliO27np47qjGf7JGTCdtXKZLmIx9ApdXRvSVm92MT6tKETuV5kKliat7xOcj5LAMhjAfvzEYSsJtraHeajH2i3DvPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004906; c=relaxed/simple;
	bh=zCYZwtzzF6aS6IU7PuhTpxheZNTVNw5P2rLwr1yXY7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ks/WRKpCJZo0IIXgfJn3XVF8Z9bYIPBsi2h6CEtusg0vleyy0H87h/3uyuJ+KVn0BGP6a5qVzrsEHV5TosSlTU30yo7RTbpXBI+7XQmKCOikpIQ+IB7/bzbwreOlKwQEH84wQRAqHomziADdueAsj19d20Q7lTX3ypPxI+9Pb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=enkZoc2X; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="enkZoc2X"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54025432becso4958958e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004903; x=1735609703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nJs58cbfMJKQeVAGp0JHG5pyuxuSDegdZpDL4/kDow=;
        b=enkZoc2X5vqM9nrcrottdawDUSPyWgfJRejuBlqdaTrralKGWjSy2tgJZaSUVzP2/R
         ur5dcPRbs7DxTVVaPljLQEXrsa4XoNZc/c7Ti9VFQEa2UhyaI7BfdNYPyJT1vRXPW8xC
         6KIQhxU20iuFZo2T5Gy9DmW+5bOo54qyF4DKM4WFxYDkfhdEFBGzEmfn3G65qBoCq2jd
         HKaqcPi9I26LmvOTpcXoqQbYdb2AGDLqrG50SdgRAQnlpSPoSR1CyAZKWGDd4+o71KUj
         CxyYyEBoBWXUGxtEp5B0dDaW6JCoKAvkDwOCl7L5YXQ4/OB2NMElSaRQYe8QC0g16Yrt
         eWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004903; x=1735609703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nJs58cbfMJKQeVAGp0JHG5pyuxuSDegdZpDL4/kDow=;
        b=C37Dj3iEykqWz0qBu+yAR15ckVm4DDE3vlv9rNYxFEyjvxm5pQO9YHWBtm/RJ1vA2p
         dhQve9L7vu44czibNKZQcusxxy8kLkMpF4A+kRcjPPiz26w3VRfVVIziUjUkw838m5xt
         lU7Qar2vRAEAqbzbAAw//TBTt8PMgWjMyggTOcJL3nIbIMIt8reYj4IPJEbDsBDVueMc
         OTM2WAjZofb17py8Yip1rRDNwmljzw0Igpmgi7KSoL9+B+0JlqhEPBu49ZVwZ3F7G9LA
         nmjlI9t5NVxgxolUYi0IgDpAELqwlk/oeM7yZNHg0ElKwLlYxqsuZ/N8n9G1zUxJ7MlG
         YZQg==
X-Forwarded-Encrypted: i=1; AJvYcCUGQT7czQoGvs2ZQmjQpf/9mQAnLg4wPWUirecSLoJuaHS4ShzGqKzxRj/vpNMmvIOMS1pKmniDWIsW5VebRlcbaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG0jGWcGBi1j6029ezMR2UR+UjXtOBYdXdoLO1x1pRMtGYfNNY
	C3P3OHYEy/UcpaNNzHCNxwKnQ2hXkR+SrCaR2gkQBVos6ykPwBESijWKVIswc+QRNCLFVvyirDk
	M
X-Gm-Gg: ASbGncslo/mQmywE8volPBo0HvPyQrVpQm0lwUVum4lU3+mAjXALYcMItHcYMK1qro0
	czbXwkWBYDFbmuUl94kN7Dwz2sZH2eIUoXrv+KnqLTnJuSRIqVVwNSQbYTJ0mxGJWQqkJ1Fbv7Q
	AqdeEmttMJ+fD52R40grDxg6YDQjsZH9ZctkXfVvEJeGdNgjDCV8HUI9KD0jLzuWOrqX4pzpSXQ
	cBObTLNMiWNM0xLop+wPj0WFZPZ33S1KgqRj/yYIGAVF/V4cpZ3jGnYlAwUYFIs
X-Google-Smtp-Source: AGHT+IGF1X6G7LQaBvibMCKszSuu7ITNK8iX9zbONnj+RwH46spk+ukXUmmAo5oN2pulLqrWFQ/iYg==
X-Received: by 2002:a05:6512:4389:b0:542:234b:9a73 with SMTP id 2adb3069b0e04-54229598a1cmr4180618e87.53.1735004902766;
        Mon, 23 Dec 2024 17:48:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:01 +0200
Subject: [PATCH v10 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-9-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zCYZwtzzF6aS6IU7PuhTpxheZNTVNw5P2rLwr1yXY7A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLNVoVTN9gpByakXsqaMqgbCvYXwFZg0TnPv
 Vd1A7oO3quJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzQAKCRCLPIo+Aiko
 1ZdPCACWQQSlUlGTcJnAD9tRCc+l8nBAsyC3OrLEO47kLEFy7UsLp+ihq3+Auxcd0Rm+V3d0d2d
 pbphQW0o1WCEvjQvBS/M99jDRXN0ypRZWRw9Tqe3gHtJOzG+Ev3+H8mvH+kD3HElVWJyX8XTpjD
 Dho8w5OpEITEKGomImoqLkigYbCxGIqpdSJ4oB6amNx5GWQPef8tIw0qNfgaHTTn91R3dQGLRtx
 0Rqp9zJ0rUMlBufaq9ZGkBM3tt3gdDHMkVKKQn4iWycBqZCq7/MintLJTJd/2+PfzE9T2zHgzCM
 dldF8ODo2w1dg6l47B0korv9Eiyx3XtcUCXKoT00fwDziKW2
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
already reads EDID and propagates it to the drm_connector. Stop
rereading EDID as a part of the .get_modes() callback and just update
the list of modes. This matches the behaviour of the i915 driver.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index cc5fdb23f76f4a4730ab9eff9b47f5d1507aac8f..4949171c28876a9145ddf03e99c00feff4df255a 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -471,31 +471,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
 
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

