Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC476378D80
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802982; cv=none; b=hFfYTOpBPVmDmwfA4Gfmj4XdPgk58TnrOYR5s3hMNCOQDa8OprYqYCYtGPpa2yJEt50wrYEs3E9JeUSEt/6uRId44+mtw4Cd0JQvXfdS3YcxbRyyd01QBVu8LW6AS7JMIpgpgXPU+A1ADbp59z4PWZmhxPQp989cE3Rc+YkvVzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802982; c=relaxed/simple;
	bh=TlE3YDvy+t5RtC+Km6LkK0CiyIuQKjYCOd/3ddkTIKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eJk4RlDYD1q7IJkuB7fqRuxqrg8N2FJHYENBV901Qqyxhi5nUL6rnSELN+TGys2c3PAhxigtfWrsgTfAUy2ARG1HnDdMttjQYgsazQhQgL1dt/7UiyHQelnJqg7Nu4UfWAiG3j8KnDr5WF7y/oC3aHJ6GP2pocS7V7KH40ietMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0PBXQU1I; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0PBXQU1I"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A7BE51A26E6;
	Wed,  7 Jan 2026 16:22:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C448606F8;
	Wed,  7 Jan 2026 16:22:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA559103C821A;
	Wed,  7 Jan 2026 17:22:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767802968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SA0cq6vwDyGvyP6SIBlq9HJkNg1w6ZLReUneEYt+F+A=;
	b=0PBXQU1IufSv9OAninwcHSoJr31ZcYtsGaC0anMJOqmxGaJiXaUsN7KM3zbRJlmgQ/00cN
	2rozTMU32C/x2p83caDuDJtst5RQQL6r9XKMCkeYActN2bR5+sagZOR/Cw3VkgZ/26Pk2u
	2iZKtRENzWlZf4JWjtnx7FvPTQrBEVuRRoPYW/CGOYHIezJxXcgz4KneTFZNAVpIP0pjDJ
	+24Mk1qaBmnA/usF75Sj7y2oXum8CDyme0KNsBfl5B1AvnjQW9RN/LSYJiJVzIl59oTWNN
	6V2A+y8X+LGvZNLzzscItdC2jdgJuwEGmWOPpp6IFlC3nl7ett+ZgnqJ1LrnCA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 17:22:04 +0100
Subject: [PATCH 6/6] drm: rcar-du: lvds: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-6-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done.

Since the companion bridge pointer is used by .atomic_enable, putting its
reference in the remove function would be dangerous. Use .destroy to put it
on final deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 001b3543924a..227818e37390 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -633,6 +633,13 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
+static void rcar_lvds_destroy(struct drm_bridge *bridge)
+{
+	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
+
+	drm_bridge_put(lvds->companion);
+}
+
 static int rcar_lvds_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -648,6 +655,7 @@ static int rcar_lvds_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
 	.attach = rcar_lvds_attach,
+	.destroy = rcar_lvds_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
@@ -740,7 +748,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		goto done;
 	}
 
-	lvds->companion = of_drm_find_bridge(companion);
+	lvds->companion = of_drm_find_and_get_bridge(companion);
 	if (!lvds->companion) {
 		ret = -EPROBE_DEFER;
 		goto done;

-- 
2.52.0

