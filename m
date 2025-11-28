Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600A2EF652;
	Fri, 28 Nov 2025 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348827; cv=none; b=QmRWFGAfDsEXZWEq1cjVTaea+ukF3Lyfck6fU8omdtH0y3XjrixNchh6F8fncW6BxcHzH0gjosPFFthwKv4nFNB1DbBCTKcw8VcIfnPoFm7R6HuhOXVX0/0souqt9bfQQ16j5bBeumCWESeyHAaO02Pw0SOxmF/dQVR4GW6mMUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348827; c=relaxed/simple;
	bh=hKPicZXpwO5U14vbZc+g3T5O1TMZ8YWOTXQyrz6KK/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ax1hZop/fRdh1riJl6tlfVFt3F/IqcAxzxQSc/h2C3E/S6OGoth+3PUgXyHGMzBOLb9mOLPu7LU/9n7cLOjeFokS6AAxrs946NFxnQ/RqcfkbjGXWzariIq/kE/EhtfLiV7alBTMyd3qHKMeaSDhgvmFq2XkJLFV1lVatr+fYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zVFRb21y; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zVFRb21y"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6AF944E4194E;
	Fri, 28 Nov 2025 16:53:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3ED2B60706;
	Fri, 28 Nov 2025 16:53:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75EFE10B0218F;
	Fri, 28 Nov 2025 17:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r0SeZhibaHmgTA3+OXcjuF8nwebchOJQovKKk2F4Pvw=;
	b=zVFRb21ydmijis1wyGi7Dyg33XdiWZk43jdjKDoE/4kX9o7L2t/s5I9L6NHXS9p5B7kABH
	u9FlRuctCCXA1vilhDv9ZsFlBBU1X7V1vIlfRPxexDjDKHWlQlro087EDFMNtWwdz6kAkd
	tSyoOXXGkvcuTuq9nOOKanojBkiHuBWJRRkKE1/TEYq0ja8uopP7ZtCxAT/9QVeLV2hNEQ
	JyR/wO4QKpDEMosDAoPn7XAmw57Fd2BQKhaJSI26+IbiyFyAbRDBRJOBxJd42opSuBq/Oy
	Gwrgby+xl/Qwf/loFiLObwQZkgrgp4kyj/RaZmD8jdJEb2YctaUMIszSaR/Efg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:23 +0100
Subject: [PATCH v2 13/26] drm/bridge: lt8912b: use devm_of_drm_get_bridge()
 to put the hdmi bridge
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-13-88f8a107eca2@bootlin.com>
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
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 342374cb8fc6..e83ea0e727d8 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -723,7 +723,7 @@ static int lt8912_parse_dt(struct lt8912 *lt)
 		goto err_free_host_node;
 	}
 
-	lt->hdmi_port = of_drm_find_bridge(port_node);
+	lt->hdmi_port = devm_of_drm_get_bridge(lt->dev, port_node);
 	if (!lt->hdmi_port) {
 		ret = -EPROBE_DEFER;
 		dev_err_probe(lt->dev, ret, "%s: Failed to get hdmi port\n", __func__);

-- 
2.51.1

