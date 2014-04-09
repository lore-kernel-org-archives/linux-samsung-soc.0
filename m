From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: ehci-exynos: Return immediately from suspend
 if ehci_suspend fails
Date: Wed, 9 Apr 2014 14:32:09 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1404091430240.28384-100000@netrider.rowland.org>
References: <1397016042-4451-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:33673 "HELO
	netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S933393AbaDIScL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 14:32:11 -0400
In-Reply-To: <1397016042-4451-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, kgene.kim@samsung.com, Jingoo Han <jg1.han@samsung.com>

On Wed, 9 Apr 2014, Vivek Gautam wrote:

> Patch 'b8efdaf USB: EHCI: add check for wakeup/suspend race'
> adds a check for possible race between suspend and wakeup interrupt,
> and thereby it returns -EBUSY as error code if there's a wakeup
> interrupt.
> So the platform host controller should not proceed further with
> its suspend callback, rather should return immediately to avoid
> powering down the essential things, like phy.
> 
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Jingoo Han <jg1.han@samsung.com>
> ---
> 
> Based on 'usb-next' branch of Greg's usb tree.
> 
>  drivers/usb/host/ehci-exynos.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> index d1d8c47..a4550eb 100644
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
> @@ -221,7 +223,7 @@ static int exynos_ehci_suspend(struct device *dev)
>  
>  	clk_disable_unprepare(exynos_ehci->clk);
>  
> -	return rc;
> +	return 0;
>  }
>  
>  static int exynos_ehci_resume(struct device *dev)

The first hunk of this patch is correct, but the second hunk isn't 
needed.  A similar remark is true for the ehci-platform patch.

Alan Stern
