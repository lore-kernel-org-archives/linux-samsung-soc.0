From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/7] ARM: EXYNOS: Constify list of retention registers
Date: Sat, 10 Dec 2016 15:47:32 +0200
Message-ID: <1481377658-22603-1-git-send-email-krzk@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:50132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751075AbcLJNsA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Dec 2016 08:48:00 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Simtec Linux Team <linux@simtec.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

The list of retention registers (release_ret_regs field of struct
exynos_pm_data and arrays with values) are not modified and can be made
const to improve the const safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-exynos/suspend.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
index 73df9f3ffbf7..d0e6ac7938f3 100644
--- a/arch/arm/mach-exynos/suspend.c
+++ b/arch/arm/mach-exynos/suspend.c
@@ -55,7 +55,7 @@ struct exynos_wkup_irq {
 struct exynos_pm_data {
 	const struct exynos_wkup_irq *wkup_irq;
 	unsigned int wake_disable_mask;
-	unsigned int *release_ret_regs;
+	const unsigned int *release_ret_regs;
 
 	void (*pm_prepare)(void);
 	void (*pm_resume_prepare)(void);
@@ -93,7 +93,7 @@ static const struct exynos_wkup_irq exynos5250_wkup_irq[] = {
 	{ /* sentinel */ },
 };
 
-static unsigned int exynos_release_ret_regs[] = {
+static const unsigned int exynos_release_ret_regs[] = {
 	S5P_PAD_RET_MAUDIO_OPTION,
 	S5P_PAD_RET_GPIO_OPTION,
 	S5P_PAD_RET_UART_OPTION,
@@ -104,7 +104,7 @@ static unsigned int exynos_release_ret_regs[] = {
 	REG_TABLE_END,
 };
 
-static unsigned int exynos3250_release_ret_regs[] = {
+static const unsigned int exynos3250_release_ret_regs[] = {
 	S5P_PAD_RET_MAUDIO_OPTION,
 	S5P_PAD_RET_GPIO_OPTION,
 	S5P_PAD_RET_UART_OPTION,
@@ -117,7 +117,7 @@ static unsigned int exynos3250_release_ret_regs[] = {
 	REG_TABLE_END,
 };
 
-static unsigned int exynos5420_release_ret_regs[] = {
+static const unsigned int exynos5420_release_ret_regs[] = {
 	EXYNOS_PAD_RET_DRAM_OPTION,
 	EXYNOS_PAD_RET_MAUDIO_OPTION,
 	EXYNOS_PAD_RET_JTAG_OPTION,
-- 
2.7.4
