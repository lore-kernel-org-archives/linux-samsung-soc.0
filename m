Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4BF191F9C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Dec 2024 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734922765; cv=none; b=P7N2MrxgAa1LPpLgzCJvlRsj5RIn1inKSh4zaxJD1jKp7Sf/Xtlw7D7ndmg10Ics+xMCZBu3fmeoTQe4j/xXMo7aGQKMMoFDD8jKxvAxme7qGYvXyEHx2Yq7Ayjx5l6dOT7RtX2vR1juTdNARxeBkjFR+UxjFSCcNHtNUfYqS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734922765; c=relaxed/simple;
	bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY7Q8TCgR0shrU1Muucui2s7/D6ix4r3usUU4hU0/EpxcFcQqLQSh14ByvGCR8KiejSq1lfObl3aZifg1NwMBCc2haY7xdI7A0gf2uQU16DxCKfqNlE511W/IBdCU000aM/m+I5Jr7HMSp6PvS33FEnNyzEFaT6J/Zsjh4ZZV1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZ9V9bUf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZ9V9bUf"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3c47434eso4112486e87.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2024 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734922762; x=1735527562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=KZ9V9bUfCVZWzza29OFxJq7Ues+YNdgyx5eJQPvv7X40++mI2u+5SQ51Nknfphr1UG
         3wA6P7ieTbfllQ7WKnpKYkxWC5xU24BW0fQUl0omjRbTpdeJq7qLXQf6UzvGph7BeNZz
         1q6KhUZRWM9R/WiQFg8kKWQhTP5zCWugvsoMOA/rZGqq7hkDGDNV0lh0emPFVAlt2Top
         vvFDg6Bxb3x/IboHRKW9iG8Rp9fUZw/suEzLVTCXnHhKyko72058BBUd7S9YfDEh1zRT
         0xtzj0CpLXHV54Z0hOdqtbfZYkIhmSwl6sPiR4shy+2Gy/57GCptBbWPo6jwg6ymmrST
         21jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734922762; x=1735527562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M6HwiDjtz6MVhwJBxGtnK97LOfqJCVvtnZY32TOfk0=;
        b=eNXjLVAcTr9zXD7K35th4fYI5kELHcITHqGgqNdJYLg2a9LnJ8C5mJlIciw+IDijax
         3ZjQCydwg6IErtLr8Lu70fBhA5KUfRS2IrX61bm5lbHf0nhSKVtlaNmxNmdO4Z1PWa13
         m89adbyAAxVD/hOUHe18ezXUgkAFsnJyIbCqSZgzEyShayfFEjfFmeYfL8iHdH2snt9t
         jX+kUln3VesaT98Bg6RbI1InDvMHlxHaCqwIjNgkVszsQtDykbi4kSo3j8VZdtGSy28T
         XoRsJKfMrm0ndY7GKxfoIjfNbZq+2HEuFHS/dpFNaFKMIgRwXcRwsINqjO1wBnOlp9Fc
         y9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZuRDCqBzdo+cXaNQ2jFDmcuGxNCJ6fzuC2FWrSlcy/VJP+yeEVjWYsKOweSdO9xwT5h6TazWAF0/mbursTKdbeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ6SF//Tpw51MNnUstVeGTJi8XY1fosrk877Oj54uM11AA5vJH
	YYc03X4FXEfWvHcmfQqgeQEgq0vlDBujl2XxL8bHx2BBRA/50rbsCSmeKE8upuI=
X-Gm-Gg: ASbGncsZMJ43IJD7y7AUcuL2QZCiqYRHUZPimySUoAMvFdlotEL7n6VcKwMOBr+WYrT
	/1eokpMihTSsgyMBs+uCBJfiOZm9rizETc3kGbfE6+Cn+RfjLaqbtM40XWbbMY1E14fjLZpPuZG
	pYlGA5o1ONofOlQ9EgY/8rqS8/CihuTyi1tuuploQbYNOwpMRe767mOAKBc4sIK8D/+PF7mLWoJ
	Vc8LFR0GwfsA9WnZseLbTPxnxaS0pPx1YpaqJeDDbmXQYrkfK7sES/3/t3398IA
X-Google-Smtp-Source: AGHT+IGXP4rXvq7W3fLpzfisWqyUJAOUer76ywuuwhoE5fp8LHSToAxEcbOqHJy2piepiuWIG7rxUA==
X-Received: by 2002:ac2:4e07:0:b0:540:25a6:c342 with SMTP id 2adb3069b0e04-54229525435mr3832068e87.4.1734922762189;
        Sun, 22 Dec 2024 18:59:22 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f658csm1124639e87.44.2024.12.22.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 18:59:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Dec 2024 04:59:00 +0200
Subject: [PATCH v9 09/10] drm/vc4: hdmi: stop rereading EDID in get_modes()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-drm-bridge-hdmi-connector-v9-9-6ce16bcedb8b@linaro.org>
References: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
In-Reply-To: <20241223-drm-bridge-hdmi-connector-v9-0-6ce16bcedb8b@linaro.org>
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
 bh=zd/Y8mBxMdBApDi5CzqJHH1RW7mj7RyJYMvyUl/+gqU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnaNHxS+CfU4MvBlw2osJl83QA+wZ5kGncYgdoc
 JR2tU6eRoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2jR8QAKCRCLPIo+Aiko
 1TOJCACrRFuRB+oY+c98sRz7Ma4pmcP9hkSpViEb1HhcqhQ+wSNrwsLQ11Regmd4mJBK79nOzwT
 Nfpri3HXgX0HS3qFYrZcUzi+B68x6wvwU60GwKMd/PZvyFIX8OxvcXzgOk2EQ/3yygWo8fFGThO
 X2MGTJqbpeegKvCKA3d3otC6Eu9/QitcjoKBNIh5HDbkAMlRMwzWQ2lriSa9FMiZYkSuA8vpt76
 bPSe/sIipmve9fE5crzyrvzklzHGaOofu5vsyHZI8cgf3TMNtOEi0MelWz3Xs3r09Ix2sCQ34be
 pLuk4G41OLEBneTNS266BoRuUdJI0xxWKkNROz1buEXtKh/I
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
index 24199b511f2ee1bc3aa5f4a30e9d3d928d556ff1..5282dd765cc9478361a705dca85f615015b12e8e 100644
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

