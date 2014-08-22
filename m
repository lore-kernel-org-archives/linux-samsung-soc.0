From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 13/15] drm/exynos/fimc: do not enable fimc twice
Date: Fri, 22 Aug 2014 09:52:24 +0200
Message-ID: <1408693946-15456-14-git-send-email-a.hajda@samsung.com>
References: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1408693946-15456-1-git-send-email-a.hajda@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The patch removes redundant H/W activation.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index bbaf4f9..bd6628d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1596,12 +1596,9 @@ static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 
 	fimc_clear_bits(ctx, EXYNOS_CIOCTRL, EXYNOS_CIOCTRL_WEAVE_MASK);
 
-	if (cmd == IPP_CMD_M2M) {
+	if (cmd == IPP_CMD_M2M)
 		fimc_set_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
 
-		fimc_set_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
-	}
-
 	return 0;
 }
 
-- 
1.9.1
