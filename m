From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH RESEND] usb: ohci-exynos: Remove locks for 'ohci' in
 suspend callback
Date: Wed, 09 Apr 2014 11:13:32 +0900
Message-ID: <003a01cf5399$4e7e8590$eb7b90b0$%han@samsung.com>
References: <1396968035-32286-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1396968035-32286-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Content-language: ko
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Vivek Gautam' <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, 'Manjunath Goudar' <csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tuesday, April 08, 2014 11:41 PM, Vivek Gautam wrote:
> 
> Patch : 14982e3 USB: OHCI: Properly handle ohci-exynos suspend
> has already removed 'ohci_hcd' settings from exynos glue layer
> as a part of streamlining the ohci controller's suspend.
> So we don't need the locks for 'ohci_hcd' anymore.

Right, this spin_lock/unlock is unnecessary, because it is
already used in ohci_suspend().

Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Jingoo Han

> 
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Manjunath Goudar <csmanjuvijay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> ---
>  drivers/usb/host/ohci-exynos.c |    6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
> index 68588d8..9cf80cb 100644
> --- a/drivers/usb/host/ohci-exynos.c
> +++ b/drivers/usb/host/ohci-exynos.c
> @@ -190,17 +190,13 @@ static int exynos_ohci_suspend(struct device *dev)
>  {
>  	struct usb_hcd *hcd = dev_get_drvdata(dev);
>  	struct exynos_ohci_hcd *exynos_ohci = to_exynos_ohci(hcd);
> -	struct ohci_hcd *ohci = hcd_to_ohci(hcd);
>  	struct platform_device *pdev = to_platform_device(dev);
>  	bool do_wakeup = device_may_wakeup(dev);
> -	unsigned long flags;
>  	int rc = ohci_suspend(hcd, do_wakeup);
> 
>  	if (rc)
>  		return rc;
> 
> -	spin_lock_irqsave(&ohci->lock, flags);
> -
>  	if (exynos_ohci->otg)
>  		exynos_ohci->otg->set_host(exynos_ohci->otg, &hcd->self);
> 
> @@ -208,8 +204,6 @@ static int exynos_ohci_suspend(struct device *dev)
> 
>  	clk_disable_unprepare(exynos_ohci->clk);
> 
> -	spin_unlock_irqrestore(&ohci->lock, flags);
> -
>  	return 0;
>  }
> 
> --
> 1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
