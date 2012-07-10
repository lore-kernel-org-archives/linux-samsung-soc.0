From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning in setup-usb-phy.c file
Date: Tue, 10 Jul 2012 11:27:40 +0530
Message-ID: <1341899860-17979-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:64638 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752430Ab2GJF57 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jul 2012 01:57:59 -0400
Received: by yhmm54 with SMTP id m54so159364yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Jul 2012 22:57:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org, patches@linaro.org

=46ixes the following warning:
arch/arm/mach-exynos/setup-usb-phy.c: In function =E2=80=98exynos4210_u=
sb_phy_clkset=E2=80=99:
arch/arm/mach-exynos/setup-usb-phy.c:83:2:
warning: =E2=80=98phyclk=E2=80=99 may be used uninitialized in this fun=
ction [-Wuninitialized]

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos/setup-usb-phy.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exyno=
s/setup-usb-phy.c
index d26deb7..1eaa0b0 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -31,7 +31,6 @@ static void exynos4210_usb_phy_clkset(struct platform=
_device *pdev)
 	struct clk *xusbxti_clk;
 	u32 phyclk;
=20
-
 	xusbxti_clk =3D clk_get(&pdev->dev, "xusbxti");
 	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
 		if (soc_is_exynos4210()) {
@@ -50,6 +49,8 @@ static void exynos4210_usb_phy_clkset(struct platform=
_device *pdev)
 				phyclk |=3D EXYNOS4210_CLKSEL_48M;
 				break;
 			}
+			clk_put(xusbxti_clk);
+			writel(phyclk, EXYNOS4_PHYCLK);
 		} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
 			/* set clock frequency for PLL */
 			phyclk =3D readl(EXYNOS4_PHYCLK) & ~EXYNOS4X12_CLKSEL_MASK;
@@ -76,11 +77,10 @@ static void exynos4210_usb_phy_clkset(struct platfo=
rm_device *pdev)
 				phyclk |=3D EXYNOS4X12_CLKSEL_24M;
 				break;
 			}
+			clk_put(xusbxti_clk);
+			writel(phyclk, EXYNOS4_PHYCLK);
 		}
-		clk_put(xusbxti_clk);
 	}
-
-	writel(phyclk, EXYNOS4_PHYCLK);
 }
=20
 static int exynos4210_usb_phy0_init(struct platform_device *pdev)
--=20
1.7.4.1
