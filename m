Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF4B190470
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Dec 2024 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735004910; cv=none; b=MIGFAJfnbGdqDFGJJnBhzbDTh75M4bIHOz742+Ywvj9+a0QY6oAA4ioAF+hCC3QU3LoXYKe7cyFCY4XRLIM7biVfFXJMHrfulZuoHaLgv6cnEdEkc8qjwtHybcF+ybTvINO8hRaNWiYUPkpQJ/Xlscf+/fYilxHSOSgOdcCcVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735004910; c=relaxed/simple;
	bh=B+VyVi47xGS5Rgo1fXAf2iMXQyx6B0hUm57mitVwu5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xg21vyZErE/vAF00PAoMpKkhxQYOS8JjZK6P2iNDO3XDilP/cTZsHOFy2YeWALgKmS0L4StDCTywVBuplhMQbkeh3nxFzk/8Pa8199TnQj8+qZpUIRqd5BOuKq1dkGNSXNJ9E4htiDSMdLmhKll60ZLAPJWwdyEwYaooUL+XvJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iz4c21E8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iz4c21E8"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54026562221so5013975e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 17:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735004905; x=1735609705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
        b=iz4c21E89IsqBSixg1Ijgg6Pdg3xz2qajc7Ld8qKHNo5CMb4+0wJv/2c/xrKCGYKwa
         /iRx4IaYoPlV0uutV3642wQYM6pKCQ6fMS3GUIH0zzvgMMf3maPf7veJmclo+TLTTarh
         2HUzY8A6VUUnLUni09zQZofoAHaW23UPuj3NLzkzCQLxv8bvGXXmQ3xpluX9ME25QmnR
         pzr7EXtBd24ZL2rgU/56WoMvxNh+bXBj3k8I2upkoOI9V2JF6UxKLGB/4j0EXwkoPC3J
         gNKPVFZ1v2WULUEREuEuFGry02cMSVkvvJAUXRtFDcCnQ/t58psvWJCQkpsXCdN+Qj50
         N5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735004905; x=1735609705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x27qjhhHmmSFc4Yew7R/X79LJ3J4qUtREtZZ6cr9W9o=;
        b=q4r5qxcgpK+oyoW7iDHpsV78pQQVilwtDJIcoSjH0TQdIStAavOZzZ5O1ntD3ua05r
         FaVKwxJiZZZSREzlUNdbIGd4n083u/EXuwq0WypnyETyfaofAnXHkoAI95H5SVHTPWK3
         dKx4xWHPrYwhj96tRqLXDNz4CCPeL44DzIfSUUTs92uHsY4Ch4kBnyvhBcRA3C0oZZ5D
         asm2brcbYQuOzZ/YZAYWppB1lqwDEGBVNzf9BI9qhnji7Sr5TW1NhcQL9K42Y4uzEr4m
         0NjbstyPmmD7m0RIYM4jQ9I9he1SA2hhkkizuLT5iahAHqiIQSNFqU5tNZch4MrbSIqr
         Gefg==
X-Forwarded-Encrypted: i=1; AJvYcCU06NISM6Lv2TkBejK2L75ZuV8TGlN/awRTrmx1IKjBrHh8CONIF4miOEctzGcWY6NzEo5HX9QK2PhqM7WRGBJEDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNjYo6tIA6IbRkYt07Qr3uAFXgjb5rkY/Avoxvzhs4UhrbkML
	ukWC0fZFejaKpXXK4lJTgCSCPIPbVKflBtw/Gvzy+SSOnDl+2qC5BDFZENCLzr4=
X-Gm-Gg: ASbGncuDpen00THXXzjqZrS/KF/ByrWBb6sPEqGTvoxc1qj8wSq+bsKG66ocLFE0NHP
	GGeH98g4Ot4c9PMndWd0PkkNWKSnxxBnqAwqniqh21nonriUjqy8TFkDUx6WB3+NMkHaifx7Rvq
	KS5mR4TDYZFhAqSmOebbJbZ+JXH4sVa82/Gmqr3bttM7X0bRze5hjjoCZ44zGL1peUKlTGy7bKM
	ha/R2rhCXoT3a9g71a0lOk778MsJZz5+3sHSpCipCXJnOuHmIfSnWFFsOn1Oqkm
X-Google-Smtp-Source: AGHT+IGxywAHlZ5biHokHnOEm3MPf0yFL5QnCm6g8X8iUKGFmxEoXLpi8MebkWFCTzgOs9+bQfvDzA==
X-Received: by 2002:a05:6512:1245:b0:53e:395c:688b with SMTP id 2adb3069b0e04-5422956b5b1mr5020537e87.47.1735004905376;
        Mon, 23 Dec 2024 17:48:25 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f6509sm1425988e87.25.2024.12.23.17.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 17:48:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 03:48:02 +0200
Subject: [PATCH v10 10/10] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_hotplug()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-drm-bridge-hdmi-connector-v10-10-dc89577cd438@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=B+VyVi47xGS5Rgo1fXAf2iMXQyx6B0hUm57mitVwu5U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnahLO/eNo/39x/HJrv+HFXwG6d8BCBlotDoJCU
 qqGZkD6mo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2oSzgAKCRCLPIo+Aiko
 1TWHCACeIhaoB+aD1Id5dsTO6uA+nC/AVkJRJD/7UYmW8Ex7Zn2qDhEmWtBdITotMWW3ByYkUvj
 uWd356HEakck9NA8ieyZDfqWEWxIYpA8KfFQcvIFiYtmcFLi8kJSZDn50oFIpYvQaj2/gM0dAUN
 p8u9lmdLuAdFhoJjHaZawfbQ74cmm6k0F0FhKKbhW+u/RzdcsQu+fDZ+GzwQfElhQt5Cabh9VTD
 9m+cMW8Yv8g3rD7N8BgPs/xSnrX5W/1NqXWaD3O5GzP50Iks3oWr3bfaQmjdOpjCu4PWuKpHVmB
 5WNoz9+G5V+lgNo6KogfIsR04KOp+MyB/Lr4QH+DuZNDR5I1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Use the helper function to update the connector's information. This
makes sure that HDMI-related events are handled in a generic way.
Currently it is limited to the HDMI state reporting to the sound system.

Acked-by: Maxime Ripard <mripard@kernel.org>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 4949171c28876a9145ddf03e99c00feff4df255a..47d9ada98430634cfd8c1e21c2a4d00d501bab7e 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -384,7 +384,6 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
 				    enum drm_connector_status status)
 {
 	struct drm_connector *connector = &vc4_hdmi->connector;
-	const struct drm_edid *drm_edid;
 	int ret;
 
 	/*
@@ -406,17 +405,14 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
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
@@ -550,6 +546,7 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
+	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,

-- 
2.39.5

