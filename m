From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND 1/4] ARM: EXYNOS: Add usb otg phy control for
 EXYNOS4210
Date: Wed, 16 May 2012 17:17:35 +0900
Message-ID: <097801cd333c$59c94770$0d5bd650$%kim@samsung.com>
References: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
 <1336655818-15136-2-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60020 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759834Ab2EPIRi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 May 2012 04:17:38 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4300EQ6WAR23V0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 May 2012 17:17:37 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4300MC3WD8QAI0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 May 2012 17:17:37 +0900 (KST)
In-reply-to: <1336655818-15136-2-git-send-email-l.majewski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Lukasz Majewski' <l.majewski@samsung.com>
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Yulgon Kim' <yulgon.kim@samsung.com>

Lukasz Majewski wrote:
> 
> This patch supports to control usb otg phy of EXYNOS4210.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> [Rebased on the newest git/kgene/linux-samsung #for-next]
> Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
> ---
>  arch/arm/mach-exynos/include/mach/irqs.h     |    1 +
>  arch/arm/mach-exynos/include/mach/map.h      |    4 +
>  arch/arm/mach-exynos/include/mach/regs-pmu.h |    3 +
>  arch/arm/mach-exynos/setup-usb-phy.c         |   95
+++++++++++++++++++-----
> --
>  4 files changed, 78 insertions(+), 25 deletions(-)
> 

[...]

Hi Lukasz,

I have small comments on this.

> +static int exynos4_usb_phy0_init(struct platform_device *pdev)
> +{
> +	u32 rstcon;
> +
> +	writel(readl(S5P_USBDEVICE_PHY_CONTROL) | S5P_USBDEVICE_PHY_ENABLE,
> +			S5P_USBDEVICE_PHY_CONTROL);
> +
> +	exynos4_usb_phy_clkset(pdev);
> +
> +	/* set to normal PHY0 */
> +	writel((readl(EXYNOS4_PHYPWR) & ~PHY0_NORMAL_MASK), EXYNOS4_PHYPWR);
> +
> +	/* reset PHY0 and Link */
> +	rstcon = readl(EXYNOS4_RSTCON) | PHY0_SWRST_MASK;
> +	writel(rstcon, EXYNOS4_RSTCON);
> +	udelay(10);
> +
> +	rstcon &= ~PHY0_SWRST_MASK;
> +	writel(rstcon, EXYNOS4_RSTCON);
> +	udelay(80);

Do we _really_ need above udelay(80)?

As I know, we only need it in the phy1_init() for EHCI and we don't need it
here.

[...]

>  int s5p_usb_phy_init(struct platform_device *pdev, int type)
>  {
> -	if (type == S5P_USB_PHY_HOST)
> +	if (type == S5P_USB_PHY_DEVICE)
> +		return exynos4_usb_phy0_init(pdev);

I think, this should be exynos4210_usb_phy0_init(pdev), because this is
available on only exynos4210 not exynos4x12 and exynos5.

> +	else if (type == S5P_USB_PHY_HOST)
>  		return exynos4_usb_phy1_init(pdev);

Same as above.

> 
>  	return -EINVAL;
> @@ -144,7 +187,9 @@ int s5p_usb_phy_init(struct platform_device *pdev, int
> type)
> 
>  int s5p_usb_phy_exit(struct platform_device *pdev, int type)
>  {
> -	if (type == S5P_USB_PHY_HOST)
> +	if (type == S5P_USB_PHY_DEVICE)
> +		return exynos4_usb_phy0_exit(pdev);

Same as above.

> +	else if (type == S5P_USB_PHY_HOST)
>  		return exynos4_usb_phy1_exit(pdev);

Same as above.

If you're ok on my comments, could you please update it as soon as possible
for v3.5?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
