From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 13/14] ARM: S5PV310: Add video clocks
Date: Thu, 19 Aug 2010 19:28:42 +0900
Message-ID: <AANLkTikreMifRgd8kkvcmjZoRZ0fEAcHqWExaOikzE6v@mail.gmail.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
	<1282140084-10265-14-git-send-email-kgene.kim@samsung.com>
	<AANLkTincrZWhrb8fcrdL2QNtZTbgBB-pAYzTf8cq6Zn7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:33817 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752445Ab0HSK2n convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Aug 2010 06:28:43 -0400
Received: by yxg6 with SMTP id 6so613872yxg.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Aug 2010 03:28:43 -0700 (PDT)
In-Reply-To: <AANLkTincrZWhrb8fcrdL2QNtZTbgBB-pAYzTf8cq6Zn7@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org

On Thu, Aug 19, 2010 at 7:04 PM, MyungJoo Ham <myungjoo.ham@samsung.com=
> wrote:
> On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> From: Jongpill Lee <boyko.lee@samsung.com>
>>
>> This patch adds video clocks for S5PV310/S5PC210.
>>
>> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> =C2=A0arch/arm/mach-s5pv310/clock.c | =C2=A0 74 ++++++++++++++++++++=
+++++++++++++++++++++
>> =C2=A01 files changed, 74 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/c=
lock.c
>> index 14c9707..04bde94 100644
>> --- a/arch/arm/mach-s5pv310/clock.c
>> +++ b/arch/arm/mach-s5pv310/clock.c
>> @@ -506,6 +506,78 @@ static struct clksrc_sources clkset_group =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.nr_sources =C2=A0 =C2=A0 =3D ARRAY_SIZE(=
clkset_group_list),
>> =C2=A0};
>>
>> +static struct clksrc_clk clk_sclk_mipidphy4l =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .clk =C2=A0 =C2=A0=3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D "sclk_mipidphy4l",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D -1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D s5pv310_clk_ip_lcd0_ctrl,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctrlbit =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (1 << 4),
>> + =C2=A0 =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &clks=
et_group,
>> + =C2=A0 =C2=A0 =C2=A0 .reg_src =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { .re=
g =3D S5P_CLKSRC_LCD0, .shift =3D 12, .size =3D 4 },
>> + =C2=A0 =C2=A0 =C2=A0 .reg_div =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { .re=
g =3D S5P_CLKDIV_LCD0, .shift =3D 16, .size =3D 4 },
>> +};
>
> It appears that clk_ip_lcd0[4](CLK_SMMUFIMD0) is not for this clock
> source. This SCLK_MIPIDPHY4L seems to be masked by
> CLK_SRC_MASK_LCD0[12] (MIPI0_MASK)

Um... As CLK_SRC_MASK_LCD0[12] (MIPI0_MASK) controls MUX_MIPI0, it
masks both SCLK_MIPIDPHY4L and SCLK_MIPI0. Then, it seems that we
cannot mask SCLK_MIPIDPHY4L and SCLK_MIPI0 independently.

Then, what about not adding .enable entry for both "sclk_mipidphy4l"
and "sclk_mipi" (which is added in the PATCH 14/14)? Affecting another
clock source with one does not look good.

>
>> +
>> +static struct clksrc_clk clk_sclk_mipidphy2l =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .clk =C2=A0 =C2=A0=3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D "sclk_mipidphy2l",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D -1,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D s5pv310_clk_ip_lcd1_ctrl,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ctrlbit =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D (1 << 4),
>> + =C2=A0 =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &clks=
et_group,
>> + =C2=A0 =C2=A0 =C2=A0 .reg_src =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { .re=
g =3D S5P_CLKSRC_LCD1, .shift =3D 12, .size =3D 4 },
>> + =C2=A0 =C2=A0 =C2=A0 .reg_div =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { .re=
g =3D S5P_CLKDIV_LCD1, .shift =3D 16, .size =3D 4 },
>> +};
>
> Appears to have the similar issue with the previous clock source

Same with above.

>
>> +
>> +static struct clk *clkset_mout_g2d0_list[] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 [0] =3D &clk_mout_mpll.clk,
>> + =C2=A0 =C2=A0 =C2=A0 [1] =3D &clk_sclk_apll.clk,
>> +};
>> +
>> +static struct clksrc_sources clkset_mout_g2d0 =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D clkse=
t_mout_g2d0_list,
>> + =C2=A0 =C2=A0 =C2=A0 .nr_sources =C2=A0 =C2=A0 =3D ARRAY_SIZE(clks=
et_mout_g2d0_list),
>> +};
>> +
>> +static struct clksrc_clk clk_mout_g2d0 =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .clk =C2=A0 =C2=A0=3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D "mout_g2d0",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D -1,
>> + =C2=A0 =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &clks=
et_mout_g2d0,
>> + =C2=A0 =C2=A0 =C2=A0 .reg_src =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { .re=
g =3D S5P_CLKSRC_IMAGE, .shift =3D 0, .size =3D 1 },
>> +};
>> +
>> +static struct clk *clkset_mout_g2d1_list[] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 [0] =3D &clk_mout_epll.clk,
>> + =C2=A0 =C2=A0 =C2=A0 [1] =3D &clk_sclk_vpll.clk,
>> +};
>> +
>> +static struct clksrc_sources clkset_mout_g2d1 =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D clkse=
t_mout_g2d1_list,
>> + =C2=A0 =C2=A0 =C2=A0 .nr_sources =C2=A0 =C2=A0 =3D ARRAY_SIZE(clks=
et_mout_g2d1_list),
>> +};
>> +
>> +static struct clksrc_clk clk_mout_g2d1 =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .clk =C2=A0 =C2=A0=3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D "mout_g2d1",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D -1,
>> + =C2=A0 =C2=A0 =C2=A0 },
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &clks=
et_mout_g2d1,
>> + =C2=A0 =C2=A0 =C2=A0 .reg_src =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D { .re=
g =3D S5P_CLKSRC_IMAGE, .shift =3D 4, .size =3D 1 },
>> +};
>> +
>> +static struct clk *clkset_mout_g2d_list[] =3D {
>> + =C2=A0 =C2=A0 =C2=A0 [0] =3D &clk_mout_g2d0.clk,
>> + =C2=A0 =C2=A0 =C2=A0 [1] =3D &clk_mout_g2d1.clk,
>> +};
>> +
>> +static struct clksrc_sources clkset_mout_g2d =3D {
>> + =C2=A0 =C2=A0 =C2=A0 .sources =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D clkse=
t_mout_g2d_list,
>> + =C2=A0 =C2=A0 =C2=A0 .nr_sources =C2=A0 =C2=A0 =3D ARRAY_SIZE(clks=
et_mout_g2d_list),
>> +};
>> +
>> =C2=A0static struct clksrc_clk clk_dout_mmc0 =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0.clk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "dout_mmc0",
>> @@ -672,6 +744,8 @@ static struct clksrc_clk *sysclks[] =3D {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&clk_aclk_100,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&clk_aclk_160,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&clk_aclk_133,
>> + =C2=A0 =C2=A0 =C2=A0 &clk_sclk_mipidphy4l,
>> + =C2=A0 =C2=A0 =C2=A0 &clk_sclk_mipidphy2l,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&clk_dout_mmc0,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&clk_dout_mmc1,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&clk_dout_mmc2,
>> --
>> 1.6.2.5
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>
>
>
> --
> MyungJoo Ham, Ph.D.
> Mobile Software Platform Lab,
> Digital Media and Communications (DMC) Business
> Samsung Electronics
> cell: 82-10-6714-2858
>



--=20
MyungJoo Ham (=ED=95=A8=EB=AA=85=EC=A3=BC), Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
