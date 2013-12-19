From: Levente Kurusa <levex@linux.com>
Subject: [PATCH 10/38] arm: exynos: add missing put_device call
Date: Thu, 19 Dec 2013 16:03:21 +0100
Message-ID: <1387465429-3568-11-git-send-email-levex@linux.com>
References: <1387465429-3568-2-git-send-email-levex@linux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1387465429-3568-2-git-send-email-levex@linux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Levente Kurusa <levex@linux.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

This is required so that we give up the last reference to the device.

Signed-off-by: Levente Kurusa <levex@linux.com>
---
 arch/arm/mach-exynos/common.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index 61d2906..8b58829 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -407,7 +407,13 @@ early_initcall(exynos4_l2x0_cache_init);
 
 static int __init exynos_init(void)
 {
+	int rc = 0;
+
 	printk(KERN_INFO "EXYNOS: Initializing architecture\n");
 
-	return device_register(&exynos4_dev);
+	rc = device_register(&exynos4_dev);
+	if (rc)
+		put_device(&exynos4_dev);
+	
+	return rc;
 }
-- 
1.8.3.1
