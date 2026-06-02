Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781E395AF3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Jun 2026 18:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425478; cv=none; b=o/kohhzR4vM9MFF0RHQjQyyYYesg9jLRjl8ZuN5myyqwDqquLVrOyBPDuSSxsqkIh+v1cxIqgcfk020ALtuhrbIKZ/D3vmnD8i8b78i2D6b6SpScxATBZpyqPv8dL82or+JTTcur/tP2bS95OVrHPWWTnNlaTeV4xt8PqC2++J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425478; c=relaxed/simple;
	bh=2JY7jnSV1JB6B0QOWe63/vdQ4r7EM95S5p7Kzp0USdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqxLkLBvRFgT8mpA5VAhN3f29QPTE89SfZgNai5ByRBbtiEM/okBD1SbErVP1E9HOZkIBS6mNs0UVZs50VmsLSElEqdrf4/ClUX0EEpihdG+CYBXJOfu0gyqjjk12PHYuKBAzDUDLLGpp7wGY8AgjZ2YGSzLOMNmw+1Op/uJuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=k8bAAhZ2; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="k8bAAhZ2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1780425472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MQmCjaY8e93JhvqyS05LSFJf7JVZklINckJ9CozzQyY=;
	b=k8bAAhZ21IGaI8CtYrvGWLNboois7F2pMfESCq3DBVLyFmX0kO1G6AaulM6+9K16azu+J2
	abgalwU2WrVzu6NcKEcPB8ViMn92ryfIzKAA4FtXAbFQFx8abd1xsi4ubpH38BS4GZSxVT
	VX3cUkEznPPd/wbwn26ECjbOEp5NhtQ=
From: Henrik Grimler <henrik@grimler.se>
Date: Tue, 02 Jun 2026 20:36:49 +0200
Subject: [PATCH RESEND v4 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-exynos4-sii9234-driver-v4-2-9b2fc38e104a@grimler.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=henrik@grimler.se;
 h=from:subject:message-id; bh=2JY7jnSV1JB6B0QOWe63/vdQ4r7EM95S5p7Kzp0USdQ=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBqHyLsxq80QudmYZcs9ETzWXKz24adP5QSwpXbB
 nGz5A0Sv1+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCah8i7AAKCRCwB25JC3Fh
 a3QiB/wPPWO7lvNZs/EQOLAPjumAPuwc+tXMCZQ21irQYGVDGejM1eegJt/BddMhpZtVYvUo4Hz
 SxLPIxNxOfa8ZUsJ0Kc5OTE2HDMdg4zPfW7lkDWQ2f1JCkQQXBe0B2GmTWtG9muz3NCxtR4QzOt
 vZ5GbVy9IcYF0iW8yLvQXulQC7iD/kQfeGx/aIf5xyjapaYZsZwj1izsutoD4mjBWtWz+MbUj9A
 kVC6O/7KAiFliLYP1Iq5MHFRqX1Jhvi/xuwehwY5Y26Kv69EZJux5SjbdAp/Oc1vHk2E/t+XiPV
 q4ayuZfU9G3OHNeap+w2dDP31Efkir58YT/xtMVJONjiB9M5
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
2.54.0

