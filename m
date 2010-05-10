From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support
	for S3C6410
Date: Mon, 10 May 2010 01:28:02 +0100
Message-ID: <20100510002802.GT26401@trinity.fluff.org>
References: <1054428.61651273231771063.JavaMail.weblogic@epml16>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:52971 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753411Ab0EJA2I convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 9 May 2010 20:28:08 -0400
Content-Disposition: inline
In-Reply-To: <1054428.61651273231771063.JavaMail.weblogic@epml16>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: NAVEEN KRISHNA CHATRADHI <ch.naveen@samsung.com>
Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "ben-linux@fluff.org" <ben-linux@fluff.org>

On Fri, May 07, 2010 at 11:29:31AM +0000, NAVEEN KRISHNA CHATRADHI wrote:
> Hi, Maurus
> 
> ------- Original Message -------
> Sender : Maurus Cuelenaere<mcuelenaere@gmail.com> 
> Date   : May 07, 2010 14:55 (GMT+05:00)
> Title  : Re: [PATCH 4/6] ARM: S3C64XX: Adds Touch Screen Driver Support for
>  S3C6410
> 
> Hi Naveen,
> 
> "Kukjin Kim" <kgene.kim@samsung.com> wrote:
> 
> >From: Naveen Krishna <ch.naveen@samsung.com>
> >
> >Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> >Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> >---
> > arch/arm/mach-s3c64xx/Kconfig          |    1 +
> > arch/arm/mach-s3c64xx/mach-smdk6410.c  |   12 +++++++
> > arch/arm/mach-s3c64xx/s3c6410.c        |    1 +
> > arch/arm/plat-samsung/Kconfig          |    5 +++
> > arch/arm/plat-samsung/Makefile         |    1 +
> > arch/arm/plat-samsung/dev-ts.c         |   54 ++++++++++++++++++++++++++++++++
> > drivers/input/touchscreen/Kconfig      |    3 +-
> > drivers/input/touchscreen/s3c2410_ts.c |   19 +++++++++--
> > 8 files changed, 92 insertions(+), 4 deletions(-)
> > create mode 100644 arch/arm/plat-samsung/dev-ts.c
> >
> 
> I'm sure you've seen my patch which does pretty much the same wrt adjusting s3c2410_ts.c.
> Though that one has already been acked by Ben so I'm unsure what should happen: you adjusting your patchset or me dropping mine (obviously I prefer the former :) ).
> My patch was under review for over a week, its a coincidence that i saw your patch and my patch was posted on mainline. 
> I'ill rework my patches anyway, I'ill wait for a day on Ben Dook's Comments on my patch set.

Naveen's patches do have two advantages, firstly that they add a gpio
callback to the platform data so that if it is needed in the future it
can be used again. The second is that it covers more than just the 24xx
and 64xx series.

I tried applying this with Maurus' updates but they don't apply well together
and I'm not going to spend a lot of time trying to get the two sets applied.

Maurus, hope you're not too offended if we go for Naveen's series, unless
you have any technical commenbts that need to be sorted.
 
> P.S.: I'd recommend splitting this patch and sending the drivers/input part to the linux-input mailing list.
> I'ill take this option.

This is going to be a bit of an interesting merge as we will temporarily
end up either breaking the s3c2410 users, or waiting for the input system
updates before applying the arch specific updayes (otherwise we'll not be
able to compile).

Whichever waym, the input part needs to go the linux-input list to get
reviewed before it gets applied. With a note that there is some arch
dependency that may require a cross tree merge (preferable to go with
arch merging and the input maintainers blessing).
 
> --
> Maurus Cuelenaere
> 
> 
> Thanks & Best Regards,
> Naveen Krishna Ch
> SE @ SLG Div, DS LABs, Samsung, India.
> N?????r??y????b?X????v?^?)??{.n?+????{?????x,????????}?????z?&j:+v???????zZ+??+zf???h???~????i???z??w?????????&?)??f
-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
