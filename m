Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421E04189DE
	for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Aug 2026 13:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765211; cv=none; b=A8YU+C75fSIm7FZGthUrvpFaDSS6wy0EA2vXGZd1UgMc9oBeg1DruR32B1PxcHFRe1EqPYE64rwU+7JHEsOO5wNkBdlDxgYJ+rjQ4jm+JnX9zmQpVHP3Nc4csQz3iFyvG2IA7xmqyhArDpThcXV+zTd8yzcaI18Zn0tumzCHBU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765211; c=relaxed/simple;
	bh=5bkF1vPQjSz143+UbwZmXBJj9utm2hGLqkpmSbgRX+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbrH33i6pEJXpXPHqNzKEF1FIIOht7Mxzeq9uoSZtI64leYM0T0nWVIV6qG4PzFSnFYwZhGAQGNPRv2Xfwmb00Jc3RAUNjnrfcSvv8xK0yzu2HteJO3YWIyOkVMy0V+MHE6iCh5fNc5bsPTiP97chYOWPfF61naMMqwfiEmO+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZgnZ5SF8; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZgnZ5SF8"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8423f236418so2654627b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Aug 2026 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785765208; x=1786370008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Gx76VJyX4gBn4VLPhypngQoj/jr3IBftVHMJXbc1Po=;
        b=ZgnZ5SF8SfCFQspOlPYt7I3Lni5fimCk5tAknjaBrE/FMaeZI+HEU2l1ZsTX0hgRTK
         eAJXsnBJ3HGtdwpKvXrskSCCZyuz2p00kLvw7x1zoEH/mEDJEEvW+KA21NLlBqr9c8nb
         A3+f4ZcGNSYC9dMAbu6XuXDUIhjCt59f2PI34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785765208; x=1786370008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Gx76VJyX4gBn4VLPhypngQoj/jr3IBftVHMJXbc1Po=;
        b=MTciaY9K/Ap8K8ayufY1dyINVSDZVzcfvKFoN5eOeJ7bGYRxKZ4Jlx5iXFElWptGXR
         31Yvr3FnhbNcoyywmO7EV2eUaJPd6/QBE7H2Jslp+Ps/ilsaaWJVmhNUdr1pZXvXi6Wu
         ytA7L5JaI8Afet+jCc00ZzrissGl5Khb7DR+8ScAv97VaG8rkDPb/A7j1Go0tR2jDHv1
         4Abfych1tJfH3Ny4SJtAwoZSLiJEUCQpBrannf1BTgQ0d6mdPOdhvgQDiygH15ydX1oX
         vSn8JOUPiGhVXWc8g1BjM+dOBcPHub0Mpo5qrVn8FU474hKNXPNpDdNqBPxs/hHYVomR
         cjyw==
X-Forwarded-Encrypted: i=1; AHgh+RojP4P11AoULY0NEUx8wgFiHcocND04BtsPhQb3mXD735NXbk6v+7NjQpbtgPAO7S+WkUINAq19pVRkuHhX+xu0iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/DlvFJ1xSJICcfrX5y0FTErwzmKQFxVEXMJkcStSgy83ryZMx
	3/Qw0T1zUt0POAuWnFn+iPPucpaShCfACYjX3ZgYWO+7XDzIR5JrtDbJR5mUjxXakg==
X-Gm-Gg: AR+sD13W/I+2kYJiyiu4bl0XiSqtdkEwCoh8DHrsS9ExYtZPiIUr+OMBF2strGoQd6h
	O7/ymktQkOZ6xJhTvx92rOz2chm1qUwUuyoSCIP+6IOJpvL1LwigZRsrLTabyI/OG3vts4dVbJO
	cQJWApx7ESYDxCFM1kPC+CMmkPKVBz6kvLT1XFs0i8i84pUL3sGBYEA19KxfGJc38f93znaxFxB
	KLjJOlhNILcc+kjIW2lMY6Cum001UVN1qJx42cVRB4kq6xp+kK5VCh4j24rQ/sU4xD74dMzyi5J
	1vZ5sY5P0XztVYU3kTuleLDYCnldg8qxEA3H3Xrqj5JDEVzrmU3w5SxdYZTLp8Tmiwc0lsjEHL5
	Wrh9ctP1+ASoyn/+tvr/hS9QBT9ijLUG/taJVPbnBQjieSwVQwsi/bd7hvBPbh8XY82VjQVtnFQ
	jrb6OM/zdhSYjw+AqwONZ2e9SPIncgnvOTEtyhbuT6b77S4NHck/fy7uzxSZm6naJu/NckqukTx
	9ovAu3fZ8RXaJoPa2gyosSyV4BvvQglbA4Wxq0rEW1l/w==
X-Received: by 2002:a05:6a00:399b:b0:848:4ff5:5316 with SMTP id d2e1a72fcca58-84ee480a3c8mr9142674b3a.19.1785765208605;
        Mon, 03 Aug 2026 06:53:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:1c0b:57ba:92e2:e178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbe7a243sm3757511b3a.24.2026.08.03.06.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:53:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos/gem: Drop extra "0x" prefix in front of "%pad" format
Date: Mon,  3 Aug 2026 21:53:21 +0800
Message-ID: <20260803135322.2898247-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.571.g244d577d93-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recent size_t format string fix for exynos DRM driver left the "0x"
prefix in front of "%pad" format around. Since the pointer format output
already provides "0x" prefix, this ends up adding an extra prefix.

Drop the redundant "0x" prefix".

Fixes: 3470274dca48 ("drm/exynos: fix size_t format string")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 0208c9259572..acb8def747de 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -80,7 +80,7 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
 			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
-- 
2.55.0.571.g244d577d93-goog

