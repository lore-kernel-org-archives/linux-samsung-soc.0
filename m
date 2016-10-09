From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] host: ehci-exynos: Convert to use the SET_SYSTEM_SLEEP_PM_OPS
Date: Sun, 9 Oct 2016 17:17:15 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1610091713490.1734-100000@netrider.rowland.org>
References: <20161009163446.GA9672@kozik-lap>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from netrider.rowland.org ([192.131.102.5]:56125 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1751072AbcJIVRR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 9 Oct 2016 17:17:17 -0400
In-Reply-To: <20161009163446.GA9672@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 9 Oct 2016, Krzysztof Kozlowski wrote:

> On Sun, Oct 09, 2016 at 02:34:14PM +0000, Anand Moon wrote:
> > Move the ehci-exynos system PM callbacks within #ifdef CONFIG_PM_SLEEP
> > as to avoid them being build when not used. This also allows us to use the
> > SET_SYSTEM_SLEEP_PM_OPS macro which simplifies the code.
> > 
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/usb/host/ehci-exynos.c | 14 ++++++--------
> >  1 file changed, 6 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/host/ehci-exynos.c b/drivers/usb/host/ehci-exynos.c
> > index 42e5b66..1899900 100644
> > --- a/drivers/usb/host/ehci-exynos.c
> > +++ b/drivers/usb/host/ehci-exynos.c
> > @@ -251,7 +251,7 @@ static int exynos_ehci_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > -#ifdef CONFIG_PM
> > +#ifdef CONFIG_PM_SLEEP
> 
> Does not look like an equivalent change. How will it behave in a config
> with !SUSPEND && !HIBERNATE && PM?

It's hard to say what Anand originally had in mind.  To me, it looks
like it will behave exactly the same as before, the only difference
being that the object image will not contain unused exynos_ehci_suspend
and exynos_ehci_resume routines.  And the compiler won't issue a 
warning at build time that the routines are unused.

Alan Stern
