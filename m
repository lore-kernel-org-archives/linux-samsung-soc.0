From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH v2 2/3] ARM: EXYNOS4: Add sclk_spdif clocks.
Date: Mon, 18 Jul 2011 16:55:01 +0530
Message-ID: <CAHfPSqAAmu+DMTuiT89TpQ7He-HVqBcA+HHpziG0CyviGrtd_g@mail.gmail.com>
References: <1308655463-8787-1-git-send-email-ch.naveen@samsung.com>
 <1308655463-8787-3-git-send-email-ch.naveen@samsung.com> <048301cc450c$37dc4b90$a794e2b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:34626 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752001Ab1GRLZV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 07:25:21 -0400
Received: by iwn6 with SMTP id 6so2994410iwn.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Jul 2011 04:25:21 -0700 (PDT)
In-Reply-To: <048301cc450c$37dc4b90$a794e2b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, jassisinghbrar@gmail.com, sbkim73@samsung.com, sw.youn@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Every one,

On 18 July 2011 11:03, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Naveen Krishna Chatradhi wrote:
>>
>> Add the sclk_spdif clock is of type 'struct clksrc_clk' clock.
>> Also, add clk_spdifextclk clocks of type 'struct clk' clock.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/clock.c | =A0 35
>> +++++++++++++++++++++++++++++++++++
>> =A01 files changed, 35 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/clock.c b/arch/arm/mach-exynos4/c=
lock.c
>> index 937335a..feeb27e 100644
>> --- a/arch/arm/mach-exynos4/clock.c
>> +++ b/arch/arm/mach-exynos4/clock.c
>> @@ -64,6 +64,11 @@ static struct clk clk_audiocdclk2 =3D {
>> =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "audiocdclk",
>> =A0};
>>
>> +static struct clk clk_spdifextclk =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "spdif_extclk",
>> + =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> +};
>> +
>> =A0static int exynos4_clksrc_mask_top_ctrl(struct clk *clk, int enab=
le)
>> =A0{
>> =A0 =A0 =A0 return s5p_gatectrl(S5P_CLKSRC_MASK_TOP, clk, enable);
>> @@ -550,6 +555,11 @@ static struct clk init_clocks_off[] =3D {
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
>
> Need to re-work based on clkdev :)
Sure, will rebase on updated for-next branch.
>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "ac97",
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D exynos4_clk_=
ip_peril_ctrl,
>> @@ -801,6 +811,30 @@ static struct clk init_clocks[] =3D {
>> =A0 =A0 =A0 }
>> =A0};
>>
>> +static struct clk *clkset_sclk_spdif_list[] =3D {
>> + =A0 =A0 [0] =3D &clk_sclk_audio0.clk,
>> + =A0 =A0 [1] =3D &clk_sclk_audio1.clk,
>> + =A0 =A0 [2] =3D &clk_sclk_audio2.clk,
>> + =A0 =A0 [3] =3D &clk_spdifextclk,
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
>> + =A0 =A0 =A0 =A0 =A0 =A0 .ops =A0 =A0 =A0 =A0 =A0 =A0=3D &s5p_sclk_=
spdif_ops,
>> + =A0 =A0 },
>> + =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_sclk_spdif,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLKSRC_PERIL1,=
 .shift =3D 8, .size =3D 2
> },
>> +};
>
> Hmm...is it possible to move this into struct clksrc_clk clksrcs[] ?
When i try to move it under struct clksrc_clk clksrcs[], I encountered
a problem with .ops field
The sample code as follows (I'm not sure if i can copy paste the code f=
or RFC)

+static struct clk *clkset_sclk_spdif_list[] =3D {
+       [0] =3D &clk_sclk_audio0.clk,
+       [1] =3D &clk_sclk_audio1.clk,
+       [2] =3D &clk_sclk_audio2.clk,
+       [3] =3D &clk_spdifextclk,
+};
+
+static struct clksrc_sources clkset_sclk_spdif =3D {
+       .sources        =3D clkset_sclk_spdif_list,
+       .nr_sources     =3D ARRAY_SIZE(clkset_sclk_spdif_list),
+};
+
 static struct clk *clkset_group_list[] =3D {
        [0] =3D &clk_ext_xtal_mux,
        [1] =3D &clk_xusbxti,
@@ -1175,6 +1197,17 @@ static struct clksrc_clk clksrcs[] =3D {
                        .parent         =3D &clk_sclk_audio2.clk,
                },
                .reg_div =3D { .reg =3D S5P_CLKDIV_PERIL4, .shift =3D 2=
0, .size =3D 8 },
+       }, {
+               .clk    =3D {
+                       .name           =3D "sclk_spdif",
+                       .id             =3D 0,
+                       .parent         =3D &clk_sclk_audio0.clk,
+       //              .ops            =3D &s5p_sclk_spdif_ops,
"When i keep this .ops, The system hangs during boot up.
If i don't define the .ops, The WARN_ON would print a stack of call
trace for undefined set_rate function"
I did not find any set_ops kind off utility functions.

Kindly, point me towards any better way of doing the same.

+                       .enable         =3D exynos4_clksrc_mask_peril1_=
ctrl,
+                       .ctrlbit        =3D (1 << 8),
+               },
+               .sources =3D &clkset_sclk_spdif,
+               .reg_src =3D { .reg =3D S5P_CLKSRC_PERIL1, .shift =3D 8=
, .size =3D 2 },
        },
 };

>
>> +
>> =A0static struct clk *clkset_group_list[] =3D {
>> =A0 =A0 =A0 [0] =3D &clk_ext_xtal_mux,
>> =A0 =A0 =A0 [1] =3D &clk_xusbxti,
>> @@ -1206,6 +1240,7 @@ static struct clksrc_clk *sysclks[] =3D {
>> =A0 =A0 =A0 &clk_sclk_audio0,
>> =A0 =A0 =A0 &clk_sclk_audio1,
>> =A0 =A0 =A0 &clk_sclk_audio2,
>> + =A0 =A0 &clk_sclk_spdif,
>> =A0};
>>
>> =A0static int xtal_rate;
>> --
>> 1.7.2.3
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
