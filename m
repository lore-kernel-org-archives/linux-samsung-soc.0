From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
Date: Thu, 10 Oct 2013 14:29:58 +0900
Message-ID: <000101cec579$c2c9c1c0$485d4540$%han@samsung.com>
References: <000001cec55c$b70f0100$252d0300$%han@samsung.com>
 <52561022.603@samsung.com> <000501cec562$11209d20$3361d760$%han@samsung.com>
 <11324918.I3J8AgutaD@amdn883>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53855 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753519Ab3JJFaA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 01:30:00 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MUF00GWJTXQSFM0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Oct 2013 14:29:59 +0900 (KST)
In-reply-to: <11324918.I3J8AgutaD@amdn883>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>
Cc: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, October 10, 2013 2:18 PM, Tomasz Figa wrote:
> On Thursday 10 of October 2013 11:40:22 Jingoo Han wrote:
> > On Thursday, October 10, 2013 11:26 AM, Sylwester Nawrocki wrote:

[....]

> > > Are you planning to remove also this file altogether ? Probably the
> > > s5p-ehci driver could be cleaned up then and the platform_data handling
> > > dropped from it as a follow up.
> >
> > Hi Sylwester Nawrocki,
> >
> > I will rename s5p-ehci to s5p-exynos, then drop platform_data handling
> > from it. These will be separate patches.
> > Thank you your comment. :-)
> 
> I'd recommend keeping driver name as is. S5PV210 is going to receive DT
> support soon and it will be also able to use this driver.
> 

Hi Tomasz Figa,

Now, Exynos EHCI and OHCI driver's name is different as below:
 ehci-s5p.c
 ohci-exynos.c

I want to use same name. There is no reason to keep the different names.
Also I want to use '-exynos.c' even though S5PV210 can support EHCI and OHCI.
 ehci-exynos.c
 ohci-exynos.c

Then, do you want to use the following names?
 ehci-s5p.c
 ohci-s5p.c

Best regards,
Jingoo Han
