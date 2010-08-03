From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v3] ARM: Samsung SoC: clksrc-clk: wait for the stable
	SRC/DIV status.
Date: Tue, 3 Aug 2010 18:29:34 +0900
Message-ID: <AANLkTi=eQgMyYe-kWQ3FefuRU4CWJe6A=4J04pqmPZHR@mail.gmail.com>
References: <1280717476-32327-1-git-send-email-myungjoo.ham@samsung.com>
	<003001cb3203$ce869bd0$6b93d370$%kim@samsung.com>
	<AANLkTikCRMaRVj4tvBSS0RTTwYF_GKuGSqZBG3+_j-kd@mail.gmail.com>
	<00e301cb32a1$9e57aaa0$db06ffe0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:43704 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754585Ab0HCJ3f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Aug 2010 05:29:35 -0400
Received: by yxg6 with SMTP id 6so1530724yxg.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Aug 2010 02:29:34 -0700 (PDT)
In-Reply-To: <00e301cb32a1$9e57aaa0$db06ffe0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org

On Tue, Aug 3, 2010 at 9:19 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> MyungJoo Ham wrote:
>>
>> On Mon, Aug 2, 2010 at 2:30 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
>> > MyungJoo Ham wrote:
>> >>
>> >> Many MUX and clock dividers have a status bit so that users can w=
ait
>> >> until the status is stable. When corresponding registers are acce=
ssed
>> >> while a clock is not stable, we may suffer from unexpected errors=
=2E
>> >>
>> >> Therefore, we introduce a mechanism to let the operations related=
 with
>> >> updating SRC/DIV registers of clksrc-clk wait for the stabilizati=
on:
>> >> clk_set_parent, clk_set_rate.
>> >>
>> >> In order to use this feature, the definition of clksrc_clk should
>> >> include reg_src_stable or reg_div_stable. With effective rec_src_=
stable
>> >> values, clk_set_parent returns with a stabilized SRC register and
>> >> with effective rec_div_stable values, clk_set_rate returns with a
>> >> stabilized DIV register. If .reg field is null, its (either SRC o=
r DIV)
>> >> register's status is not checked and returned without waiting; i.=
e.,
>> >> some MUX/DIV may not need this feature.
>> >>
>> >> When setting reg_*_stable, .size is used to tell the value of "st=
able".
>> >> If .size =3D 0, the stable status is 0 and if .size =3D 1, the st=
able status
>> >> is 1.
>> >>
>> >> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> >> --
>> >> v2:
>> >> =C2=A0 =C2=A0 =C2=A0 - Wait-for-stable loop is described at an in=
line function.
>> >> v3:
>> >> =C2=A0 =C2=A0 =C2=A0 - Stop using clksrc_reg for stable bits. Use=
 "clkstat_reg" for
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 them.
>> >>
>> >> ---
>> >> =C2=A0arch/arm/plat-samsung/clock-clksrc.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 +++++++++++++
>> >> =C2=A0arch/arm/plat-samsung/include/plat/clock-clksrc.h | =C2=A0 =
22
>> >> +++++++++++++++++++++
>> >> =C2=A02 files changed, 36 insertions(+), 0 deletions(-)
>> >>
>> >> diff --git a/arch/arm/plat-samsung/clock-clksrc.c
>> > b/arch/arm/plat-samsung/clock-
>> >> clksrc.c
>> >> index 46d204a..79ae92e 100644
>> >> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> >> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> >> @@ -50,6 +50,15 @@ static unsigned long s3c_getrate_clksrc(struct=
 clk
>> > *clk)
>> >> =C2=A0 =C2=A0 =C2=A0 return rate;
>> >> =C2=A0}
>> >>
>> >> +static inline void s3c_wait_for_stable(struct clkstat_reg *stat)
>> >> +{
>> >> + =C2=A0 =C2=A0 WARN_ON(stat =3D=3D NULL);
>> >
>> > if (stat =3D=3D NULL)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>>
>> Because .reg_*_stable is included in struct clksrc_clk and
>> s3c_wait_for_stable is called by clk_set_parent and clk_set_rate,
>> which have struct clksrc_clk, stat is unlikely to be NULL and if it'=
s
>> NULL, s3c_wait_for_stable is called from a wrong function and wrong
>> context; thus, I'd use WARN for it rather than silently doing return=
=2E
>>
> I don't think that need warning to it, because it is not wrong being =
NULL.

In this context (caller: s3c_setrate_clksrc, s3c_setparent_clksrc /
callee: s3c_wait_for_stable), it cannot be NULL as long as the callers
are these two. If it's NULL, it means that the function,
s3c_wait_for_stable, is called by someone who's not supposed to call.
In these two callers, &sclk->reg_xxx_stable cannot be NULL as long as
clk is not NULL and if clk is NULL, the thread cannot successfully
reach there.

>
>> >
>> > If don't need to check status, have not become define relevant sta=
tus
>> > register.
>> >
>> >> + =C2=A0 =C2=A0 if (stat->reg) {
>> >
>> > No need?...or need to check stat->reg and stat->shift?
>>
>> If stat->reg is NULL (it can be intentionally NULL), it means that t=
he
>> corresponding struct clksrc_clk does not have stable-stat bit; thus,
>> pass this checking routine. And, stat->shift may be both 0 and
>> positive effectively.
>>
>> stat->reg =3D 0 : NO STAT REGISTER
>> stat->reg !=3D 0 : STAT Register Exists. Use stat->shift to specify =
the
>> bit (stat->shift can be 0 or larger)
>>
> If stat !=3D NULL, I think that it does not need...because should bei=
ng reg.

When stat !=3D NULL, stat->reg may still be NULL intentionally as
mentioned in this paragraph because stat is not going to be NULL if
the owning clksrc_clk is present. Note that stat is a non-pointer
member of clksrc_clk.

>
>> >
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do { } while (((__raw=
_readl(stat->reg) >> stat->shift) & 1)
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D stat->stable);
>> >
>> > I'm still wondering we _really_ need 'stable'...just comments is e=
nough,
>> > right now.
>>
>> S5PV210 is fine without stable because stat->stable is always 0 for =
S5PV210.
>>
>
> Generally, the meaning of stable value may not change....frankly I'm =
not sure...
> but if change, then we can add that later...so right now, unnecessary=
 stuff like that does not need.
>
> Then...and no need to add 'struct clkstat_reg'

Yes, if the definition of stable value does not change, "stable" is
not needed and only shift and reg values are required.

>
>> However, this is for "Samsung-SoC" not for "S5PV210" although only
>> S5PV210 uses this feature for now.
>>
>> I've added stat->stable for the generality. Would it be better disca=
rd
>> such generality and assume that other Samsung-SoC systems will also
>> use the same stat bit scheme for every register (0 for stable, 1 for
>> changing for every STAT register) with S5PV210? If we can guarantee
>> such homogeneousity, getting rid of stable property would be perfect=
ly
>> fine. It is added just because I couldn't sure about Samsung-SoC chi=
ps
>> other than S5PV210. (and I thought some chips may use different sche=
me
>> for each register; e.g., some registers use 0 for stable, some other=
s
>> use 1 for stable)
>>
>> >
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do { } while (((__raw=
_readl(stat->reg) >> stat->shift) & 1)
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D stat->stable);
>> >
>> >> + =C2=A0 =C2=A0 }
>> >> +}
>> >> +
>> >> =C2=A0static int s3c_setrate_clksrc(struct clk *clk, unsigned lon=
g rate)
>> >> =C2=A0{
>> >> =C2=A0 =C2=A0 =C2=A0 struct clksrc_clk *sclk =3D to_clksrc(clk);
>> >> @@ -68,6 +77,8 @@ static int s3c_setrate_clksrc(struct clk *clk, =
unsigned
>> > long rate)
>> >> =C2=A0 =C2=A0 =C2=A0 val |=3D (div - 1) << sclk->reg_div.shift;
>> >> =C2=A0 =C2=A0 =C2=A0 __raw_writel(val, reg);
>> >>
>> >> + =C2=A0 =C2=A0 s3c_wait_for_stable(&sclk->reg_div_stable);
>> >> +
>> >> =C2=A0 =C2=A0 =C2=A0 return 0;
>> >> =C2=A0}
>> >>
>> >> @@ -93,6 +104,9 @@ static int s3c_setparent_clksrc(struct clk *cl=
k, struct
>> > clk
>> >> *parent)
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clksrc |=3D src_=
nr << sclk->reg_src.shift;
>> >>
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(clk=
src, sclk->reg_src.reg);
>> >> +
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_wait_for_stable(&=
sclk->reg_src_stable);
>> >> +
>> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> >> =C2=A0 =C2=A0 =C2=A0 }
>> >>
>> >> diff --git a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
>> > b/arch/arm/plat-
>> >> samsung/include/plat/clock-clksrc.h
>> >> index 50a8ca7..f1d54da 100644
>> >> --- a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
>> >> +++ b/arch/arm/plat-samsung/include/plat/clock-clksrc.h
>> >> @@ -40,11 +40,30 @@ struct clksrc_reg {
>> >> =C2=A0};
>> >>
>> >> =C2=A0/**
>> >> + * struct clkstat_reg - register definition for clock stat bits
>> >> + * @reg: pointer to the register in virtual memory.
>> >> + * @shift: the shift in bits to where the bitfield is.
>> >> + * @stable: the bit value of stable status.
>> >> + */
>> >> +struct clkstat_reg {
>> >> + =C2=A0 =C2=A0 void __iomem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*reg;
>> >> + =C2=A0 =C2=A0 unsigned short =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
shift;
>> >> + =C2=A0 =C2=A0 unsigned short =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
stable;
>> >
>> > If you want to use this, just 'value' is better.
>> > But...I think...we don't need this field now.
>> >
>> >> +};
>> >> +
>> >> +/**
>> >> =C2=A0 * struct clksrc_clk - class of clock for newer style samsu=
ng devices.
>> >> =C2=A0 * @clk: the standard clock representation
>> >> =C2=A0 * @sources: the sources for this clock
>> >> =C2=A0 * @reg_src: the register definition for selecting the cloc=
k's source
>> >> =C2=A0 * @reg_div: the register definition for the clock's output=
 divisor
>> >> + * @reg_src_stable: the register definition to probe if reg_src =
is
>> >> + * =C2=A0 =C2=A0stabilized after the update of reg_src. It is "s=
tabilized" if
>> >> + * =C2=A0 =C2=A0reg[shift] =3D=3D size. If reg =3D=3D NULL, this=
 stable reg is not looked
>> >> + * =C2=A0 =C2=A0up. Thus, in S5PV210, size is usually 0.
>> >> + * @reg_div_stable: the register definition to probe if reg_div =
is
>> >> + * =C2=A0 =C2=A0stabilized after the update of reg_div. Same mec=
hanism with
>> >> + * =C2=A0 =C2=A0reg_src_stable.
>> >> =C2=A0 *
>> >> =C2=A0 * This clock implements the features required by the newer=
 SoCs where
>> >> =C2=A0 * the standard clock block provides an input mux and a pos=
t-mux divisor
>> >> @@ -61,6 +80,9 @@ struct clksrc_clk {
>> >>
>> >> =C2=A0 =C2=A0 =C2=A0 struct clksrc_reg =C2=A0 =C2=A0 =C2=A0 reg_s=
rc;
>> >> =C2=A0 =C2=A0 =C2=A0 struct clksrc_reg =C2=A0 =C2=A0 =C2=A0 reg_d=
iv;
>> >> +
>> >> + =C2=A0 =C2=A0 struct clkstat_reg =C2=A0 =C2=A0 =C2=A0reg_src_st=
able;
>> >> + =C2=A0 =C2=A0 struct clkstat_reg =C2=A0 =C2=A0 =C2=A0reg_div_st=
able;
>> >> =C2=A0};
>> >>
>> >> =C2=A0/**
>> >> --
>> >
>> >
>
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
