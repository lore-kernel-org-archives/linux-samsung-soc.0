Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B528D8CB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753091035; cv=none; b=tBBgwVjgoxefBeVLijoA/yNwvQuf29vMMVAiPjSTi/5K5scd+bHNEDZYzKmafB1d61M6AOCeBwUfJ+d6RXI2tAM6eWgdq0JQ4sZtUlR0jvXchXzrVhHUVqGnZP6a6FhhYc/scHuofu/mtIoY8uDpMPxgcCVcLR/U76ABFOE1aZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753091035; c=relaxed/simple;
	bh=QHXGHFXuTsdjOdvOFvsVyCMBCyTudAbMgmdgOuKio7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dvKC9pqO39icziB9ZUasJCKyU/v/+e96eRLqXvuTMWTx11IFocmpAXI0KgIOYsPKbCF7VWEvwJpSF9CBbDeMBZi72TuTbE2mkWL5uE/fR/YdWGFMwAS2seUpgbGi8Klwlf2mvNQ+tzP1hQFJpawsCmBD0vo5aLP+XHo2GnkugRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=dqtK07zg; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="dqtK07zg"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753091030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9J8Q6nI+kE6dVKYCKcMhHtBZibz54RqJK7hL8Sg/lQ=;
	b=dqtK07zgziOvMYG4HICBxksYSxrXoLe8gej8MuaecTskrorIiO/5rlzpWSGkRXfINx0ywr
	uKBnBQ7zhKY53AM5JW2VrW4PGDbHCgWC7Z0gc/oGdTZwCI0k7srA2lRQTc9LAFNXtPo609
	SEu22n7GUk1lLr8DHyYbrQ1uTTHsMes=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 21 Jul 2025 11:43:19 +0200
Subject: [PATCH 3/3] drm/bridge: sii9234: use extcon cable detection logic
 to detect MHL
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-exynos4-sii9234-driver-v1-3-2e47ed02f677@grimler.se>
References: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
In-Reply-To: <20250721-exynos4-sii9234-driver-v1-0-2e47ed02f677@grimler.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maciej Purski <m.purski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173; i=henrik@grimler.se;
 h=from:subject:message-id; bh=QHXGHFXuTsdjOdvOFvsVyCMBCyTudAbMgmdgOuKio7I=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBofgvLFNVB0QWRIEgdw90xBe01dDqqpUqh3WSug
 1b+WcQ27jqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaH4LywAKCRCwB25JC3Fh
 a8t2CAC2Qa3XCkijFxzKacvil9jrKn6k9ZUuj6eCnPPxJ0+kakMvvk3fUIHtaZrCp+il5Mua7d5
 zISfM8/1fjP/8ywj4Wi1P44KikM2LK9MR7pXBYyf73RQ4Adtjg94Tj+jLVJNG8q0xFox0JY4pA/
 J/CiexNs+GYWMXrGVuMPBtvLVvAxGkiUwlSVcR7j1hWyhuhWSdPGPQUxnUANsZPHw79OT+TtZEV
 RhP5n/pHto2q48+sLv2rLiMjWtf1mB5Ab/1WGqI2l50RUTYWe+XOZWy6i6Cee/BIxjxRx/V4V7S
 ckxBDLDc11c72ZJBIblR9wcGqWGLg1HuRuu3Sm2p0ZphAucp
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

To use MHL we currently need the MHL chip to be permanently on, which
consumes unnecessary power. Let's use extcon attached to MUIC to enable
the MHL chip only if it detects an MHL cable.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -19,6 +19,7 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/extcon.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -26,6 +27,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -170,8 +172,12 @@ struct sii9234 {
 	struct drm_bridge bridge;
 	struct device *dev;
 	struct gpio_desc *gpio_reset;
-	int i2c_error;
 	struct regulator_bulk_data supplies[4];
+	struct extcon_dev *extcon;
+	struct notifier_block extcon_nb;
+	struct work_struct extcon_wq;
+	int cable_state;
+	int i2c_error;
 
 	struct mutex lock; /* Protects fields below and device registers */
 	enum sii9234_state state;
@@ -864,6 +870,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	return 0;
 }
 
+static void sii9234_extcon_work(struct work_struct *work)
+{
+	struct sii9234 *ctx =
+		container_of(work, struct sii9234, extcon_wq);
+	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
+
+	if (state == ctx->cable_state)
+		return;
+
+	ctx->cable_state = state;
+
+	if (state > 0)
+		sii9234_cable_in(ctx);
+	else
+		sii9234_cable_out(ctx);
+}
+
+static int sii9234_extcon_notifier(struct notifier_block *self,
+			unsigned long event, void *ptr)
+{
+	struct sii9234 *ctx =
+		container_of(self, struct sii9234, extcon_nb);
+
+	schedule_work(&ctx->extcon_wq);
+
+	return NOTIFY_DONE;
+}
+
+static int sii9234_extcon_init(struct sii9234 *ctx)
+{
+	struct extcon_dev *edev;
+	struct device_node *musb, *muic;
+	int ret;
+
+	/* Get micro-USB connector node */
+	musb = of_graph_get_remote_node(ctx->dev->of_node, 1, -1);
+	/* Then get micro-USB Interface Controller node */
+	muic = of_get_next_parent(musb);
+
+	if (!muic) {
+		dev_info(ctx->dev,
+			 "no extcon found, switching to 'always on' mode\n");
+		return 0;
+	}
+
+	edev = extcon_find_edev_by_node(muic);
+	of_node_put(muic);
+	if (IS_ERR(edev)) {
+		dev_err_probe(ctx->dev, PTR_ERR(edev),
+			      "invalid or missing extcon\n");
+	}
+
+	ctx->extcon = edev;
+	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
+	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
+	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
+	if (ret) {
+		dev_err(ctx->dev, "failed to register notifier for MHL\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
 					 const struct drm_display_info *info,
 					 const struct drm_display_mode *mode)
@@ -916,12 +986,17 @@ static int sii9234_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = sii9234_extcon_init(ctx);
+	if (ret < 0)
+		return ret;
+
 	i2c_set_clientdata(client, ctx);
 
 	ctx->bridge.of_node = dev->of_node;
 	drm_bridge_add(&ctx->bridge);
 
-	sii9234_cable_in(ctx);
+	if (!ctx->extcon)
+		sii9234_cable_in(ctx);
 
 	return 0;
 }
@@ -930,7 +1005,15 @@ static void sii9234_remove(struct i2c_client *client)
 {
 	struct sii9234 *ctx = i2c_get_clientdata(client);
 
-	sii9234_cable_out(ctx);
+	if (ctx->extcon) {
+		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
+					   &ctx->extcon_nb);
+		flush_work(&ctx->extcon_wq);
+		if (ctx->cable_state > 0)
+			sii9234_cable_out(ctx);
+	} else {
+		sii9234_cable_out(ctx);
+	}
 	drm_bridge_remove(&ctx->bridge);
 }
 

-- 
2.50.1

