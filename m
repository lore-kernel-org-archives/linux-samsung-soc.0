Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF765395AEE
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jun 2026 18:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425479; cv=none; b=pOauSA2yhzJexrifUf+xEy8/v0+GQReMY/OhgCkXy4a/NGHpGLaKvVjYSc4IfF4/95Yj+a+mdGwnLMwTkUYH5GBVSzZaCgfShrn87pVLJB/8h3d/b2QlG1ke1Cyjl0YCc9srM4qX7zi5b7RVt83xHnQLwLlcvjftHon0e9rbjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425479; c=relaxed/simple;
	bh=J2VrdZZdHdrUSvVv2/0hRbTGcr86aySVkMiUCH39Ld4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RxLCmrnWLXWKVu+nPQupOScwToFA5wFFdb91nSyw0wno82Jv6j4fM0KtYwhVbyINHRII9FRjFN7zfes/2LocwVZYlTDxQPd3FUxbDebAAKwtas5XXGkEWlro4WUNP0/sVkicSsH0IfxYdScfFEBqNx1OVDFRE2nSp3eerhYN1QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=Wh7rVw1t; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="Wh7rVw1t"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1780425475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WxMYC4T1LGG7DL25LkdKxvkXEaCcM5nAzX/5lfuA2Hc=;
	b=Wh7rVw1tYHNqYWPTzBP57ZGQzQKY5xTG+zrHYG3pqe+SfeghdLE3Somd74L5h2hsg99yE2
	YRx4+4iF59XrFjiSKKnPVgXW81wNMxTrTf3rHXFFLsOxl7k2Covu6eKsmqRBOxDf0dQhsi
	lTD0UBAFPcsJDhCTfKiUZPI75tp8IXA=
From: Henrik Grimler <henrik@grimler.se>
Date: Tue, 02 Jun 2026 20:36:50 +0200
Subject: [PATCH RESEND v4 3/3] drm/bridge: sii9234: use extcon cable
 detection logic to detect MHL
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-exynos4-sii9234-driver-v4-3-9b2fc38e104a@grimler.se>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
In-Reply-To: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
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
 h=from:subject:message-id; bh=J2VrdZZdHdrUSvVv2/0hRbTGcr86aySVkMiUCH39Ld4=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqHyLv132KVuTm+PwuW9cyhgbWox+p1MI5l8ytv
 Lc6CdMzpuSJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCah8i7wAKCRCwB25JC3Fh
 a85yB/9pljhUB9wE1+ub5xWBjYeuyWheF5e3cs9FG332jfHA7MNhxV3jAy6ph44Dt2NwElbxhZk
 MJdh6JkGO1EKm/L5euXIEJjZq2LUooo4zQJXIXjEzmEj7LunTbJbwq3l+d1Obyyg/eLxQokugWC
 a5kojU/pnRDnfLkUvxvbqaKonQWFkDhLd5MNJJQtlG1rC3idlEGwUD/tbgQJLe0ttuLhONv79na
 Zw9c4hXWAUXPUHFbCJF/N9gSpUh19fm04xTePQFEQqWbNWBzYIwMN7qVsc5ThmvTMlpEX98CAkF
 YfVyb5whq2UwCMmH6hZErjM6DH7RiP0kAFSshpa8M3LWZ0iT
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
2.54.0

