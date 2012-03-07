From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Fix compilation error with mach-exynos4-dt board
Date: Wed,  7 Mar 2012 10:50:26 +0530
Message-ID: <1331097626-5369-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:55330 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750726Ab2CGF1N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Mar 2012 00:27:13 -0500
Received: by pbcun15 with SMTP id un15so203432pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Mar 2012 21:27:12 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: thomas.abraham@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Commit 84499abd19d4 ("ARM: EXYNOS: add support uart for EXYNOS4 and EXY=
NOS5")
renames S5P_PA_UARTn to EXYNOS4_PA_UARTn. Hence we need to do
similar modification in mach-exynos4-dt.c to fix compilation error.

arch/arm/mach-exynos/mach-exynos4-dt.c:40:2: error: =E2=80=98S5P_PA_UAR=
T0=E2=80=99
undeclared here (not in a function)

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exy=
nos/mach-exynos4-dt.c
index e6b02fd..8245f1c 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -37,13 +37,13 @@
  * data from the device tree.
  */
 static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initc=
onst =3D {
-	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART0,
+	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART0,
 				"exynos4210-uart.0", NULL),
-	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART1,
+	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART1,
 				"exynos4210-uart.1", NULL),
-	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART2,
+	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART2,
 				"exynos4210-uart.2", NULL),
-	OF_DEV_AUXDATA("samsung,exynos4210-uart", S5P_PA_UART3,
+	OF_DEV_AUXDATA("samsung,exynos4210-uart", EXYNOS4_PA_UART3,
 				"exynos4210-uart.3", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-sdhci", EXYNOS4_PA_HSMMC(0),
 				"exynos4-sdhci.0", NULL),
--=20
1.7.4.1
