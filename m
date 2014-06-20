From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH v3 2/3] clocksource: exynos_mct: __raw_readl/__raw_writel => readl_relaxed/writel_relaxed
Date: Fri, 20 Jun 2014 10:47:51 -0700
Message-ID: <1403286472-6817-3-git-send-email-dianders@chromium.org>
References: <1403286472-6817-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f74.google.com ([209.85.216.74]:33904 "EHLO
	mail-qa0-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757411AbaFTRsB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jun 2014 13:48:01 -0400
Received: by mail-qa0-f74.google.com with SMTP id w8so537069qac.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jun 2014 10:48:00 -0700 (PDT)
In-Reply-To: <1403286472-6817-1-git-send-email-dianders@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Chirantan Ekbote <chirantan@chromium.org>, David Riley <davidriley@chromium.org>, olof@lixom.net, linux-samsung-soc@vger.kernel.org, Amit Daniel Kachhap <amit.daniel@samsung.com>, javier.martinez@collabora.co.uk, Doug Anderson <dianders@chromium.org>, tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Using the __raw functions is discouraged.  Update the file to
consistently use the proper functions.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
Changes in v3:
- __raw_readl / __raw_writel patch new for version 3

 drivers/clocksource/exynos_mct.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index ab51bf20a..2df03e2 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -94,7 +94,7 @@ static void exynos4_mct_write(unsigned int value, unsigned long offset)
 	u32 mask;
 	u32 i;
 
-	__raw_writel(value, reg_base + offset);
+	writel_relaxed(value, reg_base + offset);
 
 	if (likely(offset >= EXYNOS4_MCT_L_BASE(0))) {
 		stat_addr = (offset & ~EXYNOS4_MCT_L_MASK) + MCT_L_WSTAT_OFFSET;
@@ -144,8 +144,8 @@ static void exynos4_mct_write(unsigned int value, unsigned long offset)
 
 	/* Wait maximum 1 ms until written values are applied */
 	for (i = 0; i < loops_per_jiffy / 1000 * HZ; i++)
-		if (__raw_readl(reg_base + stat_addr) & mask) {
-			__raw_writel(mask, reg_base + stat_addr);
+		if (readl_relaxed(reg_base + stat_addr) & mask) {
+			writel_relaxed(mask, reg_base + stat_addr);
 			return;
 		}
 
@@ -157,7 +157,7 @@ static void exynos4_mct_frc_start(void)
 {
 	u32 reg;
 
-	reg = __raw_readl(reg_base + EXYNOS4_MCT_G_TCON);
+	reg = readl_relaxed(reg_base + EXYNOS4_MCT_G_TCON);
 	reg |= MCT_G_TCON_START;
 	exynos4_mct_write(reg, EXYNOS4_MCT_G_TCON);
 }
@@ -165,12 +165,12 @@ static void exynos4_mct_frc_start(void)
 static cycle_t notrace _exynos4_frc_read(void)
 {
 	unsigned int lo, hi;
-	u32 hi2 = __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_U);
+	u32 hi2 = readl_relaxed(reg_base + EXYNOS4_MCT_G_CNT_U);
 
 	do {
 		hi = hi2;
-		lo = __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);
-		hi2 = __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_U);
+		lo = readl_relaxed(reg_base + EXYNOS4_MCT_G_CNT_L);
+		hi2 = readl_relaxed(reg_base + EXYNOS4_MCT_G_CNT_U);
 	} while (hi != hi2);
 
 	return ((cycle_t)hi << 32) | lo;
@@ -225,7 +225,7 @@ static void exynos4_mct_comp0_stop(void)
 {
 	unsigned int tcon;
 
-	tcon = __raw_readl(reg_base + EXYNOS4_MCT_G_TCON);
+	tcon = readl_relaxed(reg_base + EXYNOS4_MCT_G_TCON);
 	tcon &= ~(MCT_G_TCON_COMP0_ENABLE | MCT_G_TCON_COMP0_AUTO_INC);
 
 	exynos4_mct_write(tcon, EXYNOS4_MCT_G_TCON);
@@ -238,7 +238,7 @@ static void exynos4_mct_comp0_start(enum clock_event_mode mode,
 	unsigned int tcon;
 	cycle_t comp_cycle;
 
-	tcon = __raw_readl(reg_base + EXYNOS4_MCT_G_TCON);
+	tcon = readl_relaxed(reg_base + EXYNOS4_MCT_G_TCON);
 
 	if (mode == CLOCK_EVT_MODE_PERIODIC) {
 		tcon |= MCT_G_TCON_COMP0_AUTO_INC;
@@ -327,7 +327,7 @@ static void exynos4_mct_tick_stop(struct mct_clock_event_device *mevt)
 	unsigned long mask = MCT_L_TCON_INT_START | MCT_L_TCON_TIMER_START;
 	unsigned long offset = mevt->base + MCT_L_TCON_OFFSET;
 
-	tmp = __raw_readl(reg_base + offset);
+	tmp = readl_relaxed(reg_base + offset);
 	if (tmp & mask) {
 		tmp &= ~mask;
 		exynos4_mct_write(tmp, offset);
@@ -349,7 +349,7 @@ static void exynos4_mct_tick_start(unsigned long cycles,
 	/* enable MCT tick interrupt */
 	exynos4_mct_write(0x1, mevt->base + MCT_L_INT_ENB_OFFSET);
 
-	tmp = __raw_readl(reg_base + mevt->base + MCT_L_TCON_OFFSET);
+	tmp = readl_relaxed(reg_base + mevt->base + MCT_L_TCON_OFFSET);
 	tmp |= MCT_L_TCON_INT_START | MCT_L_TCON_TIMER_START |
 	       MCT_L_TCON_INTERVAL_MODE;
 	exynos4_mct_write(tmp, mevt->base + MCT_L_TCON_OFFSET);
@@ -401,7 +401,7 @@ static int exynos4_mct_tick_clear(struct mct_clock_event_device *mevt)
 		exynos4_mct_tick_stop(mevt);
 
 	/* Clear the MCT tick interrupt */
-	if (__raw_readl(reg_base + mevt->base + MCT_L_INT_CSTAT_OFFSET) & 1) {
+	if (readl_relaxed(reg_base + mevt->base + MCT_L_INT_CSTAT_OFFSET) & 1) {
 		exynos4_mct_write(0x1, mevt->base + MCT_L_INT_CSTAT_OFFSET);
 		return 1;
 	} else {
-- 
2.0.0.526.g5318336
