From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 3/4] s3c-fb: Add support S5PV310 FIMD
Date: Fri, 12 Nov 2010 19:40:16 +0900
Message-ID: <000001cb8255$feb050b0$fc10f210$%dae@samsung.com>
References: <1287406528-15324-1-git-send-email-sbkim73@samsung.com>
 <1287406528-15324-4-git-send-email-sbkim73@samsung.com>
 <053f01cb822a$2758a7f0$7609f7d0$%kim@samsung.com>
 <00a501cb824f$9942f300$cbc8d900$%dae@samsung.com>
 <20101112100851.GA18511@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36817 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756583Ab0KLKkR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Nov 2010 05:40:17 -0500
In-reply-to: <20101112100851.GA18511@linux-sh.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Paul Mundt' <lethal@linux-sh.org>
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, akpm@linux-foundation.org, 'Jonghun Han' <jonghun.han@samsung.com>


> -----Original Message-----
> From: Paul Mundt [mailto:lethal@linux-sh.org]
> Sent: Friday, November 12, 2010 7:09 PM
> To: Inki Dae
> Cc: 'Kukjin Kim'; 'Sangbeom Kim'; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; linux-fbdev@vger.kernel.org; ben-
> linux@fluff.org; akpm@linux-foundation.org; 'Jonghun Han'
> Subject: Re: [PATCH 3/4] s3c-fb: Add support S5PV310 FIMD
> 
> On Fri, Nov 12, 2010 at 06:54:29PM +0900, Inki Dae wrote:
> > @@ -1314,13 +1319,22 @@ static int __devinit s3c_fb_probe(struct
> > platform_device *pdev)
> >  	sfb->pdata = pd;
> >  	sfb->variant = fbdrv->variant;
> >
> > -	sfb->bus_clk = clk_get(dev, "lcd");
> > -	if (IS_ERR(sfb->bus_clk)) {
> > -		dev_err(dev, "failed to get bus clock\n");
> > +	/* if sclk_name is NULL then it would use bus clock as default. */
> > +	if (!pd->sclk_name)
> > +		sfb->lcd_clk = clk_get(dev, "lcd");
> > +	else
> > +		sfb->lcd_clk = clk_get(dev, pd->sclk_name);
> > +
> No, this is totally pointless. Simply establish a clk lookup for the
> configuration you are running on in your board code
You mean, call the function at s3c_fb_probe() establishing clk lookup in
board code?
Sorry but I could understand. Please give me more detail.

> and always have
> clk_get() operate on a fixed id. You can use this same scheme with any
> optional clocks you have too, and reconfigure according to whether the
> lookups for optional clocks succeeded or not.

optional clocks could be sclk_name?

I will glad to show me some example for it.
thank you.
