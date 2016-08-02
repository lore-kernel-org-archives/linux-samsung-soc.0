From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0525/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 19:20:50 +0800
Message-ID: <20160802112050.16958-1-baolex.ni@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mchehab@kernel.org, maurochehab@gmail.com, mchehab@infradead.org, mchehab@redhat.com, m.chehab@samsung.com, kyungmin.park@samsung.com, s.nawrocki@samsung.com, kgene@kernel.org, k.kozlowski@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, baolex.ni@intel.com, hdegoede@redhat.com, chuansheng.liu@intel.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/media/platform/exynos4-is/mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index bf95442..ab326a2 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -36,7 +36,7 @@
 #include "mipi-csis.h"
 
 static int debug;
-module_param(debug, int, 0644);
+module_param(debug, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(debug, "Debug level (0-2)");
 
 /* Register map definition */
-- 
2.9.2
