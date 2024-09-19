Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA081A0B16;
	Thu, 19 Sep 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758734; cv=none; b=LwapNnuwNqh6hzNNJtxEMg72fEXqhjh7PNKVjTgbWcGoveqHn8iB7s/JJQF2KL9YX+WFAUXf8cnxUz4GdHoMJV+SzELS5YVY7LcSMV2LTwaNBrfV52tfFXY01OLc+MBvFaAqObiYqPb4Wy19Hr96n1PqoZxOGsyf3hsbcJlKxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758734; c=relaxed/simple;
	bh=W9NCakkUrBU6rZgTcjvry5F2W8keaA/67v1TEQpKKeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m3nGF2DDPw8OUQlPnLPNvhSPbm5KdxTY0J3xn5GyYBWc5Y0XbC/V2lhgE9H+zXeHEfQlMTQAwJsIB18j35XrkrLk4bX0T+XbLhJQKUOOKm7xVL9YONAEtxY3wnlcuhkLONMqftC9UB1L1H7NOJvvc0QNqhgF22O0OiOsq6iexdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=d4a12F3o; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="d4a12F3o"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E438521B06;
	Thu, 19 Sep 2024 17:11:35 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqxMisKfJAsW; Thu, 19 Sep 2024 17:11:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1726758695; bh=W9NCakkUrBU6rZgTcjvry5F2W8keaA/67v1TEQpKKeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d4a12F3oc0//7xbMft44unULEDptgyZ8hdZsHJlcawbcBix+0C+teeomT+TQazSR7
	 SOksXV3EVD937F1dSYO19M5XUN17GvEzjOLK4FKngNBfaJYdLzc15b+wTnR/HJ357o
	 E1aVNVLV6v9m2OStYcGw2/oFeuxqapya0gsURwvrRkNlczUhFiQPeeLAkfD16qebIT
	 Preyv5iXYzQQD0LLiZot9ukE+IB/aLsBrDQzAwRKJLUFx5z+ZNk1A6UnP7Amuv7Xxt
	 u5ZDzpfXXVbfEbl4BpsJpI/OZaLM70BBqdWikkdjLjRtZUi8gLc8BGXAfjJBDKjk10
	 zhAg/u/3bWK8g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 19 Sep 2024 20:41:01 +0530
Subject: [PATCH 2/6] drm/exynos: exynos7_drm_decon: fix suspended condition
 in decon_commit()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-exynosdrm-decon-v1-2-6c5861c1cb04@disroot.org>
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

decon_commit() gets called during atomic_enable. At this stage, DECON is
suspended, and thus the function refuses to run. Fix the suspended
condition checking in decon_commit().

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index e994779694f0..2c4ee87ae6ec 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -152,7 +152,7 @@ static void decon_commit(struct exynos_drm_crtc *crtc)
 	struct drm_display_mode *mode = &crtc->base.state->adjusted_mode;
 	u32 val, clkdiv;
 
-	if (ctx->suspended)
+	if (!ctx->suspended)
 		return;
 
 	/* nothing to do if we haven't set the mode yet */

-- 
2.46.1

