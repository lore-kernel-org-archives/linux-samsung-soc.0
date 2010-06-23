From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 16:01:35 +0800
Message-ID: <AANLkTikspf9zHuSKe86wDQxI12HpJo_occBlLUXBkjef@mail.gmail.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
	<AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
	<AANLkTil1i_ZGI8bY14HhjrAk9RooVreAJsTteqqrMgqJ@mail.gmail.com>
	<AANLkTikDml6gQAsiRrCjIt4bUD3hnpAATr1erqCGOJMd@mail.gmail.com>
	<002301cb129c$ec59fe30$c50dfa90$%szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:58505 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751190Ab0FWIB4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Jun 2010 04:01:56 -0400
Received: by vws9 with SMTP id 9so605374vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Jun 2010 01:01:55 -0700 (PDT)
In-Reply-To: <002301cb129c$ec59fe30$c50dfa90$%szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, arm-linux <linux-arm-kernel@lists.infradead.org>, Ben Dooks <ben-linux@fluff.org>

On Wed, Jun 23, 2010 at 2:25 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Hello,
>
> On Wednesday, June 23, 2010 3:55 AM Eric Miao wrote:
>
>> ...
>
>> >>> e.g., cpu_is_* usage at OMAP tree
>> >>>
>> >>> static void omap_init_mcspi(void)
>> >>> {
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap44xx())
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap4_mcs=
pi_fixup();
>> >>>
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi=
1);
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi=
2);
>> >>>
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap2430() || cpu_is_omap3=
43x() || cpu_is_omap44xx())
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcs=
pi3_init();
>> >>>
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap343x() || cpu_is_omap4=
4xx())
>> >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcs=
pi4_init();
>> >>> }
>> >>
>> >> Just my two cents: cpu_is_*() can be used, but only when absolute=
ly
>> necessary.
>> >> The s3c does a CPU detection at startup, so I guess the usage of
>> cpu_is_*()
>> >> can be even reduced.
>> >
>> > My concern is that most device resources use the S3C_* or S5P_* pr=
efix
>> > and defined at each arch differently.
>> >
>> > E.G., mmc resource drivers use the S3C_PA_HSMMC0. but each mach ha=
s
>> > different base address.
>> > then how to handle this or make it possible?
>> >
>>
>> Now you have
>>
>> s5pv210_device_hsmmc0
>> s5pc100_device_hsmmc0
>> s3c64xx_device_hsmmc0
>> ....
>>
>> each with a different base.
>
> There is no need for such code duplication.

However, I believe this is the right way to go. A certain level of
duplication is the price to pay for a generic and clean solution.

When a peripheral controller or IP is moved from one SoC to the
next generation, there are several things could have been changed:

1. new base address and IRQ number
2. fixes and enhancements to the original IP

1. will result in a different 'struct resource', and 2. will result in =
a
different 'struct platform_device' with a different name, so the driver
can match the platform_device_id table as you agreed I'm right on
that recommendation.

They are actually _two_ different devices.

> Ben is working on a solution for
> a single kernel which supports multiple SoCs. Some of his work in pro=
gress can
> be found here: git://git.fluff.org/bjdooks/linux branch wip-samsung-d=
ev and
> wip-samsung-dev2.

Could you describe it a bit here and bring it on table for discussion?

PS: My feeling of commenting several of the samsung patches so far turn=
s
out to be quite frustrated, or I'm just too sensitive. NOTE neither am =
I
NAKing Samsung patches, nor am I interested to be involved, I'm just gi=
vin
my suggestions.
