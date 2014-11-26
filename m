From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] ARM: EXYNOS: use u8 for val[] in struct exynos_pmu_conf
Date: Wed, 26 Nov 2014 18:21:38 +0100
Message-ID: <1787532.9Q2MHGpzCz@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Values stored in val[] are never bigger than a byte.

   text    data     bss     dec     hex filename
   7716    3692       8   11416    2c98 arch/arm/mach-exynos/pmu.o.before
   5436    1908       8    7352    1cb8 arch/arm/mach-exynos/pmu.o.after

Cc: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: Amit Daniel Kachhap <amit.daniel@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
v2:
- rebased on top of next-20141126 branch of linux-next kernel tree
  (it also applies fine to for-next branch of linux-samsung.git)

 arch/arm/mach-exynos/pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pmu.c b/arch/arm/mach-exynos/pmu.c
index ccb0120..c15761c 100644
--- a/arch/arm/mach-exynos/pmu.c
+++ b/arch/arm/mach-exynos/pmu.c
@@ -25,7 +25,7 @@
 
 struct exynos_pmu_conf {
 	unsigned int offset;
-	unsigned int val[NUM_SYS_POWERDOWN];
+	u8 val[NUM_SYS_POWERDOWN];
 };
 
 struct exynos_pmu_data {
-- 
1.8.2.3
