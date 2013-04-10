From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [GIT PULL 08/10] secure-exynos for v3.10
Date: Wed, 10 Apr 2013 11:19:27 +0200
Message-ID: <50580316.bmGRcvNpvy@flatron>
References: <51630A36.6030505@samsung.com> <CAL_JsqJLVae44Sr2qf0=YE0DokkeetHFnyFEMKhYpY8sv58Mjw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:64015 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751490Ab3DJJTc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 05:19:32 -0400
Received: by mail-ee0-f53.google.com with SMTP id c13so116487eek.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Apr 2013 02:19:30 -0700 (PDT)
In-Reply-To: <CAL_JsqJLVae44Sr2qf0=YE0DokkeetHFnyFEMKhYpY8sv58Mjw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Rob,

On Tuesday 09 of April 2013 16:43:48 Rob Herring wrote:
> On Mon, Apr 8, 2013 at 1:19 PM, Kukjin Kim <kgene.kim@samsung.com> 
wrote:
> > The following changes since commit 
da821eb7d42935b0f7056d98c75fd1150f6636f4:
> >   Merge commit 'v3.9-rc5' into next/clk-exynos (2013-04-09 01:10:13
> >   +0900)> 
> > are available in the git repository at:
> >   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.gi
> >   t
> > 
> > tags/secure-exynos-for-v3.10
> > 
> > for you to fetch changes up to 
beddf63fc8e01f06799bd6d7a2dd879885bbc9c6:
> >   ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up
> > 
> > (2013-04-09 01:52:30 +0900)
> > 
> > ----------------------------------------------------------------
> > add support secure firmware for exynos
> > 
> > ----------------------------------------------------------------
> > 
> > Tomasz Figa (5):
> >       ARM: Add interface for registering and calling firmware-specific
> > 
> > operations
> 
> I missed the original series, but looking at this patch now I'm not
> convinced this is all that generic despite the name. Should PSCI be
> using this for example?

As far as I remember, nobody had any objections about this interface not 
being generic enough in last version of the series.

In fact it might be hard to make this fully generic (in terms of available 
firmware ops), because each firmware might provide its own, different set 
of operations.
 
> Also, a comment from Barry Song that "firmware_ops" is too generic for
> global name was not addressed.

This doesn't seem like any major issue at the moment. I can send a 
followup patch to rename it to arm_firmware, secure_firmware or whatever 
is preferred after it gets merged.

Btw. Barry's comment is dated to 26 Dec, more than a month since the patch 
was posted and was already merged in Kukjin's tree at that time.

Best regards,
Tomasz

> Rob
> 
> >       ARM: EXYNOS: Add support for secure monitor calls
> >       ARM: EXYNOS: Add support for Exynos secure firmware
> >       ARM: EXYNOS: Add IO mapping for non-secure SYSRAM.
> >       ARM: EXYNOS: Add secure firmware support to secondary CPU
> >       bring-up
> >  
> >  Documentation/arm/firmware.txt                     | 88
> > 
> > ++++++++++++++++++++++
> > 
> >  .../devicetree/bindings/arm/samsung-boards.txt     | 10 +++
> >  arch/arm/common/Makefile                           |  2 +
> >  arch/arm/common/firmware.c                         | 18 +++++
> >  arch/arm/include/asm/firmware.h                    | 66
> >  ++++++++++++++++ arch/arm/mach-exynos/Makefile                     
> >  |  6 ++
> >  arch/arm/mach-exynos/common.c                      | 35 +++++++++
> >  arch/arm/mach-exynos/common.h                      |  2 +
> >  arch/arm/mach-exynos/exynos-smc.S                  | 22 ++++++
> >  arch/arm/mach-exynos/firmware.c                    | 70
> >  +++++++++++++++++ arch/arm/mach-exynos/include/mach/map.h           
> >  |  3 +
> >  arch/arm/mach-exynos/mach-exynos4-dt.c             |  1 +
> >  arch/arm/mach-exynos/platsmp.c                     | 32 ++++++--
> >  arch/arm/mach-exynos/smc.h                         | 31 ++++++++
> >  arch/arm/plat-samsung/include/plat/map-s5p.h       |  1 +
> >  15 files changed, 382 insertions(+), 5 deletions(-)
> >  create mode 100644 Documentation/arm/firmware.txt
> >  create mode 100644 arch/arm/common/firmware.c
> >  create mode 100644 arch/arm/include/asm/firmware.h
> >  create mode 100644 arch/arm/mach-exynos/exynos-smc.S
> >  create mode 100644 arch/arm/mach-exynos/firmware.c
> >  create mode 100644 arch/arm/mach-exynos/smc.h
> > 
> > --
> > Thanks.
> > 
> > Best regards,
> > Kgene.
> > --
> > Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> > SW Solution Development Team, Samsung Electronics Co., Ltd.
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
