From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH 13/14] ARM: S5PV310: Add video clocks
Date: Thu, 19 Aug 2010 19:04:43 +0900
Message-ID: <AANLkTincrZWhrb8fcrdL2QNtZTbgBB-pAYzTf8cq6Zn7@mail.gmail.com>
References: <1282140084-10265-1-git-send-email-kgene.kim@samsung.com>
	<1282140084-10265-14-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1282140084-10265-14-git-send-email-kgene.kim@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Jongpill Lee <boyko.lee@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 18, 2010 at 11:01 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> From: Jongpill Lee <boyko.lee@samsung.com>
>
> This patch adds video clocks for S5PV310/S5PC210.
>
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/mach-s5pv310/clock.c | =A0 74 +++++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 74 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-s5pv310/clock.c b/arch/arm/mach-s5pv310/clock.c
> index 14c9707..04bde94 100644
> --- a/arch/arm/mach-s5pv310/clock.c
> +++ b/arch/arm/mach-s5pv310/clock.c
> @@ -506,6 +506,78 @@ static struct clksrc_sources clkset_group =3D {
> =A0 =A0 =A0 =A0.nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_group_list),
> =A0};
>
> +static struct clksrc_clk clk_sclk_mipidphy4l =3D {
> + =A0 =A0 =A0 .clk =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_mipidph=
y4l",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk_ip_=
lcd0_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 4),
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_group,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_LCD0, .sh=
ift =3D 12, .size =3D 4 },
> + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_LCD0, .sh=
ift =3D 16, .size =3D 4 },
> +};

It appears that clk_ip_lcd0[4](CLK_SMMUFIMD0) is not for this clock
source. This SCLK_MIPIDPHY4L seems to be masked by
CLK_SRC_MASK_LCD0[12] (MIPI0_MASK)

> +
> +static struct clksrc_clk clk_sclk_mipidphy2l =3D {
> + =A0 =A0 =A0 .clk =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "sclk_mipidph=
y2l",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .enable =A0 =A0 =A0 =A0 =3D s5pv310_clk_ip_=
lcd1_ctrl,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ctrlbit =A0 =A0 =A0 =A0=3D (1 << 4),
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_group,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_LCD1, .sh=
ift =3D 12, .size =3D 4 },
> + =A0 =A0 =A0 .reg_div =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKDIV_LCD1, .sh=
ift =3D 16, .size =3D 4 },
> +};

Appears to have the similar issue with the previous clock source

> +
> +static struct clk *clkset_mout_g2d0_list[] =3D {
> + =A0 =A0 =A0 [0] =3D &clk_mout_mpll.clk,
> + =A0 =A0 =A0 [1] =3D &clk_sclk_apll.clk,
> +};
> +
> +static struct clksrc_sources clkset_mout_g2d0 =3D {
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_mout_g2d0_list,
> + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_mout_g2d0_list),
> +};
> +
> +static struct clksrc_clk clk_mout_g2d0 =3D {
> + =A0 =A0 =A0 .clk =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mout_g2d0",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_mout_g2d0,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_IMAGE, .s=
hift =3D 0, .size =3D 1 },
> +};
> +
> +static struct clk *clkset_mout_g2d1_list[] =3D {
> + =A0 =A0 =A0 [0] =3D &clk_mout_epll.clk,
> + =A0 =A0 =A0 [1] =3D &clk_sclk_vpll.clk,
> +};
> +
> +static struct clksrc_sources clkset_mout_g2d1 =3D {
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_mout_g2d1_list,
> + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_mout_g2d1_list),
> +};
> +
> +static struct clksrc_clk clk_mout_g2d1 =3D {
> + =A0 =A0 =A0 .clk =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mout_g2d1",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D &clkset_mout_g2d1,
> + =A0 =A0 =A0 .reg_src =A0 =A0 =A0 =A0=3D { .reg =3D S5P_CLKSRC_IMAGE, .s=
hift =3D 4, .size =3D 1 },
> +};
> +
> +static struct clk *clkset_mout_g2d_list[] =3D {
> + =A0 =A0 =A0 [0] =3D &clk_mout_g2d0.clk,
> + =A0 =A0 =A0 [1] =3D &clk_mout_g2d1.clk,
> +};
> +
> +static struct clksrc_sources clkset_mout_g2d =3D {
> + =A0 =A0 =A0 .sources =A0 =A0 =A0 =A0=3D clkset_mout_g2d_list,
> + =A0 =A0 =A0 .nr_sources =A0 =A0 =3D ARRAY_SIZE(clkset_mout_g2d_list),
> +};
> +
> =A0static struct clksrc_clk clk_dout_mmc0 =3D {
> =A0 =A0 =A0 =A0.clk =A0 =A0 =A0 =A0 =A0 =A0=3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "dout_mmc0",
> @@ -672,6 +744,8 @@ static struct clksrc_clk *sysclks[] =3D {
> =A0 =A0 =A0 =A0&clk_aclk_100,
> =A0 =A0 =A0 =A0&clk_aclk_160,
> =A0 =A0 =A0 =A0&clk_aclk_133,
> + =A0 =A0 =A0 &clk_sclk_mipidphy4l,
> + =A0 =A0 =A0 &clk_sclk_mipidphy2l,
> =A0 =A0 =A0 =A0&clk_dout_mmc0,
> =A0 =A0 =A0 =A0&clk_dout_mmc1,
> =A0 =A0 =A0 =A0&clk_dout_mmc2,
> --
> 1.6.2.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>



-- =

MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
