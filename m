From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v2 1/5] phy: Add new Exynos USB PHY driver
Date: Tue, 29 Oct 2013 11:16:07 +0100
Message-ID: <030c01ced48f$e2d513f0$a87f3bd0$%debski@samsung.com>
References: <1382710529-12082-1-git-send-email-k.debski@samsung.com>
 <526A90B9.3040501@ti.com> <025b01ced3e4$ec685db0$c5391910$%debski@samsung.com>
 <1548448.GBuE52miBt@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:41189 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339Ab3J2KQK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Oct 2013 06:16:10 -0400
In-reply-to: <1548448.GBuE52miBt@flatron>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Kishon Vijay Abraham I' <kishon@ti.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm@vger.kernel.org, kyungmin.park@samsung.com, Tomasz Figa <t.figa@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, gautam.vivek@samsung.com, mat.krawczuk@gmail.com

Hi,

> From: Tomasz Figa [mailto:tomasz.figa@gmail.com]
> Sent: Monday, October 28, 2013 9:00 PM
> 
> Hi Kamil,
> 
> On Monday 28 of October 2013 14:52:19 Kamil Debski wrote:
> > Hi Kishon,
> >
> > Thank you for your review! I will answer your comments below.
> [snip]
> > > > +
> > > > +	switch (drv->cfg->cpu) {
> > > > +	case TYPE_EXYNOS4210:
> > >
> > > > +	case TYPE_EXYNOS4212:
> > > Lets not add such cpu checks inside driver.
> >
> > Some SoC have a special register, which switches the OTG lines
> between
> > device and host modes. I understand that it might not be the
> prettiest
> > code. I see this as a good compromise between having a single huge
> > driver for all Exynos SoCs and having a multiple drivers for each SoC
> > version. PHY IPs in these chips very are similar but have to be
> > handled differently. Any other ideas to solve this issue?
> 
> Maybe adding a flag in drv->cfg called, for example, .has_mode_switch
> could solve this problem without having to check the SoC type
> explicitly?

Sounds like a good idea.
 
> [snip]
> > > > +#ifdef CONFIG_PHY_EXYNOS4210_USB
> > >
> > > Do we really need this?
> >
> > No we don't. The driver can always support all Exynos SoC versions.
> > These config options were added for flexibility.
> >
> > > > +extern const struct uphy_config exynos4210_uphy_config; #endif
> > > > +
> > > > +#ifdef CONFIG_PHY_EXYNOS4212_USB
> > >
> > > Same here.
> > >
> > > > +extern const struct uphy_config exynos4212_uphy_config; #endif
> > > > +
> > > > +static const struct of_device_id exynos_uphy_of_match[] = {
> > > > +#ifdef CONFIG_PHY_EXYNOS4210_USB
> > >
> > > #if not needed here.
> >
> > If the #ifdef CONFIG_PHY_EXYNOS4210_USB is removed then yes.
> Otherwise
> > it is necessary - exynos4210_uphy_config may be undefined.
> 
> I believe this and other ifdefs below are needed, otherwise, with
> support for one of the SoCs disabled, the driver could still bind to
> its compatible value.
> 

Best wishes,
-- 
Kamil Debski
Samsung R&D Institute Poland
