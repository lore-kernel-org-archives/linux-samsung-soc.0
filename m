Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7AC14A4E0
	for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2024 00:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396054; cv=none; b=JIF+StlTrP+dEF//LsNAaduhtKqPFkP5bItKdEuqDCZCulGEnc6xPLiZRmjD+yqqYoEkJZDvDetSh9rb21eW0ocKs4M5S9AenvErQSPmwFxp17hEfgKvfqOdQjH4TXJstBTVbU/klgMfFer3ytV9kIoCzF0DYDiX/ct82HTe+DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396054; c=relaxed/simple;
	bh=Pn3jlKOdfQqOhTgwlNovK0Mjhw+ujx5JcQ8ESvBRcTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gn598WjdaYL8nEpIqQtOLerfaunYWhnYptFivcTkIMtmHdn47NYiwqDwJOnli1qnvrVcU+qFXuT9WOn+czvVGUr+L0rn5dsotfaYt3OC4DDE6CD1L+0WDMmAfWI7KBPfdNbc11gmFrrMfnRvd2p9NKYLdcY0No9Yn8p1e72n6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dDQrV6kA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dDQrV6kA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e399e3310so5614191e87.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Dec 2024 16:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734396051; x=1735000851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=;
        b=dDQrV6kAOsz4eoZMtKnhNs/JSMxdTOjOuEZcv0rNjPYxjoyz1apJi/mL4mMQS0bdzH
         z7T2DhjPQJ15SpbSWnSin52K635gOa7phM+xeREgfRhQZR4bg+sxgHpmZY7RVvkEZkNV
         ipLPDDIOzNxeT0DaE++02040nYv8L5a4M5WuwMv3x1SLCpYuaYXH6cW4mN8Gm6T4ROIk
         WvWCSYkHmLgKMOGqRhT6MTXbLTH9evuiscbRPA5SuHITebDnJnSPhdo06JIQH1VGQLKr
         N1TIQ8WHqEaE3c18KgHbkTiL/CN43ywAOzGCuXBHnK9J2WLrvv1HtQjjEo/qFR/rOZpL
         Rl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734396051; x=1735000851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOV9LGB+7crRuSYkJueJAduPKSeD1LHvXO2AOg6QFD8=;
        b=wU3DGQkbolu8RbsMJE0emeka5O8ncy5l599x+ncpU8SXpopcl96tl7ifvP1bbXZ7my
         b1TRwuRIc2bv2e+3rDOYTFREqx06AIlFLgSrjs3/+W8RHFbfD7P1TiPRqwzelpJpKmYK
         MNDAksHkdCF1dTxuQ1cBvAKYTKl2F7KUNdWVXL7pUMIbJyPx8e1a1Y7CWZBAaK3TwU92
         lkrSkugE6muHE46ufw83evRqBPVBCwJhs9ysjos6821L0zkWTBMxnXGDDScJDXkfb+Ao
         bnYQxG65to8LZvQcC2VPvr+kkWkit4Z9Lm8jW98RwblO86l5F4kVD9t9prlbxh9Kp9DD
         G0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUAwYH2u+yCGsQGBjhFZ5tF/sBlS46rA5cYO/aXcf4mjyiSiNHiJnJmnzGUobBNJSBxYryP7PBGx+hmbFJfxGzKGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZqQETDPkY5LpTZ1+o0DHDWGlrT9V6FKanWPFfmSf/sr2xeUr3
	8Yga7v2XyNRPJWHRy6JqC/HQwjeepGuxKr2juUg2CCchv8UKyNfUfvyNARVnHfw=
X-Gm-Gg: ASbGncvq697KimEAd5/Er8Vzsmg3Aox3Cj734++/jZubI2KH25ogZs4gK1eoD1n3+9u
	t71Kh8MS4prYjB/BDbkSXLVpFtdi9hJuVJGFVzZKrG5F8ri83ELjlhloUYE9PHDRhAzT8yfsrnp
	SJqbO8NiHDsGPBBUCGGOeVwYvp1M7KIYTTIW3elEGDJz/nK0P+oehXNJXX7w2/hqztuUC0/izke
	VfQx0qR9qZFAKHoztVbPKkXJ56mE2TBRtA0sYWHOnrPorKTpuYgUSAk4O2fyg+m
X-Google-Smtp-Source: AGHT+IHw7VXjrPeZhfVp33UgiptzZosNfvLSX3nNYvM2KHEjnFm3we6xTly89BdAPcurVBRYJ3TzIg==
X-Received: by 2002:a05:6512:3d8a:b0:540:75d3:95c0 with SMTP id 2adb3069b0e04-54099b6aeb9mr4716425e87.47.1734396050964;
        Mon, 16 Dec 2024 16:40:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9ab2sm1009122e87.74.2024.12.16.16.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 16:40:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 02:40:31 +0200
Subject: [PATCH v7 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-drm-bridge-hdmi-connector-v7-9-cb9df2b6a515@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1884;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pn3jlKOdfQqOhTgwlNovK0Mjhw+ujx5JcQ8ESvBRcTY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnYMh5AcX6vqsmyTSEOah3v/NRfb59bBLsVA0Am
 5PF/UeNbMuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2DIeQAKCRCLPIo+Aiko
 1UYkB/4nmHMFle4w74ujOB7redDUAjj366h2sS6n0SYJQS5bY63lKUrcybdCpnPcp6IQgM7zPJT
 KI3Zu9Z+K2ZvACjsEqw5/l2aXc0xEcmWTAKox52w1HpK+mxERTYSNrKnEpHylqTK2aOcQrkwpGb
 90JB3CO4lyUmqID7sOLHsfS3eqBnYJiWYmplzScjqHDslUzYcE6rjuZaD3MtRPP2RLHo2S1yGht
 YfwBKu2NZ6YKX0LN9PAhJb6RXOuJ0S37kgoycJB4XyXb/p3yPs0dM1IhItwoki1nGLfBOB3xKEY
 EjldH/ijsNmTlfSrYitzNGnCyz43NBBdHpkVVJnf44FwvI7z
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
index 2a2aca7017994779a7163935df3fc87ca312d6dd..bb5e8738845c74d975c1e0e1262ced46e4ef8fde 100644
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

