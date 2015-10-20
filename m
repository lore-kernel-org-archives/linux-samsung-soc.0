From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 03/10] drm/exynos/decon5433: add PCLK clock
Date: Tue, 20 Oct 2015 11:22:34 +0200
Message-ID: <1445332961-25419-4-git-send-email-a.hajda@samsung.com>
References: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1445332961-25419-1-git-send-email-a.hajda@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

PCLK clock is used by DECON IP. The patch also replaces magic number with
number of clocks in array definition.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1ea26dbb..b25d764 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -27,13 +27,23 @@
 #define CURSOR_WIN	2
 #define MIN_FB_WIDTH_FOR_16WORD_BURST	128
 
+static const char * const decon_clks_name[] = {
+	"pclk",
+	"aclk_decon",
+	"aclk_smmu_decon0x",
+	"aclk_xiu_decon0x",
+	"pclk_smmu_decon0x",
+	"sclk_decon_vclk",
+	"sclk_decon_eclk",
+};
+
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	void __iomem			*addr;
-	struct clk			*clks[6];
+	struct clk			*clks[ARRAY_SIZE(decon_clks_name)];
 	unsigned long			irq_flags;
 	int				pipe;
 	bool				suspended;
@@ -45,15 +55,6 @@ struct decon_context {
 	atomic_t			win_updated;
 };
 
-static const char * const decon_clks_name[] = {
-	"aclk_decon",
-	"aclk_smmu_decon0x",
-	"aclk_xiu_decon0x",
-	"pclk_smmu_decon0x",
-	"sclk_decon_vclk",
-	"sclk_decon_eclk",
-};
-
 static const uint32_t decon_formats[] = {
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_RGB565,
-- 
1.9.1

