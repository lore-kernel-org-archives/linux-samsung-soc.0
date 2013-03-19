From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH] drm/exynos: enable FIMD clocks
Date: Tue, 19 Mar 2013 15:29:53 +0530
Message-ID: <1363687193-30893-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org, kgene.kim@samsung.com, joshi@samsung.com, inki.dae@samsung.com, linaro-kernel@lists.linaro.org, jy0922.shim@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org
List-Id: linux-samsung-soc@vger.kernel.org

While migrating to common clock framework (CCF), found that the FIMD clocks
were pulled down by the CCF.
If CCF finds any clock(s) which has NOT been claimed by any of the
drivers, then such clock(s) are PULLed low by CCF.

By calling clk_prepare_enable() for FIMD clocks fixes the issue.

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9537761..d93dd8a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -934,6 +934,9 @@ static int fimd_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	clk_prepare_enable(ctx->lcd_clk);
+	clk_prepare_enable(ctx->bus_clk);
+
 	ctx->vidcon0 = pdata->vidcon0;
 	ctx->vidcon1 = pdata->vidcon1;
 	ctx->default_win = pdata->default_win;
-- 
1.7.9.5
