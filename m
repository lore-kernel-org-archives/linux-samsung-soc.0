From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH RESEND] ARM: EXYNOS: change the name of USB ohci header
Date: Tue, 05 Feb 2013 11:13:06 -0800
Message-ID: <149b01ce03d4$d56a59f0$803f0dd0$@samsung.com>
References: <000501ce0349$0f1a97a0$2d4fc6e0$%han@samsung.com>
 <Pine.LNX.4.44L0.1302051019430.2245-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:17758 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754785Ab3BETNU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 14:13:20 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHR003R2HE001S0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 04:13:19 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHR00EKBHE49S50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 04:13:18 +0900 (KST)
In-reply-to: <Pine.LNX.4.44L0.1302051019430.2245-100000@iolanthe.rowland.org>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Alan Stern' <stern@rowland.harvard.edu>, 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Alan Stern wrote:
> 
> On Tue, 5 Feb 2013, Jingoo Han wrote:
> 
> > On Wednesday, December 26, 2012 3:35 PM, Jingoo Han wrote
> > >
> > > This patch changes the name of USB ohci header from 'usb-exynos.h'
> > > to 'usb-ohci-exynos.h'. This is because this header file has
> > > the platdata for only Exynos ohci.
> > >
> > > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > > ---
> > >  arch/arm/mach-exynos/dev-ohci.c                    |    2 +-
> > >  arch/arm/mach-exynos/mach-origen.c                 |    2 +-
> > >  arch/arm/mach-exynos/mach-smdkv310.c               |    2 +-
> > >  drivers/usb/host/ohci-exynos.c                     |    2 +-
> > >  .../{usb-exynos.h => usb-ohci-exynos.h}            |    0
> > >  5 files changed, 4 insertions(+), 4 deletions(-)
> > >  rename include/linux/platform_data/{usb-exynos.h => usb-ohci-
> exynos.h} (100%)
> > >
> >
> > Hi Alan,
> >
> > Can I get your Acked-by for 'drivers/usb/host/ohci-exynos.c'?
> 
> Yes, it's a trivial change.  Sorry I missed it; probably because it
> came right in the middle of the holidays.
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

Looks good, applied this into samsung tree with Alan's ack.

Thanks.

- Kukjin
