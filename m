Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0E37998D;
	Wed,  7 Jan 2026 16:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802957; cv=none; b=g3ulXJPWXQTpD2sqZJAU5aU00JnCGTUZ4OogrJ9O1to/plvc1/m3JQMvdZdrAUJenxbQNdRI/86o7GWtu5CZVAq6veiLK+qavcfZOg4ujqT2zM5W+FrD4kTFssjFlrJy3yn2/OndePTl7SA86agzTfl6FGDQklrLTuzSFJe90pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802957; c=relaxed/simple;
	bh=Qx4aDeANZ0D6B1htnXHfZWmU+EZlztLobFtAkm1Eh6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M5dVc56sym4iukSaef2vN5vjPt32+8QaWw84cPTLsKSJYTrz1YbNzlmsiQ94G0BsmrVvMU09Ml4YF+67L6K7zUUUWiNySuX9Y6s5vWHzNfKsCKgWjMSL4iO2iOa4jP3fRFWBTDltIGzeLcI7/zkTnwfsQPqbDeYNT+SqKkERZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pha0wCkx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pha0wCkx"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B36C24E41FDF;
	Wed,  7 Jan 2026 16:22:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8502A606F8;
	Wed,  7 Jan 2026 16:22:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 575F6103C821A;
	Wed,  7 Jan 2026 17:22:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767802942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wUXQ33oruACQ84bvMK4XU+95VmvIsqK1JcpOd4ez768=;
	b=Pha0wCkxsAj9VUrxvtyNPAqtMpBbYFmzR/ZWP2ZBmYJABAmUuCaKoOcauZBE1D0F5MHlmW
	stSwWcgixFxFsTHeRDQGvgWzLzsZQh6tNbgWKlAZV2vyFHPh8TdWWnuidjK4YQ59YNQdfu
	/D7e9Ns5hsTkyfeibIXD6dFpuX8d0gk7HUlD39JFY5u2a1ARVgBqXQyM5u78ZefJjrb4MK
	YEH72jbp5bEqjufwRXhTOICCLPdxqin7vzDnHsTutvSQKWg3FcNlUltby5bCxNZVLOWN9T
	OMK9zY/YIO4wAM7t8V6aRKDmOSS6h9ZUZY1mhsQ5RjvOtVrzJ54erI55jfi0ng==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 17:21:59 +0100
Subject: [PATCH 1/6] drm/bridge: dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-1-ef48a517828e@bootlin.com>
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
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 3b77e73ac0ea..ee88c0e793b0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -132,7 +132,6 @@ struct dw_hdmi_phy_data {
 struct dw_hdmi {
 	struct drm_connector connector;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 
 	unsigned int version;
 
@@ -2912,7 +2911,7 @@ static int dw_hdmi_bridge_attach(struct drm_bridge *bridge,
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
-		return drm_bridge_attach(encoder, hdmi->next_bridge,
+		return drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
 					 bridge, flags);
 
 	return dw_hdmi_connector_create(hdmi);
@@ -3318,9 +3317,9 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
 	if (!remote)
 		return -ENODEV;
 
-	hdmi->next_bridge = of_drm_find_bridge(remote);
+	hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
-	if (!hdmi->next_bridge)
+	if (!hdmi->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	return 0;

-- 
2.52.0

