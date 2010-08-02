From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v2] ARM: Samsung SoC: clksrc-clk: wait for the stable
	SRC/DIV status.
Date: Mon, 2 Aug 2010 11:10:11 +0900
Message-ID: <AANLkTikM-mDn_PXCK1B=c531ZuxLSEeyfqTgJVkv2fWm@mail.gmail.com>
References: <1280379947-7362-1-git-send-email-myungjoo.ham@samsung.com>
	<000101cb3077$0272a3a0$0757eae0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44298 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab0HBCKM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 1 Aug 2010 22:10:12 -0400
Received: by iwn7 with SMTP id 7so3628180iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Aug 2010 19:10:11 -0700 (PDT)
In-Reply-To: <000101cb3077$0272a3a0$0757eae0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

On Sat, Jul 31, 2010 at 3:09 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> MyungJoo Ham wrote:
>>
>> Many MUX and clock dividers have a status bit so that users can wait
>> until the status is stable. When corresponding registers are accesse=
d
>> while a clock is not stable, we may suffer from unexpected errors.
>>
>> Therefore, we introduce a mechanism to let the operations related wi=
th
>> updating SRC/DIV registers of clksrc-clk wait for the stabilization:
>> clk_set_parent, clk_set_rate.
>>
>> In order to use this feature, the definition of clksrc_clk should
>> include reg_src_stable or reg_div_stable. With effective rec_src_sta=
ble
>> values, clk_set_parent returns with a stabilized SRC register and
>> with effective rec_div_stable values, clk_set_rate returns with a
>> stabilized DIV register. If .reg field is null, its (either SRC or D=
IV)
>> register's status is not checked and returned without waiting; i.e.,
>> some MUX/DIV may not need this feature.
>>
>> When setting reg_*_stable, .size is used to tell the value of "stabl=
e".
>> If .size =3D 0, the stable status is 0 and if .size =3D 1, the stabl=
e status
>> is 1.
>>
>> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> --
>> v2 changes:
>> =C2=A0 =C2=A0 =C2=A0 - Wait-for-stable loop is described at an inlin=
e function.
>>
>> ---
>> =C2=A0arch/arm/plat-samsung/clock-clksrc.c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13 +++++++++++++
>> =C2=A0arch/arm/plat-samsung/include/plat/clock-clksrc.h | =C2=A0 10 =
++++++++++
>> =C2=A02 files changed, 23 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock-clksrc.c
> b/arch/arm/plat-samsung/clock-
>> clksrc.c
>> index 46d204a..eeaf8f4 100644
>> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> @@ -50,6 +50,14 @@ static unsigned long s3c_getrate_clksrc(struct cl=
k
> *clk)
>> =C2=A0 =C2=A0 =C2=A0 return rate;
>> =C2=A0}
>>
>> +static inline void s3c_wait_for_stable(struct clksrc_reg *stable)
>> +{
>> + =C2=A0 =C2=A0 if (stable->reg) {
>
> if (stable =3D=3D NULL )
> return;

=46ine. I'll rewrite it as "if (stable && stable->reg)" or add
WARN_ON(stable =3D=3D NULL).

>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do { } while (((__raw_re=
adl(stable->reg) >> stable->shift) &
> 1)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D stable->size);
>
>> When setting reg_*_stable, .size is used to tell the value of "stabl=
e".
>> If .size =3D 0, the stable status is 0 and if .size =3D 1, the stabl=
e status
>> is 1.
>
> Really need stable->size and checking in while loop?
> Because the meaning of 'size' used number of bit...
> It can be confusing to us...later.

S5PV210's stat bits are "0 at stable". However, as I don't know
whether it's also true for other CPUs, I wanted to make it more
general. I'll add the following struct to make it more readable:

/**
 * struct clkstat_reg - register definition for clock stat bits
 * @reg: pointer to the register in virtual memory.
 * @shift: the shift in bits to where the bitfield is.
 * @stable: the bit value of stable status.
 */
struct clksstat_reg {
       void __iomem            *reg;
       unsigned short          shift;
       unsigned short          stable;
};


>
>> + =C2=A0 =C2=A0 }
>> +}
>> +
>> =C2=A0static int s3c_setrate_clksrc(struct clk *clk, unsigned long r=
ate)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 struct clksrc_clk *sclk =3D to_clksrc(clk);
>> @@ -68,6 +76,8 @@ static int s3c_setrate_clksrc(struct clk *clk, uns=
igned
> long rate)
>> =C2=A0 =C2=A0 =C2=A0 val |=3D (div - 1) << sclk->reg_div.shift;
>> =C2=A0 =C2=A0 =C2=A0 __raw_writel(val, reg);
>>
>> + =C2=A0 =C2=A0 s3c_wait_for_stable(&sclk->reg_div_stable);
>> +
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0}
>>
>> @@ -93,6 +103,9 @@ static int s3c_setparent_clksrc(struct clk *clk, =
struct
> clk
>> *parent)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clksrc |=3D src_nr =
<< sclk->reg_src.shift;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(clksrc=
, sclk->reg_src.reg);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_wait_for_stable(&scl=
k->reg_src_stable);
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0 =C2=A0 =C2=A0 }
>>
>> diff --git a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
> b/arch/arm/plat-
>> samsung/include/plat/clock-clksrc.h
>> index 50a8ca7..282821d 100644
>> --- a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
>> +++ b/arch/arm/plat-samsung/include/plat/clock-clksrc.h
>> @@ -45,6 +45,13 @@ struct clksrc_reg {
>> =C2=A0 * @sources: the sources for this clock
>> =C2=A0 * @reg_src: the register definition for selecting the clock's=
 source
>> =C2=A0 * @reg_div: the register definition for the clock's output di=
visor
>> + * @reg_src_stable: the register definition to probe if reg_src is
>> + * =C2=A0 =C2=A0stabilized after the update of reg_src. It is "stab=
ilized" if
>> + * =C2=A0 =C2=A0reg[shift] =3D=3D size. If reg =3D=3D NULL, this st=
able reg is not looked
>> + * =C2=A0 =C2=A0up. Thus, in S5PV210, size is usually 0.
>> + * @reg_div_stable: the register definition to probe if reg_div is
>> + * =C2=A0 =C2=A0stabilized after the update of reg_div. Same mechan=
ism with
>> + * =C2=A0 =C2=A0reg_src_stable.
>> =C2=A0 *
>> =C2=A0 * This clock implements the features required by the newer So=
Cs where
>> =C2=A0 * the standard clock block provides an input mux and a post-m=
ux divisor
>> @@ -61,6 +68,9 @@ struct clksrc_clk {
>>
>> =C2=A0 =C2=A0 =C2=A0 struct clksrc_reg =C2=A0 =C2=A0 =C2=A0 reg_src;
>> =C2=A0 =C2=A0 =C2=A0 struct clksrc_reg =C2=A0 =C2=A0 =C2=A0 reg_div;
>> +
>> + =C2=A0 =C2=A0 struct clksrc_reg =C2=A0 =C2=A0 =C2=A0 reg_src_stabl=
e;
>> + =C2=A0 =C2=A0 struct clksrc_reg =C2=A0 =C2=A0 =C2=A0 reg_div_stabl=
e;
>> =C2=A0};
>>
>> =C2=A0/**
>> --
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



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
