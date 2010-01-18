From: Thomas Abraham <thomas.ab@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Add check to ensure that clksrc_clk does
	have multiple clock sources
Date: Mon, 18 Jan 2010 13:23:27 +0900
Message-ID: <84c135f51001172023u2ec6f3e9k3af591b2cfe7111a@mail.gmail.com>
References: <1263782404-30534-1-git-send-email-thomas.ab@samsung.com>
	 <20100118032133.GJ10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f172.google.com ([209.85.222.172]:36151 "EHLO
	mail-pz0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752207Ab0AREbE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 17 Jan 2010 23:31:04 -0500
Received: by pzk2 with SMTP id 2so399286pzk.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Jan 2010 20:31:00 -0800 (PST)
In-Reply-To: <20100118032133.GJ10014@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org

Hi Ben,

On Mon, Jan 18, 2010 at 12:21 PM, Ben Dooks <ben-linux@fluff.org> wrote=
:
> On Mon, Jan 18, 2010 at 11:40:04AM +0900, Thomas Abraham wrote:
>> This patch adds a additional check in s3c_set_clksrc function to ens=
ure
>> that the clksrc_clk does have a choice of multiple clock sources. In=
 addition
>> to this, a check is added to ensure that a parent is assigned to the=
 clksrc_clk
>> in case it does not have a choice of parent clocks.
>
> 'This patch' is redudnant in this case, so how about Add an additiona=
l check...

Ok. I will remove 'This patch' phrase from the description and resend t=
he patch.

>
> I assume as we're not getting a pile of s3c6410 reports that this isn=
't
> an urgent fix and that we can add this to the next-samsung series.

It is fine to add this to next-samsung. This patch is required for
V210 patch series.

>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>> =A0arch/arm/plat-samsung/clock-clksrc.c | =A0 13 +++++++++----
>> =A01 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-sa=
msung/clock-clksrc.c
>> index 33c633a..835921d 100644
>> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> @@ -129,11 +129,16 @@ void __init_or_cpufreq s3c_set_clksrc(struct c=
lksrc_clk *clk, bool announce)
>> =A0{
>> =A0 =A0 =A0 struct clksrc_sources *srcs =3D clk->sources;
>> =A0 =A0 =A0 u32 mask =3D bit_mask(clk->reg_src.shift, clk->reg_src.s=
ize);
>> - =A0 =A0 u32 clksrc =3D 0;
>> -
>> - =A0 =A0 if (clk->reg_src.reg)
>> - =A0 =A0 =A0 =A0 =A0 =A0 clksrc =3D __raw_readl(clk->reg_src.reg);
>> + =A0 =A0 u32 clksrc;
>>
>> + =A0 =A0 if (!clk->reg_src.reg) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!clk->clk.parent)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "%s: no par=
ent clock specified\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk->clk.n=
ame);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 clksrc =3D __raw_readl(clk->reg_src.reg);
>> =A0 =A0 =A0 clksrc &=3D mask;
>> =A0 =A0 =A0 clksrc >>=3D clk->reg_src.shift;
>>
>> --
>> 1.6.3.3
>>
>
>
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
