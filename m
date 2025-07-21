Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9728C5A4
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753091031; cv=none; b=rPM+aY44PGOSERSkUa32BFF+qBuEg0o/NzDlZnptZi2kDl+g6W5Z1fOpOeMy4pheWE6F7Fqk15Rtj4OdH4AYererVZkGG4HCSP8hVeUJBplALzAOhYqn/yQdfNI0ujJZuTcu9jmnfZH1NkUn6bzcg45HkuCrq4DHmP8N2AUHZgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753091031; c=relaxed/simple;
	bh=fA7kCw/btmE/Kdd4JfUiEBidHB1Txrk8ejW2zzBXunM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csisbzJPRIdV1IJjZXgLFunFq5tvP7iXs36xmsIY1cZmm/3z93/tPOwRautrEqWwhGFM6BLg0m8zRiDnsT5DeKieQzyrRyIyWdU8tqDjdeNJj/hxXvNki4Rkfu06+Rd5GvJyPuL/iAQ6F9tX6sWseSP6182s7/Gvel5X9V1+9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=YBw89Lf4; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="YBw89Lf4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753091027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLEv1F8si+d4JJJEfku+IvjEsa+DjKyQC0EuZ/oVHD0=;
	b=YBw89Lf4y0J81omtVXFiErCy7x7GCqvBn9kRHUywYFrPxpgnwB8GnQ1oWSMqF3dK6auKZd
	TIVzr17F0DAzQsdoZzgMIVze8Nx24Y6tlvowId9/BdMVItXdl7O700OyBHnfh1Man7gGiQ
	egQLEfykp0Sglpzko5rNyXEaHVOBFS8=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 21 Jul 2025 11:43:18 +0200
Subject: [PATCH 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-exynos4-sii9234-driver-v1-2-2e47ed02f677@grimler.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1995; i=henrik@grimler.se;
 h=from:subject:message-id; bh=fA7kCw/btmE/Kdd4JfUiEBidHB1Txrk8ejW2zzBXunM=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBofgvIS7HDC0DrDRkeyFvc9LW0I1rTyNgAnlKfU
 bM4zIXwgQqJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaH4LyAAKCRCwB25JC3Fh
 a3XoB/9G40Lv0JikNKi9Ia8QkocQfYruM/z/b25jkjcvIMg5emz1qVhp4+y6a/lOb8wxDwSronb
 r0DcGzDRu+uBkuNJJTqPDSUT8OdWNrabTLHQb0g0lRMkzdGvqEthoZh7b77uFB2FYcJy0667FxY
 fmB0SCpJPWuhfF6o5lJY1W3qjcl40tpPjdgUrlNSeSdgfa5YSvxsylKke/698b3U87mZAjq/mVF
 wZAg7ppIU+1baeyu0De6hog7wGH0+prm1c9/n/yfAZbfWcQbg4bJzuBzmrlFHkv5HywIcjZxpgp
 3eJeWA74HahKR5PMQx4q1bvXXon1/RICH7CYjs0Eususlxhb
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

In case of error during resource acquisition the driver should print
an error message only if it is not deferred probe. Use dev_err_probe
helper to handle this, which will also record defer probe reason for
debugging.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 drivers/gpu/drm/bridge/sii9234.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 930117bbba87285e62107389606897740516eb0a..0e0bb1bf71fdcef788715cfd6fa158a6992def33 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -825,10 +825,9 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	}
 
 	ctx->gpio_reset = devm_gpiod_get(ctx->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->gpio_reset)) {
-		dev_err(ctx->dev, "failed to get reset gpio from DT\n");
-		return PTR_ERR(ctx->gpio_reset);
-	}
+	if (IS_ERR(ctx->gpio_reset))
+		return dev_err_probe(ctx->dev, PTR_ERR(ctx->gpio_reset),
+				     "failed to get reset gpio from DT\n");
 
 	ctx->supplies[0].supply = "avcc12";
 	ctx->supplies[1].supply = "avcc33";
@@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(ctx->dev, "regulator_bulk failed\n");
-		return ret;
+		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
 	}
 
 	ctx->client[I2C_MHL] = client;
@@ -911,10 +908,9 @@ static int sii9234_probe(struct i2c_client *client)
 					sii9234_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"sii9234", ctx);
-	if (ret < 0) {
-		dev_err(dev, "failed to install IRQ handler\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to install IRQ handler\n");
 
 	ret = sii9234_init_resources(ctx, client);
 	if (ret < 0)

-- 
2.50.1

