From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 1/2] usb: ehci-exynos: Return immediately from suspend
 if ehci_suspend fails
Date: Thu, 10 Apr 2014 11:27:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1404101127270.32351-100000@netrider.rowland.org>
References: <1397125682-4955-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1397125682-4955-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 10 Apr 2014, Vivek Gautam wrote:

> Patch 'b8efdaf USB: EHCI: add check for wakeup/suspend race'
> adds a check for possible race between suspend and wakeup interrupt,
> and thereby it returns -EBUSY as error code if there's a wakeup
> interrupt.
> So the platform host controller should not proceed further with
> its suspend callback, rather should return immediately to avoid
> powering down the essential things, like phy.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> ---
> 
> Changes from v1:
> -- Removed unnecessary change 'return 0'
> 
>  drivers/usb/host/ehci-exynos.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index d1d8c47..7f425ac 100644
> --- a/drivers/usb/host/ehci-exynos.c
> +++ b/drivers/usb/host/ehci-exynos.c
> @@ -212,6 +212,8 @@ static int exynos_ehci_suspend(struct device *dev)
>  	int rc;
>  
>  	rc = ehci_suspend(hcd, do_wakeup);
> +	if (rc)
> +		return rc;
>  
>  	if (exynos_ehci->otg)
>  		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
