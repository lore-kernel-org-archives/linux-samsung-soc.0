From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/exynos: change zero to NULL for sparse
Date: Wed, 11 Jun 2014 09:36:23 +0300
Message-ID: <20140611063623.GA16247@mwanda>
References: <5397F355.4060105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5397F355.4060105@samsung.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

We recently changed this function to return a pointer instead of an int
so we need to change this zero to a NULL or Sparse complains:

	drivers/gpu/drm/exynos/exynos_drm_drv.h:346:47:
	warning: Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 36535f3..06cde45 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -343,7 +343,7 @@ struct exynos_drm_display * exynos_dpi_probe(struct device *dev);
 int exynos_dpi_remove(struct device *dev);
 #else
 static inline struct exynos_drm_display *
-exynos_dpi_probe(struct device *dev) { return 0; }
+exynos_dpi_probe(struct device *dev) { return NULL; }
 static inline int exynos_dpi_remove(struct device *dev) { return 0; }
 #endif
 
