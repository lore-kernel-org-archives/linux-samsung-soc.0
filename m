From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Add more register addresses of CMU.
Date: Thu, 21 Jul 2011 11:11:31 +0900
Message-ID: <1311214291-32151-1-git-send-email-myungjoo.ham@samsung.com>
References: <000501cc470b$34a32060$9de96120$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <000501cc470b$34a32060$9de96120$%kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, myungjoo.ham@gmail.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

These registers are crucial for PM to work properly.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/regs-clock.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/regs-clock.h b/arch/arm/mach-exynos4/include/mach/regs-clock.h
index 64bdd24..d493fdb 100644
--- a/arch/arm/mach-exynos4/include/mach/regs-clock.h
+++ b/arch/arm/mach-exynos4/include/mach/regs-clock.h
@@ -36,7 +36,9 @@
 #define S5P_CLKSRC_TOP0			S5P_CLKREG(0x0C210)
 #define S5P_CLKSRC_TOP1			S5P_CLKREG(0x0C214)
 #define S5P_CLKSRC_CAM			S5P_CLKREG(0x0C220)
+#define S5P_CLKSRC_TV			S5P_CLKREG(0x0C224)
 #define S5P_CLKSRC_MFC			S5P_CLKREG(0x0C228)
+#define S5P_CLKSRC_G3D			S5P_CLKREG(0x0C22C)
 #define S5P_CLKSRC_IMAGE		S5P_CLKREG(0x0C230)
 #define S5P_CLKSRC_LCD0			S5P_CLKREG(0x0C234)
 #define S5P_CLKSRC_LCD1			S5P_CLKREG(0x0C238)
@@ -64,6 +66,7 @@
 #define S5P_CLKDIV_PERIL3		S5P_CLKREG(0x0C55C)
 #define S5P_CLKDIV_PERIL4		S5P_CLKREG(0x0C560)
 #define S5P_CLKDIV_PERIL5		S5P_CLKREG(0x0C564)
+#define S5P_CLKDIV2_RATIO		S5P_CLKREG(0x0C580)
 
 #define S5P_CLKSRC_MASK_TOP		S5P_CLKREG(0x0C310)
 #define S5P_CLKSRC_MASK_CAM		S5P_CLKREG(0x0C320)
-- 
1.7.4.1
