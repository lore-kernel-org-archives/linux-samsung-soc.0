From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH] usb: ohci-exynos: use clk_prepare_enable and
 clk_disable_unprepare
Date: Thu, 04 Oct 2012 15:00:07 +0900
Message-ID: <006501cda1f5$81639920$842acb60$%han@samsung.com>
References: <1349221297-2815-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29445 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964Ab2JDGAJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 02:00:09 -0400
In-reply-to: <1349221297-2815-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, October 03, 2012 8:42 AM Thomas Abraham wrote
> 
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>


Acked-by: Jingoo Han <jg1.han@samsung.com>


Best regards,
Jingoo Han


> ---
>  drivers/usb/host/ohci-exynos.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index 20a5008..7bca600 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -123,7 +123,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>  		goto fail_clk;
>  	}
> 
> -	err = clk_enable(exynos_ohci->clk);
> +	err = clk_prepare_enable(exynos_ohci->clk);
>  	if (err)
>  		goto fail_clken;
> 
> @@ -167,7 +167,7 @@ static int __devinit exynos_ohci_probe(struct platform_device *pdev)
>  	return 0;
> 
>  fail_io:
> -	clk_disable(exynos_ohci->clk);
> +	clk_disable_unprepare(exynos_ohci->clk);
>  fail_clken:
>  	clk_put(exynos_ohci->clk);
>  fail_clk:
> @@ -186,7 +186,7 @@ static int __devexit exynos_ohci_remove(struct platform_device *pdev)
>  	if (pdata && pdata->phy_exit)
>  		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> 
> -	clk_disable(exynos_ohci->clk);
> +	clk_disable_unprepare(exynos_ohci->clk);
>  	clk_put(exynos_ohci->clk);
> 
>  	usb_put_hcd(hcd);
> @@ -232,7 +232,7 @@ static int exynos_ohci_suspend(struct device *dev)
>  	if (pdata && pdata->phy_exit)
>  		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> 
> -	clk_disable(exynos_ohci->clk);
> +	clk_disable_unprepare(exynos_ohci->clk);
> 
>  fail:
>  	spin_unlock_irqrestore(&ohci->lock, flags);
> @@ -247,7 +247,7 @@ static int exynos_ohci_resume(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct exynos4_ohci_platdata *pdata = pdev->dev.platform_data;
> 
> -	clk_enable(exynos_ohci->clk);
> +	clk_prepare_enable(exynos_ohci->clk);
> 
>  	if (pdata && pdata->phy_init)
>  		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> --
> 1.7.4.1
