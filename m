From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2 v2] drm/exynos: fix a warning message
Date: Fri, 25 Mar 2016 23:05:59 +0300
Message-ID: <20160325200559.GA22090@mwanda>
References: <56F4FC08.6090009@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56F4FC08.6090009@samsung.com>
Sender: kernel-janitors-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The "ret = regmap_write()" assignment was missing so this error message
is never printed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: in v1 I just deleted the error message

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 9869d70..ea2ea17 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -129,7 +129,7 @@ static void mic_set_path(struct exynos_mic *mic, bool enable)
 	} else
 		val &= ~(MIC0_RGB_MUX | MIC0_I80_MUX | MIC0_ON_MUX);
 
-	regmap_write(mic->sysreg, DSD_CFG_MUX, val);
+	ret = regmap_write(mic->sysreg, DSD_CFG_MUX, val);
 	if (ret)
 		DRM_ERROR("mic: Failed to read system register\n");
 }
