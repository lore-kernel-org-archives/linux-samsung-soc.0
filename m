From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm: exynos: Fix "allmodconfig" build errors in mcpm and
 hotplug
Date: Fri, 30 May 2014 22:10:36 -0700
Message-ID: <20140531051036.GA27008@quad.lixom.net>
References: <1401083696-25702-1-git-send-email-a.kesavan@samsung.com>
 <CAK9yfHzNkVZX6pMkFmdeubTgoZdRhd=U0oMtUDHr9bvZZYQYbQ@mail.gmail.com>
 <CAK9yfHxaDtx7r1wg_8f+A2Z-ZDwvBcfGFq9BkWhSzPjntNsg5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:59560 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750734AbaEaFKY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 May 2014 01:10:24 -0400
Received: by mail-pb0-f45.google.com with SMTP id um1so2415888pbc.32
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 22:10:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAK9yfHxaDtx7r1wg_8f+A2Z-ZDwvBcfGFq9BkWhSzPjntNsg5A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Abhilash Kesavan <a.kesavan@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>

On Sat, May 31, 2014 at 10:15:56AM +0530, Sachin Kamat wrote:
> + Olof
> 
> On 26 May 2014 12:19, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > Thanks Abhilash.
> >
> > On 26 May 2014 11:24, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> >> This fixes the following build errors:
> >>
> >> /tmp/ccRbZlaA.s: Assembler messages:
> >> /tmp/ccRbZlaA.s:69: Error: selected processor does not support ARM mode `isb '
> >> /tmp/ccRbZlaA.s:75: Error: selected processor does not support ARM mode `isb '
> >> /tmp/ccRbZlaA.s:76: Error: selected processor does not support ARM mode `dsb '
> >> make[1]: *** [arch/arm/mach-exynos/hotplug.o] Error 1
> >>
> >> /tmp/ccJEg4jw.s: Assembler messages:
> >> /tmp/ccJEg4jw.s:454: Error: selected processor does not support ARM mode `isb'
> >> /tmp/ccJEg4jw.s:455: Error: selected processor does not support ARM mode `dsb'
> >> /tmp/ccJEg4jw.s:465: Error: selected processor does not support ARM mode `isb'
> >> /tmp/ccJEg4jw.s:474: Error: selected processor does not support ARM mode `isb'
> >> /tmp/ccJEg4jw.s:475: Error: selected processor does not support ARM mode `dsb'
> >> /tmp/ccJEg4jw.s:516: Error: selected processor does not support ARM mode `isb'
> >> /tmp/ccJEg4jw.s:525: Error: selected processor does not support ARM mode `isb'
> >> /tmp/ccJEg4jw.s:526: Error: selected processor does not support ARM mode `dsb'
> >> make[1]: *** [arch/arm/mach-exynos/mcpm-exynos.o] Error 1
> >>
> >> Reported-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> >
> > This patch fixes the above reported issues.
> >
> > Tested-by: Sachin Kamat <sachin.kamat@linaro.org>
> 
> Kukjin,
> 
> This patch is also needed to fix the reported build error.

Thanks. I've applied this directly on top of next/soc.


-Olof
