From: Aditya Sharma <adityaps789@gmail.com>
Subject: Re: [PATCH] [ARM] [S3C64XX] Add support for hr timer
Date: Wed, 11 Nov 2009 14:38:04 +0900
Message-ID: <da7d6d700911102138w2a057803wb49f25197eb8740f@mail.gmail.com>
References: <1257468345-18021-1-git-send-email-aditya.ps@samsung.com>
	 <20091106055850.GD4117@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:46947 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905AbZKKFh7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Nov 2009 00:37:59 -0500
Received: by pwi3 with SMTP id 3so488312pwi.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Nov 2009 21:38:04 -0800 (PST)
In-Reply-To: <20091106055850.GD4117@prithivi.gnumonks.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Harald Welte <laforge@gnumonks.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi Harald,

On Fri, Nov 6, 2009 at 2:58 PM, Harald Welte <laforge@gnumonks.org> wro=
te:
> Hi Aditya,
>
> thanks for your [first] patch :)
>
> On Fri, Nov 06, 2009 at 09:45:45AM +0900, aditya.ps@samsung.com wrote=
:
>> +
>> +choice
>> + =A0 =A0 prompt "OS Timer support"
>> + =A0 =A0 depends on PLAT_S3C64XX
>> + =A0 =A0 default DYNAMIC_TIMER
>> +
>> +config FIXED_TIMER
>> + =A0 =A0 bool "Fixed Tick timer"
>> +
>> +config DYNAMIC_TIMER
>> + =A0 =A0 bool "Tickless and HR Timer"
>> + =A0 =A0 select GENERIC_TIME
>> + =A0 =A0 select GENERIC_CLOCKEVENTS
>
> I think those should probably be prefixed with S3C_ as the Kconfig na=
mespace
> is global. =A0Like with symbol names, we should not use generic names=
 unless
> we are implementing generic code.
>
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D =A0init.o
>> +ifdef CONFIG_NO_HZ
>> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
+=3D hr-time.o
>> +else
>> +
>> +ifndef CONFIG_HIGH_RES_TIMERS
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0+=3D time.o
>> +else
>> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
+=3D hr-time.o
>> +endif
>
> Mh. =A0This means the actual timer code depends only on CONFIG_NO_HZ =
and
> CONFIG_HIGH_RES_TIMERS.
>
> The two Kconfig choices FIXED_TIMER and DYNAMIC_TIMER are not really =
used
> anywhere.
>
> At last to me, it is unclear how this all works together. I think the=
 choices
> are either
>
> 1) you build the timer code solely on core kernel configuration optio=
ns like
> =A0 GENERIC_TIME, GENERIC_CLOCKEVENTS, HIGH_RES_TIMERS, NO_HZ or the =
like
>

Yes, selected the GENERIC_TIME, GENERIC_CLOCKEVENTS during machine
configuration.

> or
>
> 2) you have a private (s3c-specific) Kconfig option to select it. =A0=
In this case,
> =A0 dependent options need to be selected (like you do). =A0But then,=
 the Makefile
> =A0 should still reflect the s3c-specific Kconfig.
>
> Mixing both does not really seem to make sense to me.
>
> So as I can see, there are the three following possible cases:
>
> a) the regular/old timer code is used. =A0No high-res and no tickless=
=2E
>
> b) the high-resolution timer is used but not tickless (NO_HZ not set)
>
> c) the high-resolution timer are used tickless.
>
> If you configure+build yoru code, each of those three options has to =
work
> as expected.
>
>> +static struct clock_event_device clockevent_tick_timer =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "pwm_timer4",
>> + =A0 =A0 .features =A0 =A0 =A0 =3D CLOCK_EVT_FEAT_PERIODIC | CLOCK_=
EVT_FEAT_ONESHOT,
>> + =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D 32,
>> + =A0 =A0 .set_next_event =3D s3c64xx_tick_set_next_event,
>> + =A0 =A0 .set_mode =A0 =A0 =A0 =3D s3c64xx_tick_set_mode,
>> +};
>
> if you give this static variable a shorter name, (like clkevt_tick_tm=
r or even
> only tick_timer), then you can probably avoid some line wraps further=
 down the
> code:
>
>> + =A0 =A0 clockevent_tick_timer.mult =3D div_sc(rate, NSEC_PER_SEC,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 clockevent_tick_timer.shift);
>> + =A0 =A0 clockevent_tick_timer.max_delta_ns =3D
>> + =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(-1, &clockevent_tick_t=
imer);
>> + =A0 =A0 clockevent_tick_timer.min_delta_ns =3D
>> + =A0 =A0 =A0 =A0 =A0 =A0 clockevent_delta2ns(1, &clockevent_tick_ti=
mer);
>
> Also, we typically don't define a static string and then printk'
>
>> + =A0 =A0 static char err[] __initdata =3D KERN_ERR
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "%s: can't register clocks=
ource!\n";
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(err, clocksource_s3c64xx.name);
>
> why not simply
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "%s: can't register cl=
ocksource\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clocksource_s3c64xx.na=
me);
>

i have made these changes in the new patch.

>> + =A0 =A0 if (IS_ERR(ck_ref))
>> + =A0 =A0 =A0 =A0 =A0 =A0 panic("failed to get clock for system time=
r");
>
> here we panic. =A0Is this failure really more severe than the failure=
 above
> where we simply printk(KERN_ERR) ?
>
> Yes, I think if we can't get the clocks for the system timer, then we=
 should
> panic since the kernel will not be able to function. =A0But is failin=
g the
> clocksource registration any less severe? (this is a real question, y=
ou
> probably know better than I do)
>
> Regards,
> =A0 =A0 =A0 =A0Harald
> --
> - Harald Welte <laforge@gnumonks.org> =A0 =A0 =A0 =A0 =A0 http://lafo=
rge.gnumonks.org/
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> "Privacy in residential applications is a desirable marketing option.=
"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0(ETSI EN 300 175-7 Ch. A6)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>


--=20
Thanks and best regards
Aditya
