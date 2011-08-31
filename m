From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS4: Code cleanup and remove extra functions.
Date: Wed, 31 Aug 2011 14:42:35 +0900
Message-ID: <001901cc67a0$c93da370$5bb8ea50$%kim@samsung.com>
References: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
 <1314098937-4727-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22989 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752758Ab1HaFmh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 01:42:37 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQS005VB2IZJKH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 14:42:35 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQS006UT2IZTQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 14:42:35 +0900 (KST)
In-reply-to: <1314098937-4727-2-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>, =?ks_c_5601-1987?B?J7HosObAzyc=?= <ki0351.kim@samsung.com>

Sachin Kamat wrote:
> 
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
> 
> This patch removes the intermediate exynos4_usb_phy1_init and
> exynos4_usb_phy1_exit function calls.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/setup-usb-phy.c |  166 +++++++++++++++-------------
----
>  1 files changed, 78 insertions(+), 88 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-
> exynos4/setup-usb-phy.c
> index 39aca04..f4c944a 100644
> --- a/arch/arm/mach-exynos4/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos4/setup-usb-phy.c
> @@ -19,118 +19,108 @@
>  #include <plat/cpu.h>
>  #include <plat/usb-phy.h>
> 
> -static int exynos4_usb_phy1_init(struct platform_device *pdev)
> +int s5p_usb_phy_init(struct platform_device *pdev, int type)
>  {
> -	struct clk *otg_clk;
> -	struct clk *xusbxti_clk;
> -	u32 phyclk;
> -	u32 rstcon;
> -	int err;
> -
> -	otg_clk = clk_get(&pdev->dev, "otg");
> -	if (IS_ERR(otg_clk)) {
> -		dev_err(&pdev->dev, "Failed to get otg clock\n");
> -		return PTR_ERR(otg_clk);
> -	}
> +	if (type == S5P_USB_PHY_HOST) {
> +		struct clk *otg_clk;
> +		struct clk *xusbxti_clk;
> +		u32 phyclk;
> +		u32 rstcon;
> +		int err;
> +
> +		otg_clk = clk_get(&pdev->dev, "otg");
> +		if (IS_ERR(otg_clk)) {
> +			dev_err(&pdev->dev, "Failed to get otg clock\n");
> +			return PTR_ERR(otg_clk);
> +		}
> 
> -	err = clk_enable(otg_clk);
> -	if (err) {
> -		clk_put(otg_clk);
> -		return err;
> -	}
> +		err = clk_enable(otg_clk);
> +		if (err) {
> +			clk_put(otg_clk);
> +			return err;
> +		}
> 
> -	writel(readl(S5P_USBHOST_PHY_CONTROL) |
> S5P_USBHOST_PHY_ENABLE,
> +		writel(readl(S5P_USBHOST_PHY_CONTROL) |
> S5P_USBHOST_PHY_ENABLE,
>  			S5P_USBHOST_PHY_CONTROL);
> 
> -	/* set clock frequency for PLL */
> -	phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
> -
> -	xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
> -	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> -		switch (clk_get_rate(xusbxti_clk)) {
> -		case 12 * MHZ:
> -			phyclk |= CLKSEL_12M;
> -			break;
> -		case 24 * MHZ:
> -			phyclk |= CLKSEL_24M;
> -			break;
> -		default:
> -		case 48 * MHZ:
> -			/* default reference clock */
> -			break;
> -		}
> +		/* set clock frequency for PLL */
> +		phyclk = readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
> +
> +		xusbxti_clk = clk_get(&pdev->dev, "xusbxti");
> +		if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> +			switch (clk_get_rate(xusbxti_clk)) {
> +			case 12 * MHZ:
> +				phyclk |= CLKSEL_12M;
> +				break;
> +			case 24 * MHZ:
> +				phyclk |= CLKSEL_24M;
> +				break;
> +			default:
> +			case 48 * MHZ:
> +				/* default reference clock */
> +				break;
> +			}
>  		clk_put(xusbxti_clk);
> -	}
> +		}
> 
> -	writel(phyclk, EXYNOS4_PHYCLK);
> +		writel(phyclk, EXYNOS4_PHYCLK);
> 
> -	/* floating prevention logic: disable */
> -	writel((readl(EXYNOS4_PHY1CON) | FPENABLEN),
> EXYNOS4_PHY1CON);
> +		/* floating prevention logic: disable */
> +		writel((readl(EXYNOS4_PHY1CON) | FPENABLEN),
> EXYNOS4_PHY1CON);
> 
> -	/* set to normal HSIC 0 and 1 of PHY1 */
> -	writel((readl(EXYNOS4_PHYPWR) & ~PHY1_HSIC_NORMAL_MASK),
> +		/* set to normal HSIC 0 and 1 of PHY1 */
> +		writel((readl(EXYNOS4_PHYPWR) &
> ~PHY1_HSIC_NORMAL_MASK),
>  			EXYNOS4_PHYPWR);
> 
> -	/* set to normal standard USB of PHY1 */
> -	writel((readl(EXYNOS4_PHYPWR) & ~PHY1_STD_NORMAL_MASK),
> EXYNOS4_PHYPWR);
> +		/* set to normal standard USB of PHY1 */
> +		writel((readl(EXYNOS4_PHYPWR) &
> ~PHY1_STD_NORMAL_MASK),
> +			EXYNOS4_PHYPWR);
> 
> -	/* reset all ports of both PHY and Link */
> -	rstcon = readl(EXYNOS4_RSTCON) | HOST_LINK_PORT_SWRST_MASK |
> -		PHY1_SWRST_MASK;
> -	writel(rstcon, EXYNOS4_RSTCON);
> -	udelay(10);
> +		/* reset all ports of both PHY and Link */
> +		rstcon = readl(EXYNOS4_RSTCON) |
> HOST_LINK_PORT_SWRST_MASK |
> +			PHY1_SWRST_MASK;
> +		writel(rstcon, EXYNOS4_RSTCON);
> +		udelay(10);
> 
> -	rstcon &= ~(HOST_LINK_PORT_SWRST_MASK | PHY1_SWRST_MASK);
> -	writel(rstcon, EXYNOS4_RSTCON);
> -	udelay(80);
> +		rstcon &= ~(HOST_LINK_PORT_SWRST_MASK |
> PHY1_SWRST_MASK);
> +		writel(rstcon, EXYNOS4_RSTCON);
> +		udelay(80);
> 
> -	clk_disable(otg_clk);
> -	clk_put(otg_clk);
> +		clk_disable(otg_clk);
> +		clk_put(otg_clk);
> 
> -	return 0;
> +		return 0;
> +	}
> +	return -EINVAL;
>  }
> 
> -static int exynos4_usb_phy1_exit(struct platform_device *pdev)
> +int s5p_usb_phy_exit(struct platform_device *pdev, int type)
>  {
> -	struct clk *otg_clk;
> -	int err;
> -
> -	otg_clk = clk_get(&pdev->dev, "otg");
> -	if (IS_ERR(otg_clk)) {
> -		dev_err(&pdev->dev, "Failed to get otg clock\n");
> -		return PTR_ERR(otg_clk);
> -	}
> +	if (type == S5P_USB_PHY_HOST) {
> +		struct clk *otg_clk;
> +		int err;
> +		otg_clk = clk_get(&pdev->dev, "otg");
> +		if (IS_ERR(otg_clk)) {
> +			dev_err(&pdev->dev, "Failed to get otg clock\n");
> +			return PTR_ERR(otg_clk);
> +		}
> 
> -	err = clk_enable(otg_clk);
> -	if (err) {
> -		clk_put(otg_clk);
> -		return err;
> -	}
> +		err = clk_enable(otg_clk);
> +		if (err) {
> +			clk_put(otg_clk);
> +			return err;
> +		}
> 
> -	writel((readl(EXYNOS4_PHYPWR) |
> PHY1_STD_ANALOG_POWERDOWN),
> +		writel((readl(EXYNOS4_PHYPWR) |
> PHY1_STD_ANALOG_POWERDOWN),
>  			EXYNOS4_PHYPWR);
> 
> -	writel(readl(S5P_USBHOST_PHY_CONTROL) &
> ~S5P_USBHOST_PHY_ENABLE,
> +		writel(readl(S5P_USBHOST_PHY_CONTROL) &
> ~S5P_USBHOST_PHY_ENABLE,
>  			S5P_USBHOST_PHY_CONTROL);
> 
> -	clk_disable(otg_clk);
> -	clk_put(otg_clk);
> -
> -	return 0;
> -}
> -
> -int s5p_usb_phy_init(struct platform_device *pdev, int type)
> -{
> -	if (type == S5P_USB_PHY_HOST)
> -		return exynos4_usb_phy1_init(pdev);
> -
> -	return -EINVAL;
> -}
> -
> -int s5p_usb_phy_exit(struct platform_device *pdev, int type)
> -{
> -	if (type == S5P_USB_PHY_HOST)
> -		return exynos4_usb_phy1_exit(pdev);
> +		clk_disable(otg_clk);
> +		clk_put(otg_clk);
> 
> +		return 0;
> +	}
>  	return -EINVAL;
>  }
> --
> 1.7.4.1

(Cc'ed Yulgon Kim and Kyoungil Kim)

Hi Sachin,

I don't know why this is required on usb-phy control for EXYNOS4 now.

Actually, other upcoming EXYNOS SoCs have more usb phys than EXYNOS4210, so
this can make it more difficult to control.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
