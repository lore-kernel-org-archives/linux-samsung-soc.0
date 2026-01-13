Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F9838F95B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308617; cv=none; b=rFYnVAOBr14tUv2qBVMn6K/QSy2Sg4g1drkfMpUw49F20xezTo9u5Yf7R8+1fXb3eb0dfstOqIIaoATNeeuuaFvTLLcvMIJy6D6/XVHm5i5EginGjqB+HaQSPyzZjQoLvVY/DUeu6hcQU7BgWD/mmGv1If6JkTJbqselYjreAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308617; c=relaxed/simple;
	bh=pldzOsbv7vqhDc1HP8HwsXxb+ROaOBWObRlyCIAfto0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrFxMwhv9EnG5igH3hn6CT2AdCZpqct7EkyDn2i1ykA1ya5v65CeiOeeJ0N9vNFFYji4bH9pNaP9VxsssD/z2n6SwbzQh0P5chY0Lpqkv3+c12QbhUqTj2RHnySX2gLNPDRmQOli36aXLQXfVuggvN8WjGJwoIzzgEJJuY8WTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=eOtdakCj; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="eOtdakCj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1768308606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b5HYdsqnn7iZNMGRXG9w9QT0yjmplZ77lGq34gX7Onw=;
	b=eOtdakCjzzdNvMvJRBjAwgYBYrJaLOoETJO/bBpZMWfdEZImS4wR9IAOPAU0iivX3bfLn9
	YULvRA+NsbsEnJVR01Pig4gZ7kcMeg6Jmu0Isuz9dZTtRiKTLDlaWSfbIIY7t61yfNl9DV
	J0bYPilkb+G55ZAPXKMhi6Tsc+Ix/58=
From: Henrik Grimler <henrik@grimler.se>
Date: Tue, 13 Jan 2026 13:49:31 +0100
Subject: [PATCH v4 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-exynos4-sii9234-driver-v4-3-6e8c0ac14f84@grimler.se>
References: <20260113-exynos4-sii9234-driver-v4-0-6e8c0ac14f84@grimler.se>
In-Reply-To: <20260113-exynos4-sii9234-driver-v4-0-6e8c0ac14f84@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4934; i=henrik@grimler.se;
 h=from:subject:message-id; bh=pldzOsbv7vqhDc1HP8HwsXxb+ROaOBWObRlyCIAfto0=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBpZj9wNYYO4aHtNT011nHB2qQoDPj/pSBnWbTZu
 Z5WMbPfmQ2JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaWY/cAAKCRCwB25JC3Fh
 a1uUCADHNLW62WImxg6gvZXfbWFpbv6ZGxgwXO3dpOSUpmzEGUl06pv3irk+zD+6By5HGHh9+Jt
 fTpR0J9gv5bY8vOKxWQo5Pi3uYmskWlAOBE0UWDLoAb+f0ZN2nUNe8+j28z4c/9nYMAbvHm8m4Q
 xgzclQPhfWixVXBkQgzCxxeibGfucYFP3DE+XaEpcs3bLjxuHAGLeKPT+RC0hNhj1bFyz/EwjsX
 GZmDv2LO4orIpF9MQhWn/AZNV+DvZUl37BLQepQFMY+ATNS+B8ot0dpA06fRiRa47ozGW368kpB
 fJjLVdymtvrm7NC8pHsD508TBgcxTzglzmOWNtjU+m9H9QqO
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

To use MHL we currently need the MHL chip to be permanently on, which
consumes unnecessary power. Let's use extcon attached to MUIC to enable
the MHL chip only if it detects an MHL cable.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
v4: collect tags
v3: add missing return in error path, spotted by Marek
    Use depends on EXTCON || !EXTCON instead of select
v2: add dependency on extcon. Issue reported by kernel test robot
    <lkp@intel.com>
---
 drivers/gpu/drm/bridge/Kconfig   |  1 +
 drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 39385deafc68..a8343df2d424 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -310,6 +310,7 @@ config DRM_SII902X
 config DRM_SII9234
 	tristate "Silicon Image SII9234 HDMI/MHL bridge"
 	depends on OF
+	depends on EXTCON || !EXTCON
 	help
 	  Say Y here if you want support for the MHL interface.
 	  It is an I2C driver, that detects connection of MHL bridge
diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index e43248e515b3..72c6aeed6e12 100644
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
@@ -863,6 +869,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
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
+		return dev_err_probe(ctx->dev, PTR_ERR(edev),
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
@@ -915,12 +985,17 @@ static int sii9234_probe(struct i2c_client *client)
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
@@ -929,7 +1004,15 @@ static void sii9234_remove(struct i2c_client *client)
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
2.52.0

