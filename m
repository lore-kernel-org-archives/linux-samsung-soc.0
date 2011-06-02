From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: exynos4: fix secondary CPU boot
Date: Thu, 2 Jun 2011 16:01:09 +0900
Message-ID: <BANLkTi=fjq5ki8BGDhQxHVD3u-s7W-C1rw@mail.gmail.com>
References: <1305899190-16732-1-git-send-email-marc.zyngier@arm.com>
	<4DDD3C57.6020705@samsung.com>
	<1306346645.27474.182.camel@e102391-lin.cambridge.arm.com>
	<4DDD531A.50604@samsung.com>
	<1306422710.27474.237.camel@e102391-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:56979 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751908Ab1FBHBL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Jun 2011 03:01:11 -0400
Received: by vxi39 with SMTP id 39so427997vxi.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2011 00:01:10 -0700 (PDT)
In-Reply-To: <1306422710.27474.237.camel@e102391-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marc Zyngier <Marc.Zyngier@arm.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, May 27, 2011 at 12:11 AM, Marc Zyngier <Marc.Zyngier@arm.com> w=
rote:
> On Wed, 2011-05-25 at 12:06 -0700, Kukjin Kim wrote:
>> On 05/25/11 11:04, Marc Zyngier wrote:
>> > On Wed, 2011-05-25 at 10:28 -0700, Kukjin Kim wrote:
>> >> On 05/20/11 06:46, Marc Zyngier wrote:
>>
>> (snip)
>>
>> > So that address has changed between two SoC revisions? That's
>> > unfortunate, to say the least. I'm most probably using an early re=
vision
>> > of the hardware (EVT0?), as it doesn't even support MCT.
>> >
>> I'm afraid :( and I agree secondary CPU should work on all of
>> Exynos4210. But I'm still think about the method...
>>
>> > What about the following patch?
>> >
>> Uhm...this is really hack but I'd like to use another normal way...?
>
> Oh, no question about the hack status. The trouble is, unless there i=
s a
> sure way to tell which SoC revision we're running on, there's little
> else we can do than poke both locations and pray.
>
> Is there such a way to identify the SoC revision?

It's also required for OneNAND. as you know C210 EVT0 OneNAND DMA has
bug and need to workaround.

platform codes should provide the these function. please see the OMAP
codes. how to handle it.

Thank you,
Kyungmin Park
>
>> >> From c27e75b86e1ee181987a9364286a888421e76205 Mon Sep 17 00:00:00=
 2001
>> > From: Marc Zyngier<marc.zyngier@arm.com>
>> > Date: Fri, 20 May 2011 14:38:25 +0100
>> > Subject: [PATCH] ARM: exynos4: fix secondary CPU boot on early SoC=
 revisions
>> >
>> > It appears that the system-wide flags register that used to be at
>> > 0x02025000 on the first revision of Exynos4 has moved to 0x0202000=
0.
>> >
>> > The kernel has been updated accordingly, but this unfortunately le=
aves
>> > early boards without SMP support (the secondary CPU spins endlessl=
y
>> > in BL0 waiting for an address to be written at that memory locatio=
n).
>> >
>> > Try to solve the problem by poking both locations. This should be
>> > safe as this is done early enough in the kernel boot process, and =
nobody
>> > should be using the SRAM yet.
>> >
>> > Tested on a vintage SMDK-v310.
>>
>> vintage ;)
>
> Well, I thought I was the uber-cool guy in the office because of that
> shiny blue board on my desk, only to discover that it's sooo last
> year... ;-)
>
>> >
>> > Cc: Kukjin Kim<kgene.kim@samsung.com>
>> > Signed-off-by: Marc Zyngier<marc.zyngier@arm.com>
>> > ---
>> > =A0 arch/arm/mach-exynos4/include/mach/map.h | =A0 =A01 +
>> > =A0 arch/arm/mach-exynos4/platsmp.c =A0 =A0 =A0 =A0 =A0| =A0 14 ++=
++++++++++++
>> > =A0 2 files changed, 15 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/m=
ach-exynos4/include/mach/map.h
>> > index 0009e77..781e149 100644
>> > --- a/arch/arm/mach-exynos4/include/mach/map.h
>> > +++ b/arch/arm/mach-exynos4/include/mach/map.h
>> > @@ -24,6 +24,7 @@
>> > =A0 #include<plat/map-s5p.h>
>> >
>> > =A0 #define EXYNOS4_PA_SYSRAM =A0 =A0 =A0 =A0 0x02020000
>> > +#define EXYNOS4_PA_SYSRAM_EVT0 =A0 =A0 =A0 =A0 =A0 =A0 0x02025000
>> >
>> > =A0 #define EXYNOS4_PA_FIMC0 =A0 =A0 =A0 =A0 =A00x11800000
>> > =A0 #define EXYNOS4_PA_FIMC1 =A0 =A0 =A0 =A0 =A00x11810000
>> > diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exyno=
s4/platsmp.c
>> > index c5e65a0..f261c34 100644
>> > --- a/arch/arm/mach-exynos4/platsmp.c
>> > +++ b/arch/arm/mach-exynos4/platsmp.c
>> > @@ -155,6 +155,7 @@ void __init smp_init_cpus(void)
>> > =A0 void __init platform_smp_prepare_cpus(unsigned int max_cpus)
>> > =A0 {
>> > =A0 =A0 int i;
>> > + =A0 void __iomem *sysram_evt0;
>> >
>> > =A0 =A0 /*
>> > =A0 =A0 =A0* Initialise the present map, which describes the set o=
f CPUs
>> > @@ -172,4 +173,17 @@ void __init platform_smp_prepare_cpus(unsigne=
d int max_cpus)
>> > =A0 =A0 =A0* secondary CPU branches to this address.
>> > =A0 =A0 =A0*/
>> > =A0 =A0 __raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup))=
, S5P_VA_SYSRAM);
>> > +
>> > + =A0 /*
>> > + =A0 =A0* EVT0 has the system-wide flags register at a different =
address.
>> > + =A0 =A0* Poke it as well, in case we're running on an old SoC re=
vision.
>> > + =A0 =A0*/
>> > + =A0 sysram_evt0 =3D ioremap(EXYNOS4_PA_SYSRAM_EVT0, SZ_4K);
>>
>> Hmm...first of all, need to check whether can ioremap the area on ne=
wer
>> one but I'm out off office now so will check it after backing.
>
> The only documentation I have access to refers to the iRAM (SRAM) bei=
ng
> mapped between 0x02020000 and 0x02040000. Unless the HW guys have gon=
e
> completely wild and changed this range as well, I think we're pretty
> safe.
>
>> > + =A0 if (!sysram_evt0) {
>> > + =A0 =A0 =A0 =A0 =A0 pr_err("Unable to remap EXYNOS4_PA_SYSRAM_EV=
T0\n");
>>
>> Do we really need 'pr_err' here?...
>
> No. Anything will do. Though not being able to ioremap() that region =
may
> indicate further trouble down the road.
>
>> > + =A0 =A0 =A0 =A0 =A0 return;
>> > + =A0 }
>> > +
>> > + =A0 __raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)), =
sysram_evt0);
>> > + =A0 iounmap(sysram_evt0);
>> > =A0 }
>>
>
> Cheers,
>
> =A0 =A0 =A0 =A0M.
> --
> Reality is an implementation detail.
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
