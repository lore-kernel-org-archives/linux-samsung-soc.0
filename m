From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/5] ARM: EXYNOS: Add secure firmware support
Date: Fri, 21 Sep 2012 22:52:09 -0700
Message-ID: <20120922055209.GE32245@quad.lixom.net>
References: <1347524018-19301-1-git-send-email-t.figa@samsung.com>
 <32882618.QIYkyWltBx@amdc1227>
 <CAH9JG2VFk5ZRCHDxwj6L0jEhAkwHx_MwWcYFw5g=+8cvEiZGPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58356 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753389Ab2IVFv6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 22 Sep 2012 01:51:58 -0400
Received: by mail-pb0-f46.google.com with SMTP id rr4so3998557pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Sep 2012 22:51:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAH9JG2VFk5ZRCHDxwj6L0jEhAkwHx_MwWcYFw5g=+8cvEiZGPg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, arnd@arndb.de, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk

On Fri, Sep 21, 2012 at 05:39:41PM +0900, Kyungmin Park wrote:
> On 9/19/12, Tomasz Figa <t.figa@samsung.com> wrote:
> > Hi,
> >
> > On Thursday 13 of September 2012 10:13:33 Tomasz Figa wrote:
> >> Some Exynos-based boards are running with secure firmware running in
> >> TrustZone secure world, which changes the way some things have to be
> >> initialized.
> >>
> >> This series adds support for specifying firmware operations, implements
> >> some firmware operations for Exynos secure firmware and adds a method of
> >> enabling secure firmware operations on Exynos-based boards through board
> >> file and device tree.
> >>
> >> This is a continuation of the patch series by Kyungmin Park:
> >> [PATCH v5 1/2] ARM: Make a compile firmware conditionally
> >> http://thread.gmane.org/gmane.linux.ports.arm.kernel/183607
> >> [PATCH v5 2/2] ARM: EXYNOS: SMC instruction (aka firmware) support
> >> http://thread.gmane.org/gmane.linux.ports.arm.kernel/183608/focus=184109
> >>
> >> Tomasz Figa (5):
> >>   ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
> >>   ARM: Add interface for registering and calling firmware-specific
> >>     operations
> >>   ARM: EXYNOS: Add support for secure monitor calls
> >>   ARM: EXYNOS: Add support for Exynos secure firmware
> >>   ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up
> >>
> >>  .../devicetree/bindings/arm/samsung-boards.txt     |  8 ++++
> >>  arch/arm/common/Makefile                           |  2 +
> >>  arch/arm/common/firmware.c                         | 18 ++++++++
> >>  arch/arm/include/asm/firmware.h                    | 30 +++++++++++++
> >>  arch/arm/mach-exynos/Makefile                      |  6 +++
> >>  arch/arm/mach-exynos/common.c                      | 34 ++++++++++++++
> >>  arch/arm/mach-exynos/common.h                      |  2 +
> >>  arch/arm/mach-exynos/exynos-smc.S                  | 22 +++++++++
> >>  arch/arm/mach-exynos/firmware.c                    | 52
> >> ++++++++++++++++++++++ arch/arm/mach-exynos/include/mach/map.h
> >>  |  3 ++
> >>  arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
> >>  arch/arm/mach-exynos/platsmp.c                     |  8 ++++
> >>  arch/arm/mach-exynos/smc.h                         | 31 +++++++++++++
> >>  arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
> >>  14 files changed, 218 insertions(+)
> >>  create mode 100644 arch/arm/common/firmware.c
> >>  create mode 100644 arch/arm/include/asm/firmware.h
> >>  create mode 100644 arch/arm/mach-exynos/exynos-smc.S
> >>  create mode 100644 arch/arm/mach-exynos/firmware.c
> >>  create mode 100644 arch/arm/mach-exynos/smc.h
> >
> > Any further comments for this series? Maybe we could merge it for 3.7?
> >
> Hi Arnd, Olof,
> Can you merge it for 3.7? If exynos implementation still has issues,
> it's okay only merge firmware implementation.
> 
> Can you give your opinions?

Hi,

There are still a few open questions to resolve on this before I think it
can be merged. And it doesn't make much sense to merge the infrastructure
without at least the first user of it.


-Olof
