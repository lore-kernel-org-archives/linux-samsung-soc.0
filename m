From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 7/10] ARM: S5PV210: Fix wrong EPLL rate getting on setup clocks
Date: Fri, 8 Oct 2010 19:55:27 +0900
Message-ID: <AANLkTim4epO5cmoGw9ub1ERgHxruvoC+dFLP=k6aYms9@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286193919-19830-1-git-send-email-sw.youn@samsung.com>
	<001e01cb66d4$c178a400$4469ec00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:43448 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755189Ab0JHKz3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:55:29 -0400
Received: by wyb28 with SMTP id 28so961311wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2010 03:55:28 -0700 (PDT)
In-Reply-To: <001e01cb66d4$c178a400$4469ec00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

On Fri, Oct 8, 2010 at 7:37 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Seungwhan Youn wrote:
>>
>> This patch fix wrong EPLL getting on setup clocks on S5PV210.
>>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv210/clock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
>> =C2=A0arch/arm/mach-s5pv210/include/mach/regs-clock.h | =C2=A0 =C2=A0=
3 ++-
>> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/c=
lock.c
>> index 3f3b7ba..bcbe7e9 100644
>> --- a/arch/arm/mach-s5pv210/clock.c
>> +++ b/arch/arm/mach-s5pv210/clock.c
>> @@ -1040,7 +1040,8 @@ void __init_or_cpufreq s5pv210_setup_clocks(vo=
id)
>>
>> =C2=A0 =C2=A0 =C2=A0 apll =3D s5p_get_pll45xx(xtal, __raw_readl(S5P_=
APLL_CON), pll_4508);
>> =C2=A0 =C2=A0 =C2=A0 mpll =3D s5p_get_pll45xx(xtal, __raw_readl(S5P_=
MPLL_CON), pll_4502);
>> - =C2=A0 =C2=A0 epll =3D s5p_get_pll45xx(xtal, __raw_readl(S5P_EPLL_=
CON), pll_4500);
>> + =C2=A0 =C2=A0 epll =3D s5p_get_pll90xx(xtal, __raw_readl(S5P_EPLL_=
CON0),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_readl(S5P_EPLL_CON1));
>
> Maybe you wanted to implement fractional PLL 4600B...not used 90xx in=
 there.
> So need to update plat/pll.h to epll of s5pv210.
>

Okay, I'll fix it and add PLL_4600B also.

Thanks,
Claude
