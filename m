Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4B138F252
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2026 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768308607; cv=none; b=FV73vtnDz6gWuEg0NFSE7+fYvfakPg280il/XDZZf02nFqToJH5lH+AdWS8u2p88UliVc4OGJWR5lnHGvQCJoAun/p81U+4AlWZhq9QLG1t/sEaY962v0ptG9jmywQ5/Gvf3tluZpZPNPQhtkSYlzQ8nf9RtWosWhmrgYM/s8dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768308607; c=relaxed/simple;
	bh=1pnn12wlQLRLVuJOXumFkPogBBkxIJewCc4pUkwMdhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JPR0x4QW6jRQ268SG43BtBBocEmpmGUNSJsfFs1vMBd8r/pfP6uYxg+zw/aPY1ht7YaOX5W4KDp7/XOPbd/SfxxC/Eg/v94TvThC73dfZLDGQRLDwKhYvxr/VCmTAOYPpAeIrvsaqtWbvXjg+LQGPNLoOkXIg6O7ChwtDVo86pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=DHnTJFhP; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="DHnTJFhP"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1768308604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Y/Fgs7A0AOIZAlZ6XnKfgoin/CzNGqX+748paLlw/s=;
	b=DHnTJFhPz4t7cJ2WousNEHKFhAMbtmFE9w1+ikiAw5Zg9n0G4sQAmpFFHy0UMqA4ocYnYT
	hkxj+DSmYRbxtDEwuooYEW7wtoO/gDB3Ig7eTrZk9mlPxt2WqZuwKw7qkzisI/DQS5mOOP
	x2z3NCusUlz59qNl9M7P4Rm19wcS6QI=
From: Henrik Grimler <henrik@grimler.se>
Date: Tue, 13 Jan 2026 13:49:30 +0100
Subject: [PATCH v4 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-exynos4-sii9234-driver-v4-2-6e8c0ac14f84@grimler.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=henrik@grimler.se;
 h=from:subject:message-id; bh=1pnn12wlQLRLVuJOXumFkPogBBkxIJewCc4pUkwMdhE=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBpZj9twnqIjL/fuNNSK5NMiJcFaYib7Nr8YXwZw
 9nlua7NLC+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaWY/bQAKCRCwB25JC3Fh
 a82yB/9gAoSqGSTjVXu/btz9oyxWZnGFD7saihV02JJhSTENQRjLfDs7ef9SrX/G9e9bYL2F/E0
 exDqehceTUHD9nVbOZ+fPXI8cTUU2tNRIZhEm/MkG2lSi2Gub+jYgv+DcdfEugahHXhvZbRXpMR
 8wGQOE60fc0gOxsRHCfmRE6Kmn/yaXxZsQiGtMLylr5FmQqudFAIWGLiEGEKqaN1GreCaxCxX+i
 scFUdNc24v2aeDt/rmzuRwL/uczGaZz5/1/WwYuTE6sT9JO9lfJtdlBt+7BWp3FTbLN3g4Yt4T1
 DL1m6Kh9s6H+/DuQ+pHinWFQZEx4oAMy806AGMTcv1/PuMfU
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

In case of error during resource acquisition the driver should print
an error message only if it is not deferred probe. Use dev_err_probe
helper to handle this, which will also record defer probe reason for
debugging.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
v4: collect tags
v3: add missing return in error path, spotted by Dmitry
v2: no changes
---
 drivers/gpu/drm/bridge/sii9234.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 930117bbba87..e43248e515b3 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -825,21 +825,17 @@ static int sii9234_init_resources(struct sii9234 *ctx,
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
 	ctx->supplies[2].supply = "iovcc18";
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(ctx->dev, "regulator_bulk failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
 
 	ctx->client[I2C_MHL] = client;
 
@@ -911,10 +907,9 @@ static int sii9234_probe(struct i2c_client *client)
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
2.52.0

