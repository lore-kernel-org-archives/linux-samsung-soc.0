From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: 3.12 merge window exynos cpufreq driver fails to build
Date: Wed, 04 Sep 2013 17:04:33 +0200
Message-ID: <1480759.MNj1g1yX4l@amdc1227>
References: <CA+5PVA6SQ9JGBD3F=u5ysch-agp91oTK8ZbKsdQkz57yZ8OUHQ@mail.gmail.com>
 <7035644.8Kb1gDYsCf@amdc1227>
 <CA+5PVA7T4P9vMH0r8p78aZYUrL8gzbpY9MmW9=nV3X0tE-e4NA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:9996 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934783Ab3IDPEh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Sep 2013 11:04:37 -0400
In-reply-to: <CA+5PVA7T4P9vMH0r8p78aZYUrL8gzbpY9MmW9=nV3X0tE-e4NA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Josh Boyer <jwboyer@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org

On Wednesday 04 of September 2013 10:41:31 Josh Boyer wrote:
> On Wed, Sep 4, 2013 at 10:36 AM, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi Josh,
> > 
> > On Wednesday 04 of September 2013 10:13:16 Josh Boyer wrote:
> >> Using Linus' tree as of this morning (v3.11-2654-g458c3f6), the
> >> exynos-cpufreq driver doesn't build because it includes a file that
> >> doesn't exist.
> >> 
> >> + make -s ARCH=arm V=1 -j4 bzImage KALLSYMS_EXTRA_PASS=1
> >> arch/arm/kernel/return_address.c:63:2: warning: #warning "TODO:
> >> return_address should use unwind tables" [-Wcpp]
> >> 
> >>  #warning "TODO: return_address should use unwind tables"
> >>  
> >>   ^
> >> 
> >> arch/arm/mm/dma-mapping.c:253:2: warning: #warning ARM Coherent DMA
> >> allocator does not (yet) support huge TLB [-Wcpp]
> >> 
> >>  #warning ARM Coherent DMA allocator does not (yet) support huge TLB
> >>  
> >>   ^
> >> 
> >> drivers/cpufreq/exynos-cpufreq.c:21:22: fatal error: plat/cpu.h: No
> >> such file or directory
> >> 
> >>  #include <plat/cpu.h>
> >>  
> >>                       ^
> >> 
> >> compilation terminated.
> >> make[2]: *** [drivers/cpufreq/exynos-cpufreq.o] Error 1
> >> 
> >> I'm guessing that <plat/cpu.h> file is supposed to come from
> >> arch/arm/plat-samsung/include/plat/, but I don't see anything that
> >> specifies a -I there.
> >> 
> >> Thoughts?
> > 
> > Could you attach config that could be used to trigger this? Thanks in
> > advance.
> 
> Attached.

Hmm, this does not look like config for kernel neither from Linus' nor 
linux-next tree. The first thing I can see is CONFIG_ARCH_EXYNOS_MULTI 
selected, which is not available in any mainline tree.

As for the build error itself, headers from plat/ are available for drivers 
only in single platform builds, they can't be included when multiplatform 
is enabled. The exynos-cpufreq driver is not multiplatform-aware yet and so 
you get the failure.

Best regards,
Tomasz
