From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH] usb: ehci-s5p: use clk_prepare_enable and
 clk_disable_unprepare
Date: Thu, 04 Oct 2012 14:57:54 +0900
Message-ID: <006401cda1f5$32558fa0$9700aee0$%han@samsung.com>
References: <1349221242-2771-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:29066 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964Ab2JDF54 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 01:57:56 -0400
In-reply-to: <1349221242-2771-1-git-send-email-thomas.abraham@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Thomas Abraham' <thomas.abraham@linaro.org>, linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, jy0922.shim@samsung.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Wednesday, October 03, 2012 8:41 AM Thomas Abraham wrote
> 
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>


It looks good. Also, I have tested this patch with Exynos4210.

Acked-by: Jingoo Han <jg1.han@samsung.com>


Best regards,
Jingoo Han

> ---
>  drivers/usb/host/ehci-s5p.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-s5p.c b/drivers/usb/host/ehci-s5p.c
> index 85b74be..abc178d 100644
> --- a/drivers/usb/host/ehci-s5p.c
> +++ b/drivers/usb/host/ehci-s5p.c
> @@ -136,7 +136,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  		goto fail_clk;
>  	}
> 
> -	err = clk_enable(s5p_ehci->clk);
> +	err = clk_prepare_enable(s5p_ehci->clk);
>  	if (err)
>  		goto fail_clk;
> 
> @@ -183,7 +183,7 @@ static int __devinit s5p_ehci_probe(struct platform_device *pdev)
>  	return 0;
> 
>  fail_io:
> -	clk_disable(s5p_ehci->clk);
> +	clk_disable_unprepare(s5p_ehci->clk);
>  fail_clk:
>  	usb_put_hcd(hcd);
>  	return err;
> @@ -200,7 +200,7 @@ static int __devexit s5p_ehci_remove(struct platform_device *pdev)
>  	if (pdata && pdata->phy_exit)
>  		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> 
> -	clk_disable(s5p_ehci->clk);
> +	clk_disable_unprepare(s5p_ehci->clk);
> 
>  	usb_put_hcd(hcd);
> 
> @@ -231,7 +231,7 @@ static int s5p_ehci_suspend(struct device *dev)
>  	if (pdata && pdata->phy_exit)
>  		pdata->phy_exit(pdev, S5P_USB_PHY_HOST);
> 
> -	clk_disable(s5p_ehci->clk);
> +	clk_disable_unprepare(s5p_ehci->clk);
> 
>  	return rc;
>  }
> @@ -243,7 +243,7 @@ static int s5p_ehci_resume(struct device *dev)
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct s5p_ehci_platdata *pdata = pdev->dev.platform_data;
> 
> -	clk_enable(s5p_ehci->clk);
> +	clk_prepare_enable(s5p_ehci->clk);
> 
>  	if (pdata && pdata->phy_init)
>  		pdata->phy_init(pdev, S5P_USB_PHY_HOST);
> --
> 1.7.4.1
