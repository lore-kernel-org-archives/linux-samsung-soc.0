From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v8 2/2] ARM: EXYNOS: Move PMU specific definitions from
 common.h
Date: Wed, 01 Oct 2014 08:29:16 +0530
Message-ID: <002401cfdd23$b538dbf0$1faa93d0$@samsung.com>
References: <1412072481-22370-1-git-send-email-pankaj.dubey@samsung.com>
 <1412072481-22370-3-git-send-email-pankaj.dubey@samsung.com>
 <11948982.c37J1JPj8N@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18071 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750972AbaJAC74 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 22:59:56 -0400
In-reply-to: <11948982.c37J1JPj8N@wuerfel>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, naushad@samsung.com, tomasz.figa@gmail.com, thomas.ab@samsung.com, vikas.sajjan@samsung.com

Hi Arnd,

On Tuesday, September 30, 2014 4:09 PM, Arnd Bergmann wrote,
> To: linux-arm-kernel@lists.infradead.org
> Cc: Pankaj Dubey; linux-kernel@vger.kernel.org;
linux-samsung-soc@vger.kernel.org;
> kgene.kim@samsung.com; linux@arm.linux.org.uk; naushad@samsung.com;
> tomasz.figa@gmail.com; thomas.ab@samsung.com; vikas.sajjan@samsung.com
> Subject: Re: [PATCH v8 2/2] ARM: EXYNOS: Move PMU specific definitions
from
> common.h
> 
> On Tuesday 30 September 2014 15:51:21 Pankaj Dubey wrote:
> >
> > +static inline void pmu_raw_writel(u32 val, u32 offset) {
> > +       __raw_writel(val, pmu_base_addr + offset); }
> > +
> > +static inline u32 pmu_raw_readl(u32 offset) {
> > +       return __raw_readl(pmu_base_addr + offset); }
> > +
> >
> 
> While you're at it, please convert these to use readl_relaxed() instead,
which is safe to
> use in drivers and works independent of CPU endianess.
> 

OK, I will update this. 

Thanks,
Pankaj Dubey
> 	Arnd
