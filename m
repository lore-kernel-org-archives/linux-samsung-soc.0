Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541939A076;
	Wed, 27 May 2026 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911133; cv=none; b=AEUjeQ3WQEGg4v9k2grfpNSRzU2Vhv3upqHMHBAwOTjgIPWpyaukAO654tR2tO15wN2D2tojX99qZKgwGYpz2nddPdxyJwiIC5mmwOLcUZVLmLKpJEOi7Qt8495XX+9kxIzad9aoX8kBS8b+TjqlVLZM0zRL+iW+ta74LSU7Miw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911133; c=relaxed/simple;
	bh=eopCEnXS8WKRsOh51rQnWAJA50RLBc15JXO+1L+aarA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jdNAwxw3kyEBSESyGx8NtZIPCVP24ZdA67zCryUq3pm7GNKN+eEexu5ptK/5VpuKABLozyF74BFsTDdpi51MF5ZWvM1Pwttz9Dky4q8Oh0Fxryrw8Kdow6OsWBcLvsDylQbYeRBWSERfBpTkKksEjjFFEO1ZYmayRd+4SX5PjV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8IFwv5A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8IFwv5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2CF1F000E9;
	Wed, 27 May 2026 19:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911131;
	bh=VEXrEgQOj4YY+Lnsrc4y61tSJT6X+D5o07tAaEt61D0=;
	h=From:To:Cc:Subject:Date;
	b=b8IFwv5Ai+txihlJgwlqu12gYLmg8TX0mxUE4T4ysYKm8Tllc5zV3o2ICG/JFkm9P
	 QY25aqK9ciSVxn0PIppWVm48fTGiaN6eAyQDRc1gJ45xYjkDj5COiQajUe1Ugpayu+
	 K3zpCJB8x07rSiFTGsK7Mm+rig6r1gytivolAM5sRPCYPRCaZU6FIQ5XAhhPGmgxbZ
	 XozANXFe3lwlEPxUdOTnFE23En8vgt+OMBMmkcDoL2OeTcDlR/LuSIF7l759GurykQ
	 lGqU9Qut4WegZz8tw9e7pLUsOxWxDb9XEqfumeIx+m0JFZA7s7r90oG0Yi2nUV9fC+
	 yATW1OTVm3Fiw==
From: Arnd Bergmann <arnd@kernel.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: fix size_t format string
Date: Wed, 27 May 2026 21:45:07 +0200
Message-Id: <20260527194525.45762-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The exynos_gem->base.size argument is a size_t rather than an
unsigned long, so adapt the printk() format string accordingly:

In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
   69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
      |                                                              ~~~~~~~~~~~~~~~~~~~~~
      |                                                                              |
      |                                                                              size_t {aka unsigned int}

The dma_addr in the same line is already printed using a cast
to unsigned long, so change that similarly to use the correct
%pad format.

Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 297a93b087cd..8e357f2beb9e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	if (kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
-	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 	return 0;
 }
 
@@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
-- 
2.39.5

