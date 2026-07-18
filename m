Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D793612E3
	for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 23:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784417774; cv=none; b=hwud90u05kjKp8aErJblSQzE+M5MShCsZxmQ2Nitjnyv8Lfw1pNHlVJcUcFW23sEIjaGbuE/fPcS/+BWNLalyf6wVvJ7IciE7SIpRJxtpCWeKzJhY0vP8t4tkT1LIH04OaYxMdWqh9nWA7nGnRp2sSt0ACjOqK9bDMIZgkc73M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784417774; c=relaxed/simple;
	bh=vUlV0bfkxAr1ke6u+O++/m3ul17qgcqKWxREUGJ4Esw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MDPnf8h7J3eIgOSdfWCoryQcT5a6D0JVEKMAWWOmzQY+/EvM1M2xsvMPhW9yNufcjWqW6iLn/yI6ZfZPSQAQF1/bbM1/v4ahOJSHCxaoPmdC0bq3VUOyHOxBIbZT6gVHJA3GKIhMJqoHtEty7lTWB25XWtEJgmBbEf81mAhNlK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0lNWXVk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0lNWXVk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so42323525e9.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 18 Jul 2026 16:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784417769; x=1785022569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FjNP86ptWMOuru/pKfvMOeLrB2j6SXLcAuojoL3wm4=;
        b=S0lNWXVk4ndU1tsc5BOhCHwEl0rLabZ20znooQYAq6mBYDWjlAjORz6Fqv+IiU1v6s
         8pu04eA+MLqHOS6sR0JUWfXLbe5OD7gduD7/I1L749fRxczlDPJV0OMdeStNeX/ZeLDX
         UmjOgePqI71YRP4piTRycrxwzJ4hLrIx+wF8bQLN2yndHafqDP9XyIkV1zoATF4qUSfT
         Yizgv23GeluLLbDgXyF/7qDSLDoQCTWEtubGHmm3g/FFlSmvpsvMDxkeX6sBaA3gXjw/
         bMMO6aNEyptBSqt5sx8wZ4l93QBzOJPVkXr3zX3Qyw0Tv4TXyjhg6gxC35bq3rhkag1I
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784417769; x=1785022569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FjNP86ptWMOuru/pKfvMOeLrB2j6SXLcAuojoL3wm4=;
        b=ODP6/EhbCvgidaKx20am3xFjJMojh+bOU82eXNfDfsdGK7OE3dPh35XuBhfHjDwsky
         j4InM3glOgUoDDzqQjDvuZpDWNx9S3FvJTwUdO3RE6CYFyrVEbXfpGYIKV0vSjHw2Hp6
         YfwlhoXKRpKBsD3OLMwaCYDsbHi0zaSMSRC/g0FTu1+9n115DV3sNrCIeH8sgUcB3jfb
         s3gCbTlqawb/OW8xglY89h+1MZxYSQg7LyJfhNyfazI4MY2MTUvFAFm7SH4+TcBJ7ATK
         rfSpGqRfPZ71eNEhKUEWtxCaW/lPt0ulcm4S6U9Dugw1YcmV/zdzNtpsb0/+84h5PUsm
         f58Q==
X-Forwarded-Encrypted: i=1; AHgh+RqNU7wxt7N84oqhpguU/qW9LGmGz5iJhOqjc4YlDhEduX84qM7K78I25h3u1eqYcMZoD7LVtjRRCiDBuHa55XFd3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ykVostPkiksW1OMm9P/EfpSBhGDV+Iy0/ryDNOcMS9Us550z
	hpQa/Muv01DNyTA31dlWhp909m68IqjOARewDUqlX2rW2xWtpkLqRc2/
X-Gm-Gg: AfdE7cnZmadRJSSpe3JEH0vge/2kBkpN8TQpzjJmiaD/3A7Sg0yZBNDTwBREa093E0N
	voMz//QPdDfhx0EZ/7FVkBpwf2jacRc1sIRHne137livORKdniWmoMNfGrVN2xa4U0mv1ZR+dBE
	CWIBCDxDVzYAOHk6KENNwpcYUtaoTyvnJcJPQYldKoRrk2Y36ZpjHpHsUDt+9HZCJn6Mj4n1kpR
	5kxOqwCKN6MxsfVFnwi+ZfKZ55oXL1apJXDElnaahcE53KjkLgO+U+hip9a+mYk5y5nX2X6Ejo4
	aaCCa3KQFjIN5mvPBTMrpOCmnbFdkYstpV4PTU/JlMC4ASLJCEFEy5E6UllSct2hRrhEKEFgzyg
	Fttmvg1FkP0KFMj3xkPabWbY/iCpXU3N/zmUtcEshrRjDurV9w44cTsN72wzfP7fbat/tjTlWv+
	/s5zkdAvgbstjci4PL1IHb
X-Received: by 2002:a7b:ce84:0:b0:495:4487:61af with SMTP id 5b1f17b1804b1-4954a51659emr61464735e9.36.1784417768965;
        Sat, 18 Jul 2026 16:36:08 -0700 (PDT)
Received: from [127.0.0.2] ([2a01:14:111:ccf0:645b:9e5c:7fe3:c09f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a24b6sm160964675e9.3.2026.07.18.16.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:36:07 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Sun, 19 Jul 2026 01:35:34 +0200
Subject: [PATCH 03/15] drm/tegra: remove dependency on DRM simple helpers
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-drm_simple_encoder_init-v1-3-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
In-Reply-To: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Michal Simek <michal.simek@amd.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Xinliang Liu <xinliang.liu@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-doc@vger.kernel.org, Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.15.2

The simple KMS helpers are deprecated because they only add an
intermediate layer between drivers and atomic modesetting.

Open-code drm_simple_encoder_init() by calling drm_encoder_init()
directly and providing driver-local drm_encoder_funcs.
Also check the return value from drm_encoder_init() to avoid silent
failures.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/gpu/drm/tegra/dsi.c | 17 ++++++++++++++---
 drivers/gpu/drm/tegra/rgb.c | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index e7fdd8c7ac12..840e118716b2 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -20,11 +20,11 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
 #include "drm.h"
@@ -1055,6 +1055,10 @@ tegra_dsi_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_dsi_encoder_helper_funcs = {
 	.disable = tegra_dsi_encoder_disable,
 	.enable = tegra_dsi_encoder_enable,
@@ -1078,8 +1082,15 @@ static int tegra_dsi_init(struct host1x_client *client)
 					 &tegra_dsi_connector_helper_funcs);
 		dsi->output.connector.dpms = DRM_MODE_DPMS_OFF;
 
-		drm_simple_encoder_init(drm, &dsi->output.encoder,
-					DRM_MODE_ENCODER_DSI);
+		err = drm_encoder_init(drm, &dsi->output.encoder,
+				       &tegra_dsi_encoder_funcs,
+				       DRM_MODE_ENCODER_DSI, NULL);
+		if (err) {
+			dev_err(dsi->dev, "failed to initialize encoder: %d\n",
+				err);
+			return err;
+		}
+
 		drm_encoder_helper_add(&dsi->output.encoder,
 				       &tegra_dsi_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index e67fbb2362e6..337925c30d67 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_encoder.h>
 
 #include "drm.h"
 #include "dc.h"
@@ -194,6 +194,10 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	return err;
 }
 
+static const struct drm_encoder_funcs tegra_rgb_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static const struct drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs = {
 	.disable = tegra_rgb_encoder_disable,
 	.enable = tegra_rgb_encoder_enable,
@@ -305,7 +309,13 @@ int tegra_dc_rgb_init(struct drm_device *drm, struct tegra_dc *dc)
 	if (!dc->rgb)
 		return -ENODEV;
 
-	drm_simple_encoder_init(drm, &output->encoder, DRM_MODE_ENCODER_LVDS);
+	err = drm_encoder_init(drm, &output->encoder, &tegra_rgb_encoder_funcs,
+			       DRM_MODE_ENCODER_LVDS, NULL);
+	if (err) {
+		dev_err(output->dev, "failed to initialize encoder: %d\n", err);
+		return err;
+	}
+
 	drm_encoder_helper_add(&output->encoder,
 			       &tegra_rgb_encoder_helper_funcs);
 

-- 
2.54.0

