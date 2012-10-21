From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: [PATCH] usb: phy: samsung: Introducing usb phy driver for hsotg
Date: Sun, 21 Oct 2012 09:16:19 +0200
Message-ID: <20121021071619.GA1676@glitch>
References: <1349256393-11741-1-git-send-email-p.paneri@samsung.com>
 <1350036934-6051-1-git-send-email-p.paneri@samsung.com>
 <005801cdac56$8da0c120$a8e24360$%kim@samsung.com>
 <20121017191300.GL21164@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:58794 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751466Ab2JUHQX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Oct 2012 03:16:23 -0400
Content-Disposition: inline
In-Reply-To: <20121017191300.GL21164@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Praveen Paneri' <p.paneri@samsung.com>, linux-usb@vger.kernel.org, l.majewski@samsung.com, linux-samsung-soc@vger.kernel.org, heiko@sntech.de, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, balbi@ti.com, grant.likely@secretlab.ca, kyungmin.park@samsung.com, thomas.abraham@linaro.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Wed, Oct 17, 2012 at 08:13:01PM +0100, Russell King - ARM Linux wrote:
> On Wed, Oct 17, 2012 at 08:00:00PM +0900, Kukjin Kim wrote:
> > > +static int samsung_usbphy_get_refclk_freq(struct samsung_usbphy *sphy)
> > > +{
> > > +	struct clk *ref_clk;
> > > +	int refclk_freq = 0;
> > > +
> > > +	ref_clk = clk_get(sphy->dev, "xusbxti");
> > > +	if (IS_ERR(ref_clk)) {
> > 
> > IS_ERR_OR_NULL(ref_clk)?
> 
> For the N'th time, NO.  IS_ERR is correct here.
> 
> > > +		dev_err(sphy->dev, "Failed to get reference clock\n");
> > > +		return PTR_ERR(ref_clk);
> 
> Look, it's the ABI.  Not only that but it's also TOTALLY AND UTTERLY WRONG
> to use IS_ERR_OR_NULL(foo) and then follow it with return PTR_ERR(foo).
> You end up returning ZERO.
> 
> Stop telling people to use IS_ERR_OR_NULL without properly thinking about
> it first.  Virtually every single one of these done this way is a BUG.
> 
> Are we clear on this?

Wouldn't be much easier to define PTR_ERR() to return -Esomething when
its argument is NULL?

This would end the whole issue of "should I use IS_ERR*/PTR_ERR or look into
the pointer myself?" story.  One could simply always use IS_ERR*/PTR_ERR
and have the right thing done in whatever case.

Regards,
Domenico
