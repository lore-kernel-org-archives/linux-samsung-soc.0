From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH] ARM: Samsung SoC: clksrc-clk: wait for the stable SRC/DIV
	status.
Date: Thu, 29 Jul 2010 14:07:07 +0900
Message-ID: <AANLkTikgOABkS0_Q48rmd37LZVe8kf_dHLP1CNF9xBBe@mail.gmail.com>
References: <1280287044-6645-1-git-send-email-myungjoo.ham@samsung.com>
	<4C50681B.8040306@simtec.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:42152 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750824Ab0G2FHI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 01:07:08 -0400
Received: by iwn7 with SMTP id 7so206179iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jul 2010 22:07:07 -0700 (PDT)
In-Reply-To: <4C50681B.8040306@simtec.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@simtec.co.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Jul 29, 2010 at 2:25 AM, Ben Dooks <ben@simtec.co.uk> wrote:
> On 28/07/10 04:17, MyungJoo Ham wrote:
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
>> ---
>> =C2=A0arch/arm/plat-samsung/clock-clksrc.c =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13 +++++++++++++
>> =C2=A0arch/arm/plat-samsung/include/plat/clock-clksrc.h | =C2=A0 10 =
++++++++++
>> =C2=A02 files changed, 23 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-sa=
msung/clock-clksrc.c
>> index 46d204a..5ff17ad 100644
>> --- a/arch/arm/plat-samsung/clock-clksrc.c
>> +++ b/arch/arm/plat-samsung/clock-clksrc.c
>> @@ -68,6 +68,12 @@ static int s3c_setrate_clksrc(struct clk *clk, un=
signed long rate)
>> =C2=A0 =C2=A0 =C2=A0 val |=3D (div - 1) << sclk->reg_div.shift;
>> =C2=A0 =C2=A0 =C2=A0 __raw_writel(val, reg);
>>
>> + =C2=A0 =C2=A0 if (sclk->reg_div_stable.reg) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do { } while (((__raw_re=
adl(sclk->reg_div_stable.reg) >>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sclk->reg_div_stable.shift) & 1)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D sclk->reg_div_stable.size);
>> + =C2=A0 =C2=A0 }
>> +
>> =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0}
>
> you could move the code for this out to a separate inlined function t=
o
> avoid it being here twice, and possibly make it flow better.
>

Ok. Inlining those is done with the v2 patch. Thanks.

>> @@ -93,6 +99,13 @@ static int s3c_setparent_clksrc(struct clk *clk, =
struct clk *parent)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clksrc |=3D src_nr =
<< sclk->reg_src.shift;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(clksrc=
, sclk->reg_src.reg);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sclk->reg_src_stable=
=2Ereg) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 do { } while (((__raw_readl(sclk->reg_src_stable.reg) >>
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 sclk->reg_src_stable.shift) & 1)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !=3D sclk->=
reg_src_stable.size);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0 =C2=A0 =C2=A0 }
>>
>> diff --git a/arch/arm/plat-samsung/include/plat/clock-clksrc.h b/arc=
h/arm/plat-samsung/include/plat/clock-clksrc.h
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
>
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
