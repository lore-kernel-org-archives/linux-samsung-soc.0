From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 2/5] ARM: EXYNOS4: Add sclk_spdif clocks
Date: Tue, 14 Jun 2011 12:01:41 +0530
Message-ID: <BANLkTi=OLyuB435xbV6yYsG1geMcSDeZig@mail.gmail.com>
References: <1307687667-9127-1-git-send-email-ch.naveen@samsung.com>
 <1307687667-9127-3-git-send-email-ch.naveen@samsung.com> <005701cc2a56$947a7870$bd6f6950$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:56546 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752856Ab1FNGcD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 02:32:03 -0400
Received: by qwk3 with SMTP id 3so2496904qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jun 2011 23:32:02 -0700 (PDT)
In-Reply-To: <005701cc2a56$947a7870$bd6f6950$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, broonie@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com, lrg@ti.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Kukjin,

On 14 June 2011 11:17, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> From: Naveen Krishna Chatradhi wrote:
>>
>> Add the sclk_spdif clock is of type 'struct clksrc_clk' clock.
>> Also, add clk_spdifcdclk clocks of type 'struct clk' clock.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/clock.c | =A0 70
>> +++++++++++++++++++++++++++++++++++++++++
>> =A01 files changed, 70 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/c=
lock.c
>> index 7aa4aef..57ca356 100644
>> --- a/arch/arm/mach-exynos4/clock.c
>> +++ b/arch/arm/mach-exynos4/clock.c
>> @@ -73,6 +73,11 @@ static struct clk clk_audiocdclk2 =3D {
>> =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 2,
>> =A0};
>>
>> +static struct clk clk_spdifcdclk =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "spdifcdclk",
>> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> +};
>
> Do we really need this?
This is to complete the clock structure.
>
> spdif_extclk? not spdifcdclk.
Sorry, my bad. Will change
>
>> +
>> =A0static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enab=
le)
>> =A0{
>> =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
>> @@ -592,6 +597,11 @@ static struct clk init_clocks_off[] =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_=
ip_peril_ctrl,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 21),
>> =A0 =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "spdif",
>> + =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_ip=
_peril_ctrl,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 26),
>> + =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "ac97",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_=
ip_peril_ctrl,
>> @@ -858,6 +868,65 @@ static struct clk init_clocks[] =3D {
>> =A0 =A0 =A0 }
>> =A0};
>>
>> +static int exynos4_spdif_set_rate(struct clk *clk, unsigned long ra=
te)
>> +{
>> + =A0 =A0 struct clk *pclk;
>> + =A0 =A0 int ret;
>> +
>> + =A0 =A0 pclk =3D clk_get_parent(clk);
>> + =A0 =A0 if (IS_ERR(pclk))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 ret =3D pclk->ops->set_rate(pclk, rate);
>> + =A0 =A0 clk_put(pclk);
>> +
>> + =A0 =A0 return ret;
>> +}
>> +
>> +static unsigned long exynos4_spdif_get_rate(struct clk *clk)
>> +{
>> + =A0 =A0 struct clk *pclk;
>> + =A0 =A0 int rate;
>> +
>> + =A0 =A0 pclk =3D clk_get_parent(clk);
>> + =A0 =A0 if (IS_ERR(pclk))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> +
>> + =A0 =A0 rate =3D pclk->ops->get_rate(clk);
>> + =A0 =A0 clk_put(pclk);
>> +
>> + =A0 =A0 return rate;
>> +}
>
> I think, we can move above into plat-s5p for common spdif with others=
=2E
Sure, Will move.
Note: It wont apply for S5P64X0 series.
>
>> +
>> +static struct clk_ops exynos4_sclk_spdif_ops =3D {
>> + =A0 =A0 .set_rate =A0 =A0 =A0 =3D exynos4_spdif_set_rate,
>> + =A0 =A0 .get_rate =A0 =A0 =A0 =3D exynos4_spdif_get_rate,
>> +};
>> +
>> +static struct clk *clkset_sclk_spdif_list[] =3D {
>> + =A0 =A0 [0] =3D &clk_sclk_audio0.clk,
>> + =A0 =A0 [1] =3D &clk_sclk_audio1.clk,
>> + =A0 =A0 [2] =3D &clk_sclk_audio2.clk,
>> + =A0 =A0 [3] =3D &clk_spdifcdclk,
>> +};
>> +
>> +static struct clksrc_sources clkset_sclk_spdif =3D {
>> + =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_sclk_spdif_list,
>> + =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_sclk_spdif_list)=
,
>> +};
>> +
>> +static struct clksrc_clk clk_sclk_spdif =3D {
>> + =A0 =A0 .clk =A0 =A0=3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_spdif"=
,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clksrc=
_mask_peril1_ctrl,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 8),
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ops =A0 =A0 =A0 =A0 =A0 =A0=3D &exynos4_s=
clk_spdif_ops,
>> + =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_sclk_spdif,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_PERIL1,=
 .shift =3D 8, .size =3D 2
> },
>> +};
>> +
>> =A0static struct clk *clkset_group_list[] =3D {
>> =A0 =A0 =A0 [0] =3D &clk_ext_xtal_mux,
>> =A0 =A0 =A0 [1] =3D &clk_xusbxti,
>> @@ -1274,6 +1343,7 @@ static struct clksrc_clk *sysclks[] =3D {
>> =A0 =A0 =A0 &clk_sclk_audio0,
>> =A0 =A0 =A0 &clk_sclk_audio1,
>> =A0 =A0 =A0 &clk_sclk_audio2,
>> + =A0 =A0 &clk_sclk_spdif,
>> =A0};
>>
>> =A0static u32 epll_div[][6] =3D {
>> --
>> 1.7.2.3
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
