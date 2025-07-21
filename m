Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726681552E0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Jul 2025 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753091030; cv=none; b=j7L2hw83UChwIymIWGRF9VX3UW5TkTng7EtBDNgoSDOaE4zOUs5AeaQc0ROkoZeZXSZCTLsJ5T2FM23B69ct12vY+CgORcFcfxALxSIiTWpRV00XC3HJ/rTIcNODd3ghoWRXFo/PpoAB1/ad/J/ATRCE+V7A03ZCjwiZYi3Pw7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753091030; c=relaxed/simple;
	bh=VZR9L/YQAGIhhNghVVdCnKKDaytCOzfTudQMGYx1nto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajQMQd7PBnSddTnegZ46LRH7exp9LBbvutuxSjxxyte6QM2TRmDJg/ri9R5DTxvjI1ZUJR/AoIHKyT5KTDzHj+U7KoKdsKZTqZTXoCnqtxmyv/OYmAAnqtTx66axbUenwtnOTeh42+F5fBGU4BysV5Ba6ysDPwULjPatmGYVR/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=OUnCEbkH; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="OUnCEbkH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753091024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aF2s9Qr5GNaKwpyz9KRWWSUy0LehEu6UCIeJ3Re6uEI=;
	b=OUnCEbkHFEy1n8ZiypQGthy17Gzm1YnNLmxPTC3xisnSuvNBEjKGsdJSRDm50i9fGYrGvB
	dVnyrhVS3x8mLeVP5oWPjzGrlSFjr/thjguBWrwBdGITJqOB5FkqzPihy3N1EoF1lICnYs
	hyir03/1c/cEnTsKYMyuPW+MYCL+XUQ=
From: Henrik Grimler <henrik@grimler.se>
Date: Mon, 21 Jul 2025 11:43:17 +0200
Subject: [PATCH 1/3] drm/bridge: sii9234: fix some typos in comments and
 messages
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-exynos4-sii9234-driver-v1-1-2e47ed02f677@grimler.se>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2316; i=henrik@grimler.se;
 h=from:subject:message-id; bh=VZR9L/YQAGIhhNghVVdCnKKDaytCOzfTudQMGYx1nto=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBofgvFk192z/AfkceQ1t7q4qnae8at/l3esEQ6q
 nMLYBZ02v+JATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaH4LxQAKCRCwB25JC3Fh
 a75zB/9PB/5w5mjThVdcK7yy/nNmqcAi85C13GIQiZ/CIAOL41K09ViKp+BpNdayeixeFnWzkFh
 k6HzPKn2XQfD+S5z/7rHXNZW4lOqvzUQ4ltJQW4jcU2JOs+0COf/mFTRPRI1f52qXr7j4VBKZ09
 4UYGYUr9N4HEB4Vs2F+j5nGE0R+0R4xIVEZv4N7YnkgSdP9x6Fg+tYMBc0sFFzG/Y1EhTRCCV6t
 zKRS/iIdPfqIvgsywu0Q+oXoXKvSvzFaZHMzmV+OjdJaDv2zsHl0A/7At8Dj7aKHi11eDJOWvGz
 +6nKC0+OZu3Lz1B2YUXsxbVtThESjL4cbJePM+QcSzhZC/Nm
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

Fix spelling and formatting so that the code is easier to follow, and
so that it is more searchable.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
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

