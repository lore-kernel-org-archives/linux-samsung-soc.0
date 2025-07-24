Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D9205E02
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 18:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383094; cv=none; b=VpyTW0qp2ZZt2YNI+QS+wpbBpg3hfPmsIkaZanO1dKhmKsR9RAoWM6RXAnsvqSt+mLpKPKSv5A5w6NX9CoQI+tkobIFpNcb1pSxJd4PRLMciTFz7pxhwjxMJyc/6LZ5FalPqku/3zxGbOr+ud6fNRU0B4zprT8j15MS1UcsL7T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383094; c=relaxed/simple;
	bh=x7ArkJEJ9UcO+6C4Ru2GjqQ1KuSGnTuAjOfKTce7MBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YDKXuljXsFCzgW3upSoTQiHSQjN47HKNr0edrEZNw0Eos5aBmZLVW6ibk6bJ2WMG/lKnqwJFZOyaG9buYwpGr9wPts7IV0+hmMyhUOWJ8k0mosCX5JTRFSK8Omnkw0jLszEwq//M2qpjL++cIYdVtYARYNgA7YOTIj4yS+73XLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=h8U+1wbM; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="h8U+1wbM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753383088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sk/dubggUrsZRv18JEnxLLB6/IJr310Fql5axFV4e5U=;
	b=h8U+1wbMYDv9Gf6u/u3z/hX0EVU0H4ilBeJpZMlFyewcM1+vzqzVK7zcwJLjNsmE6NXuPY
	EwP7dIrJzzzHnVnB7Zm6OEVGSuMzJCdHw3q5WPBdEIYDbp7yko/khz3CiWZxPJZmOhpAxV
	330XfEXxHjjBMGffK+HjmVCPjpfCmCc=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 24 Jul 2025 20:50:51 +0200
Subject: [PATCH v2 1/3] drm/bridge: sii9234: fix some typos in comments and
 messages
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-exynos4-sii9234-driver-v2-1-faee244f1d40@grimler.se>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337; i=henrik@grimler.se;
 h=from:subject:message-id; bh=x7ArkJEJ9UcO+6C4Ru2GjqQ1KuSGnTuAjOfKTce7MBE=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBogoCjJ9/3h8Wky1TRWhdX3OOfB+G5JpWthPsCV
 w440zNhYqKJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaIKAowAKCRCwB25JC3Fh
 a9npCADHWTJz3xTyDqFUzn3hB/3tLJFw8GxSEj0e+QRnCpw/CKXNg5ylY7zfogUgWnla48cjNzQ
 OQfvrAjIreTRs5OjMyliwSiBU3Hf43FzDbahNZ/DNLVgKmmaAe6JX8Ue+jH1Zbhr0ZNkLCLxlve
 WViOyl7ljdRecRVi+/EzudbtLa09Ve6A6zaTtdcEXUPy+DOsNGDfz0LPUlMTanQBEFCi4JpgrmP
 I62kuosZ1XoPH8fO04ycNyd5hqs+gt2CKk2kG3Qd2jsl/YcpXQrXT7ODt1bwdk+o292+NALeNSE
 yOewobZJ008mh/A5wmNHSJgR1/xAkH4yb0CHpigj2vl4/HRm
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

Fix spelling and formatting so that the code is easier to follow, and
so that it is more searchable.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
v2: no changes
---
 drivers/gpu/drm/bridge/sii9234.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index bb1bed03eb5b7ae67f752c0d593dc54131e9e370..930117bbba87285e62107389606897740516eb0a 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -339,7 +339,7 @@ static int sii9234_cbus_reset(struct sii9234 *ctx)
 	return sii9234_clear_error(ctx);
 }
 
-/* Require to chek mhl imformation of samsung in cbus_init_register */
+/* Require to check mhl information of samsung in cbus_init_register */
 static int sii9234_cbus_init(struct sii9234 *ctx)
 {
 	cbus_writeb(ctx, 0x07, 0xF2);
@@ -614,7 +614,7 @@ static void sii9234_cable_out(struct sii9234 *ctx)
 
 	disable_irq(to_i2c_client(ctx->dev)->irq);
 	tpi_writeb(ctx, TPI_DPD_REG, 0);
-	/* Turn on&off hpd festure for only QCT HDMI */
+	/* Turn on&off hpd feature for only QCT HDMI */
 	sii9234_hw_off(ctx);
 
 	ctx->state = ST_OFF;
@@ -708,7 +708,7 @@ static enum sii9234_state sii9234_rsen_change(struct sii9234 *ctx)
 {
 	int value;
 
-	/* Work_around code to handle wrong interrupt */
+	/* Workaround code to handle wrong interrupt */
 	if (ctx->state != ST_RGND_1K) {
 		dev_err(ctx->dev, "RSEN_HIGH without RGND_1K\n");
 		return ST_FAILURE;
@@ -723,9 +723,9 @@ static enum sii9234_state sii9234_rsen_change(struct sii9234 *ctx)
 	}
 	dev_dbg(ctx->dev, "RSEN lost\n");
 	/*
-	 * Once RSEN loss is confirmed,we need to check
-	 * based on cable status and chip power status,whether
-	 * it is SINK Loss(HDMI cable not connected, TV Off)
+	 * Once RSEN loss is confirmed, we need to check
+	 * based on cable status and chip power status, whether
+	 * it is SINK Loss (HDMI cable not connected, TV Off)
 	 * or MHL cable disconnection
 	 * TODO: Define the below mhl_disconnection()
 	 */
@@ -820,7 +820,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	int ret;
 
 	if (!ctx->dev->of_node) {
-		dev_err(ctx->dev, "not DT device\n");
+		dev_err(ctx->dev, "no DT device\n");
 		return -ENODEV;
 	}
 

-- 
2.50.1

