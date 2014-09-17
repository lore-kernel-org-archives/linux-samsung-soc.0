From: Jonghwa Lee <jonghwa3.lee@samsung.com>
Subject: [RESEND PATCH] arm: exynos: Allow rtc alarm and tick wakeup irq for
 exynos3250.
Date: Wed, 17 Sep 2014 12:07:42 +0900
Message-ID: <1410923262-4771-1-git-send-email-jonghwa3.lee@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35654 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021AbaIQDHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Sep 2014 23:07:51 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, Jonghwa Lee <jonghwa3.lee@samsung.com>

Add rtc alarm and tick irq to wakeup sources in exynos3250.

Signed-off-by: Jonghwa Lee <jonghwa3.lee@samsung.com>
Acked-by : Chanwoo choi <cw00.choi@samsung.com>
---
 arch/arm/mach-exynos/pm.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
index fa7218a..d78dcf9 100644
--- a/arch/arm/mach-exynos/pm.c
+++ b/arch/arm/mach-exynos/pm.c
@@ -66,6 +66,12 @@ static struct sleep_save exynos_core_save[] = {
 
 static u32 exynos_irqwake_intmask = 0xffffffff;
 
+static const struct exynos_wkup_irq exynos3250_wkup_irq[] = {
+	{ 105, BIT(1) }, /* RTC alarm */
+	{ 106, BIT(2) }, /* RTC tick */
+	{ /* sentinel */ },
+};
+
 static const struct exynos_wkup_irq exynos4_wkup_irq[] = {
 	{ 76, BIT(1) }, /* RTC alarm */
 	{ 77, BIT(2) }, /* RTC tick */
@@ -81,9 +87,10 @@ static const struct exynos_wkup_irq exynos5250_wkup_irq[] = {
 static int exynos_irq_set_wake(struct irq_data *data, unsigned int state)
 {
 	const struct exynos_wkup_irq *wkup_irq;
-
 	if (soc_is_exynos5250())
 		wkup_irq = exynos5250_wkup_irq;
+	else if (soc_is_exynos3250())
+		wkup_irq = exynos3250_wkup_irq;
 	else
 		wkup_irq = exynos4_wkup_irq;
 
-- 
1.7.9.5
