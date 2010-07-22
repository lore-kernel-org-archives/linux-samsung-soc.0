From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v4 3/7] ARM: S5P: Added default pll values for APLL 800/1000MHz
Date: Thu, 22 Jul 2010 18:22:49 +0900
Message-ID: <1279790573-24179-4-git-send-email-myungjoo.ham@samsung.com>
References: <1279790573-24179-1-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-2-git-send-email-myungjoo.ham@samsung.com>
	<1279790573-24179-3-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1279790573-24179-3-git-send-email-myungjoo.ham@samsung.com>
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

CPUFREQ of S5PV210 uses different APLL settings according to
different CPU frequencies. We provide such settings values for
CPUFREQ at pll.h.

Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
ARMCLK, APLL should be 800MHz.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-s5p/include/plat/pll.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/include/plat/pll.h b/arch/arm/plat-s5p/include/plat/pll.h
index 7db3227..d79042a 100644
--- a/arch/arm/plat-s5p/include/plat/pll.h
+++ b/arch/arm/plat-s5p/include/plat/pll.h
@@ -21,6 +21,9 @@
 
 #include <asm/div64.h>
 
+#define PLL45XX_APLL_VAL_1000	((1 << 31) | (125<<16) | (3<<8) | (1))
+#define PLL45XX_APLL_VAL_800	((1 << 31) | (100<<16) | (3<<8) | (1))
+
 enum pll45xx_type_t {
 	pll_4500,
 	pll_4502,
-- 
1.6.3.3
