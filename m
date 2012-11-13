From: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH] usb: ohci-exynos: use clk_prepare_enable and
 clk_disable_unprepare
Date: Tue, 13 Nov 2012 13:56:11 +0900
Message-ID: <01a401cdc15b$33be8100$9b3b8300$%kim@samsung.com>
References: <1349221297-2815-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1349221297-2815-1-git-send-email-thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Thomas Abraham' <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Thomas Abraham wrote:
> 
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

(+ Alan Stern)

Acked-by: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  drivers/usb/host/ohci-exynos.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-
> exynos.c
> index 20a5008..7bca600 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -123,7 +123,7 @@ static int __devinit exynos_ohci_probe(struct
> platform_device *pdev)
>  		goto fail_clk;
>  	}
> 
> -	err = clk_enable(exynos_ohci->clk);
> +	err = clk_prepare_enable(exynos_ohci->clk);
>  	if (err)
>  		goto fail_clken;
> 
> @@ -167,7 +167,7 @@ static int __devinit exynos_ohci_probe(struct
> platform_device *pdev)
>  	return 0;
> 
>  fail_io:
> -	clk_disable(exynos_ohci->clk);
> +	clk_disable_unprepare(exynos_ohci->clk);
>  fail_clken:
>  	clk_put(exynos_ohci->clk);
>  fail_clk:
> @@ -186,7 +186,7 @@ static int __devexit exynos_ohci_remove(struct
> platform_device *pdev)
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

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
