From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [clocks] ARM: S3C64XX: Use new clock-clksrc.c code for clocks.
Date: Tue, 1 Dec 2009 18:48:10 +0900
Message-ID: <9c9fda240912010148w59d8b3f3n749d174ae738e017@mail.gmail.com>
References: <1259631793-25480-1-git-send-email-ben-linux@fluff.org>
	 <1259631793-25480-6-git-send-email-ben-linux@fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f197.google.com ([209.85.212.197]:42689 "EHLO
	mail-vw0-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753905AbZLAJsF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 1 Dec 2009 04:48:05 -0500
Received: by vws35 with SMTP id 35so1438601vws.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Dec 2009 01:48:10 -0800 (PST)
In-Reply-To: <1259631793-25480-6-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>
Cc: laforge@gnumonks.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Dec 1, 2009 at 10:43 AM, Ben Dooks <ben-linux@fluff.org> wrote:
> Move the s3c6400-clock.c implementation over to use the new common
> plat-samsung based clock-clksrc.c.
>
> Note, this does not delete the clocks definitions that are now unused
> in the regs-clock.h to reduce the quantity of change in this commit.
>
> Based on original patches by Harald Welte.
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
> =A0arch/arm/plat-s3c64xx/Kconfig =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0arch/arm/plat-s3c64xx/s3c6400-clock.c | =A0241 ++++++-------------=
--------------
> =A02 files changed, 40 insertions(+), 202 deletions(-)
>
> diff --git a/arch/arm/plat-s3c64xx/Kconfig b/arch/arm/plat-s3c64xx/Kc=
onfig
> index bcfa778..f029697 100644
> --- a/arch/arm/plat-s3c64xx/Kconfig
> +++ b/arch/arm/plat-s3c64xx/Kconfig
> @@ -15,6 +15,7 @@ config PLAT_S3C64XX
> =A0 =A0 =A0 =A0select ARM_VIC
> =A0 =A0 =A0 =A0select NO_IOPORT
> =A0 =A0 =A0 =A0select ARCH_REQUIRE_GPIOLIB
> + =A0 =A0 =A0 select SAMSUNG_CLKSRC
> =A0 =A0 =A0 =A0select S3C_GPIO_TRACK
> =A0 =A0 =A0 =A0select S3C_GPIO_PULL_UPDOWN
> =A0 =A0 =A0 =A0select S3C_GPIO_CFG_S3C24XX
> diff --git a/arch/arm/plat-s3c64xx/s3c6400-clock.c b/arch/arm/plat-s3=
c64xx/s3c6400-clock.c
> index a07e5c9..adc2e0a 100644
> --- a/arch/arm/plat-s3c64xx/s3c6400-clock.c
> +++ b/arch/arm/plat-s3c64xx/s3c6400-clock.c
> @@ -29,6 +29,7 @@
>
> =A0#include <plat/regs-clock.h>
> =A0#include <plat/clock.h>
> +#include <plat/clock-clksrc.h>
> =A0#include <plat/cpu.h>
> =A0#include <plat/pll.h>
>
> @@ -47,22 +48,6 @@ static struct clk clk_ext_xtal_mux =3D {
>
> =A0#define clk_fout_mpll =A0clk_mpll
>
> -struct clk_sources {
> - =A0 =A0 =A0 unsigned int =A0 =A0nr_sources;
> - =A0 =A0 =A0 struct clk =A0 =A0 =A0**sources;
> -};
> -
> -struct clksrc_clk {
> - =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0clk;
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0mask;
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0shift;
> -
> - =A0 =A0 =A0 struct clk_sources =A0 =A0 =A0*sources;
> -
> - =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0divider_shift;
> - =A0 =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*reg_divider;
> -};
> -
> =A0static struct clk clk_fout_apll =3D {
> =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "fout_apll",
> =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> @@ -73,7 +58,7 @@ static struct clk *clk_src_apll_list[] =3D {
> =A0 =A0 =A0 =A0[1] =3D &clk_fout_apll,
> =A0};
>
> -static struct clk_sources clk_src_apll =3D {
> +static struct clksrc_sources clk_src_apll =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clk_src_apll_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clk_src_apll_list),
> =A0};
> @@ -83,8 +68,7 @@ static struct clksrc_clk clk_mout_apll =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "mout_ap=
ll",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_CLKSRC_APLL_MOUT_=
SHIFT,
> - =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_CLKSRC_APLL_MOUT,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_SRC, 0, 1 },

What's the meaning of '0', '1'? It's difficult to read and understand,
How about to use the proper macro, I think it means the offset and
required mask bit?

Others are same.

Thank you,
Kyungmin Park

> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clk_src_apll,
> =A0};
>
> @@ -98,7 +82,7 @@ static struct clk *clk_src_epll_list[] =3D {
> =A0 =A0 =A0 =A0[1] =3D &clk_fout_epll,
> =A0};
>
> -static struct clk_sources clk_src_epll =3D {
> +static struct clksrc_sources clk_src_epll =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clk_src_epll_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clk_src_epll_list),
> =A0};
> @@ -108,8 +92,7 @@ static struct clksrc_clk clk_mout_epll =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "mout_ep=
ll",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_CLKSRC_EPLL_MOUT_=
SHIFT,
> - =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_CLKSRC_EPLL_MOUT,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_SRC, 2, 1 },
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clk_src_epll,
> =A0};
>
> @@ -118,7 +101,7 @@ static struct clk *clk_src_mpll_list[] =3D {
> =A0 =A0 =A0 =A0[1] =3D &clk_fout_mpll,
> =A0};
>
> -static struct clk_sources clk_src_mpll =3D {
> +static struct clksrc_sources clk_src_mpll =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clk_src_mpll_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clk_src_mpll_list),
> =A0};
> @@ -128,8 +111,7 @@ static struct clksrc_clk clk_mout_mpll =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "mout_mp=
ll",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_CLKSRC_MPLL_MOUT_=
SHIFT,
> - =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_CLKSRC_MPLL_MOUT,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_SRC, 1, 1 },
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clk_src_mpll,
> =A0};
>
> @@ -218,7 +200,7 @@ static struct clk *clkset_spi_mmc_list[] =3D {
> =A0 =A0 =A0 =A0&clk_27m,
> =A0};
>
> -static struct clk_sources clkset_spi_mmc =3D {
> +static struct clksrc_sources clkset_spi_mmc =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_spi_mmc_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_spi_mmc_list=
),
> =A0};
> @@ -230,7 +212,7 @@ static struct clk *clkset_irda_list[] =3D {
> =A0 =A0 =A0 =A0&clk_27m,
> =A0};
>
> -static struct clk_sources clkset_irda =3D {
> +static struct clksrc_sources clkset_irda =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_irda_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_irda_list),
> =A0};
> @@ -242,7 +224,7 @@ static struct clk *clkset_uart_list[] =3D {
> =A0 =A0 =A0 =A0NULL
> =A0};
>
> -static struct clk_sources clkset_uart =3D {
> +static struct clksrc_sources clkset_uart =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_uart_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_uart_list),
> =A0};
> @@ -254,7 +236,7 @@ static struct clk *clkset_uhost_list[] =3D {
> =A0 =A0 =A0 =A0&clk_fin_epll,
> =A0};
>
> -static struct clk_sources clkset_uhost =3D {
> +static struct clksrc_sources clkset_uhost =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_uhost_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_uhost_list),
> =A0};
> @@ -269,94 +251,6 @@ static struct clk_sources clkset_uhost =3D {
> =A0* have a common parent divisor so are not included here.
> =A0*/
>
> -static inline struct clksrc_clk *to_clksrc(struct clk *clk)
> -{
> - =A0 =A0 =A0 return container_of(clk, struct clksrc_clk, clk);
> -}
> -
> -static unsigned long s3c64xx_getrate_clksrc(struct clk *clk)
> -{
> - =A0 =A0 =A0 struct clksrc_clk *sclk =3D to_clksrc(clk);
> - =A0 =A0 =A0 unsigned long rate =3D clk_get_rate(clk->parent);
> - =A0 =A0 =A0 u32 clkdiv =3D __raw_readl(sclk->reg_divider);
> -
> - =A0 =A0 =A0 clkdiv >>=3D sclk->divider_shift;
> - =A0 =A0 =A0 clkdiv &=3D 0xf;
> - =A0 =A0 =A0 clkdiv++;
> -
> - =A0 =A0 =A0 rate /=3D clkdiv;
> - =A0 =A0 =A0 return rate;
> -}
> -
> -static int s3c64xx_setrate_clksrc(struct clk *clk, unsigned long rat=
e)
> -{
> - =A0 =A0 =A0 struct clksrc_clk *sclk =3D to_clksrc(clk);
> - =A0 =A0 =A0 void __iomem *reg =3D sclk->reg_divider;
> - =A0 =A0 =A0 unsigned int div;
> - =A0 =A0 =A0 u32 val;
> -
> - =A0 =A0 =A0 rate =3D clk_round_rate(clk, rate);
> - =A0 =A0 =A0 div =3D clk_get_rate(clk->parent) / rate;
> - =A0 =A0 =A0 if (div > 16)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> -
> - =A0 =A0 =A0 val =3D __raw_readl(reg);
> - =A0 =A0 =A0 val &=3D ~(0xf << sclk->divider_shift);
> - =A0 =A0 =A0 val |=3D (div - 1) << sclk->divider_shift;
> - =A0 =A0 =A0 __raw_writel(val, reg);
> -
> - =A0 =A0 =A0 return 0;
> -}
> -
> -static int s3c64xx_setparent_clksrc(struct clk *clk, struct clk *par=
ent)
> -{
> - =A0 =A0 =A0 struct clksrc_clk *sclk =3D to_clksrc(clk);
> - =A0 =A0 =A0 struct clk_sources *srcs =3D sclk->sources;
> - =A0 =A0 =A0 u32 clksrc =3D __raw_readl(S3C_CLK_SRC);
> - =A0 =A0 =A0 int src_nr =3D -1;
> - =A0 =A0 =A0 int ptr;
> -
> - =A0 =A0 =A0 for (ptr =3D 0; ptr < srcs->nr_sources; ptr++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (srcs->sources[ptr] =3D=3D parent) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src_nr =3D ptr;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 if (src_nr >=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc &=3D ~sclk->mask;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clksrc |=3D src_nr << sclk->shift;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(clksrc, S3C_CLK_SRC);
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk->parent =3D parent;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return -EINVAL;
> -}
> -
> -static unsigned long s3c64xx_roundrate_clksrc(struct clk *clk,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 unsigned long rate)
> -{
> - =A0 =A0 =A0 unsigned long parent_rate =3D clk_get_rate(clk->parent)=
;
> - =A0 =A0 =A0 int div;
> -
> - =A0 =A0 =A0 if (rate > parent_rate)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate =3D parent_rate;
> - =A0 =A0 =A0 else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 div =3D parent_rate / rate;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (div =3D=3D 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 div =3D 1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (div > 16)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 div =3D 16;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate =3D parent_rate / div;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 return rate;
> -}
> -
> =A0/* clocks that feed other parts of the clock source tree */
>
> =A0static struct clk clk_iis_cd0 =3D {
> @@ -382,7 +276,7 @@ static struct clk *clkset_audio0_list[] =3D {
> =A0 =A0 =A0 =A0[4] =3D &clk_pcm_cd,
> =A0};
>
> -static struct clk_sources clkset_audio0 =3D {
> +static struct clksrc_sources clkset_audio0 =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_audio0_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_audio0_list)=
,
> =A0};
> @@ -395,7 +289,7 @@ static struct clk *clkset_audio1_list[] =3D {
> =A0 =A0 =A0 =A0[4] =3D &clk_pcm_cd,
> =A0};
>
> -static struct clk_sources clkset_audio1 =3D {
> +static struct clksrc_sources clkset_audio1 =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_audio1_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_audio1_list)=
,
> =A0};
> @@ -404,7 +298,7 @@ static struct clk *clkset_camif_list[] =3D {
> =A0 =A0 =A0 =A0&clk_h2,
> =A0};
>
> -static struct clk_sources clkset_camif =3D {
> +static struct clksrc_sources clkset_camif =3D {
> =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D clkset_camif_list,
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_camif_list),
> =A0};
> @@ -417,11 +311,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_MMC0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_MMC0_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_MMC0_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 18, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV1, 0, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_sp=
i_mmc,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV1_M=
MC0_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV1,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "mmc_bus",
> @@ -429,11 +321,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_MMC1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_MMC1_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_MMC1_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 20, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV1, 4, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_sp=
i_mmc,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV1_M=
MC1_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV1,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "mmc_bus",
> @@ -441,11 +331,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_MMC2,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_MMC2_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_MMC2_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 22, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV1, 8, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_sp=
i_mmc,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV1_M=
MC2_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV1,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "usb-bus-host",
> @@ -453,11 +341,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_UHOST,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_UHOST_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_UHOST_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 5, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV1, 20, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_uh=
ost,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV1_U=
HOST_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV1,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "uclk1",
> @@ -465,11 +351,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_UART,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_UART_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_UART_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 13, 1 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV2, 16, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_ua=
rt,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV2_U=
ART_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV2,
> =A0 =A0 =A0 =A0}, {
> =A0/* Where does UCLK0 come from? */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> @@ -478,11 +362,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_SPI0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_SPI0_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_SPI0_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 14, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV2, 0, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_sp=
i_mmc,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV2_S=
PI0_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV2,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "spi-bus",
> @@ -490,11 +372,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_SPI1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_SPI1_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_SPI1_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 16, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV2, 4, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_sp=
i_mmc,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV2_S=
PI1_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV2,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "audio-bus",
> @@ -502,11 +382,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_AUDIO0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_AUDIO0_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_AUDIO0_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 7, 3 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV2, 8, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_au=
dio0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV2_A=
UDIO0_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV2,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "audio-bus",
> @@ -514,11 +392,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_AUDIO1,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_AUDIO1_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_AUDIO1_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 10, 3 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV2, 12, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_au=
dio1,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV2_A=
UDIO1_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV2,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "irda-bus",
> @@ -526,11 +402,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_IRDA,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D S3C6400_C=
LKSRC_IRDA_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D S3C6400_C=
LKSRC_IRDA_MASK,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { S3C_CLK_S=
RC, 24, 2 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV2, 20, 4 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_ir=
da,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV2_I=
RDA_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV2,
> =A0 =A0 =A0 =A0}, {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.clk =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =
=A0 =3D "camera",
> @@ -538,11 +412,9 @@ static struct clksrc_clk clksrcs[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ctrlbit =A0 =A0 =A0 =A0=
=3D S3C_CLKCON_SCLK_CAM,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.enable =A0 =A0 =A0 =A0=
 =3D s3c64xx_sclk_ctrl,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .shift =A0 =A0 =A0 =A0 =A0=3D 0,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mask =A0 =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { S3C_CLK_D=
IV0, 20, 4 },
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { NULL, 0, =
0 },
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.sources =A0 =A0 =A0 =A0=3D &clkset_ca=
mif,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .divider_shift =A0=3D S3C6400_CLKDIV0_C=
AM_SHIFT,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .reg_divider =A0 =A0=3D S3C_CLK_DIV0,
> =A0 =A0 =A0 =A0},
> =A0};
>
> @@ -554,27 +426,6 @@ static struct clksrc_clk *init_parents[] =3D {
> =A0 =A0 =A0 =A0&clk_mout_mpll,
> =A0};
>
> -static void __init_or_cpufreq s3c6400_set_clksrc(struct clksrc_clk *=
clk)
> -{
> - =A0 =A0 =A0 struct clk_sources *srcs =3D clk->sources;
> - =A0 =A0 =A0 u32 clksrc =3D __raw_readl(S3C_CLK_SRC);
> -
> - =A0 =A0 =A0 clksrc &=3D clk->mask;
> - =A0 =A0 =A0 clksrc >>=3D clk->shift;
> -
> - =A0 =A0 =A0 if (clksrc > srcs->nr_sources || !srcs->sources[clksrc]=
) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "%s: bad source %d\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->clk.name, clksrc);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> - =A0 =A0 =A0 }
> -
> - =A0 =A0 =A0 clk->clk.parent =3D srcs->sources[clksrc];
> -
> - =A0 =A0 =A0 printk(KERN_INFO "%s: source is %s (%d), rate is %ld\n"=
,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0clk->clk.name, clk->clk.parent->name, cl=
ksrc,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0clk_get_rate(&clk->clk));
> -}
> -
> =A0#define GET_DIV(clk, field) ((((clk) & field##_MASK) >> field##_SH=
IFT) + 1)
>
> =A0void __init_or_cpufreq s3c6400_setup_clocks(void)
> @@ -633,10 +484,10 @@ void __init_or_cpufreq s3c6400_setup_clocks(voi=
d)
> =A0 =A0 =A0 =A0clk_f.rate =3D fclk;
>
> =A0 =A0 =A0 =A0for (ptr =3D 0; ptr < ARRAY_SIZE(init_parents); ptr++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c6400_set_clksrc(init_parents[ptr]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_set_clksrc(init_parents[ptr]);
>
> =A0 =A0 =A0 =A0for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c6400_set_clksrc(&clksrcs[ptr]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_set_clksrc(&clksrcs[ptr]);
> =A0}
>
> =A0static struct clk *clks[] __initdata =3D {
> @@ -680,21 +531,7 @@ void __init s3c6400_register_clocks(unsigned arm=
clk_divlimit)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 for (ptr =3D 0; ptr < ARRAY_SIZE(clksrcs); ptr++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clkp =3D &clksrcs[ptr].clk;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* all clksrc clocks have these */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clkp->get_rate =3D s3c64xx_getrate_clks=
rc;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clkp->set_rate =3D s3c64xx_setrate_clks=
rc;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clkp->set_parent =3D s3c64xx_setparent_=
clksrc;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 clkp->round_rate =3D s3c64xx_roundrate_=
clksrc;
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D s3c24xx_register_clock(clkp);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret < 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Failed=
 to register clock %s (%d)\n",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clkp->na=
me, ret);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 }
> + =A0 =A0 =A0 s3c_register_clksrc(clksrcs, ARRAY_SIZE(clksrcs));
>
> =A0 =A0 =A0 =A0clk_mpll.parent =3D &clk_mout_mpll.clk;
> =A0 =A0 =A0 =A0clk_epll.parent =3D &clk_mout_epll.clk;
> --
> 1.5.6.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
