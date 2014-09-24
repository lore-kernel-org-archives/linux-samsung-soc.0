From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [RESEND PATCH v4 2/2] ARM: EXYNOS: Refactor the pm code to use DT
 based lookup
Date: Wed, 24 Sep 2014 14:00:07 +0900
Message-ID: <01ef01cfd7b4$696d7560$3c486020$@kernel.org>
References: <1408431167-14134-1-git-send-email-vikas.sajjan@samsung.com>
 <1408431167-14134-3-git-send-email-vikas.sajjan@samsung.com>
 <CAGm_ybjx4t7kGg0mJHjrox39jP-DNgc-0rkLNn2rcOLS6JjAHQ@mail.gmail.com>
 <2186657.jhIisq7Fok@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:47994 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767AbaIXFAK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Sep 2014 01:00:10 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NCE00ANO3880870@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Sep 2014 14:00:08 +0900 (KST)
In-reply-to: <2186657.jhIisq7Fok@amdc1032>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, 'Vikas Sajjan' <vikas.sajjan@samsung.com>
Cc: 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Vikas Sajjan' <sajjan.linux@gmail.com>, 'Doug Anderson' <dianders@chromium.org>, 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
Hi,

> On Tuesday, August 19, 2014 01:26:49 PM Vikas Sajjan wrote:
> > Hi Kukjin,
> >
> > On Tue, Aug 19, 2014 at 12:22 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> > > Refactoring the pm.c to avoid using "soc_is_exynos" checks,
> > > instead use the DT based lookup.
> > >
> > > While at it, consolidate the common code across SoCs
> > > and create static helper functions.
> > >
> > > Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> > > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> >
> > Can you pick this series...
> 
> I think that my PM_SLEEP=n build fixes should go in before this cleanup
> series:
> 
>   http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg35430.html
> 

Bart, your patch has a problem due to dependency, Firmware-assisted suspend/
resume patch from Tomasz as I emailed today morning in my time. So I will
apply this series firstly. Please respin the fixes once the build breakage
resolved. If you have any idea, please let me know.

Thanks,
Kukjin

> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 
> > > ---
> > >  arch/arm/mach-exynos/pm.c       |  167 +++++++++++++++++++++++++++++----------
> > >  arch/arm/mach-exynos/regs-pmu.h |    1 +
> > >  2 files changed, 126 insertions(+), 42 deletions(-)
