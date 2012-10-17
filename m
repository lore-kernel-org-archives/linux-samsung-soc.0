From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Wed, 17 Oct 2012 20:13:01 +0100
Message-ID: <20121017191300.GL21164@n2100.arm.linux.org.uk>
References: <1349256393-11741-1-git-send-email-p.paneri@samsung.com> <1350036934-6051-1-git-send-email-p.paneri@samsung.com> <005801cdac56$8da0c120$a8e24360$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <005801cdac56$8da0c120$a8e24360$%kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Praveen Paneri' <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Oct 17, 2012 at 08:00:00PM +0900, Kukjin Kim wrote:
> > +static int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)
> > +{
> > +	struct clk *ref_clk;
> > +	int refclk_freq = 0;
> > +
> > +	ref_clk = clk_get(sphy->dev, "xusbxti");
> > +	if (IS_ERR(ref_clk)) {
> 
> IS_ERR_OR_NULL(ref_clk)?

For the N'th time, NO.  IS_ERR is correct here.

> > +		dev_err(sphy->dev, "Failed to get reference clock\n");
> > +		return PTR_ERR(ref_clk);

Look, it's the ABI.  Not only that but it's also TOTALLY AND UTTERLY WRONG
to use IS_ERR_OR_NULL(foo) and then follow it with return PTR_ERR(foo).
You end up returning ZERO.

Stop telling people to use IS_ERR_OR_NULL without properly thinking about
it first.  Virtually every single one of these done this way is a BUG.

Are we clear on this?
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
