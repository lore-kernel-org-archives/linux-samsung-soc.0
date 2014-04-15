From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 2/8] ARM: EXYNOS: Add IO mapping for non-secure SYSRAM of
 Exynos3250
Date: Tue, 15 Apr 2014 10:59:46 +0900
Message-ID: <1397527192-21988-3-git-send-email-cw00.choi@samsung.com>
References: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1397527192-21988-1-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, marc.zyngier@arm.com, t.figa@samsung.com, hyunhee.kim@samsung.com, sw0312.kim@samsung.com, yj44.cho@samsung.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, ben-linux@fluff.org, olof@lixom.net, chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

The non-secure SYSRAM is used for secondary CPU bring-up. This patch add
IO mapping for non-scure SYSRAM.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
Arnd Bergmann suggested that need proper driver instead of static memory mapping.
As Chanho Park reply[2], Sachin Kamat already posted the DT support patch[1]
for memory mapping for SYSRAM.
[1] http://www.spinics.net/lists/linux-samsung-soc/msg27647.html
[2] https://lkml.org/lkml/2014/4/10/161

So, I'm going to re-implement following patch related to static memory mapping
after merged Sachin Kamat patch[1].
  ARM: EXYNOS: Add IO mapping for non-secure SYSRAM of Exynos3250

 arch/arm/mach-exynos/exynos.c           | 12 ++++++++++++
 arch/arm/mach-exynos/include/mach/map.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index a603dfa..c7c9472 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -35,6 +35,15 @@
 #define L2_AUX_VAL 0x7C470001
 #define L2_AUX_MASK 0xC200ffff
 
+static struct map_desc exynos3250_iodesc[] __initdata = {
+	{
+		.virtual	= (unsigned long)S5P_VA_SYSRAM_NS,
+		.pfn		= __phys_to_pfn(EXYNOS3_PA_SYSRAM_NS),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	},
+};
+
 static struct map_desc exynos4_iodesc[] __initdata = {
 	{
 		.virtual	= (unsigned long)S3C_VA_SYS,
@@ -275,6 +284,9 @@ static int __init exynos_fdt_map_chipid(unsigned long node, const char *uname,
  */
 static void __init exynos_map_io(void)
 {
+	if (soc_is_exynos3250())
+		iotable_init(exynos3250_iodesc, ARRAY_SIZE(exynos3250_iodesc));
+
 	if (soc_is_exynos4())
 		iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
 
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 7b046b5..a53981b 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -26,6 +26,7 @@
 #define EXYNOS4_PA_SYSRAM0		0x02025000
 #define EXYNOS4_PA_SYSRAM1		0x02020000
 #define EXYNOS5_PA_SYSRAM		0x02020000
+#define EXYNOS3_PA_SYSRAM_NS		0x0205F000
 #define EXYNOS4210_PA_SYSRAM_NS		0x0203F000
 #define EXYNOS4x12_PA_SYSRAM_NS		0x0204F000
 #define EXYNOS5250_PA_SYSRAM_NS		0x0204F000
-- 
1.8.0
