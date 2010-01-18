From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: s3c_set_clksrc returns for single parent
	clock.
Date: Mon, 18 Jan 2010 10:34:29 +0900
Message-ID: <84c135f51001171734l3f731217gbee1fb482fafbe1d@mail.gmail.com>
References: <1263775097-16062-1-git-send-email-thomas.ab@samsung.com>
	 <20100118011028.GC10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f182.google.com ([209.85.216.182]:54680 "EHLO
	mail-px0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751463Ab0ARBea convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 20:34:30 -0500
Received: by pxi12 with SMTP id 12so2892893pxi.33
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Jan 2010 17:34:29 -0800 (PST)
In-Reply-To: <20100118011028.GC10014@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi Ben,

On Mon, Jan 18, 2010 at 10:10 AM, Ben Dooks <ben-linux@fluff.org> wrote=
:
> On Mon, Jan 18, 2010 at 09:38:17AM +0900, Thomas Abraham wrote:
>> The function s3c_set_clksrc should return if the clksrc_clk clock ha=
s
>> only one possible parent clock.
>
> Does this actually relate to a real bug or is this something that you=
've
> come across whilst reading the code?

This is required in cases where a clock has a divider but no mux. In
s3c_register_clksrc function, after the default set of clock
operations are assigned, the parent clock set function s3c_set_clksrc
is called. For clocks that do not have mux, the call to s3c_set_clksrc
is incorrect.

>
> From arch/arm/plat-samnsung/clock-clksrc.c:
>
> =A0 181 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!clksr=
c->reg_div.reg)
> =A0 182 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0clksrc->clk.ops =3D &clksrc_ops_nodiv;
> =A0 183 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (!=
clksrc->reg_src.reg)
> =A0 184 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0clksrc->clk.ops =3D &clksrc_ops_nosrc;
> =A0 185 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 186 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0clksrc->clk.ops =3D &clksrc_ops;
>
> So we change the ops dependant on which register(s) we have availalbe=
=2E
>
>> Signed-of-by: =A0Thomas Abraham <thomas.ab@samsung.com>
>> ---
>> =A0arch/arm/plat-samsung/clock-clksrc.c | =A0 =A05 +++--
>> =A01 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-sa=
msung/clock-clksrc.c
>> index 33c633a..80da4c4 100644
>> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> @@ -131,9 +131,10 @@ void __init_or_cpufreq s3c_set_clksrc(struct cl=
ksrc_clk *clk, bool announce)
>> =A0 =A0 =A0 u32 mask =3D bit_mask(clk->reg_src.shift, clk->reg_src.s=
ize);
>> =A0 =A0 =A0 u32 clksrc =3D 0;
>>
>> - =A0 =A0 if (clk->reg_src.reg)
>> - =A0 =A0 =A0 =A0 =A0 =A0 clksrc =3D __raw_readl(clk->reg_src.reg);
>> + =A0 =A0 if (!clk->reg_src.reg)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>>
>> + =A0 =A0 clksrc =3D __raw_readl(clk->reg_src.reg);
>> =A0 =A0 =A0 clksrc &=3D mask;
>> =A0 =A0 =A0 clksrc >>=3D clk->reg_src.shift;
>>
>> --
>> 1.6.3.3
>>
>
> --
> --
> Ben
>
> Q: =A0 =A0 =A0What's a light-year?
> A: =A0 =A0 =A0One-third less calories than a regular year.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>


Thanks,
Thomas.
