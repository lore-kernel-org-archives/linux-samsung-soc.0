From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2 1/4] ARM: EXYNOS4: Add DMC1, allow PPMU access for DMC.
Date: Wed, 14 Dec 2011 20:28:42 +0900
Message-ID: <1323862125-10699-2-git-send-email-myungjoo.ham@samsung.com>
References: <1323862125-10699-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1323862125-10699-1-git-send-email-myungjoo.ham@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@ti.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, "Rafael J. Wysocki" <rjw@sisk.pl>, Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com, Jongpill Lee <boyko.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

- Add DMC1
- Enlarge address space for DMC from 4k to 64k so that PPMU registers
  may be accessed.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/cpu.c              |    7 ++++++-
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 90ec247..8bdcba9 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -108,7 +108,12 @@ static struct map_desc exynos4_iodesc[] __initdata = {
 	}, {
 		.virtual	= (unsigned long)S5P_VA_DMC0,
 		.pfn		= __phys_to_pfn(EXYNOS4_PA_DMC0),
-		.length		= SZ_4K,
+		.length		= SZ_64K,
+		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC1,
+		.pfn		= __phys_to_pfn(EXYNOS4_PA_DMC1),
+		.length		= SZ_64K,
 		.type		= MT_DEVICE,
 	}, {
 		.virtual	= (unsigned long)S5P_VA_SROMC,
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 058541d..870a980 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -57,6 +57,7 @@
 #define EXYNOS4_PA_KEYPAD		0x100A0000
 
 #define EXYNOS4_PA_DMC0			0x10400000
+#define EXYNOS4_PA_DMC1			0x10410000
 
 #define EXYNOS4_PA_COMBINER		0x10440000
 
-- 
1.7.4.1
