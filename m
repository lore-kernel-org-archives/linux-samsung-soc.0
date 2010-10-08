From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 8/10] ARM: S5PV210: Add EPLL clock operations
Date: Fri, 8 Oct 2010 19:53:42 +0900
Message-ID: <AANLkTinVMMyM6kgwbwN+iRiuyyp6r55P-XLRDeXuPgM4@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194060-19860-1-git-send-email-sw.youn@samsung.com>
	<001d01cb66d3$c7799e00$566cda00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:42473 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757234Ab0JHKxn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Oct 2010 06:53:43 -0400
Received: by wwj40 with SMTP id 40so1023405wwj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2010 03:53:42 -0700 (PDT)
In-Reply-To: <001d01cb66d3$c7799e00$566cda00$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

On Fri, Oct 8, 2010 at 7:29 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> Seungwhan Youn wrote:
>>
>> This patch adds EPLL specific clock get_rate/set_rate operations
>> on S5PV210.
>>
>> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv210/clock.c =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 95
>> ++++++++++++++++++++++++++++++++++
>> =C2=A0arch/arm/plat-s5p/include/plat/pll.h | =C2=A0 =C2=A02 +
>> =C2=A02 files changed, 97 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/c=
lock.c
>> index bcbe7e9..affa5a0 100644
>> --- a/arch/arm/mach-s5pv210/clock.c
>> +++ b/arch/arm/mach-s5pv210/clock.c
>> @@ -1003,6 +1003,97 @@ static struct clksrc_clk *sysclks[] =3D {
>> =C2=A0 =C2=A0 =C2=A0 &clk_sclk_spdif,
>> =C2=A0};
>>
>> +static int s5pv210_epll_enable(struct clk *clk, int enable)
>> +{
>> + =C2=A0 =C2=A0 unsigned int ctrlbit =3D clk->ctrlbit;
>> + =C2=A0 =C2=A0 unsigned int epll_con =3D __raw_readl(S5P_EPLL_CON0)=
 & ~ctrlbit;
>> +
>> + =C2=A0 =C2=A0 if (enable)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(epll_con | =
ctrlbit, S5P_EPLL_CON0);
>> + =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(epll_con, S=
5P_EPLL_CON0);
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>
> Maybe if we move s5p64x0_epll_enable() to common part i.e.,
> plat-s5p/clock.c, we can use common_epll_enable() in here.
> Of course, need to sort out the regarding definitions such as
> S5PXX_EPLL_CON0...
>

Okay, I'll fix.

>> +static unsigned long s5pv210_epll_get_rate(struct clk *clk)
>> +{
>> + =C2=A0 =C2=A0 return clk->rate;
>> +}
>> +
>> +static u32 epll_div[][6] =3D {
>> + =C2=A0 =C2=A0 { =C2=A048000000, 0, 48, 3, 3, 0 },
>> + =C2=A0 =C2=A0 { =C2=A096000000, 0, 48, 3, 2, 0 },
>> + =C2=A0 =C2=A0 { 144000000, 1, 72, 3, 2, 0 },
>> + =C2=A0 =C2=A0 { 192000000, 0, 48, 3, 1, 0 },
>> + =C2=A0 =C2=A0 { 288000000, 1, 72, 3, 1, 0 },
>> + =C2=A0 =C2=A0 { =C2=A032750000, 1, 65, 3, 4, 35127 },
>> + =C2=A0 =C2=A0 { =C2=A032768000, 1, 65, 3, 4, 35127 },
>> + =C2=A0 =C2=A0 { =C2=A045158400, 0, 45, 3, 3, 10355 },
>> + =C2=A0 =C2=A0 { =C2=A045000000, 0, 45, 3, 3, 10355 },
>> + =C2=A0 =C2=A0 { =C2=A045158000, 0, 45, 3, 3, 10355 },
>> + =C2=A0 =C2=A0 { =C2=A049125000, 0, 49, 3, 3, 9961 },
>> + =C2=A0 =C2=A0 { =C2=A049152000, 0, 49, 3, 3, 9961 },
>> + =C2=A0 =C2=A0 { =C2=A067737600, 1, 67, 3, 3, 48366 },
>> + =C2=A0 =C2=A0 { =C2=A067738000, 1, 67, 3, 3, 48366 },
>> + =C2=A0 =C2=A0 { =C2=A073800000, 1, 73, 3, 3, 47710 },
>> + =C2=A0 =C2=A0 { =C2=A073728000, 1, 73, 3, 3, 47710 },
>> + =C2=A0 =C2=A0 { =C2=A036000000, 1, 32, 3, 4, 0 },
>> + =C2=A0 =C2=A0 { =C2=A060000000, 1, 60, 3, 3, 0 },
>> + =C2=A0 =C2=A0 { =C2=A072000000, 1, 72, 3, 3, 0 },
>> + =C2=A0 =C2=A0 { =C2=A080000000, 1, 80, 3, 3, 0 },
>> + =C2=A0 =C2=A0 { =C2=A084000000, 0, 42, 3, 2, 0 },
>> + =C2=A0 =C2=A0 { =C2=A050000000, 0, 50, 3, 3, 0 },
>> +};
>> +
>> +static int s5pv210_epll_set_rate(struct clk *clk, unsigned long rat=
e)
>> +{
>> + =C2=A0 =C2=A0 unsigned int epll_con, epll_con_k;
>> + =C2=A0 =C2=A0 unsigned int i;
>> +
>> + =C2=A0 =C2=A0 /* Return if nothing changed */
>> + =C2=A0 =C2=A0 if (clk->rate =3D=3D rate)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>> +
>> + =C2=A0 =C2=A0 epll_con =3D __raw_readl(S5P_EPLL_CON0);
>> + =C2=A0 =C2=A0 epll_con_k =3D __raw_readl(S5P_EPLL_CON1);
>> +
>> + =C2=A0 =C2=A0 epll_con_k &=3D ~(PLL90XX_KDIV_MASK << PLL90XX_KDIV_=
SHIFT);
>> + =C2=A0 =C2=A0 epll_con &=3D ~(PLL90XX_VSEL_MASK << PLL90XX_VSEL_SH=
IFT |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PLL90XX_MDIV_MASK << PLL90XX_MDIV_SHIFT |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PLL90XX_PDIV_MASK << PLL90XX_PDIV_SHIFT |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 PLL90XX_SDIV_MASK << PLL90XX_SDIV_SHIFT);
>> +
>> + =C2=A0 =C2=A0 for (i =3D 0; i < ARRAY_SIZE(epll_div); i++) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (epll_div[i][0] =3D=3D=
 rate) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 epll_con_k |=3D epll_div[i][5] << 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 epll_con |=3D (epll_div[i][1] << PLL90XX_VSEL_SHIFT |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 epll_div[i]=
[2] <<
>> PLL90XX_MDIV_SHIFT |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 epll_div[i]=
[3] <<
>> PLL90XX_PDIV_SHIFT |
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 epll_div[i]=
[4] <<
>> PLL90XX_SDIV_SHIFT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 if (i =3D=3D ARRAY_SIZE(epll_div)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%s: Inv=
alid Clock EPLL Frequency\n",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 __raw_writel(epll_con, S5P_EPLL_CON0);
>> + =C2=A0 =C2=A0 __raw_writel(epll_con_k, S5P_EPLL_CON1);
>> +
>> + =C2=A0 =C2=A0 clk->rate =3D rate;
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>
> Same...

This also, I'll fix it.

(snip)

Thanks,
Claude
