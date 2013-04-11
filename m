From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 11/30] [media] exynos: remove unnecessary header inclusions
Date: Thu, 11 Apr 2013 02:04:53 +0200
Message-ID: <1365638712-1028578-12-git-send-email-arnd@arndb.de>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

In multiplatform configurations, we cannot include headers
provided by only the exynos platform. Fortunately a number
of drivers that include those headers do not actually need
them, so we can just remove the inclusions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Cc: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>
---
 drivers/media/platform/exynos-gsc/gsc-regs.c | 1 -
 drivers/media/platform/s5p-tv/sii9234_drv.c  | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/exynos-gsc/gsc-regs.c b/drivers/media/platform/exynos-gsc/gsc-regs.c
index 6f5b5a4..e22d147 100644
--- a/drivers/media/platform/exynos-gsc/gsc-regs.c
+++ b/drivers/media/platform/exynos-gsc/gsc-regs.c
@@ -12,7 +12,6 @@
 
 #include <linux/io.h>
 #include <linux/delay.h>
-#include <mach/map.h>
 
 #include "gsc-core.h"
 
diff --git a/drivers/media/platform/s5p-tv/sii9234_drv.c b/drivers/media/platform/s5p-tv/sii9234_drv.c
index d90d228..39b77d2 100644
--- a/drivers/media/platform/s5p-tv/sii9234_drv.c
+++ b/drivers/media/platform/s5p-tv/sii9234_drv.c
@@ -23,9 +23,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
 
-#include <mach/gpio.h>
-#include <plat/gpio-cfg.h>
-
 #include <media/sii9234.h>
 #include <media/v4l2-subdev.h>
 
-- 
1.8.1.2
