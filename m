From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH RESEND] ARM: EXYNOS: change the name of USB ohci header
Date: Tue, 5 Feb 2013 10:20:47 -0500 (EST)
Message-ID: <Pine.LNX.4.44L0.1302051019430.2245-100000@iolanthe.rowland.org>
References: <000501ce0349$0f1a97a0$2d4fc6e0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:56627 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751858Ab3BEPUs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 10:20:48 -0500
In-Reply-To: <000501ce0349$0f1a97a0$2d4fc6e0$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>

On Tue, 5 Feb 2013, Jingoo Han wrote:

> On Wednesday, December 26, 2012 3:35 PM, Jingoo Han wrote
> > 
> > This patch changes the name of USB ohci header from 'usb-exynos.h'
> > to 'usb-ohci-exynos.h'. This is because this header file has
> > the platdata for only Exynos ohci.
> > 
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
> >  arch/arm/mach-exynos/dev-ohci.c                    |    2 +-
> >  arch/arm/mach-exynos/mach-origen.c                 |    2 +-
> >  arch/arm/mach-exynos/mach-smdkv310.c               |    2 +-
> >  drivers/usb/host/ohci-exynos.c                     |    2 +-
> >  .../{usb-exynos.h => usb-ohci-exynos.h}            |    0
> >  5 files changed, 4 insertions(+), 4 deletions(-)
> >  rename include/linux/platform_data/{usb-exynos.h => usb-ohci-exynos.h} (100%)
> >
> 
> Hi Alan,
> 
> Can I get your Acked-by for 'drivers/usb/host/ohci-exynos.c'?

Yes, it's a trivial change.  Sorry I missed it; probably because it 
came right in the middle of the holidays.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
