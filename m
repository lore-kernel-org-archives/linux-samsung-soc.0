Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6920E709
	for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Dec 2024 10:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733480231; cv=none; b=UVHIAAn9Cj2xQBrkj+SsWfDRYJEJRg98xXV2qeTlgW3OZ0IuNPCWhWKGLoQ3Ermzg5nRJQoEwDGSp9HwM3CYx57Ff1jrzSvIDYJzzlOCGNVEcFDO6mhETQMW/urvRQAxHoxauan7QTo7IwsEPT3rIlhRZhToXw0pLTMdB6HeKL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733480231; c=relaxed/simple;
	bh=7txoET57jmm2MW5aKrjVDlHM8PA3Hnz9H/pYu/wP770=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5/9ZlUTzjQ4itdKkqOPw7cmR9JTuKixstY8+ugh+U9rPoGEiya2jgKSeZZQYeB43qoyDk4RNDhDlPWf0Waktdo1zOyyx7DkeKH8W0Iuv+g0NvIcf3GaY9NpOGR5eu8GPzNrjBmJR2O4i2ufjNkCbU8nfQMKvCP1DL5czScmedk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DmzWWeAF; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DmzWWeAF"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53dd57589c8so3285408e87.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Dec 2024 02:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733480227; x=1734085027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=;
        b=DmzWWeAFtAyNipOFPnoXc4NzSanUJNOSYLlH0jF5J+GJgubPD9B70nq/F00VLWe+rJ
         ES7NGCKmQk8Q/owofhO27kyo8f5vA3guMDNjN+AZLPyW5powWY1V49xMtQY5tHcTwUPT
         Qf33dZPKft9MLVvXf3sLg1myPLumyY3qr6Yn0A7bo2f6dA87GVSYK2MLIYE9AyhOlI/O
         d2sOSYOxw6wrOxacElr7pQ18bZnaRE44+j8GPzpzxSovAq8NNWVSAXVycQR4Tt3vS8z4
         AtS+xQgYjSZdDF37PdYKV8zJb20ZhPppgqdiZ0w4uX2fYlppTixZI1SlKX2T8HqU3akN
         Yh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733480227; x=1734085027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pny3/oZCZ9HdOf4g0MKJrdxu4AmPeKVKO+XjLSvPYWE=;
        b=HGUyG7bU9zE5sv5LVfGgExBuB1WwKOa7vqcvh8V5eJIC/bev1g2vtEWELnrj3EEpeu
         WDjlfcwI5xWxYZNfogs3p1/KRzEE6WgDJizNjeT1W+iu7kWOq5xjwC7upqHZNGqcUtHS
         ZK8iHJXrn2JnmCuVo34TDLbTMp8EBImpoOm3/xXH+exrQvPmVyHEJg6YM2G+dLmij/N+
         KKi8S8rqRb0bDeoaiI/M9b2Bxk6iTZ9GxpTtUfXlVxqc8ytFWeo4Gmkbsp2FWqPuKIcz
         dz6huY9J9Wm1raGyXaCXxHMZQZFt7cRs/tbHIKJh8AnghBodG8FgD3rvpXVXgZM29zMu
         /PXA==
X-Forwarded-Encrypted: i=1; AJvYcCWgkJ9lt9XWl2oKi7Tp85eM4Chh9+J8Zi5mLKUEGFidhsTi1eFpMN7CjVzFkN4u5xKKgotJnZHeLO/JAmK3TLpbFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwpFqDmJsPyqwviJWFvAUPjqhUGki4JMdlRsWV9bbcbWRS0ncn
	rsaYFOEpYW4z8OX7yH+KA06QXGo+UFCWdDm2FOg9P9bMGpa/FLQ60JIhlr1GEDw=
X-Gm-Gg: ASbGnctEFJHEgYtVxAP38+mSyD7ADdTNn4WQwKfPptQg14JS1AT8YyhFTQotfn4/7xs
	HzXybDzJJmEFKPvTVTlr7VyRrPSs2e4hKm+Mva+cjmHYJe90M0Xl3cUfOVlDnIUXChA4C4il2gp
	RNzxJxEC7/Cr+LgBUXaL5ZITrz5N9RZUNhZFAauNzO0q4URRJOH2w+AE2pRdsWLkMm6hGoRku37
	/xY+yFOdPCek6xzxJutflLlkts39woRkg+4fNeOXwcyTQhRsA7qSZmkkg==
X-Google-Smtp-Source: AGHT+IG0QcicheINkpKVEV+N7iY9KUPWDy1N6KSKw3gesi4tsLvAixCI3qsFKZ6xn3HsNze5iUigBQ==
X-Received: by 2002:a05:6512:a92:b0:53e:335e:774c with SMTP id 2adb3069b0e04-53e335e7ba2mr484774e87.4.1733480227384;
        Fri, 06 Dec 2024 02:17:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294738fsm462355e87.52.2024.12.06.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:17:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 12:16:04 +0200
Subject: [PATCH v6 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug_edid()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-bridge-hdmi-connector-v6-10-50dc145a9c06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=7txoET57jmm2MW5aKrjVDlHM8PA3Hnz9H/pYu/wP770=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUs8K5vHn00gwDj19cHn3nMju2ruWputUg2V4s
 rnN4SzdgMGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LPCgAKCRCLPIo+Aiko
 1RVxB/9ibECV3IDeNQwRoXBtxBfb5q/3fQOiAqYySeNrd22PjQ76DgDyRwsiItUPMPc5OBiBz7R
 KSQ40mwZyXC2r5WzaKmY4gs1aaAPiwRIy/TMksz2RGvCApkg4Hd8RszaQi+oq6e9ZLtPrCaUdeo
 Jh4fAV9j95blixfhq/8PiFnIopXyYOGqUrL9GnlglKBRAS/27u0MRm3ay1l/GbNb+sg9tEOmo4D
 TZAS0Fi9bgzcOqAy5fbB10xB4BGALGKhX9Se5PnEl1aK+rp+EAbfkeKXHZ+QBunTMGd2ByF85Gl
 W+VlY+DypXhupcZsmPnLbRDQPG9h1x7PPZr+p5kNFuOmenmE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3364ef90968dad3074800f02926300ffceb75c69..3fe025251f939290bb4430e2f5163b6549479fc0 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -383,7 +383,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -405,17 +404,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 		return;
 	}
 
-	drm_edid = drm_edid_read_ddc(connector, vc4_hdmi->ddc);
+	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
 
-	drm_edid_connector_update(connector, drm_edid);
 	cec_s_phys_addr(vc4_hdmi->cec_adap,
 			connector->display_info.source_physical_address, false);
 
-	if (!drm_edid)
+	if (status != connector_status_connected)
 		return;
 
-	drm_edid_free(drm_edid);
-
 	for (;;) {
 		ret = vc4_hdmi_reset_link(connector, ctx);
 		if (ret == -EDEADLK) {

-- 
2.39.5

