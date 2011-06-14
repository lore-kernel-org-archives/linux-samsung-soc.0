From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 1/5] ARM: EXYNOS4: Add EPLL clock operations
Date: Tue, 14 Jun 2011 12:29:19 +0530
Message-ID: <BANLkTiku6dcTFTa8MVi_87dyyfQXPuMFcQ@mail.gmail.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
 <1307687667-9127-2-git-send-email-ch.naveen@samsung.com> <005601cc2a54$988a9460$c99fbd20$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:46081 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753827Ab1FNG7k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 02:59:40 -0400
Received: by qwk3 with SMTP id 3so2503675qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2011 23:59:39 -0700 (PDT)
In-Reply-To: <005601cc2a54$988a9460$c99fbd20$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

On 14 June 2011 11:03, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Naveen Krishna Chatradhi wrote:
>>
>> This patch adds EPLL specific clock get_rate/set_rate
>> operations on EXYNOS4.
>>
>> Note: Initial code from S5PV210
>> http://permalink.gmane.org/gmane.linux.alsa.devel/77519
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/clock.c | =A0 78
>> +++++++++++++++++++++++++++++++++++++++++
>> =A01 files changed, 78 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/c=
lock.c
>> index b1b93b9..7aa4aef 100644
>> --- a/arch/arm/mach-exynos4/clock.c
>> +++ b/arch/arm/mach-exynos4/clock.c
>> @@ -1276,6 +1276,82 @@ static struct clksrc_clk *sysclks[] =3D {
>> =A0 =A0 =A0 &clk_sclk_audio2,
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
>> +
>> +static int exynos4_epll_set_rate(struct clk *clk, unsigned long rat=
e)
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
>> +
>> + =A0 =A0 printk(KERN_WARNING "EPLL Rate changes from %lu to %lu\n",
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk->rate, rate);
>> +
>> + =A0 =A0 clk->rate =3D rate;
>> +
>> + =A0 =A0 return 0;
>> +}
>
> I think, this is same with S5PV210.
This is exactly similar to V210 as mentioned in the commit message.
>
> Would be better if this could be moved into plat-s5p/ with other set_=
pllXXX.
I'm preparing patch to move the epll_set_rate as common function
across s5p series.
Will send it soon.
>
>> +
>> +static struct clk_ops exynos4_epll_ops =3D {
>> + =A0 =A0 .set_rate =3D exynos4_epll_set_rate,
>> + =A0 =A0 .get_rate =3D s5p_epll_get_rate,
>> +};
>> +
>> =A0static int xtal_rate;
>>
>> =A0static unsigned long exynos4_fout_apll_get_rate(struct clk *clk)
>> @@ -1354,6 +1430,8 @@ void __init_or_cpufreq exynos4_setup_clocks(vo=
id)
>> =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_set_clksrc(&clksrcs[ptr], true);
>>
>> + =A0 =A0 clk_fout_epll.ops =3D &exynos4_epll_ops;
>> +
>> =A0 =A0 =A0 clk_audiocdclk0.rate =3D PCM_EXTCLK0;
>> =A0 =A0 =A0 clk_set_parent(&clk_sclk_audio0.clk, &clk_audiocdclk0);
>> =A0}
>> --
>
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
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Shine bright,
(: Nav :)
