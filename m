From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv5 4/4] thermal: exynos: Remove duplicate code when reading
 triminfo register of Exynos5440
Date: Tue, 26 Aug 2014 10:31:05 +0900
Message-ID: <1409016665-3824-5-git-send-email-cw00.choi@samsung.com>
References: <1409016665-3824-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <1409016665-3824-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: eduardo.valentin@ti.com, amit.daniel@samsung.com, rui.zhang@intel.com
Cc: kgene.kim@samsung.com, ch.naveen@samsung.com, kyungmin.park@samsung.com, b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Eduardo Valentin <edubezval@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch remove simply duplicate code when reading triminfo register of Exynos5440.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>
Reviewed-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 64c702a..5888467 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -187,15 +187,13 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		 */
 		switch (data->id) {
 		case 0:
+		case 2:
 			trim_info = readl(data->base +
 			EXYNOS5440_EFUSE_SWAP_OFFSET + reg->triminfo_data);
 			break;
 		case 1:
 			trim_info = readl(data->base + reg->triminfo_data);
 			break;
-		case 2:
-			trim_info = readl(data->base -
-			EXYNOS5440_EFUSE_SWAP_OFFSET + reg->triminfo_data);
 		}
 	} else {
 		/* On exynos5420 the triminfo register is in the shared space */
-- 
1.8.0

