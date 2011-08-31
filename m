From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Add clkdev support to HSMMC
Date: Wed, 31 Aug 2011 15:43:40 +0530
Message-ID: <CAJuYYwRmEdvo684vP+pRo2XyyPbyxNOMobMVr4TFLUDCv9HHew@mail.gmail.com>
References: <0LQO00HOLZVZDW20@ms6.samsung.com>
	<4E5DF40A.1040707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:60671 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753882Ab1HaKNm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Aug 2011 06:13:42 -0400
Received: by ywf7 with SMTP id 7so431375ywf.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Aug 2011 03:13:42 -0700 (PDT)
In-Reply-To: <4E5DF40A.1040707@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: banajit.g@samsung.com, RAJESHWARI S SHINDE <rajeshwari.s@samsung.com>, PADMAVATHI VENNA <padma.v@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hi Sylwester,

On 31 August 2011 14:12, Sylwester Nawrocki <s.nawrocki@samsung.com> wr=
ote:
> Hi Banajit,
>
> (added Mr. Kim at cc)
>
>
> On 08/29/2011 03:52 PM, BANAJIT GOSWAMI wrote:
>> Hi Sylwester,
>>
>> =A0Thanks once again for your suggestions and help.
>>
>> =A0I have tried to put down some points (attached doc) regarding the=
 need of
>> registering some clocks separately (with original names).
>>
>>
>> =A0Kindly let me know your opinion regarding the same.
>
> Here is your original text as in the attachment:


[...]


>> 3) In the proposed implementation where we create connection ids onl=
y for the
>> bus clocks we are creating an extra node for the same in the clkdev =
table,
>
>> where as the clock is getting registered only once with the kernel.
>
> I don't agree with this last statement, the same struct clk is added =
to
> the list of clocks known by the system twice, in s3c24xx_register_clo=
cks()
> and clkdev_add_table(). This is only what I have been pointing out.
> Please correct me, if I missed anything.

s3c24xx_register_clock and clkdev_add_table add one instance of
"struct clk_lookup" each (with different connections ids) but both of
these "struct clk_lookup" instances point to the same "struct clk"
instance.

So, is two instances of "struct clk_lookup" pointing to the same
"struct clk" instance the concern in this case?

Thanks,
Thomas.

>
>
> Here is an original patch:
>
> 8--------------------------------------------------------------------=
---------
>
> From 04e1949999ad4f3639e7266b4a8750b13a6d9e5e Mon Sep 17 00:00:00 200=
1
> From: Rajeshwari Shinde <rajeshwari.s@samsung.com>
> Date: Fri, 19 Aug 2011 12:14:10 +0530
> Subject: [PATCH 2] ARM: S5PV210: Add Clkdev support for SDHCI
>
> This patch registers the SDHCI bus clocks to Clkdev.
>
> Signed-off-by: Rajeshwari Shinde <rajeshwari.s@samsung.com>
> ---
> =A0arch/arm/mach-s5pv210/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0178 =
++++++++++++++++++----------
> =A0arch/arm/plat-samsung/include/plat/clock.h | =A0 =A08 ++
> =A02 files changed, 122 insertions(+), 64 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/cl=
ock.c
> index 52a8e60..a95a14b 100644
> --- a/arch/arm/mach-s5pv210/clock.c
> +++ b/arch/arm/mach-s5pv210/clock.c
> @@ -350,30 +350,6 @@ static struct clk init_clocks_off[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s5pv210_cl=
k_ip1_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=3D (1<<25),
> =A0 =A0 =A0 =A0}, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
0",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_p=
sys.clk,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_ip2_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<16),
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
1",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_p=
sys.clk,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_ip2_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<17),
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
2",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_p=
sys.clk,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_ip2_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<18),
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
3",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_p=
sys.clk,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_ip2_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<19),
> - =A0 =A0 =A0 }, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "systime=
r",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.parent =A0 =A0 =A0 =A0 =3D &clk_pclk_=
psys.clk,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0 =3D s5pv210_cl=
k_ip3_ctrl,
> @@ -844,46 +820,6 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.reg_div =3D { .reg =3D S5P_CLK_DIV1, =
=2Eshift =3D 20, .size =3D 4 },
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0=
 =3D "sclk_mmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=
=3D "s3c-sdhci.0",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0=
 =3D s5pv210_clk_mask0_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=
=3D (1 << 8),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLK_SRC4, .=
shift =3D 0, .size =3D 4 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLK_DIV4, .=
shift =3D 0, .size =3D 4 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0=
 =3D "sclk_mmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=
=3D "s3c-sdhci.1",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0=
 =3D s5pv210_clk_mask0_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=
=3D (1 << 9),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLK_SRC4, .=
shift =3D 4, .size =3D 4 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLK_DIV4, .=
shift =3D 4, .size =3D 4 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0=
 =3D "sclk_mmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=
=3D "s3c-sdhci.2",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0=
 =3D s5pv210_clk_mask0_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=
=3D (1 << 10),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLK_SRC4, .=
shift =3D 8, .size =3D 4 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLK_DIV4, .=
shift =3D 8, .size =3D 4 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0=
 =3D "sclk_mmc",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=
=3D "s3c-sdhci.3",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0=
 =3D s5pv210_clk_mask0_ctrl,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=
=3D (1 << 11),
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .sources =3D &clkset_group2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =3D { .reg =3D S5P_CLK_SRC4, .=
shift =3D 12, .size =3D 4 },
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =3D { .reg =3D S5P_CLK_DIV4, .=
shift =3D 12, .size =3D 4 },
> - =A0 =A0 =A0 }, {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "sclk_mfc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.devname =A0 =A0 =A0 =A0=
=3D "s5p-mfc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s5pv210_clk_ip0_ctrl,
> @@ -1011,6 +947,112 @@ static u32 epll_div[][6] =3D {
> =A0 =A0 =A0 =A0{ =A050000000, 0, 50, 3, 3, 0 },
> =A0};
>
> +static struct clk hsmmc_clk0 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> + =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.0",
> + =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_psys.clk,
> + =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk_ip2_ctrl,
> + =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<16),
> +};
> +
> +static struct clk hsmmc_clk1 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> + =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.1",
> + =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_psys.clk,
> + =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk_ip2_ctrl,
> + =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<17),
> +};
> +
> +static struct clk hsmmc_clk2 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> + =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.2",
> + =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_psys.clk,
> + =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk_ip2_ctrl,
> + =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<18),
> +};
> +
> +static struct clk hsmmc_clk3 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "hsmmc",
> + =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.3",
> + =A0 =A0 =A0 .parent =A0 =A0 =A0 =A0 =3D &clk_hclk_psys.clk,
> + =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk_ip2_ctrl,
> + =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1<<19),
> +};
> +
> +static struct clksrc_clk sclk_mmc0 =3D {
> + =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_mmc=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_mask0_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 8),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_group2,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_SRC4, .s=
hift =3D 0, .size =3D 4 },
> + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_DIV4, .s=
hift =3D 0, .size =3D 4 },
> +
> +};
> +
> +static struct clksrc_clk sclk_mmc1 =3D {
> + =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_mmc=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_mask0_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 9),
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_group2,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_SRC4, .s=
hift =3D 4, .size =3D 4 },
> + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_DIV4, .s=
hift =3D 4, .size =3D 4 },
> +};
> +
> +static struct clksrc_clk sclk_mmc2 =3D {
> + =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_mmc=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
2",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_mask0_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 10),
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_group2,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_SRC4, .s=
hift =3D 8, .size =3D 4 },
> + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_DIV4, .s=
hift =3D 8, .size =3D 4 },
> +};
> +
> +static struct clksrc_clk sclk_mmc3 =3D {
> + =A0 =A0 =A0 .clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_mmc=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .devname =A0 =A0 =A0 =A0=3D "s3c-sdhci.=
3",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv210_clk=
_mask0_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 11),
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_group2,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_SRC4, .s=
hift =3D 12, .size =3D 4 },
> + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLK_DIV4, .s=
hift =3D 12, .size =3D 4 },
> +};
> +
> +static struct clk_lookup s5pv210_clks[] =3D {
> + =A0 =A0 =A0 CLK("s3c-sdhci.0", "mmc_busclk.0", &hsmmc_clk0),
> + =A0 =A0 =A0 CLK("s3c-sdhci.1", "mmc_busclk.0", &hsmmc_clk1),
> + =A0 =A0 =A0 CLK("s3c-sdhci.2", "mmc_busclk.0", &hsmmc_clk2),
> + =A0 =A0 =A0 CLK("s3c-sdhci.3", "mmc_busclk.0", &hsmmc_clk3),
> + =A0 =A0 =A0 CLK("s3c-sdhci.0", "mmc_busclk.2", &sclk_mmc0.clk),
> + =A0 =A0 =A0 CLK("s3c-sdhci.1", "mmc_busclk.2", &sclk_mmc1.clk),
> + =A0 =A0 =A0 CLK("s3c-sdhci.2", "mmc_busclk.2", &sclk_mmc2.clk),
> + =A0 =A0 =A0 CLK("s3c-sdhci.3", "mmc_busclk.2", &sclk_mmc3.clk),
> +};
> +
> +static struct clk *bus_clk[] =3D {
> + =A0 =A0 =A0 &hsmmc_clk0,
> + =A0 =A0 =A0 &hsmmc_clk1,
> + =A0 =A0 =A0 &hsmmc_clk2,
> + =A0 =A0 =A0 &hsmmc_clk3,
> +};
> +
> +static struct clksrc_clk *bus_clksrc[] =3D {
> + =A0 =A0 =A0 &sclk_mmc0,
> + =A0 =A0 =A0 &sclk_mmc1,
> + =A0 =A0 =A0 &sclk_mmc2,
> + =A0 =A0 =A0 &sclk_mmc3,
> +};
> +
> =A0static int s5pv210_epll_set_rate(struct clk *clk, unsigned long ra=
te)
> =A0{
> =A0 =A0 =A0 =A0unsigned int epll_con, epll_con_k;
> @@ -1156,10 +1198,18 @@ void __init s5pv210_register_clocks(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_register_clksrc(sysclks[ptr], 1);
>
> =A0 =A0 =A0 =A0s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
> + =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(bus_clksrc); ptr++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_register_clksrc(bus_clksrc[ptr], 1)=
;
> +
> =A0 =A0 =A0 =A0s3c_register_clocks(init_clocks, ARRAY_SIZE(init_clock=
s));
>
> =A0 =A0 =A0 =A0s3c_register_clocks(init_clocks_off, ARRAY_SIZE(init_c=
locks_off));
> =A0 =A0 =A0 =A0s3c_disable_clocks(init_clocks_off, ARRAY_SIZE(init_cl=
ocks_off));
>
> + =A0 =A0 =A0 s3c24xx_register_clocks(bus_clk, ARRAY_SIZE(bus_clk));
> + =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(bus_clk); ptr++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_disable_clocks(bus_clk[ptr], 1);
> +
> =A0 =A0 =A0 =A0s3c_pwmclk_init();
> + =A0 =A0 =A0 clkdev_add_table(s5pv210_clks, ARRAY_SIZE(s5pv210_clks)=
);
>
> =A0}
> diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/pl=
at-samsung/include/plat/clock.h
> index 87d5b38..03f70ba 100644
> --- a/arch/arm/plat-samsung/include/plat/clock.h
> +++ b/arch/arm/plat-samsung/include/plat/clock.h
> @@ -29,6 +29,14 @@ struct clk;
> =A0* not be a problem as it is unlikely these operations are going
> =A0* to need to be called quickly.
> =A0*/
> +
> +#define CLK(dev, con, ck) =A0 =A0 =A0\
> + =A0 =A0 =A0 { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .dev_id =3D dev, =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .con_id =3D con, =A0\
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .clk =A0 =A0=3D ck, =A0 \
> + =A0 =A0 =A0 } =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> +
> =A0struct clk_ops {
> =A0 =A0 =A0 =A0int =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (*set_rate)(struct=
 clk *c, unsigned long rate);
> =A0 =A0 =A0 =A0unsigned long =A0 =A0 =A0 (*get_rate)(struct clk *c);
> --
> 1.7.4.4
>
> 8--------------------------------------------------------------------=
--------
>
>
>>
>> Thanks and Regards,
>> Banajit Goswami
> ...
>>
>> ------- *Original Message* -------
>> *Sender* : Sylwester Nawrocki<s.nawrocki@samsung.com> Software Engin=
eer/Poland
>> R&D Center-Linux (MSD)/Samsung Electronics
>> *Date* : Aug 24, 2011 22:29 (GMT+09:00)
>> *Title* : Re: Add clkdev support to HSMMC
>>
>> Hi Banajit,
>>
>> On 08/24/2011 07:47 AM, RAJESHWARI S SHINDE wrote:
>>> Hi Sylwester,
>>>
>>>
>>> This is with regards to your reply for Padmavathi's mail regarding =
double
>>> registration of clocks with clkdev in case of SPI.
>>>
>>> In the attached patch set registration of bus clocks is happening t=
wice, once
>>> with actual clock name and another with generic connection id. This=
 is being
>>> done to avoid issue as explained below.
>>>
>>> When trying to add Clkdev support for the HSMMC, was facing the fol=
lowing issue:
>>>
>>> We have a peripheral clock with name "hsmmc " which is also being u=
sed =A0as a
>>> bus clock, for best source calculation in =A0SoC's =A0like S3C64XX,=
 S3C2416,
>>> S5PC100 and S5PV210 as shown below:
>>>
>>> char *s5pv210_hsmmc_clksrcs[4] =3D {
>>> =A0 =A0 =A0 =A0 [0] =3D "hsmmc", =A0 =A0 =A0 =A0 =A0/* HCLK */
>>> =A0 =A0 =A0 =A0 /* [1] =3D "hsmmc", =A0 =A0 =A0 - duplicate HCLK en=
try */
>>> =A0 =A0 =A0 =A0 [2] =3D "sclk_mmc", =A0 =A0 =A0 /* mmc_bus */
>>> =A0 =A0 =A0 =A0 /* [3] =3D NULL, =A0 =A0 =A0 =A0 =A0- reserved */
>>> };
>>>
>>> Hence when we try to add this "hsmmc" as a bus clock in the clkdev =
lookup table
>>> with a generic name across all the platforms, which will be used by=
 the
>>> HSMMC driver, the problem arises as the driver also tries to search=
 for this
>>> peripheral clock using the clock name "hsmmc" as shown below and fa=
ils:
>>>
>>> =A0 sc->clk_io =3D clk_get(dev, "hsmmc");
>>> =A0 if (IS_ERR(sc->clk_io)) {
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "failed to get io cloc=
k\n");
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D PTR_ERR(sc->clk_io);
>>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_io_clk;
>>> =A0 }
>>>
>>> I cannot alone use a generic connection id for getting the peripher=
al clocks as
>>> SoC's like S5P64X0 and Exynos4 do not use this peripheral clock as =
bus clock.
>>
>> Could you create two separate clock 'connection id' name classes for=
 each SoC ?
>> One for the 'bus clock' and one for the the 'other' (hsmmc) clock ?
>> Then each mach-* could assign proper struct clk to for the "clk_io" =
at the driver.
>>
>> Now you're registering both current "hsmmc" and "sclk_hsmmc" clocks =
under
>> "mmc_busclk.?" name only.
>>
>> For instance:
>>
>>
>> +static struct clk_lookup s5pv210_clks[] =3D {
>> + CLK("s3c-sdhci.0", "mmc_busclk.0", &hsmmc_clk0),
>> + CLK("s3c-sdhci.1", "mmc_busclk.0", &hsmmc_clk1),
>> + CLK("s3c-sdhci.2", "mmc_busclk.0", &hsmmc_clk2),
>> + CLK("s3c-sdhci.3", "mmc_busclk.0", &hsmmc_clk3),
>> + CLK("s3c-sdhci.0", "mmc_busclk.2", &sclk_mmc0.clk),
>> + CLK("s3c-sdhci.1", "mmc_busclk.2", &sclk_mmc1.clk),
>> + CLK("s3c-sdhci.2", "mmc_busclk.2", &sclk_mmc2.clk),
>> + CLK("s3c-sdhci.3", "mmc_busclk.2", &sclk_mmc3.clk),
>>
>> + CLK("s3c-sdhci.0", "mmc_ioclk", &hsmmc_clk0),
>> + CLK("s3c-sdhci.1", "mmc_ioclk", &hsmmc_clk1),
>> + CLK("s3c-sdhci.2", "mmc_ioclk", &hsmmc_clk2),
>> + CLK("s3c-sdhci.3", "mmc_ioclk", &hsmmc_clk3),
>>
>> +};
>>
>> Then in the driver:
>>
>>
>> - =A0 sc->clk_io =3D clk_get(dev, "hsmmc");
>> + =A0 sc->clk_io =3D clk_get(dev, "mmc_ioclk");
>> =A0 =A0if (IS_ERR(sc->clk_io)) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(dev, "failed to get io cl=
ock\n");
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D PTR_ERR(sc->clk_io);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_io_clk;
>> =A0 =A0}
>>
>> Does it make sense?
>>
>> I guess you don't want to modify every mach-s* for this ?
>>
>> I'm mostly OK with your patches, as they are a step in good directio=
n.
>>
>>>
>>> Hope you understood the problem; do refer the attached patch set fo=
r more
>>> clarification.
>>>
>>> Do suggest me if any better solution.
>>>
>>
>
> Regards,
> --
> Sylwester Nawrocki
> Samsung Poland R&D Center
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
