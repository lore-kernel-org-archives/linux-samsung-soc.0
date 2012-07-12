From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning in
 setup-usb-phy.c file
Date: Thu, 12 Jul 2012 18:09:56 +0900
Message-ID: <0fa801cd600e$1b1e6d80$515b4880$%kim@samsung.com>
References: <1341899860-17979-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28474 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932960Ab2GLJJ6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:09:58 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M71008XYISAQTW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:09:56 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71004MFISKIJ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:09:56 +0900 (KST)
In-reply-to: <1341899860-17979-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, patches@linaro.org

Sachin Kamat wrote:
>=20
> Fixes the following warning:
> arch/arm/mach-exynos/setup-usb-phy.c: In function
> =E2=80=98exynos4210_usb_phy_clkset=E2=80=99:
> arch/arm/mach-exynos/setup-usb-phy.c:83:2:
> warning: =E2=80=98phyclk=E2=80=99 may be used uninitialized in this f=
unction [-
> Wuninitialized]
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/setup-usb-phy.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-
> exynos/setup-usb-phy.c
> index d26deb7..1eaa0b0 100644
> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> @@ -31,7 +31,6 @@ static void exynos4210_usb_phy_clkset(struct
> platform_device *pdev)
>  	struct clk *xusbxti_clk;
>  	u32 phyclk;
>=20
> -
>  	xusbxti_clk =3D clk_get(&pdev->dev, "xusbxti");
>  	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
>  		if (soc_is_exynos4210()) {
> @@ -50,6 +49,8 @@ static void exynos4210_usb_phy_clkset(struct
> platform_device *pdev)
>  				phyclk |=3D EXYNOS4210_CLKSEL_48M;
>  				break;
>  			}
> +			clk_put(xusbxti_clk);
> +			writel(phyclk, EXYNOS4_PHYCLK);
>  		} else if (soc_is_exynos4212() || soc_is_exynos4412()) {
>  			/* set clock frequency for PLL */
>  			phyclk =3D readl(EXYNOS4_PHYCLK) &
> ~EXYNOS4X12_CLKSEL_MASK;
> @@ -76,11 +77,10 @@ static void exynos4210_usb_phy_clkset(struct
> platform_device *pdev)
>  				phyclk |=3D EXYNOS4X12_CLKSEL_24M;
>  				break;
>  			}
> +			clk_put(xusbxti_clk);
> +			writel(phyclk, EXYNOS4_PHYCLK);
>  		}
> -		clk_put(xusbxti_clk);
>  	}
> -
> -	writel(phyclk, EXYNOS4_PHYCLK);
>  }
>=20
>  static int exynos4210_usb_phy0_init(struct platform_device *pdev)
> --
> 1.7.4.1

Well, I think, following is enough?

And if you're ok on this, I will squash into your original one which is=
 still in my tree.

diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exyno=
s/setup-usb-phy.c
index d26deb7..3f82414 100644
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
@@ -78,9 +77,8 @@ static void exynos4210_usb_phy_clkset(struct platform=
_device *pdev)
 			}
 		}
 		clk_put(xusbxti_clk);
+		writel(phyclk, EXYNOS4_PHYCLK);
 	}
-
-	writel(phyclk, EXYNOS4_PHYCLK);
 }
=20
 static int exynos4210_usb_phy0_init(struct platform_device *pdev)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
