From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH 2/2] ARM: EXYNOS: PMU: move restart code into pmu driver
Date: Wed, 01 Oct 2014 17:12:35 +0530
Message-ID: <002b01cfdd6c$e57b6730$b0723590$@samsung.com>
References: <1412142540-3667-1-git-send-email-pankaj.dubey@samsung.com>
 <1412142540-3667-3-git-send-email-pankaj.dubey@samsung.com>
 <542BD948.8040600@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23555 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbaJALnv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Oct 2014 07:43:51 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCR0043RKL13OB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 01 Oct 2014 20:43:49 +0900 (KST)
In-reply-to: <542BD948.8040600@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, thomas.ab@samsung.com, vikas.sajjan@samsung.com, linux@roeck-us.net, naushad@samsung.com

Hi Tomasz,

On Wednesday, October 01, 2014 4:07 PM, Tomasz Figa wrote,
> To: Pankaj Dubey; linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org
> Cc: kgene.kim@samsung.com; linux@arm.linux.org.uk; thomas.ab@samsung.com;
> vikas.sajjan@samsung.com; linux@roeck-us.net; naushad@samsung.com
> Subject: Re: [PATCH 2/2] ARM: EXYNOS: PMU: move restart code into pmu
> driver
> 
> Hi Pankaj,
> 
> Please see my comments inline.
> 
> On 01.10.2014 07:49, Pankaj Dubey wrote:
> > Let's register reboot_notifier from PMU driver for reboot
> > functionality. So that we can remove restart hooks from machine
> > specific file, and thus moving ahead when PMU moved to driver folder,
> > this functionality can be reused for ARM64 based Exynos SoC's.
> 
> [snip]
> 
> > +static int pmu_reboot_notify_handler(struct notifier_block *this,
> > +		unsigned long code, void *unused)
> > +{
> > +	if (code == SYS_RESTART) {
> > +		u32 val = 0x1;
> > +
> > +		pmu_raw_writel(val, EXYNOS_SWRESET);
> 
> As already mentioned for patch 1, no need for the variable, because this
is just a
> constant 1.
> 

Thanks for review.
Addressed all your review comments for this patch series in v2.

Thanks,
Pankaj Dubey

> Best regards,
> Tomasz
