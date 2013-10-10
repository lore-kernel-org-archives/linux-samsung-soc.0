From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
Date: Thu, 10 Oct 2013 07:17:50 +0200
Message-ID: <11324918.I3J8AgutaD@amdn883>
References: <000001cec55c$b70f0100$252d0300$%han@samsung.com>
 <52561022.603@samsung.com> <000501cec562$11209d20$3361d760$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11536 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752878Ab3JJFRy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 01:17:54 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUF00DOYTDQ6DA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Oct 2013 06:17:52 +0100 (BST)
In-reply-to: <000501cec562$11209d20$3361d760$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi Jingoo,

On Thursday 10 of October 2013 11:40:22 Jingoo Han wrote:
> On Thursday, October 10, 2013 11:26 AM, Sylwester Nawrocki wrote:
> > On 10/10/2013 11:02 AM, Jingoo Han wrote:
> > > Since commit ca91435 "ARM: EXYNOS: Remove unused board files",
> > > s5p_device_ehci is not used anymore. Thus, s5p_device_ehci can
> > > be removed. Also, unnecessary S5P_DEV_USB_EHCI option is removed.
> > > 
> > > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > 
> > Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > 
> > > diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> > > index 8ce0ac0..25f40c9 100644
> > > --- a/arch/arm/plat-samsung/devs.c
> > > +++ b/arch/arm/plat-samsung/devs.c
> > > @@ -49,7 +49,6 @@
> > > 
> > >  #include <plat/devs.h>
> > >  #include <plat/adc.h>
> > >  #include <linux/platform_data/ata-samsung_cf.h>
> > > 
> > > -#include <linux/platform_data/usb-ehci-s5p.h>
> > 
> > Are you planning to remove also this file altogether ? Probably the
> > s5p-ehci driver could be cleaned up then and the platform_data handling
> > dropped from it as a follow up.
> 
> Hi Sylwester Nawrocki,
> 
> I will rename s5p-ehci to s5p-exynos, then drop platform_data handling
> from it. These will be separate patches.
> Thank you your comment. :-)

I'd recommend keeping driver name as is. S5PV210 is going to receive DT 
support soon and it will be also able to use this driver.

Otherwise this looks fine.

Best regards,
Tomasz
