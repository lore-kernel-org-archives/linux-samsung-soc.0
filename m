From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH 1/2] media: s5p-cec: Remove unneeded linux/miscdevice.h include
Date: Thu, 15 Dec 2016 15:03:23 +0100
Message-ID: <20161215140324.28986-1-clabbe.montjoie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: mchehab@kernel.org, gregkh@linuxfoundation.org, kgene@kernel.org, krzk@kernel.org, javier@osg.samsung.com, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-samsung-soc@vger.kernel.org
Cc: Corentin Labbe <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

s5p-cec: does not use any miscdevice so this patch remove this
unnecessary inclusion.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/staging/media/s5p-cec/exynos_hdmi_cec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/s5p-cec/exynos_hdmi_cec.h b/drivers/staging/media/s5p-cec/exynos_hdmi_cec.h
index 3e4fc7b..7d94535 100644
--- a/drivers/staging/media/s5p-cec/exynos_hdmi_cec.h
+++ b/drivers/staging/media/s5p-cec/exynos_hdmi_cec.h
@@ -14,7 +14,6 @@
 #define _EXYNOS_HDMI_CEC_H_ __FILE__
 
 #include <linux/regmap.h>
-#include <linux/miscdevice.h>
 #include "s5p_cec.h"
 
 void s5p_cec_set_divider(struct s5p_cec_dev *cec);
-- 
2.10.2
