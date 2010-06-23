From: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: Samsung SoCs: preparation for single kernel
Date: Wed, 23 Jun 2010 08:50:34 +0800
Message-ID: <AANLkTil-AOEqhMOXydaiA1X_v0rjoNQxALrO0UY638AS@mail.gmail.com>
References: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:52188 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750777Ab0FWAuz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 22 Jun 2010 20:50:55 -0400
Received: by gye5 with SMTP id 5so3344808gye.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Jun 2010 17:50:54 -0700 (PDT)
In-Reply-To: <AANLkTinGwWzIAOe2tj6V2kCrMiPT7PHlYs1kFS-IsiN4@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Jun 23, 2010 at 7:27 AM, Kyungmin Park <kmpark@infradead.org> w=
rote:
> To Ben,
>
> I really need single kernel for s5pc110 (cortex A8) and s5pc210
> (cortex A9) at least.
> Fortunately arm move to these approaches recently. but current Samsun=
g
> SoCs not prepare these one.
>
> So I wonder do you have a plan or how to address these issues?
> How to assign the address at resources and use it at runtime?
>
> Personally I want to use cpu_is_*. but you reject it to use.
> Other way is that we can create the base address variables and assign
> it at init time.
>
> Please give your opinions.
>
> Thank you,
> Kyungmin Park
>
> e.g., cpu_is_* usage at OMAP tree
>
> static void omap_init_mcspi(void)
> {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap44xx())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap4_mcspi_fi=
xup();
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi1);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_device_register(&omap2_mcspi2);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap2430() || cpu_is_omap343x()=
 || cpu_is_omap44xx())
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi3_i=
nit();
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu_is_omap343x() || cpu_is_omap44xx()=
)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0omap2_mcspi4_i=
nit();
> }

Just my two cents: cpu_is_*() can be used, but only when absolutely nec=
essary.
The s3c does a CPU detection at startup, so I guess the usage of cpu_is=
_*()
can be even reduced.

I'm not sure if the above case is a good reference or not. The omap_ini=
t_mcspi
is called from omap2_init_devices(), while the registration can actuall=
y be
made into the board init code when that device is used (some of the McS=
PIs are
not used, and it's not necessary to register them), and the differences=
 be
handled in the driver.

>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
