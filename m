From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 15:36:46 +0800
Message-ID: <AANLkTinYTm-AZDXOSvtTptGg1HYhKfItYYW8tBuF4SPV@mail.gmail.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
	<AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
	<20100623072855.GZ12255@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:61066 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751638Ab0FWHhI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 03:37:08 -0400
Received: by vws9 with SMTP id 9so578566vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jun 2010 00:37:06 -0700 (PDT)
In-Reply-To: <20100623072855.GZ12255@atomide.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, Ben Dooks <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Jun 23, 2010 at 3:28 PM, Tony Lindgren <tony@atomide.com> wrote=
:
> * Eric Miao <eric.y.miao@gmail.com> [100623 03:48]:
>> On Wed, Jun 23, 2010 at 7:27 AM, Kyungmin Park <kmpark@infradead.org=
> wrote:
>> > To Ben,
>> >
>> > I really need single kernel for s5pc110 (cortex A8) and s5pc210
>> > (cortex A9) at least.
>> > Fortunately arm move to these approaches recently. but current Sam=
sung
>> > SoCs not prepare these one.
>> >
>> > So I wonder do you have a plan or how to address these issues?
>> > How to assign the address at resources and use it at runtime?
>> >
>> > Personally I want to use cpu_is_*. but you reject it to use.
>> > Other way is that we can create the base address variables and ass=
ign
>> > it at init time.
>> >
>> > Please give your opinions.
>> >
>> > Thank you,
>> > Kyungmin Park
>> >
>> > e.g., cpu_is_* usage at OMAP tree
>> >
>> > static void omap_init_mcspi(void)
>> > {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap44xx())
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap4_mcspi=
_fixup();
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi1)=
;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi2)=
;
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap2430() || cpu_is_omap343=
x() || cpu_is_omap44xx())
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi=
3_init();
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap343x() || cpu_is_omap44x=
x())
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi=
4_init();
>> > }
>>
>> Just my two cents: cpu_is_*() can be used, but only when absolutely =
necessary.
>> The s3c does a CPU detection at startup, so I guess the usage of cpu=
_is_*()
>> can be even reduced.
>>
>> I'm not sure if the above case is a good reference or not. The omap_=
init_mcspi
>> is called from omap2_init_devices(), while the registration can actu=
ally be
>> made into the board init code when that device is used (some of the =
McSPIs are
>> not used, and it's not necessary to register them), and the differen=
ces be
>> handled in the driver.
>
> Few comments regarding the cpu_is_omap macros: The macros should real=
ly be
> soc_is_omapxxxx() instead cpu_is_omapxxxx().

Right, that will be more specific. cpu_is_* could be used only
with the ARM core, like cpu_is_arm946ejs(), ... And apparently
we all have abusively used it :-)

>
> Also, sprinkling these too much makes the code messy and hard to patc=
h for
> new processors. So you should limit the use to very selected places d=
uring
> init, then set some flag like OMAP_HAS_MCSPI2 | OMAP_HAS_MCSPI3 or so=
mething
> similar.

Exactly.
