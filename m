From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Fix the "WFI" instruction opcode definition.
Date: Tue, 06 Nov 2012 20:24:31 +0900
Message-ID: <0bee01cdbc11$4a59afb0$df0d0f10$%kim@samsung.com>
References: <DA41BE1DDCA941489001C7FBD7A8820E3CB5512E@szxeml549-mbx.china.huawei.com>
 <5091D13B.6060106@gmail.com>
 <CAKw8HL0ymmNRB=jgGcZn1+6k0s=FKA+qBV04y_wfeu7xMpUpkw@mail.gmail.com>
 <20121105173604.GF2005@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:39132 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317Ab2KFLYc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Nov 2012 06:24:32 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD2003DOD0KD2U0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 20:24:31 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD200B7JD0VGD00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 20:24:31 +0900 (KST)
In-reply-to: <20121105173604.GF2005@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Dave Martin' <dave.martin@linaro.org>, 'Fei Yang' <yangfei.kernel@gmail.com>
Cc: 'Rob Herring' <robherring2@gmail.com>, 'Russell King' <linux@arm.linux.org.uk>, 'Magnus Damm' <magnus.damm@gmail.com>, linux-samsung-soc@vger.kernel.org, 'Paul Mundt' <lethal@linux-sh.org>, "'Yangfei (Felix)'" <felix.yang@huawei.com>, linux-arm-kernel@lists.infradead.org

Dave Martin wrote:
> 

[...]

> > >> -             asm(".word      0xe320f003\n"
> > >> +             asm(__WFI
> > >
> > > Wouldn't using the actual wfi instruction fix this. There is a wfi()
> > > macro.
> > >
> > > Or just call cpu_do_idle() which will do any other things needed
> before
> > > wfi like a dsb instruction.
> > >
> > > Rob
> > >>                   :
> > >>                   :
> > >>                   : "memory", "cc");
> >
> > <Cut>
> >
> > Hi Rob,
> >     Thanks for the reply. The way you suggested is more elegant. But
> > here we worried about the version of the compiler toolchain used to
> > build the kernel. The "WFI" assembler instruction may not be
> > recognized if the toolchain is too old. Need the related ARM board
> > maintainers to confirm this.
> 
> Maybe all the exynos platforms are new enough for this not to be a
> problem?
> 
Yeah, I think there is no problem on exynos now.

> I think mach-exynos is pretty new and v7-only anyway.  If so, then it

Yes, right at the moment.

BTW, if mach-exynos includes ARMv8 later?...ARMv8 platform codes will be put
in the arch/arm/ or arch/arm/64/ if some platform codes share with ARMv7?
Just wondering...

> may be better to put
> 
> CFLAGS_hotplug.o	:= -march=armv7-a
> 
> in arch/arm/mach-exynos/Makefile, and use the real "wfi" mnemonic
> directly.  People should _really_ not be building kernels containig
> v7 board support with tools that are too old to support this.
> 
I think so...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
