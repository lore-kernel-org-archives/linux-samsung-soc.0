Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE22F5A3F
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Nov 2025 16:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348861; cv=none; b=sWP6MFzwpC380qxbOmAo435tndlCukss4974LfT0As7gP5aEfplT0QOqg2ovzrsfBt9XQafEvirpG3iJKqwcnBB8lwYhxl+KqIVvE7AdBHL/g48IQU5Rth5ywplz2fT/uy4K32JPsbd7ehkKXl+HKjT27QgKWIUrP+8IV3qjNzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348861; c=relaxed/simple;
	bh=Q9kayNqF9azFJ6cPzl47mPimmHyuw46QpsZzx41o/4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyK5O7RmTSfXILmWfeticmTBd79GOmv/X02lF4oTo6R/6j0tbgdUox6VdIyY82SepiQ0fHB1rb5FcSX8ESr8FAKxPf7o8j3ipwP8C2B3po6DtNxMueH1v+ECv20DIewus0k+77vmjmkKNP1VfNIajPN+nL0JDetcDqWk8wNyLaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZJRXdtVJ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZJRXdtVJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 649E1C16A3C;
	Fri, 28 Nov 2025 16:53:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F4E160706;
	Fri, 28 Nov 2025 16:54:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8D2A10B02189;
	Fri, 28 Nov 2025 17:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5WAdl9mF/5vmOeq7HjMbS/w4YcaMEw0PcVLTVO9N8Bg=;
	b=ZJRXdtVJ+OtHF5FjaXM78TLQNKNjEsmYao6LihS0FqfEsa3rxyeylnvgf0yQdP4kGfGRN+
	dx+RmgVTwOX7KcHCMkjxLsSepp6Aws+MkEnhswjWuZ99+7PhAECdC3WGz0mkpKngocZRyC
	fb1lxDLX4ahZyiXxMbPybSYnGIkSdSdyftsaRZvTfhBFpRB3ZSLCLbftxY5oiB0uRtva+h
	91uqysczMslvOk4r69/DYMDImuw+z/yKbz3c/38+D0Uu5/U9tp3VxPUmqr44DwPgfzaWFM
	a4pva8vH1LOSqyG03DDkRi3l0g7zSo4EdrmPcSVcCwQOeEoPrKiKafFuunB4oA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:27 +0100
Subject: [PATCH v2 17/26] drm/meson: encoder_*: use
 devm_of_drm_get_bridge() to put the next bridge
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-17-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
reference on remove or on probe failure.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
index dc374bfc5951..bf8588a5f6dd 100644
--- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
+++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
@@ -241,7 +241,7 @@ int meson_encoder_cvbs_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_cvbs->next_bridge = of_drm_find_bridge(remote);
+	meson_encoder_cvbs->next_bridge = devm_of_drm_get_bridge(priv->dev, remote);
 	of_node_put(remote);
 	if (!meson_encoder_cvbs->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index 6c6624f9ba24..6304f51a7e7e 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -120,7 +120,7 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
+	meson_encoder_dsi->next_bridge = devm_of_drm_get_bridge(priv->dev, remote);
 	if (!meson_encoder_dsi->next_bridge)
 		return dev_err_probe(priv->dev, -EPROBE_DEFER,
 				     "Failed to find DSI transceiver bridge\n");
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691..e2a871347136 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -390,7 +390,7 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 		return 0;
 	}
 
-	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
+	meson_encoder_hdmi->next_bridge = devm_of_drm_get_bridge(priv->dev, remote);
 	if (!meson_encoder_hdmi->next_bridge) {
 		ret = dev_err_probe(priv->dev, -EPROBE_DEFER,
 				    "Failed to find HDMI transceiver bridge\n");

-- 
2.51.1

