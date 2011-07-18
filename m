From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS4: Add EPLL clock operations
Date: Mon, 18 Jul 2011 17:14:01 +0530
Message-ID: <CAHfPSqAivKxNg6xKCeEaitYUG5yB-Gk6rr4ijs-f=wZ_0ykCPg@mail.gmail.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
 <1308655463-8787-4-git-send-email-ch.naveen@samsung.com> <048501cc450e$d4d7e880$7e87b980$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:59342 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756514Ab1GRLoV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 07:44:21 -0400
Received: by iwn6 with SMTP id 6so3006491iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jul 2011 04:44:21 -0700 (PDT)
In-Reply-To: <048501cc450e$d4d7e880$7e87b980$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Every one,

On 18 July 2011 11:22, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Naveen Krishna Chatradhi wrote:
>>
>> S5PV210 and EXYNOS4 uses similar PLL(PLL46XX) for EPLL.
>> So, The EPLL set rate function is duplicated.
>>
>> Note: Moved common code to plat-s5p, as commented by Kukjin Kim.
>>
> Since if you want to keep this in git log, this should be moved after=
 below
> '---' :(
Thanks for pointing.
>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0| =A0 =A01 +
>> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0| =A0 78
> +---------------------------------
>> =A0arch/arm/plat-s5p/clock.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 77
>> +++++++++++++++++++++++++++++++++
>> =A0arch/arm/plat-s5p/include/plat/pll.h | =A0 =A03 +
>> =A04 files changed, 82 insertions(+), 77 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/c=
lock.c
>> index feeb27e..7687087 100644
>> --- a/arch/arm/mach-exynos4/clock.c
>> +++ b/arch/arm/mach-exynos4/clock.c
>> @@ -1294,6 +1294,7 @@ void __init_or_cpufreq exynos4_setup_clocks(vo=
id)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_re=
adl(S5P_VPLL_CON1), pll_4650);
>>
>> =A0 =A0 =A0 clk_fout_apll.ops =3D &exynos4_fout_apll_ops;
>> + =A0 =A0 clk_fout_epll.ops =3D &pll46xx_epll_ops;
>> =A0 =A0 =A0 clk_fout_mpll.rate =3D mpll;
>> =A0 =A0 =A0 clk_fout_epll.rate =3D epll;
>> =A0 =A0 =A0 clk_fout_vpll.rate =3D vpll;
>> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/c=
lock.c
>> index ae72f87..dd77c2c 100644
>> --- a/arch/arm/mach-s5pv210/clock.c
>> +++ b/arch/arm/mach-s5pv210/clock.c
>> @@ -979,82 +979,6 @@ static struct clksrc_clk *sysclks[] =3D {
>> =A0 =A0 =A0 &clk_sclk_spdif,
>> =A0};
>>
>> -static u32 epll_div[][6] =3D {
>> - =A0 =A0 { =A048000000, 0, 48, 3, 3, 0 },
>> - =A0 =A0 { =A096000000, 0, 48, 3, 2, 0 },
>> - =A0 =A0 { 144000000, 1, 72, 3, 2, 0 },
>> - =A0 =A0 { 192000000, 0, 48, 3, 1, 0 },
>> - =A0 =A0 { 288000000, 1, 72, 3, 1, 0 },
>> - =A0 =A0 { =A032750000, 1, 65, 3, 4, 35127 },
>> - =A0 =A0 { =A032768000, 1, 65, 3, 4, 35127 },
>> - =A0 =A0 { =A045158400, 0, 45, 3, 3, 10355 },
>> - =A0 =A0 { =A045000000, 0, 45, 3, 3, 10355 },
>> - =A0 =A0 { =A045158000, 0, 45, 3, 3, 10355 },
>> - =A0 =A0 { =A049125000, 0, 49, 3, 3, 9961 },
>> - =A0 =A0 { =A049152000, 0, 49, 3, 3, 9961 },
>> - =A0 =A0 { =A067737600, 1, 67, 3, 3, 48366 },
>> - =A0 =A0 { =A067738000, 1, 67, 3, 3, 48366 },
>> - =A0 =A0 { =A073800000, 1, 73, 3, 3, 47710 },
>> - =A0 =A0 { =A073728000, 1, 73, 3, 3, 47710 },
>> - =A0 =A0 { =A036000000, 1, 32, 3, 4, 0 },
>> - =A0 =A0 { =A060000000, 1, 60, 3, 3, 0 },
>> - =A0 =A0 { =A072000000, 1, 72, 3, 3, 0 },
>> - =A0 =A0 { =A080000000, 1, 80, 3, 3, 0 },
>> - =A0 =A0 { =A084000000, 0, 42, 3, 2, 0 },
>> - =A0 =A0 { =A050000000, 0, 50, 3, 3, 0 },
>> -};
>> -
>> -static int s5pv210_epll_set_rate(struct clk *clk, unsigned long rat=
e)
>> -{
>> - =A0 =A0 unsigned int epll_con, epll_con_k;
>> - =A0 =A0 unsigned int i;
>> -
>> - =A0 =A0 /* Return if nothing changed */
>> - =A0 =A0 if (clk->rate =3D=3D rate)
>> - =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> -
>> - =A0 =A0 epll_con =3D __raw_readl(S5P_EPLL_CON);
>> - =A0 =A0 epll_con_k =3D __raw_readl(S5P_EPLL_CON1);
>> -
>> - =A0 =A0 epll_con_k &=3D ~PLL46XX_KDIV_MASK;
>> - =A0 =A0 epll_con &=3D ~(1 << 27 |
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PLL46XX_MDIV_MASK << PLL46=
XX_MDIV_SHIFT |
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PLL46XX_PDIV_MASK << PLL46=
XX_PDIV_SHIFT |
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PLL46XX_SDIV_MASK << PLL46=
XX_SDIV_SHIFT);
>> -
>> - =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(epll_div); i++) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 if (epll_div[i][0] =3D=3D rate) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 epll_con_k |=3D epll_div[i=
][5] << 0;
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 epll_con |=3D (epll_div[i]=
[1] << 27 |
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 epll_div[i][2] <<
>> PLL46XX_MDIV_SHIFT |
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 epll_div[i][3] <<
>> PLL46XX_PDIV_SHIFT |
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 epll_div[i][4] <<
>> PLL46XX_SDIV_SHIFT);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> - =A0 =A0 =A0 =A0 =A0 =A0 }
>> - =A0 =A0 }
>> -
>> - =A0 =A0 if (i =3D=3D ARRAY_SIZE(epll_div)) {
>> - =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: Invalid Clock EPLL Fr=
equency\n",
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__);
>> - =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> - =A0 =A0 }
>> -
>> - =A0 =A0 __raw_writel(epll_con, S5P_EPLL_CON);
>> - =A0 =A0 __raw_writel(epll_con_k, S5P_EPLL_CON1);
>> -
>> - =A0 =A0 printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk->rate, rate);
>> -
>> - =A0 =A0 clk->rate =3D rate;
>> -
>> - =A0 =A0 return 0;
>> -}
>> -
>> -static struct clk_ops s5pv210_epll_ops =3D {
>> - =A0 =A0 .set_rate =3D s5pv210_epll_set_rate,
>> - =A0 =A0 .get_rate =3D s5p_epll_get_rate,
>> -};
>> -
>> =A0void __init_or_cpufreq s5pv210_setup_clocks(void)
>> =A0{
>> =A0 =A0 =A0 struct clk *xtal_clk;
>> @@ -1075,7 +999,7 @@ void __init_or_cpufreq s5pv210_setup_clocks(voi=
d)
>>
>> =A0 =A0 =A0 /* Set functions for clk_fout_epll */
>> =A0 =A0 =A0 clk_fout_epll.enable =3D s5p_epll_enable;
>> - =A0 =A0 clk_fout_epll.ops =3D &s5pv210_epll_ops;
>> + =A0 =A0 clk_fout_epll.ops =3D &pll46xx_epll_ops;
>>
>> =A0 =A0 =A0 printk(KERN_DEBUG "%s: registering clocks\n", __func__);
>>
>> diff --git a/arch/arm/plat-s5p/clock.c b/arch/arm/plat-s5p/clock.c
>> index 02af235..2a4678d 100644
>> --- a/arch/arm/plat-s5p/clock.c
>> +++ b/arch/arm/plat-s5p/clock.c
>> @@ -24,6 +24,7 @@
>> =A0#include <mach/regs-clock.h>
>>
>> =A0#include <plat/clock.h>
>> +#include <plat/pll.h>
>> =A0#include <plat/clock-clksrc.h>
>> =A0#include <plat/s5p-clock.h>
>>
>> @@ -203,6 +204,82 @@ struct clk_ops s5p_sclk_spdif_ops =3D {
>> =A0 =A0 =A0 .get_rate =A0 =A0 =A0 =3D s5p_spdif_get_rate,
>> =A0};
>>
>> +static u32 epll_div[][6] =3D {
>> + =A0 =A0 { =A048000000, 0, 48, 3, 3, 0 },
>> + =A0 =A0 { =A096000000, 0, 48, 3, 2, 0 },
>> + =A0 =A0 { 144000000, 1, 72, 3, 2, 0 },
>> + =A0 =A0 { 192000000, 0, 48, 3, 1, 0 },
>> + =A0 =A0 { 288000000, 1, 72, 3, 1, 0 },
>> + =A0 =A0 { =A032750000, 1, 65, 3, 4, 35127 },
>> + =A0 =A0 { =A032768000, 1, 65, 3, 4, 35127 },
>> + =A0 =A0 { =A045158400, 0, 45, 3, 3, 10355 },
>> + =A0 =A0 { =A045000000, 0, 45, 3, 3, 10355 },
>> + =A0 =A0 { =A045158000, 0, 45, 3, 3, 10355 },
>> + =A0 =A0 { =A049125000, 0, 49, 3, 3, 9961 },
>> + =A0 =A0 { =A049152000, 0, 49, 3, 3, 9961 },
>> + =A0 =A0 { =A067737600, 1, 67, 3, 3, 48366 },
>> + =A0 =A0 { =A067738000, 1, 67, 3, 3, 48366 },
>> + =A0 =A0 { =A073800000, 1, 73, 3, 3, 47710 },
>> + =A0 =A0 { =A073728000, 1, 73, 3, 3, 47710 },
>> + =A0 =A0 { =A036000000, 1, 32, 3, 4, 0 },
>> + =A0 =A0 { =A060000000, 1, 60, 3, 3, 0 },
>> + =A0 =A0 { =A072000000, 1, 72, 3, 3, 0 },
>> + =A0 =A0 { =A080000000, 1, 80, 3, 3, 0 },
>> + =A0 =A0 { =A084000000, 0, 42, 3, 2, 0 },
>> + =A0 =A0 { =A050000000, 0, 50, 3, 3, 0 },
>> +};
>
> Hmm, ok for now. But as Seungwhan Youn said, you have to know it can =
be
> changed according to input clock for EPLL when you add this into comm=
on
> plat-s5p.

As mentioned earlier, I've not found any generic formula for using
across boards.
So, I dropped the plan for moving it to plat-s5p for all boards.

This patch only applies only for S5PV210 and EXYNOS4,
The epll_div values are same  as per the latest User Manuals for
S5PV210 and EXYNOS4.

Sorry for the mess, attaching a patch for RFC have caused.
>
>> +
>> +int pll46xx_epll_set_rate(struct clk *clk, unsigned long rate)
>
> How about to move this in plat-s5p/include/plat/pll.h like other pll =
helper
> functions?
Isn't it wrong for the helper functions to use raw_readl and
raw_writel functions ??
>
>> +{
>> + =A0 =A0 unsigned int epll_con, epll_con_k;
>> + =A0 =A0 unsigned int i;
>> +
>> + =A0 =A0 /* Return if nothing changed */
>> + =A0 =A0 if (clk->rate =3D=3D rate)
>> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> +
>> + =A0 =A0 epll_con =3D __raw_readl(S5P_EPLL_CON);
>> + =A0 =A0 epll_con_k =3D __raw_readl(S5P_EPLL_CON1);
>> +
>> + =A0 =A0 epll_con_k &=3D ~PLL46XX_KDIV_MASK;
>> + =A0 =A0 epll_con &=3D ~(1 << 27 |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PLL46XX_MDIV_MASK << PLL46=
XX_MDIV_SHIFT |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PLL46XX_PDIV_MASK << PLL46=
XX_PDIV_SHIFT |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 PLL46XX_SDIV_MASK << PLL46=
XX_SDIV_SHIFT);
>> +
>> + =A0 =A0 for (i =3D 0; i < ARRAY_SIZE(epll_div); i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (epll_div[i][0] =3D=3D rate) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 epll_con_k |=3D epll_div[i=
][5] << 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 epll_con |=3D (epll_div[i]=
[1] << 27 |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 epll_div[i][2] <<
>> PLL46XX_MDIV_SHIFT |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 epll_div[i][3] <<
>> PLL46XX_PDIV_SHIFT |
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 epll_div[i][4] <<
>> PLL46XX_SDIV_SHIFT);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +
>> + =A0 =A0 if (i =3D=3D ARRAY_SIZE(epll_div)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: Invalid Clock EPLL Fr=
equency\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __func__);
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 __raw_writel(epll_con, S5P_EPLL_CON);
>> + =A0 =A0 __raw_writel(epll_con_k, S5P_EPLL_CON1);
>
> Basically, need to add check of pll locking after changing PLL value.
Yes, i understand.
It was a simple code movement, Will apply locking in next version of pa=
tch set.
>
>> +
>> + =A0 =A0 printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk->rate, rate);
>> +
>> + =A0 =A0 clk->rate =3D rate;
>> +
>> + =A0 =A0 return 0;
>> +}
>> +
>> +struct clk_ops pll46xx_epll_ops =3D {
>> + =A0 =A0 .set_rate =3D pll46xx_epll_set_rate,
>> + =A0 =A0 .get_rate =3D s5p_epll_get_rate,
>
> I'm not sure we need .get_rate here.
> Could you please test without this?
I've followed the legacy code, get_rate is never used,. yes will
remove in the next version.
>
>> +};
>> +
>> =A0static struct clk *s5p_clks[] __initdata =3D {
>> =A0 =A0 =A0 &clk_ext_xtal_mux,
>> =A0 =A0 =A0 &clk_48m,
>> diff --git a/arch/arm/plat-s5p/include/plat/pll.h
> b/arch/arm/plat-s5p/include/plat/pll.h
>> index bf28fad..911a20e 100644
>> --- a/arch/arm/plat-s5p/include/plat/pll.h
>> +++ b/arch/arm/plat-s5p/include/plat/pll.h
>> @@ -94,6 +94,9 @@ static inline unsigned long s5p_get_pll46xx(unsign=
ed
> long
>> baseclk,
>> =A0 =A0 =A0 return result;
>> =A0}
>>
>> +extern int pll46xx_epll_set_rate(struct clk *clk, unsigned long rat=
e);
>> +extern struct clk_ops pll46xx_epll_ops;
>> +
>> =A0#define PLL90XX_MDIV_MASK =A0 =A0(0xFF)
>> =A0#define PLL90XX_PDIV_MASK =A0 =A0(0x3F)
>> =A0#define PLL90XX_SDIV_MASK =A0 =A0(0x7)
>> --
>> 1.7.2.3
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Shine bright,
(: Nav :)
