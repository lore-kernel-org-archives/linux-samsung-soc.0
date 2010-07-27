From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH v2 3/8] ARM: S5PV310: Add Clock and PLL support
Date: Tue, 27 Jul 2010 19:43:51 +0900
Message-ID: <AANLkTi=VoG8VVa16yu2MZ2Q02hPaYW7pEY9FTpOFi-nc@mail.gmail.com>
References: <1279270714-15146-1-git-send-email-kgene.kim@samsung.com>
	<1279270714-15146-4-git-send-email-kgene.kim@samsung.com>
	<AANLkTimmkD=nrPSYmHMSDsx09ZdSZVAyz1XVBujRqf0u@mail.gmail.com>
	<00aa01cb2d6a$fa66de60$ef349b20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:39868 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755991Ab0G0Knw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Jul 2010 06:43:52 -0400
Received: by iwn7 with SMTP id 7so3669322iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jul 2010 03:43:52 -0700 (PDT)
In-Reply-To: <00aa01cb2d6a$fa66de60$ef349b20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, ben-linux@fluff.org, Kyungmin Park <kyungmin.park@samsung.com>

Hi, again.

On Tue, Jul 27, 2010 at 6:06 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> Hello,
>
> Hello,
>
>>
>> On Fri, Jul 16, 2010 at 5:58 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > From: Changhwan Youn <chaos.youn@samsung.com>
>> >
>> > This patch adds clock and pll support for S5PV310.
>> >
>> > Signed-off-by: Changhwan Youn <chaos.youn@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> > =A0arch/arm/mach-s5pv310/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0544
>> +++++++++++++++++++++++
>> > =A0arch/arm/mach-s5pv310/include/mach/regs-clock.h | =A0 60 +++
>> > =A0arch/arm/plat-s5p/include/plat/pll.h =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 41 ++
>> > =A03 files changed, 645 insertions(+), 0 deletions(-)
>> > =A0create mode 100644 arch/arm/mach-s5pv310/clock.c
>> > =A0create mode 100644 arch/arm/mach-s5pv310/include/mach/regs-cloc=
k.h
>> >
>> > diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310=
/clock.c
>> > new file mode 100644
>> > index 0000000..bb671d5
>> > --- /dev/null
>> > +++ b/arch/arm/mach-s5pv310/clock.c
>> > @@ -0,0 +1,544 @@
>> > +/* linux/arch/arm/mach-s5pv310/clock.c
>> > + *
>> > + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> > + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> > + *
>> > + * S5PV310 - Clock support
>> > + *
>> > + * This program is free software; you can redistribute it and/or =
modify
>> > + * it under the terms of the GNU General Public License version 2=
 as
>> > + * published by the Free Software Foundation.
>> > +*/
>> > +
>> > +#include <linux/kernel.h>
>> > +#include <linux/err.h>
>> > +#include <linux/io.h>
>> > +
>> > +#include <plat/cpu-freq.h>
>> > +#include <plat/clock.h>
>> > +#include <plat/cpu.h>
>> > +#include <plat/pll.h>
>> > +#include <plat/s5p-clock.h>
>> > +#include <plat/clock-clksrc.h>
>> > +
>> > +#include <mach/map.h>
>> > +#include <mach/regs-clock.h>
>> > +
>> > +static struct clk clk_sclk_hdmi27m =3D {
>> > + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_hdmi27m",
>> > + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 .rate =A0 =A0 =A0 =A0 =A0 =3D 27000000,
>> > +};
>> > +
>> > +/* Core list of CMU_CPU side */
>> > +
>> > +static struct clksrc_clk clk_mout_apll =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mout_=
apll",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clk_src_apll,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_CP=
U, .shift =3D 0, .size =3D 1 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 24, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_mout_epll =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mout_=
epll",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clk_src_epll,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 4, .size =3D 1 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_mout_mpll =3D {
>> > + =A0 =A0 =A0 .clk =3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mout_=
mpll",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clk_src_mpll,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_CP=
U, .shift =3D 4, .size =3D 1 },
>> > +};
>>
>> S5P_CLKSRC_CPU[4] is not described in the user manual (it's
>> "Reserved"). Is it "undocumented", "typographical error" in manual, =
or
>> "typographical error" in the source code? If the user manual is
>> correct, it appears to have the shift value of 8.
>>
> Yeah, you're right....typo...will fix it.
>
>> > +
>> > +static struct clk *clkset_moutcore_list[] =3D {
>> > + =A0 =A0 =A0 [0] =3D &clk_mout_apll.clk,
>> > + =A0 =A0 =A0 [1] =3D &clk_mout_mpll.clk,
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_moutcore =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_moutcore_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_moutcore_l=
ist),
>> > +};
>> > +
>> > +static struct clksrc_clk clk_moutcore =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "moutc=
ore",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_moutcore,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_CP=
U, .shift =3D 16, .size =3D 1 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_coreclk =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "core_=
clk",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_mou=
tcore.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 0, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_armclk =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "armcl=
k",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_cor=
eclk.clk,
>> > + =A0 =A0 =A0 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_aclk_corem0 =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
corem0",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_cor=
eclk.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 4, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_aclk_cores =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
cores",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_cor=
eclk.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 4, .size =3D 3 },
>> > +};
>>
>> We have two clock definitions that are identical, "aclk_corem0" and
>> "aclk_cores". Is there any reason to define the same clock source
>> twice? Although this is not going to make lockup/deadlock issues due
>> to duplicated clocks as long as there are no enable/disable function=
s
>> attached, these two may still suffer from inconsistency due to the
>> updates (on DIV) from each other.
>>
>> In the clock diagram, ACLK_COREM0 and ACLK_CORES are getting the sam=
e
>> clock from DIV_COREM0. In such a case, it'd be better let
>> clk_aclk_corem0 and clk_aclk_cores be children of a source clock of
>> DIV_corem0 or aclk_cores be a child of aclk_corem0 unless we can
>> guarantee that at least one of corem0 and cores will _never_ write t=
o
>> S5P_CLKDIV_CPU.
>>
>> Please note that with the common struct clk that provides one lock p=
er
>> clock combined with SMP support of S5PV310, we can suffer from
>> inconsistency due to parallelism in clock related values. For exampl=
e,
>> updating DIV value of corem0 may happen in the middle of
>> reading/updating cores's DIV value. We can prevent such actions by
>> locking more widely (the whole section of clk_get_rate and
>> clk_set_rate with a global lock); however, this may affect the
>> efficiency greatly especially in SMP machines.
>>
> Actually, there are own purpose...so we need to separate them.
> But used same divider because there is no case that need to set up di=
fferent each clock rate.

I understand that ACLK_COREM0 and ACLK_CORES are separated after
DIV_corem0 and each clock rate would not be different.

And, if you can guarantee that nobody is going to update DIV value
without notifying the another (COREM0 vs CORES), it's fine.

However, if it's not (the DIV value may be updated at run-time), we
should let only one of them have the DIV. e.g.,


I suggest the following:

static struct clksrc_clk clk_aclk_corem0 =3D {
 =A0 =A0 =A0 .clk =A0 =A0=3D {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_corem0=
",
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_coreclk.c=
lk,
 =A0 =A0 =A0 },
 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .sh=
ift =3D 4, .size =3D 3 },
};

static struct clksrc_clk clk_aclk_cores =3D {
 =A0 =A0 =A0 .clk =A0 =A0=3D {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_cores"=
,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_aclk_core=
m0.clk,
 =A0 =A0 =A0 },
};

=3D=3D OR =3D=3D

static struct clksrc_clk clk_div_corem0 =3D {
 =A0 =A0 =A0 .clk =A0 =A0=3D {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "div_corem0"=
,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_coreclk.c=
lk,
 =A0 =A0 =A0 },
 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CPU, .sh=
ift =3D 4, .size =3D 3 },
};

static struct clksrc_clk clk_aclk_corem0 =3D {
 =A0 =A0 =A0 .clk =A0 =A0=3D {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_corem0=
",
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_div_corem=
0.clk,
 =A0 =A0 =A0 },
};

static struct clksrc_clk clk_aclk_cores =3D {
 =A0 =A0 =A0 .clk =A0 =A0=3D {
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_cores"=
,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_div_corem=
0.clk,
 =A0 =A0 =A0 },
};




>
>> > +
>> > +static struct clksrc_clk clk_aclk_corem1 =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
corem1",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_cor=
eclk.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 8, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_periph =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "perip=
h",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_cor=
eclk.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 12, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_atbout =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "atbou=
t",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_mou=
tcore.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 16, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_pclk_dbg =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk_=
dbg",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_atb=
out.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CP=
U, .shift =3D 20, .size =3D 3 },
>> > +};
>> > +
>> > +/* Core list of CMU_CORE side */
>> > +
>> > +static struct clk *clkset_corebus_list[] =3D {
>> > + =A0 =A0 =A0 [0] =3D &clk_mout_mpll.clk,
>> > + =A0 =A0 =A0 [1] =3D &clk_mout_apll.clk,
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_mout_corebus =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_corebus_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_corebus_li=
st),
>> > +};
>> > +
>> > +static struct clksrc_clk clk_mout_corebus =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mout_=
corebus",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_mout_corebus,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_CP=
U, .shift =3D 4, .size =3D 1 },
>> > +};
>>
>> The clock, "mout_corebus", appears to be either duplicated (another
>> instance of S5P_CLKSRC_CPU[4]) or mistyped. Besides, "moutcore" is
>> already defined with a shift value of 16 and sources with
>> clkset_moutcore. Did you intend to define
>> MUX_HPM_SEL(CLK_SRC_CPU[20]), which is the only bit that is not
>> defined yet with CLK_SRC_CPU.
>>
> yeah, should be 16...will fix it.

If this "mout_corebus" is meant to address the MUX_CORE_BUS in CORE
domain as you've mentioned below, it should be CLK_SRC_CORE with shift
=3D 4.

>
>> > +
>> > +static struct clksrc_clk clk_sclk_dmc =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_=
dmc",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_mou=
t_corebus.clk,
>>
>> =3D=3D> clk_moutcore.clk?
>>
> Please refer to below explain.

If this corebus.clk is to access CLK_SRC_CORE, using clk_mout_corebus
seems correct.

>
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CO=
RE0, .shift =3D 12, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_aclk_cored =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
cored",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_scl=
k_dmc.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CO=
RE0, .shift =3D 16, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_aclk_corep =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
corep",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_acl=
k_cored.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CO=
RE0, .shift =3D 20, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_aclk_acp =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
acp",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_mou=
t_corebus.clk,
>>
>> =3D=3D> clk_moutcore.clk?
>
> The parent of clock 'clk_aclk_acp' is clk_mout_corebus.
> The clock 'clk_moutcore' is in ohter domain, CMU_CPU.
>
>>
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CO=
RE0, .shift =3D 0, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_clk clk_pclk_acp =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pclk_=
acp",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_acl=
k_acp.clk,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_CO=
RE0, .shift =3D 4, .size =3D 3 },
>> > +};
>> > +
>> > +/* Core list of CMU_TOP side */
>> > +
>> > +static struct clk *clkset_aclk_top_list[] =3D {
>> > + =A0 =A0 =A0 [0] =3D &clk_mout_mpll.clk,
>> > + =A0 =A0 =A0 [1] =3D &clk_mout_apll.clk,
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_aclk_200 =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_aclk_top_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_aclk_top_l=
ist),
>> > +};
>> > +
>> > +static struct clksrc_clk clk_aclk_200 =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
200",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_aclk_200,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 12, .size =3D 1 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_TO=
P, .shift =3D 0, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_aclk_100 =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_aclk_top_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_aclk_top_l=
ist),
>> > +};
>>
>> clkset_aclk_200 and clkset_aclk_100 are the same.
>>
> Each clock 'aclk_xxx' has own clock rate for supporting bus clock.
> So...it differs.

You can still set the SRC differently even if clkset_aclk_* is reused;
i.e., clkset_aclk_* only lists possible clock sources.

>
>> > +
>> > +static struct clksrc_clk clk_aclk_100 =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
100",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_aclk_100,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 16, .size =3D 1 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_TO=
P, .shift =3D 4, .size =3D 4 },
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_aclk_160 =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_aclk_top_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_aclk_top_l=
ist),
>> > +};
>>
>> clkset_aclk_160 is also same with _200 and _100.
>>
> already explained.
>
>> > +
>> > +static struct clksrc_clk clk_aclk_160 =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
160",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_aclk_160,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 20, .size =3D 1 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_TO=
P, .shift =3D 8, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_aclk_133 =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_aclk_top_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_aclk_top_l=
ist),
>> > +};
>>
>> clkset_aclk_133 is also same with _200, _100, and _160.
>>
> already explained.
>
>> > +
>> > +static struct clksrc_clk clk_aclk_133 =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "aclk_=
133",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_aclk_133,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 24, .size =3D 1 },
>> > + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_TO=
P, .shift =3D 12, .size =3D 3 },
>> > +};
>> > +
>> > +static struct clk *clkset_vpllsrc_list[] =3D {
>> > + =A0 =A0 =A0 [0] =3D &clk_fin_vpll,
>> > + =A0 =A0 =A0 [1] =3D &clk_sclk_hdmi27m,
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_vpllsrc =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_vpllsrc_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_vpllsrc_li=
st),
>> > +};
>> > +
>> > +static struct clksrc_clk clk_vpllsrc =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "vpll_=
src",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_vpllsrc,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 0, .size =3D 1 },
>> > +};
>>
>> In the user manual, CLKSRC_TOP0[0] is "Reserved". It appears that th=
e
>> .reg field should be "S5P_CLKSRC_TOP1", not "TOP0".
>
> will fix it.
>
>>
>> > +
>> > +static struct clk *clkset_sclk_vpll_list[] =3D {
>> > + =A0 =A0 =A0 [0] =3D &clk_vpllsrc.clk,
>> > + =A0 =A0 =A0 [1] =3D &clk_fout_vpll,
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_sclk_vpll =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_sclk_vpll_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_sclk_vpll_=
list),
>> > +};
>> > +
>> > +static struct clksrc_clk clk_sclk_vpll =3D {
>> > + =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_=
vpll",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_sclk_vpll,
>> > + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_TO=
P0, .shift =3D 8, .size =3D 1 },
>> > +};
>> > +
>> > +static int s5pv310_clk_ip_peril_ctrl(struct clk *clk, int enable)
>> > +{
>> > + =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKGATE_IP_PERIL, clk, enabl=
e);
>> > +}
>> > +
>> > +static struct clk init_clocks_disable[] =3D {
>> > + =A0 =A0 =A0 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "timer=
s",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_acl=
k_100.clk,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_=
clk_ip_peril_ctrl,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<24),
>> > + =A0 =A0 =A0 }
>> > +};
>> > +
>> > +static struct clk init_clocks[] =3D {
>> > + =A0 =A0 =A0 /* Nothing here yet */
>> > +};
>> > +
>> > +static struct clk *clkset_group_list[] =3D {
>> > + =A0 =A0 =A0 [0] =3D &clk_ext_xtal_mux,
>> > + =A0 =A0 =A0 [1] =3D &clk_xusbxti,
>> > + =A0 =A0 =A0 [2] =3D &clk_sclk_hdmi27m,
>> > + =A0 =A0 =A0 [6] =3D &clk_mout_mpll.clk,
>> > + =A0 =A0 =A0 [7] =3D &clk_mout_epll.clk,
>> > + =A0 =A0 =A0 [8] =3D &clk_sclk_vpll.clk,
>> > +};
>> > +
>> > +static struct clksrc_sources clkset_group =3D {
>> > + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_group_list,
>> > + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_group_list=
),
>> > +};
>> > +
>> > +static struct clksrc_clk clksrcs[] =3D {
>> > + =A0 =A0 =A0 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0=
 =A0 =3D "uclk1",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =
=A0 =A0 =3D 0,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0=
 =A0=3D (1 << 0),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =
=A0 =3D s5pv310_clk_ip_peril_ctrl,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_P=
ERIL0, .shift =3D 0, .size =3D 4 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLKDIV_P=
ERIL0, .shift =3D 0, .size =3D 4 },
>> > + =A0 =A0 =A0 }, {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0=
 =A0 =3D "uclk1",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =
=A0 =A0 =3D 1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =
=A0 =3D s5pv310_clk_ip_peril_ctrl,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0=
 =A0=3D (1 << 1),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_P=
ERIL0, .shift =3D 4, .size =3D 4 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLKDIV_P=
ERIL0, .shift =3D 4, .size =3D 4 },
>> > + =A0 =A0 =A0 }, {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0=
 =A0 =3D "uclk1",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =
=A0 =A0 =3D 2,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =
=A0 =3D s5pv310_clk_ip_peril_ctrl,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0=
 =A0=3D (1 << 2),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_P=
ERIL0, .shift =3D 8, .size =3D 4 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLKDIV_P=
ERIL0, .shift =3D 8, .size =3D 4 },
>> > + =A0 =A0 =A0 }, {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0=
 =A0 =3D "uclk1",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =
=A0 =A0 =3D 3,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =
=A0 =3D s5pv310_clk_ip_peril_ctrl,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0=
 =A0=3D (1 << 3),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_P=
ERIL0, .shift =3D 12, .size =3D 4 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLKDIV_P=
ERIL0, .shift =3D 12, .size =3D 4 },
>> > + =A0 =A0 =A0 }, {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0=
 =A0 =3D "sclk_pwm",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =
=A0 =A0 =3D -1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =
=A0 =3D s5pv310_clk_ip_peril_ctrl,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0=
 =A0=3D (1 << 24),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_P=
ERIL0, .shift =3D 24, .size =3D 4 },
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLKDIV_P=
ERIL3, .shift =3D 0, .size =3D 4 },
>> > + =A0 =A0 =A0 },
>> > +};
>> > +
>> > +/* Clock initialization code */
>> > +static struct clksrc_clk *sysclks[] =3D {
>> > + =A0 =A0 =A0 &clk_mout_apll,
>> > + =A0 =A0 =A0 &clk_mout_epll,
>> > + =A0 =A0 =A0 &clk_mout_mpll,
>> > + =A0 =A0 =A0 &clk_moutcore,
>> > + =A0 =A0 =A0 &clk_coreclk,
>> > + =A0 =A0 =A0 &clk_armclk,
>> > + =A0 =A0 =A0 &clk_aclk_corem0,
>> > + =A0 =A0 =A0 &clk_aclk_cores,
>> > + =A0 =A0 =A0 &clk_aclk_corem1,
>> > + =A0 =A0 =A0 &clk_periph,
>> > + =A0 =A0 =A0 &clk_atbout,
>> > + =A0 =A0 =A0 &clk_pclk_dbg,
>> > + =A0 =A0 =A0 &clk_mout_corebus,
>> > + =A0 =A0 =A0 &clk_sclk_dmc,
>> > + =A0 =A0 =A0 &clk_aclk_cored,
>> > + =A0 =A0 =A0 &clk_aclk_corep,
>> > + =A0 =A0 =A0 &clk_aclk_acp,
>> > + =A0 =A0 =A0 &clk_pclk_acp,
>> > + =A0 =A0 =A0 &clk_vpllsrc,
>> > + =A0 =A0 =A0 &clk_sclk_vpll,
>> > + =A0 =A0 =A0 &clk_aclk_200,
>> > + =A0 =A0 =A0 &clk_aclk_100,
>> > + =A0 =A0 =A0 &clk_aclk_160,
>> > + =A0 =A0 =A0 &clk_aclk_133,
>> > +};
>> > +
>> > +void __init_or_cpufreq s5pv310_setup_clocks(void)
>> > +{
>> > + =A0 =A0 =A0 struct clk *xtal_clk;
>> > + =A0 =A0 =A0 unsigned long apll;
>> > + =A0 =A0 =A0 unsigned long mpll;
>> > + =A0 =A0 =A0 unsigned long epll;
>> > + =A0 =A0 =A0 unsigned long vpll;
>> > + =A0 =A0 =A0 unsigned long vpllsrc;
>> > + =A0 =A0 =A0 unsigned long xtal;
>> > + =A0 =A0 =A0 unsigned long armclk;
>> > + =A0 =A0 =A0 unsigned long aclk_corem0;
>> > + =A0 =A0 =A0 unsigned long aclk_cores;
>> > + =A0 =A0 =A0 unsigned long aclk_corem1;
>> > + =A0 =A0 =A0 unsigned long periclk;
>> > + =A0 =A0 =A0 unsigned long sclk_dmc;
>> > + =A0 =A0 =A0 unsigned long aclk_cored;
>> > + =A0 =A0 =A0 unsigned long aclk_corep;
>> > + =A0 =A0 =A0 unsigned long aclk_acp;
>> > + =A0 =A0 =A0 unsigned long pclk_acp;
>> > + =A0 =A0 =A0 unsigned int ptr;
>> > +
>> > + =A0 =A0 =A0 printk(KERN_DEBUG "%s: registering clocks\n", __func=
__);
>> > +
>> > + =A0 =A0 =A0 xtal_clk =3D clk_get(NULL, "xtal");
>> > + =A0 =A0 =A0 BUG_ON(IS_ERR(xtal_clk));
>> > +
>> > + =A0 =A0 =A0 xtal =3D clk_get_rate(xtal_clk);
>> > + =A0 =A0 =A0 clk_put(xtal_clk);
>> > +
>> > + =A0 =A0 =A0 printk(KERN_DEBUG "%s: xtal is %ld\n", __func__, xta=
l);
>> > +
>> > + =A0 =A0 =A0 apll =3D s5p_get_pll45xx(xtal, __raw_readl(S5P_APLL_=
CON0), pll_4508);
>> > + =A0 =A0 =A0 mpll =3D s5p_get_pll45xx(xtal, __raw_readl(S5P_MPLL_=
CON0), pll_4508);
>> > + =A0 =A0 =A0 epll =3D s5p_get_pll46xx(xtal, __raw_readl(S5P_EPLL_=
CON0),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __ra=
w_readl(S5P_EPLL_CON1), pll_4500);
>> > +
>> > + =A0 =A0 =A0 vpllsrc =3D clk_get_rate(&clk_vpllsrc.clk);
>> > + =A0 =A0 =A0 vpll =3D s5p_get_pll46xx(vpllsrc, __raw_readl(S5P_VP=
LL_CON0),
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __ra=
w_readl(S5P_VPLL_CON1), pll_4502);
>> > +
>> > + =A0 =A0 =A0 clk_fout_apll.rate =3D apll;
>> > + =A0 =A0 =A0 clk_fout_mpll.rate =3D mpll;
>> > + =A0 =A0 =A0 clk_fout_epll.rate =3D epll;
>> > + =A0 =A0 =A0 clk_fout_vpll.rate =3D vpll;
>> > +
>> > + =A0 =A0 =A0 printk(KERN_INFO "S5PV310: PLL settings, A=3D%ld, M=3D=
%ld, E=3D%ld
>> V=3D%ld",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 apll, mpll, epll, vp=
ll);
>> > +
>> > + =A0 =A0 =A0 armclk =3D clk_get_rate(&clk_armclk.clk);
>> > + =A0 =A0 =A0 aclk_corem0 =3D clk_get_rate(&clk_aclk_corem0.clk);
>> > + =A0 =A0 =A0 aclk_cores =3D clk_get_rate(&clk_aclk_cores.clk);
>> > + =A0 =A0 =A0 aclk_corem1 =3D clk_get_rate(&clk_aclk_corem1.clk);
>> > + =A0 =A0 =A0 periclk =3D clk_get_rate(&clk_periph.clk);
>> > + =A0 =A0 =A0 sclk_dmc =3D clk_get_rate(&clk_sclk_dmc.clk);
>> > + =A0 =A0 =A0 aclk_cored =3D clk_get_rate(&clk_aclk_cored.clk);
>> > + =A0 =A0 =A0 aclk_corep =3D clk_get_rate(&clk_aclk_corep.clk);
>> > + =A0 =A0 =A0 aclk_acp =3D clk_get_rate(&clk_aclk_acp.clk);
>> > + =A0 =A0 =A0 pclk_acp =3D clk_get_rate(&clk_pclk_acp.clk);
>> > +
>> > + =A0 =A0 =A0 printk(KERN_INFO "S5PV310: ARMCLK=3D%ld, COREM0=3D%l=
d,
>> CORES=3D%ld\n"
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"COREM1=3D%ld, PE=
RI=3D%ld, DMC=3D%ld, CORED=3D%ld\n"
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"COREP=3D%ld, ACL=
K_ACP=3D%ld, PCLK_ACP=3D%ld",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 armclk, aclk_corem0,=
 aclk_cores, aclk_corem1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 periclk, sclk_dmc, a=
clk_cored, aclk_corep,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 aclk_acp, pclk_acp);
>> > +
>> > + =A0 =A0 =A0 clk_f.rate =3D armclk;
>> > + =A0 =A0 =A0 clk_h.rate =3D sclk_dmc;
>> > + =A0 =A0 =A0 clk_p.rate =3D periclk;
>> > +
>> > + =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_set_clksrc(&clksrcs[ptr], true);
>> > +}
>> > +
>> > +static struct clk *clks[] __initdata =3D {
>> > + =A0 =A0 =A0 /* Nothing here yet */
>> > +};
>> > +
>> > +void __init s5pv310_register_clocks(void)
>> > +{
>> > + =A0 =A0 =A0 struct clk *clkp;
>> > + =A0 =A0 =A0 int ret;
>> > + =A0 =A0 =A0 int ptr;
>> > +
>> > + =A0 =A0 =A0 ret =3D s3c24xx_register_clocks(clks, ARRAY_SIZE(clk=
s));
>> > + =A0 =A0 =A0 if (ret > 0)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Failed to register =
%u clocks\n", ret);
>> > +
>> > + =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(sysclks); ptr++)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_register_clksrc(sysclks[ptr], 1)=
;
>> > +
>> > + =A0 =A0 =A0 s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
>> > + =A0 =A0 =A0 s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clo=
cks));
>> > +
>> > + =A0 =A0 =A0 clkp =3D init_clocks_disable;
>> > + =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(init_clocks_disable=
); ptr++, clkp++) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D s3c24xx_register_clock(clkp)=
;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Fai=
led to register clock %s (%d)\n",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clkp-=
>name, ret);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (clkp->enable)(clkp, 0);
>> > + =A0 =A0 =A0 }
>> > +
>> > + =A0 =A0 =A0 s3c_pwmclk_init();
>> > +}
>> > diff --git a/arch/arm/mach-s5pv310/include/mach/regs-clock.h b/arc=
h/arm/mach-
>> s5pv310/include/mach/regs-clock.h
>> > new file mode 100644
>> > index 0000000..77f637f
>> > --- /dev/null
>> > +++ b/arch/arm/mach-s5pv310/include/mach/regs-clock.h
>> > @@ -0,0 +1,60 @@
>> > +/* linux/arch/arm/mach-s5pv310/include/mach/regs-clock.h
>> > + *
>> > + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> > + * =A0 =A0 =A0 =A0 =A0 =A0 http://www.samsung.com/
>> > + *
>> > + * S5PV310 - Clock register definitions
>> > + *
>> > + * This program is free software; you can redistribute it and/or =
modify
>> > + * it under the terms of the GNU General Public License version 2=
 as
>> > + * published by the Free Software Foundation.
>> > +*/
>> > +
>> > +#ifndef __ASM_ARCH_REGS_CLOCK_H
>> > +#define __ASM_ARCH_REGS_CLOCK_H __FILE__
>> > +
>> > +#include <mach/map.h>
>> > +
>> > +#define S5P_CLKREG(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(S3C_VA_=
SYS + (x))
>> > +
>> > +#define S5P_INFORM0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CL=
KREG(0x800)
>> > +
>> > +#define S5P_EPLL_CON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x1C110)
>> > +#define S5P_EPLL_CON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x1C114)
>> > +#define S5P_VPLL_CON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x1C120)
>> > +#define S5P_VPLL_CON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x1C124)
>> > +
>> > +#define S5P_CLKSRC_TOP0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0S5P_CLKREG(0x1C210)
>> > +#define S5P_CLKSRC_TOP1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0S5P_CLKREG(0x1C214)
>> > +
>> > +#define S5P_CLKSRC_PERIL0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C250)
>> > +
>> > +#define S5P_CLKDIV_TOP =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG=
(0x1C510)
>> > +
>> > +#define S5P_CLKDIV_PERIL0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C550)
>> > +#define S5P_CLKDIV_PERIL1 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C554)
>> > +#define S5P_CLKDIV_PERIL2 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C558)
>> > +#define S5P_CLKDIV_PERIL3 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C55C)
>> > +#define S5P_CLKDIV_PERIL4 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C560)
>> > +#define S5P_CLKDIV_PERIL5 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0=
x1C564)
>> > +
>> > +#define S5P_CLKGATE_IP_PERIL =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x1C9=
50)
>> > +
>> > +#define S5P_CLKDIV_CORE0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0=
x20500)
>> > +
>> > +#define S5P_APLL_LOCK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x24000)
>> > +#define S5P_MPLL_LOCK =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x24004)
>> > +#define S5P_APLL_CON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x24100)
>> > +#define S5P_APLL_CON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x24104)
>> > +#define S5P_MPLL_CON0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x24108)
>> > +#define S5P_MPLL_CON1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKR=
EG(0x2410C)
>> > +
>> > +#define S5P_CLKSRC_CPU =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG=
(0x24200)
>> > +#define S5P_CLKMUX_STATCPU =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x2=
4400)
>> > +
>> > +#define S5P_CLKDIV_CPU =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG=
(0x24500)
>> > +#define S5P_CLKDIV_STATCPU =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKREG(0x2=
4600)
>> > +
>> > +#define S5P_CLKGATE_SCLKCPU =A0 =A0 =A0 =A0 =A0 =A0S5P_CLKREG(0x2=
4800)
>> > +
>> > +#endif /* __ASM_ARCH_REGS_CLOCK_H */
>> > diff --git a/arch/arm/plat-s5p/include/plat/pll.h b/arch/arm/plat-
>> s5p/include/plat/pll.h
>> > index 7db3227..4e8fe08 100644
>> > --- a/arch/arm/plat-s5p/include/plat/pll.h
>> > +++ b/arch/arm/plat-s5p/include/plat/pll.h
>> > @@ -46,6 +46,47 @@ static inline unsigned long s5p_get_pll45xx(uns=
igned long
>> baseclk, u32 pll_con,
>> > =A0 =A0 =A0 =A0return (unsigned long)fvco;
>> > =A0}
>> >
>> > +#define PLL46XX_KDIV_MASK =A0 =A0 =A0(0xFFFF)
>> > +#define PLL46XX_MDIV_MASK =A0 =A0 =A0(0x1FF)
>> > +#define PLL46XX_PDIV_MASK =A0 =A0 =A0(0x3F)
>> > +#define PLL46XX_SDIV_MASK =A0 =A0 =A0(0x7)
>> > +#define PLL46XX_MDIV_SHIFT =A0 =A0 (16)
>> > +#define PLL46XX_PDIV_SHIFT =A0 =A0 (8)
>> > +#define PLL46XX_SDIV_SHIFT =A0 =A0 (0)
>> > +
>> > +enum pll46xx_type_t {
>> > + =A0 =A0 =A0 pll_4600,
>> > + =A0 =A0 =A0 pll_4650,
>> > +};
>> > +
>> > +static inline unsigned long s5p_get_pll46xx(unsigned long baseclk=
,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 u32 pll_con0, u32 pll_con1,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 enum pll46xx_type_t pll_type)
>> > +{
>> > + =A0 =A0 =A0 unsigned long result;
>> > + =A0 =A0 =A0 u32 mdiv, pdiv, sdiv, kdiv;
>> > + =A0 =A0 =A0 u64 tmp;
>> > +
>> > + =A0 =A0 =A0 mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & PLL46XX_=
MDIV_MASK;
>> > + =A0 =A0 =A0 pdiv =3D (pll_con0 >> PLL46XX_PDIV_SHIFT) & PLL46XX_=
PDIV_MASK;
>> > + =A0 =A0 =A0 sdiv =3D (pll_con0 >> PLL46XX_SDIV_SHIFT) & PLL46XX_=
SDIV_MASK;
>> > + =A0 =A0 =A0 kdiv =3D pll_con1 & PLL46XX_KDIV_MASK;
>> > +
>> > + =A0 =A0 =A0 tmp =3D baseclk;
>> > +
>> > + =A0 =A0 =A0 if (pll_type =3D=3D pll_4600) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp *=3D (mdiv << 16) + kdiv;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do_div(tmp, (pdiv << sdiv));
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result =3D tmp >> 16;
>> > + =A0 =A0 =A0 } else {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp *=3D (mdiv << 10) + kdiv;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do_div(tmp, (pdiv << sdiv));
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 result =3D tmp >> 10;
>> > + =A0 =A0 =A0 }
>> > +
>> > + =A0 =A0 =A0 return result;
>> > +}
>> > +
>> > =A0#define PLL90XX_MDIV_MASK =A0 =A0 =A0(0xFF)
>> > =A0#define PLL90XX_PDIV_MASK =A0 =A0 =A0(0x3F)
>> > =A0#define PLL90XX_SDIV_MASK =A0 =A0 =A0(0x7)
>> > --
>
> Thanks for pointing it out.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
