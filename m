From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: ehci-exynos: Return immediately from suspend
 if ehci_suspend fails
Date: Wed, 9 Apr 2014 21:36:12 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1404092134420.7397-100000@netrider.rowland.org>
References: <001a01cf5453$243d9c70$6cb8d550$%han@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:52082 "HELO
	netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S934370AbaDJBgO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 21:36:14 -0400
In-Reply-To: <001a01cf5453$243d9c70$6cb8d550$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, kgene.kim@samsung.com, 'Vivek Gautam' <gautam.vivek@samsung.com>

On Thu, 10 Apr 2014, Jingoo Han wrote:

> > > --- a/drivers/usb/host/ehci-exynos.c
> > > +++ b/drivers/usb/host/ehci-exynos.c
> > > @@ -212,6 +212,8 @@ static int exynos_ehci_suspend(struct device *dev)
> > >  	int rc;
> > >
> > >  	rc = ehci_suspend(hcd, do_wakeup);
> > > +	if (rc)
> > > +		return rc;
> > >
> > >  	if (exynos_ehci->otg)
> > >  		exynos_ehci->otg->set_host(exynos_ehci->otg, &hcd->self);
> > > @@ -221,7 +223,7 @@ static int exynos_ehci_suspend(struct device *dev)
> > >
> > >  	clk_disable_unprepare(exynos_ehci->clk);
> > >
> > > -	return rc;
> > > +	return 0;
> > >  }
> > >
> > >  static int exynos_ehci_resume(struct device *dev)
> > 
> > The first hunk of this patch is correct, but the second hunk isn't
> > needed.  A similar remark is true for the ehci-platform patch.
> 
> Hi Alan,
> 
> Do you mean the following?
> 
> 1st hunk
>  +	if (rc)
>  +		return rc;
> 
> 2nd hunk
>  -	return rc;
>  +	return 0;

Yes, that's what I mean.

> Currently, the 'rc' will be always 'zero'; however, I don't
> Have any objection, because the code might be  modified later.

Exactly.  We should add the new "if" statement but leave the "return 
rc" the way it is.

Alan Stern
