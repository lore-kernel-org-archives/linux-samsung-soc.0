From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v6 5/7] ARM: S5PV210: Access for DMCx registers
Date: Tue, 03 Aug 2010 19:04:24 +0900
Message-ID: <1280829866-26001-6-git-send-email-myungjoo.ham@samsung.com>
References: <1280829866-26001-1-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-2-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-3-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-4-git-send-email-myungjoo.ham@samsung.com>
	<1280829866-26001-5-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1280829866-26001-5-git-send-email-myungjoo.ham@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

	The CPUFREQ driver requires an access to DMCx registers. We
define physical addresses and mapping between physical and virtual
addresses of DMCx registers.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/cpu.c              |   12 +++++++++++-
 arch/arm/mach-s5pv210/include/mach/map.h |    4 ++++
 2 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s5pv210/cpu.c b/arch/arm/mach-s5pv210/cpu.c
index 74d4c08..2066695 100644
--- a/arch/arm/mach-s5pv210/cpu.c
+++ b/arch/arm/mach-s5pv210/cpu.c
@@ -60,7 +60,17 @@ static struct map_desc s5pv210_iodesc[] __initdata = {
 		.pfn		= __phys_to_pfn(S5PV210_PA_SROMC),
 		.length		= SZ_4K,
 		.type		= MT_DEVICE,
-	}
+	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC0,
+		.pfn		= __phys_to_pfn(S5PV210_PA_DMC0),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	}, {
+		.virtual	= (unsigned long)S5P_VA_DMC1,
+		.pfn		= __phys_to_pfn(S5PV210_PA_DMC1),
+		.length		= SZ_4K,
+		.type		= MT_DEVICE,
+	},
 };
 
 static void s5pv210_idle(void)
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 17687f0..daf6456 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -108,4 +108,8 @@
 #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 #define SAMSUNG_PA_KEYPAD	S5PV210_PA_KEYPAD
 
+/* DMC */
+#define S5PV210_PA_DMC0		(0xF0000000)
+#define S5PV210_PA_DMC1		(0xF1400000)
+
 #endif /* __ASM_ARCH_MAP_H */
-- 
1.6.3.3
