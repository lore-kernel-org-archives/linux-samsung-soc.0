From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 6/8] usb: host: ohci-s3c2410 Use
 clk_prepare_enable/clk_disable_unprepare
Date: Wed, 31 Jul 2013 16:44:43 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1307311643110.1546-100000@iolanthe.rowland.org>
References: <6370497.apKG6kIlfT@flatron>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:37249 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1755143Ab3GaUon (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Jul 2013 16:44:43 -0400
In-Reply-To: <6370497.apKG6kIlfT@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>

On Wed, 31 Jul 2013, Tomasz Figa wrote:

> Alan, Greg,
> 
> On Tuesday 23 of July 2013 01:49:23 Tomasz Figa wrote:
> > This patch modifies the ohci-s3c2410 driver to prepare and unprepare
> > clocks in addition to enabling and disabling, since it is required
> > by common clock framework.
> > 
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
> > ---
> >  drivers/usb/host/ohci-s3c2410.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/host/ohci-s3c2410.c
> > b/drivers/usb/host/ohci-s3c2410.c index e125770..db096bf 100644
> > --- a/drivers/usb/host/ohci-s3c2410.c
> > +++ b/drivers/usb/host/ohci-s3c2410.c
> > @@ -47,10 +47,10 @@ static void s3c2410_start_hc(struct platform_device
> > *dev, struct usb_hcd *hcd)
> > 
> >  	dev_dbg(&dev->dev, "s3c2410_start_hc:\n");
> > 
> > -	clk_enable(usb_clk);
> > +	clk_prepare_enable(usb_clk);
> >  	mdelay(2);			/* let the bus clock stabilise */
> > 
> > -	clk_enable(clk);
> > +	clk_prepare_enable(clk);
> > 
> >  	if (info != NULL) {
> >  		info->hcd	= hcd;
> > @@ -75,8 +75,8 @@ static void s3c2410_stop_hc(struct platform_device
> > *dev) (info->enable_oc)(info, 0);
> >  	}
> > 
> > -	clk_disable(clk);
> > -	clk_disable(usb_clk);
> > +	clk_disable_unprepare(clk);
> > +	clk_disable_unprepare(usb_clk);
> >  }
> > 
> >  /* ohci_s3c2410_hub_status_data
> 
> Any chance to get your ack on this?

Sorry, this must have slipped past.  It's fine with me.

Alan Stern
