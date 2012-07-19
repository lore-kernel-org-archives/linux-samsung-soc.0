From: Pankaj Jangra <jangra.pankaj9@gmail.com>
Subject: Re: [PATCH 1/8] EXYNOS4: USB: Generalising setup-usb-phy driver for exynos
Date: Thu, 19 Jul 2012 09:53:45 +0530
Message-ID: <CADTbHxqFR2etsoqAQDU8UafpPwKFMsCRT1Vkrg8un52PYXnRbw@mail.gmail.com>
References: <1342619128-25013-1-git-send-email-gautam.vivek@samsung.com>
	<1342619128-25013-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:59645 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752861Ab2GSEXr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 00:23:47 -0400
Received: by yhmm54 with SMTP id m54so2361149yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jul 2012 21:23:46 -0700 (PDT)
In-Reply-To: <1342619128-25013-2-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: kgene.kim@samsung.com, l.majewski@samsung.com, kyungmin.park@samsung.com, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, m.szyprowski@samsung.com, a.kesavan@samsung.com, yulgon.kim@samsung.com, boyko.lee@samsung.com, av.tikhomirov@samsung.com, joshi@samsung.com, olofj@google.com, prashanth.g@samsung.com

Hi,

On Wed, Jul 18, 2012 at 7:15 PM, Vivek Gautam <gautam.vivek@samsung.com> wrote:
> This patch updates the setup-usb-phy in order to accomodate
> exynos5 support later.
>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
>
> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
> index b81cc56..bfc1367 100644
> --- a/arch/arm/mach-exynos/setup-usb-phy.c
> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
> @@ -26,10 +26,31 @@ static int exynos4_usb_host_phy_is_on(void)
>         return (readl(EXYNOS4_PHYPWR) & PHY1_STD_ANALOG_POWERDOWN) ? 0 : 1;
>  }
>
> -static void exynos4210_usb_phy_clkset(struct platform_device *pdev)
> +struct clk *exynos_usb_clock_enable(struct platform_device *pdev)

You might want to make it static struct clk * ?

> +{
> +       struct clk *usb_clk = NULL;
> +       int err = 0;
> +
> +       if (!usb_clk) {

What is the purpose of this condition check? usb_clk will always be
NULL here, right?

> +               usb_clk = clk_get(&pdev->dev, "otg");
> +               if (IS_ERR(usb_clk)) {
> +                       dev_err(&pdev->dev, "Failed to get otg clock\n");
> +                       return NULL;
> +               }

Regards,
Pankaj Jangra
