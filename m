From: Chander Kashyap <chander.kashyap@linaro.org>
Subject: [PATCH 13/13] ARM: Exynos: extend soft-reset support for Exynos5420
Date: Thu,  6 Jun 2013 16:31:27 +0530
Message-ID: <1370516488-25860-13-git-send-email-chander.kashyap@linaro.org>
References: <1370516488-25860-1-git-send-email-chander.kashyap@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:52430 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932400Ab3FFLDZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Jun 2013 07:03:25 -0400
Received: by mail-pb0-f52.google.com with SMTP id xa12so3112185pbc.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jun 2013 04:03:24 -0700 (PDT)
In-Reply-To: <1370516488-25860-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, thomas.ab@samsung.com, Chander Kashyap <chander.kashyap@linaro.org>

Extend the soft reset support for Exynos5420 SoC.

Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
---
 arch/arm/mach-exynos/common.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
index fbe1aa7..dc7c134 100644
--- a/arch/arm/mach-exynos/common.c
+++ b/arch/arm/mach-exynos/common.c
@@ -321,7 +321,8 @@ void exynos5_restart(char mode, const char *cmd)
 	u32 val;
 	void __iomem *addr;
 
-	if (of_machine_is_compatible("samsung,exynos5250")) {
+	if (of_machine_is_compatible("samsung,exynos5250") ||
+		(of_machine_is_compatible("samsung,exynos5420"))) {
 		val = 0x1;
 		addr = EXYNOS_SWRESET;
 	} else if (of_machine_is_compatible("samsung,exynos5440")) {
-- 
1.7.9.5
