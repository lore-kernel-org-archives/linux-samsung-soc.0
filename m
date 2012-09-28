From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH V3] video: exynos_dp: Add device tree support to DP driver
Date: Fri, 28 Sep 2012 08:48:22 +0200
Message-ID: <1511551.R6uMubmq1B@flatron>
References: <1348515385-22332-1-git-send-email-ajaykumar.rs@samsung.com> <50645848.6080102@gmail.com> <000601cd9d0d$c3296ca0$497c45e0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:34526 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751152Ab2I1Gs3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 02:48:29 -0400
In-Reply-To: <000601cd9d0d$c3296ca0$497c45e0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, FlorianSchandinat@gmx.de, thomas.ab@samsung.com, 'devicetree-discuss' <devicetree-discuss@lists.ozlabs.org>

Hi,

On Friday 28 of September 2012 09:11:09 Jingoo Han wrote:
> On Thursday, September 27, 2012 10:45 PM Sylwester Nawrocki wrote
> > > +Example:
> > > +
> > > +SOC specific portion:
> > > +	dptx_phy: dptx_phy@0x10040720 {
> > > +		compatible = "samsung,dp-phy";
> > > +		samsung,dptx_phy_reg =<0x10040720>;
> > > +		samsung,enable_bit =<1>;
> > > +	};
> > > +
> > > +	display-port-controller {
> > > +		compatible = "samsung,exynos5-dp";
> > > +		reg =<0x145B0000 0x10000>;
> > > +		interrupts =<10 3>;
> > > +		interrupt-parent =<&combiner>;
> > > +		dp_phy =<&dptx_phy>;
> > 
> > Shouldn't it be "samsung,dp_phy" ?
> 
> Do you mean this ? It is not working.
> +		dp_phy = "samsung,dp_phy";

I believe he meant:

-+		dp_phy =<&dptx_phy>;
++		samsung,dp_phy =<&dptx_phy>;

to mark that this is a Samsung-specific property.

Best regards,
Tomasz Figa
