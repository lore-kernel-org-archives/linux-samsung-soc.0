From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
Date: Thu, 10 Oct 2013 07:40:32 +0200
Message-ID: <1557725.7PfMZ1T9lT@amdn883>
References: <000001cec55c$b70f0100$252d0300$%han@samsung.com>
 <11324918.I3J8AgutaD@amdn883> <000101cec579$c2c9c1c0$485d4540$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58655 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751949Ab3JJFkg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 01:40:36 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUF00JZEUFMZ180@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Oct 2013 06:40:34 +0100 (BST)
In-reply-to: <000101cec579$c2c9c1c0$485d4540$%han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

On Thursday 10 of October 2013 14:29:58 Jingoo Han wrote:
> On Thursday, October 10, 2013 2:18 PM, Tomasz Figa wrote:
> > On Thursday 10 of October 2013 11:40:22 Jingoo Han wrote:
> > > On Thursday, October 10, 2013 11:26 AM, Sylwester Nawrocki wrote:
> [....]
> 
> > > > Are you planning to remove also this file altogether ? Probably the
> > > > s5p-ehci driver could be cleaned up then and the platform_data
> > > > handling
> > > > dropped from it as a follow up.
> > > 
> > > Hi Sylwester Nawrocki,
> > > 
> > > I will rename s5p-ehci to s5p-exynos, then drop platform_data handling
> > > from it. These will be separate patches.
> > > Thank you your comment. :-)
> > 
> > I'd recommend keeping driver name as is. S5PV210 is going to receive DT
> > support soon and it will be also able to use this driver.
> 
> Hi Tomasz Figa,
> 
> Now, Exynos EHCI and OHCI driver's name is different as below:
>  ehci-s5p.c
>  ohci-exynos.c

Hmm, right, this inconsistency is a good point.

> I want to use same name. There is no reason to keep the different names.
> Also I want to use '-exynos.c' even though S5PV210 can support EHCI and
> OHCI. ehci-exynos.c
>  ohci-exynos.c

OK. S5PV210 is basically Exynos 3, so I guess it's fine. Although I'd suggest 
having a note in Kconfig entries of these drivers that they can be also used on 
S5PV210.

Best regards,
Tomasz
