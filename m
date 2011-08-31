From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] ARM: EXYNOS4: Add USB PHY initialization for device
Date: Wed, 31 Aug 2011 15:05:57 +0900
Message-ID: <001a01cc67a4$0dd349b0$2979dd10$%kim@samsung.com>
References: <1314098937-4727-1-git-send-email-sachin.kamat@linaro.org>
 <1314098937-4727-3-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41476 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753241Ab1HaGGB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 02:06:01 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQS008OV3KFJI80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 15:05:59 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQS00K573LZS6@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 31 Aug 2011 15:05:59 +0900 (KST)
In-reply-to: <1314098937-4727-3-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@lists.linaro.org, patches@linaro.org, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>, =?ks_c_5601-1987?B?J7HosObAzyc=?= <ki0351.kim@samsung.com>

Sachin Kamat wrote:
>=20
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>=20
> This patch modifies USB PHY initialization code so that USB host
> and device can be initialized with the same function.
>=20
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos4/include/mach/regs-pmu.h |    2 +-
>  arch/arm/mach-exynos4/setup-usb-phy.c         |  159 +++++++++++++++=
+---
> -----
>  2 files changed, 107 insertions(+), 54 deletions(-)
>=20
> diff --git a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
b/arch/arm/mach-
> exynos4/include/mach/regs-pmu.h
> index cdf9b47..c4709f2 100644
> --- a/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> +++ b/arch/arm/mach-exynos4/include/mach/regs-pmu.h
> @@ -34,7 +34,7 @@
>  #define S5P_WAKEUP_STAT
> 	S5P_PMUREG(0x0600)
>  #define S5P_EINT_WAKEUP_MASK
> 	S5P_PMUREG(0x0604)
>  #define S5P_WAKEUP_MASK
> 	S5P_PMUREG(0x0608)
> -
> +#define S5P_USBDEVICE_PHY_CONTROL
> 	S5P_PMUREG(0x0704)
>  #define S5P_USBHOST_PHY_CONTROL
> 	S5P_PMUREG(0x0708)
>  #define S5P_USBHOST_PHY_ENABLE			(1 << 0)
>=20
> diff --git a/arch/arm/mach-exynos4/setup-usb-phy.c b/arch/arm/mach-
> exynos4/setup-usb-phy.c
> index f4c944a..69878a1 100644
> --- a/arch/arm/mach-exynos4/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos4/setup-usb-phy.c
> @@ -21,51 +21,65 @@
>=20
>  int s5p_usb_phy_init(struct platform_device *pdev, int type)
>  {
> +	struct clk *otg_clk, *usbhost_clk;
> +	struct clk *xusbxti_clk;
> +	u32 phyclk;
> +	u32 rstcon;
> +	int err;
> +	if ((type !=3D S5P_USB_PHY_HOST) && (type !=3D S5P_USB_PHY_DEVICE))
> +		return -EINVAL;
> +
> +	otg_clk =3D clk_get(&pdev->dev, "otg");
> +	if (IS_ERR(otg_clk)) {
> +		dev_err(&pdev->dev, "Failed to get otg clock\n");
> +		return PTR_ERR(otg_clk);
> +	}
> +
> +	err =3D clk_enable(otg_clk);
> +	if (err) {
> +		clk_put(otg_clk);
> +		return err;
> +	}
> +
> +	/* set clock frequency for PLL */
> +	phyclk =3D readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
> +
> +	xusbxti_clk =3D clk_get(&pdev->dev, "xusbxti");
> +	if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> +		switch (clk_get_rate(xusbxti_clk)) {
> +		case 12 * MHZ:
> +			phyclk |=3D CLKSEL_12M;
> +			break;
> +		case 24 * MHZ:
> +			phyclk |=3D CLKSEL_24M;
> +			break;
> +		default:
> +		case 48 * MHZ:
> +			/* default reference clock */
> +			break;
> +		}
> +	clk_put(xusbxti_clk);
> +	}
> +
> +	writel(phyclk, EXYNOS4_PHYCLK);
> +
>  	if (type =3D=3D S5P_USB_PHY_HOST) {
> -		struct clk *otg_clk;
> -		struct clk *xusbxti_clk;
> -		u32 phyclk;
> -		u32 rstcon;
> -		int err;
> -
> -		otg_clk =3D clk_get(&pdev->dev, "otg");
> -		if (IS_ERR(otg_clk)) {
> -			dev_err(&pdev->dev, "Failed to get otg clock\n");
> -			return PTR_ERR(otg_clk);
> +		usbhost_clk =3D clk_get(&pdev->dev, "usbhost");
> +
> +		if (IS_ERR(usbhost_clk)) {
> +			dev_err(&pdev->dev, "Failed to get usbhost
clock\n");
> +			return PTR_ERR(usbhost_clk);

(Cc'ed Yulgon Kim and Kyoungil Kim)

Hmm...I know, since the USB Host PHY Controller is included in the 'otg=
'
clock domain the 'otg' clock is controlled here. But the USB Host clock=
 is
controlled in ehci-s5p driver now so we don't need to add this here.

>  		}
>=20
> -		err =3D clk_enable(otg_clk);
> +		err =3D clk_enable(usbhost_clk);
>  		if (err) {
> -			clk_put(otg_clk);
> +			clk_put(usbhost_clk);
>  			return err;
>  		}
>=20
>  		writel(readl(S5P_USBHOST_PHY_CONTROL) |
> S5P_USBHOST_PHY_ENABLE,
>  			S5P_USBHOST_PHY_CONTROL);
>=20
> -		/* set clock frequency for PLL */
> -		phyclk =3D readl(EXYNOS4_PHYCLK) & ~CLKSEL_MASK;
> -
> -		xusbxti_clk =3D clk_get(&pdev->dev, "xusbxti");
> -		if (xusbxti_clk && !IS_ERR(xusbxti_clk)) {
> -			switch (clk_get_rate(xusbxti_clk)) {
> -			case 12 * MHZ:
> -				phyclk |=3D CLKSEL_12M;
> -				break;
> -			case 24 * MHZ:
> -				phyclk |=3D CLKSEL_24M;
> -				break;
> -			default:
> -			case 48 * MHZ:
> -				/* default reference clock */
> -				break;
> -			}
> -		clk_put(xusbxti_clk);
> -		}
> -
> -		writel(phyclk, EXYNOS4_PHYCLK);
> -
> -		/* floating prevention logic: disable */
>  		writel((readl(EXYNOS4_PHY1CON) | FPENABLEN),
> EXYNOS4_PHY1CON);
>=20
>  		/* set to normal HSIC 0 and 1 of PHY1 */
> @@ -84,30 +98,61 @@ int s5p_usb_phy_init(struct platform_device *pdev=
,
int type)
>=20
>  		rstcon &=3D ~(HOST_LINK_PORT_SWRST_MASK |
> PHY1_SWRST_MASK);
>  		writel(rstcon, EXYNOS4_RSTCON);
> -		udelay(80);
> +	} else if (type =3D=3D S5P_USB_PHY_DEVICE) {
> +		writel(readl(S5P_USBDEVICE_PHY_CONTROL) | (0x1<<0),
> +				S5P_USBDEVICE_PHY_CONTROL);
> +		writel((readl(EXYNOS4_PHYPWR) & ~(0x7<<3)&~(0x1<<0)),
> +				EXYNOS4_PHYPWR);
> +		writel((readl(EXYNOS4_PHYCLK) & ~(0x5<<2))|(0x3<<0),
> +				EXYNOS4_PHYCLK);
> +		writel((readl(EXYNOS4_RSTCON) & ~(0x3<<1))|(0x1<<0),
> +				EXYNOS4_RSTCON);
> +		udelay(10);
> +		writel(readl(EXYNOS4_RSTCON) & ~(0x7<<0),
> +				EXYNOS4_RSTCON);
> +	}
> +	udelay(80);
>=20
> -		clk_disable(otg_clk);
> -		clk_put(otg_clk);
> +	clk_disable(otg_clk);
> +	clk_put(otg_clk);
> +	if (type =3D=3D S5P_USB_PHY_HOST)
> +		clk_put(usbhost_clk);
>=20
> -		return 0;
> -	}
> -	return -EINVAL;
> +	return 0;
>  }
>=20
>  int s5p_usb_phy_exit(struct platform_device *pdev, int type)
>  {
> +	struct clk *otg_clk, *usbhost_clk;
> +	int err;
> +
> +	if ((type !=3D S5P_USB_PHY_HOST) && (type !=3D S5P_USB_PHY_DEVICE))
> +		return -EINVAL;
> +
> +	otg_clk =3D clk_get(&pdev->dev, "otg");
> +	if (IS_ERR(otg_clk)) {
> +		dev_err(&pdev->dev, "Failed to get otg clock\n");
> +		return PTR_ERR(otg_clk);
> +	}
> +
> +	err =3D clk_enable(otg_clk);
> +	if (err) {
> +		clk_put(otg_clk);
> +		return err;
> +	}
> +
>  	if (type =3D=3D S5P_USB_PHY_HOST) {
> -		struct clk *otg_clk;
> -		int err;
> -		otg_clk =3D clk_get(&pdev->dev, "otg");
> -		if (IS_ERR(otg_clk)) {
> -			dev_err(&pdev->dev, "Failed to get otg clock\n");
> -			return PTR_ERR(otg_clk);
> +
> +		usbhost_clk =3D clk_get(&pdev->dev, "usbhost");
> +
> +		if (IS_ERR(usbhost_clk)) {
> +			dev_err(&pdev->dev, "Failed to get usbhost
clock\n");
> +			return PTR_ERR(usbhost_clk);
>  		}
>=20
> -		err =3D clk_enable(otg_clk);
> +		err =3D clk_enable(usbhost_clk);

Wrong, do you _really_ want to enable usbhost_clk here, in usb_phy_exit=
()?


>  		if (err) {
> -			clk_put(otg_clk);
> +			clk_put(usbhost_clk);
>  			return err;
>  		}
>=20
> @@ -117,10 +162,18 @@ int s5p_usb_phy_exit(struct platform_device *pd=
ev,
int
> type)
>  		writel(readl(S5P_USBHOST_PHY_CONTROL) &
> ~S5P_USBHOST_PHY_ENABLE,
>  			S5P_USBHOST_PHY_CONTROL);
>=20
> -		clk_disable(otg_clk);
> -		clk_put(otg_clk);
> +	} else if (type =3D=3D S5P_USB_PHY_DEVICE) {
> +		writel(readl(EXYNOS4_PHYPWR) | (0x3<<3),
> +				EXYNOS4_PHYPWR);
>=20
> -		return 0;
> +		writel(readl(S5P_USBDEVICE_PHY_CONTROL) & ~(1<<0),
> +				S5P_USBDEVICE_PHY_CONTROL);
>  	}
> -	return -EINVAL;
> +
> +	clk_disable(otg_clk);
> +	clk_put(otg_clk);
> +	if (type =3D=3D S5P_USB_PHY_HOST)
> +		clk_put(usbhost_clk);
> +
> +	return 0;
>  }
> --
> 1.7.4.1

I can't agree this patch. I think you need to check about whole USB PHY
structure on EXYNOS4 again.

In addition, I don=A1=AFt have idea we need to control USB Host clock f=
or
handling USB PHY enable/disable.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
