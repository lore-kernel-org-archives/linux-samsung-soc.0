Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0EC1A071B;
	Thu, 19 Sep 2024 15:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758810; cv=none; b=fykOq7SptectjUvEr3wHJQKfY5eWbCM35/DOPHHt51vqKyhdIKsOcCy+6WnsjtfdNoN7RAFaNjUNth/SDSj/BazvIugL8eOOuaHCgYWWL5MilHt1VAH3/MAMY7M49RQ1R0lEuanZxjQI1LQdCeT+Ht/cTGVYzHgEtiYNB0cz8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758810; c=relaxed/simple;
	bh=GP7vulBylMtNMk0x+Curx74hl3PAursdsxiHeXQyGIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ce6Z4DDILifHlsjzgz9O1igOzy4TqWFHxs5FEb5g6aZy4g2GLdhxNoZtsdZY/JaG49yk70XAo6Aheyw/w6p5bDVCx/4liDeRJmTwjSbPKLr8XVRzpaT3WY+mSC9gt6H185oKywNG299juGGEV271azBnIrMZvZ/TZ5WP7Ebj1K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=j1RU2oUi; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="j1RU2oUi"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 26EBA2384D;
	Thu, 19 Sep 2024 17:11:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdkrb6ejJlZP; Thu, 19 Sep 2024 17:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1726758701; bh=GP7vulBylMtNMk0x+Curx74hl3PAursdsxiHeXQyGIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j1RU2oUifgRfrDVJQxO5RYwZI3+S9p3yFuP19csagm0z4pTVEaXm8Gd7hIpcKPMPt
	 ZIBH2f/A50JsqmhZZrmSkXN+RhjYYi4URKZDg3jV3d/oF/IOc7q+lkRSEWjcOD1NlZ
	 g3ir59c/YHCO1WXX8HBTmmQVH+bPgbwI2oRquA7jbCLJXuuSAQjsAZXRDedzpsGU8R
	 0Tj84BcIBVZjJZuZ6bsib1xq5p+GhTqtrSpWAz3+Ysp80o+GIlcVJVOyb6j84XzIwq
	 JjouLksHiEeK0NeUFcpL1Ydcsl23Gu316L0EhSiiIBzwsS64ySJLd/KHUjOZBNIDo2
	 /NCwekO55hZ4g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 19 Sep 2024 20:41:02 +0530
Subject: [PATCH 3/6] drm/exynos: exynos7_drm_decon: fix ideal_clk by
 converting it to Hz
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-exynosdrm-decon-v1-3-6c5861c1cb04@disroot.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>

The clkdiv values are incorrect as ideal_clk is in kHz and the clock
rate of vclk is in Hz. Multiply 1000 to ideal_clk to bring it to Hz.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index 2c4ee87ae6ec..4e4ced50ff15 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -137,7 +137,7 @@ static void decon_ctx_remove(struct decon_context *ctx)
 static u32 decon_calc_clkdiv(struct decon_context *ctx,
 		const struct drm_display_mode *mode)
 {
-	unsigned long ideal_clk = mode->clock;
+	unsigned long ideal_clk = mode->clock * 1000;
 	u32 clkdiv;
 
 	/* Find the clock divider value that gets us closest to ideal_clk */

-- 
2.46.1

