From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 3/3] PM / devfreq: update the name of EXYNOS clock register
Date: Tue, 31 Jan 2012 14:22:29 +0900
Message-ID: <CAJ0PZbTUL-PgRXJ1MBQG+n=G4Tc-bkhipOrD34WJHXfpv_ZLZA@mail.gmail.com>
References: <1327985365-7070-1-git-send-email-kgene.kim@samsung.com>
	<1327985365-7070-4-git-send-email-kgene.kim@samsung.com>
Reply-To: myungjoo.ham@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45314 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230Ab2AaFW3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jan 2012 00:22:29 -0500
Received: by iacb35 with SMTP id b35so369045iac.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jan 2012 21:22:29 -0800 (PST)
In-Reply-To: <1327985365-7070-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, Jan 31, 2012 at 1:49 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> According to replacing the name of EXYNOS clock registers,
> this patch updates exynos4_bus.c file where it is used.
>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: MyungJoo Ham <myungjoo.ham@samsung.com>


Anyway, you are going to keep and apply this patch to your Samsung-SoC
repository, right?

I guess it'd be fine for me to apply this patch in PM/devfreq after
this one's get merged as I'm revising a seperated part of this file.



Thanks.


Cheers!
MyungJo.
> ---
> =A0drivers/devfreq/exynos4_bus.c | =A0224 ++++++++++++++++++++-------=
-------------
> =A01 files changed, 112 insertions(+), 112 deletions(-)
>
> diff --git a/drivers/devfreq/exynos4_bus.c b/drivers/devfreq/exynos4_=
bus.c
> index 6460577..565aa98 100644
> --- a/drivers/devfreq/exynos4_bus.c
> +++ b/drivers/devfreq/exynos4_bus.c
> @@ -311,51 +311,51 @@ static int exynos4210_set_busclk(struct busfreq=
_data *data, struct opp *opp)
> =A0 =A0 =A0 =A0/* Change Divider - DMC0 */
> =A0 =A0 =A0 =A0tmp =3D data->dmc_divtable[index];
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_DMC0);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_DMC0);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_DMC=
0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_DMC0);
> =A0 =A0 =A0 =A0} while (tmp & 0x11111111);
>
> =A0 =A0 =A0 =A0/* Change Divider - TOP */
> =A0 =A0 =A0 =A0tmp =3D data->top_divtable[index];
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_TOP);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_TOP);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_TOP=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_TOP);
> =A0 =A0 =A0 =A0} while (tmp & 0x11111);
>
> =A0 =A0 =A0 =A0/* Change Divider - LEFTBUS */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_LEFTBUS);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_LEFTBUS);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_BUS_GDLR_MASK | S5P_CLKDIV_BUS_GP=
LR_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_BUS_GDLR_MASK | EXYNOS4_CLKDI=
V_BUS_GPLR_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4210_clkdiv_lr_bus[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GDLR_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GDLR_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_lr_bus[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GPLR_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GPLR_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_LEFTBUS);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_LEFTBUS);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_LEF=
TBUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_LEFTBUS);
> =A0 =A0 =A0 =A0} while (tmp & 0x11);
>
> =A0 =A0 =A0 =A0/* Change Divider - RIGHTBUS */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_RIGHTBUS);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_RIGHTBUS);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_BUS_GDLR_MASK | S5P_CLKDIV_BUS_GP=
LR_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_BUS_GDLR_MASK | EXYNOS4_CLKDI=
V_BUS_GPLR_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4210_clkdiv_lr_bus[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GDLR_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GDLR_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_lr_bus[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GPLR_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GPLR_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_RIGHTBUS);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_RIGHTBUS);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_RIG=
HTBUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_RIGHTBUS);
> =A0 =A0 =A0 =A0} while (tmp & 0x11);
>
> =A0 =A0 =A0 =A0return 0;
> @@ -376,137 +376,137 @@ static int exynos4x12_set_busclk(struct busfr=
eq_data *data, struct opp *opp)
> =A0 =A0 =A0 =A0/* Change Divider - DMC0 */
> =A0 =A0 =A0 =A0tmp =3D data->dmc_divtable[index];
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_DMC0);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_DMC0);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_DMC=
0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_DMC0);
> =A0 =A0 =A0 =A0} while (tmp & 0x11111111);
>
> =A0 =A0 =A0 =A0/* Change Divider - DMC1 */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_DMC1);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_DMC1);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_DMC1_G2D_ACP_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC1_C2C_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC1_C2CACLK_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_DMC1_G2D_ACP_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC1_C2C_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC1_C2CACLK_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_dmc1[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_DMC1_G2D_ACP_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_DMC1_G2D_ACP_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc1[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_DMC1_C2C_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_DMC1_C2C_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc1[index][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_DMC1_C2CACLK_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_DMC1_C2CACLK_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_DMC1);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_DMC1);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_DMC=
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_DMC1);
> =A0 =A0 =A0 =A0} while (tmp & 0x111111);
>
> =A0 =A0 =A0 =A0/* Change Divider - TOP */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_TOP);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_TOP);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_TOP_ACLK266_GPS_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ACLK100_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ACLK160_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ACLK133_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ONENAND_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_TOP_ACLK266_GPS_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK100_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK160_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK133_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ONENAND_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_top[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_TOP_ACLK266_GPS_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_TOP_ACLK266_GPS_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_top[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_TOP_ACLK100_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_TOP_ACLK100_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_top[index][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_TOP_ACLK160_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_TOP_ACLK160_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_top[index][3] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_TOP_ACLK133_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_TOP_ACLK133_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_top[index][4] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_TOP_ONENAND_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_TOP_ONENAND_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_TOP);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_TOP);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_TOP=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_TOP);
> =A0 =A0 =A0 =A0} while (tmp & 0x11111);
>
> =A0 =A0 =A0 =A0/* Change Divider - LEFTBUS */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_LEFTBUS);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_LEFTBUS);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_BUS_GDLR_MASK | S5P_CLKDIV_BUS_GP=
LR_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_BUS_GDLR_MASK | EXYNOS4_CLKDI=
V_BUS_GPLR_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_lr_bus[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GDLR_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GDLR_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_lr_bus[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GPLR_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GPLR_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_LEFTBUS);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_LEFTBUS);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_LEF=
TBUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_LEFTBUS);
> =A0 =A0 =A0 =A0} while (tmp & 0x11);
>
> =A0 =A0 =A0 =A0/* Change Divider - RIGHTBUS */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_RIGHTBUS);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_RIGHTBUS);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_BUS_GDLR_MASK | S5P_CLKDIV_BUS_GP=
LR_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_BUS_GDLR_MASK | EXYNOS4_CLKDI=
V_BUS_GPLR_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_lr_bus[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GDLR_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GDLR_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_lr_bus[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_BUS_GPLR_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_BUS_GPLR_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_RIGHTBUS);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_RIGHTBUS);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_RIG=
HTBUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_RIGHTBUS);
> =A0 =A0 =A0 =A0} while (tmp & 0x11);
>
> =A0 =A0 =A0 =A0/* Change Divider - MFC */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_MFC);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_MFC);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_MFC_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_MFC_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_sclkip[index][0] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_MFC_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_MFC_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_MFC);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_MFC);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_MFC=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_MFC);
> =A0 =A0 =A0 =A0} while (tmp & 0x1);
>
> =A0 =A0 =A0 =A0/* Change Divider - JPEG */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_CAM1);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_CAM1);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_CAM1_JPEG_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_CAM1_JPEG_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_sclkip[index][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_CAM1_JPEG_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_CAM1_JPEG_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_CAM1);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_CAM1);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_CAM=
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_CAM1);
> =A0 =A0 =A0 =A0} while (tmp & 0x1);
>
> =A0 =A0 =A0 =A0/* Change Divider - FIMC0~3 */
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_CAM);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_CAM);
>
> - =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_CAM_FIMC0_MASK | S5P_CLKDIV_CAM_F=
IMC1_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_CAM_FIMC2_MASK | S5P_CLKDIV_=
CAM_FIMC3_MASK);
> + =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_CAM_FIMC0_MASK | EXYNOS4_CLKD=
IV_CAM_FIMC1_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_CAM_FIMC2_MASK | EXYNOS4=
_CLKDIV_CAM_FIMC3_MASK);
>
> =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_sclkip[index][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_CAM_FIMC0_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_CAM_FIMC0_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_sclkip[index][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_CAM_FIMC1_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_CAM_FIMC1_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_sclkip[index][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_CAM_FIMC2_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_CAM_FIMC2_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_sclkip[index][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLK=
DIV_CAM_FIMC3_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4=
_CLKDIV_CAM_FIMC3_SHIFT));
>
> - =A0 =A0 =A0 __raw_writel(tmp, S5P_CLKDIV_CAM);
> + =A0 =A0 =A0 __raw_writel(tmp, EXYNOS4_CLKDIV_CAM);
>
> =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_STAT_CAM=
1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_STAT=
_CAM1);
> =A0 =A0 =A0 =A0} while (tmp & 0x1111);
>
> =A0 =A0 =A0 =A0return 0;
> @@ -760,55 +760,55 @@ static int exynos4210_init_tables(struct busfre=
q_data *data)
> =A0 =A0 =A0 =A0int mgrp;
> =A0 =A0 =A0 =A0int i, err =3D 0;
>
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_DMC0);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_DMC0);
> =A0 =A0 =A0 =A0for (i =3D LV_0; i < EX4210_LV_NUM; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_DMC0_ACP_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_ACPPCLK=
_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DPHY_MA=
SK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DMC_MAS=
K |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DMCD_MA=
SK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DMCP_MA=
SK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_COPY2_M=
ASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_CORETI_=
MASK);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_DMC0_ACP_MASK=
 |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_ACP=
PCLK_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DPH=
Y_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC=
_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC=
D_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC=
P_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_COP=
Y2_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_COR=
ETI_MASK);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp |=3D ((exynos4210_clkdiv_dmc0[i][0=
] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_ACP_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_ACP_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_ACPPCLK_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_ACPPCLK_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DPHY_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DPHY_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][3] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DMC_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][4] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DMCD_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMCD_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][5] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DMCP_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMCP_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][6] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_COPY2_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_COPY2_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_dmc=
0[i][7] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_CORETI_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_CORETI_SHIFT));
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data->dmc_divtable[i] =3D tmp;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_TOP);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_TOP);
> =A0 =A0 =A0 =A0for (i =3D LV_0; i < =A0EX4210_LV_NUM; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_TOP_ACLK200_MASK =
|
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ACLK100_=
MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ACLK160_=
MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ACLK133_=
MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_TOP_ONENAND_=
MASK);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_TOP_ACLK200_M=
ASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK=
100_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK=
160_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK=
133_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_TOP_ONEN=
AND_MASK);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp |=3D ((exynos4210_clkdiv_top[i][0]=
 <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_TOP_ACLK200_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK200_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_top=
[i][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_TOP_ACLK100_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK100_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_top=
[i][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_TOP_ACLK160_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK160_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_top=
[i][3] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_TOP_ACLK133_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_TOP_ACLK133_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4210_clkdiv_top=
[i][4] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_TOP_ONENAND_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_TOP_ONENAND_SHIFT));
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data->top_divtable[i] =3D tmp;
> =A0 =A0 =A0 =A0}
> @@ -872,28 +872,28 @@ static int exynos4x12_init_tables(struct busfre=
q_data *data)
> =A0 =A0 =A0 =A0tmp |=3D DMC_PAUSE_ENABLE;
> =A0 =A0 =A0 =A0__raw_writel(tmp, S5P_DMC_PAUSE_CTRL);
>
> - =A0 =A0 =A0 tmp =3D __raw_readl(S5P_CLKDIV_DMC0);
> + =A0 =A0 =A0 tmp =3D __raw_readl(EXYNOS4_CLKDIV_DMC0);
>
> =A0 =A0 =A0 =A0for (i =3D 0; i < =A0EX4x12_LV_NUM; i++) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~(S5P_CLKDIV_DMC0_ACP_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_ACPPCLK=
_MASK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DPHY_MA=
SK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DMC_MAS=
K |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DMCD_MA=
SK |
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5P_CLKDIV_DMC0_DMCP_MA=
SK);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 tmp &=3D ~(EXYNOS4_CLKDIV_DMC0_ACP_MASK=
 |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_ACP=
PCLK_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DPH=
Y_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC=
_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC=
D_MASK |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC=
P_MASK);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tmp |=3D ((exynos4x12_clkdiv_dmc0[i][0=
] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_ACP_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_ACP_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc=
0[i][1] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_ACPPCLK_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_ACPPCLK_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc=
0[i][2] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DPHY_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DPHY_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc=
0[i][3] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DMC_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMC_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc=
0[i][4] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DMCD_SHIFT) |
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMCD_SHIFT) |
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(exynos4x12_clkdiv_dmc=
0[i][5] <<
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 S5P_CLKDIV_DMC0_DMCP_SHIFT));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 EXYNOS4_CLKDIV_DMC0_DMCP_SHIFT));
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0data->dmc_divtable[i] =3D tmp;
> =A0 =A0 =A0 =A0}
> --
> 1.7.4.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab, DMC Business, Samsung Electronics
