From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: call scu_enable() only in case of cortex-A9
 processor
Date: Wed, 05 Jun 2013 21:45:37 +0900
Message-ID: <093301ce61ea$93f52080$bbdf6180$%kim@samsung.com>
References: <1369993395-6185-1-git-send-email-l.krishna@samsung.com>
 <CAD=FV=WvRydOHZTciwOEbQ6--+sd4qYSdiypUDwm2hWGDHZSKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55493 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752993Ab3FEMpj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Jun 2013 08:45:39 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNX005HT7F0THO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Jun 2013 21:45:37 +0900 (KST)
In-reply-to: <CAD=FV=WvRydOHZTciwOEbQ6--+sd4qYSdiypUDwm2hWGDHZSKw@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Doug Anderson' <dianders@chromium.org>, 'Leela Krishna Amudala' <l.krishna@samsung.com>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Olof Johansson' <olof@lixom.net>

Doug Anderson wrote:
> 
> Leela,
> 
> On Fri, May 31, 2013 at 2:43 AM, Leela Krishna Amudala
> <l.krishna@samsung.com> wrote:
> > This patch reads the cpuid part number and if it matches with
> > cortex-A9, calls scu_enable()
> >
> > Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> > ---
> >  arch/arm/mach-exynos/platsmp.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-
> exynos/platsmp.c
> > index a0e8ff7..d9c6d0a 100644
> > --- a/arch/arm/mach-exynos/platsmp.c
> > +++ b/arch/arm/mach-exynos/platsmp.c
> > @@ -200,7 +200,7 @@ static void __init exynos_smp_prepare_cpus(unsigned
> int max_cpus)
> >  {
> >         int i;
> >
> > -       if (!(soc_is_exynos5250() || soc_is_exynos5440()))
> > +       if (read_cpuid_part_number() == ARM_CPU_PART_CORTEX_A9)
> >                 scu_enable(scu_base_addr());
> >
> >         /*
> 
> Thanks for sending upstream.  For reference, our local version is here
> <https://gerrit.chromium.org/gerrit/#/c/56804/>.
> 
> This is much better than listing every single non-A9 exynos in a big
> "if" test.  ;)
> 
Yes :)

> Reviewed-by: Doug Anderson <dianders@chromium.org>

Applied, thanks.

- Kukjin
