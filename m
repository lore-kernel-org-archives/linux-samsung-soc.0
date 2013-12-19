From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: exynos: File scope reg_save array should depend on PM_SLEEP
Date: Wed, 18 Dec 2013 23:55:10 -0800
Message-ID: <20131219075510.18119.67210@quantum>
References: <1387274199-470-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387274199-470-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, Tomasz Figa <t.figa@samsung.com>Krzysztof Kozlowski <k.kozlowski@samsung.com>, James Hogan <james.hogan@imgtec.com>, Padmavathi Venna <padma.v@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Krzysztof Kozlowski (2013-12-17 01:56:39)
> Move reg_save[] into CONFIG_PM_SLEEP dependency block as it is used o=
nly
> by suspend and resume functions.
>=20
> This fixes the warning on CONFIG_PM_SLEEP=3Dn:
> drivers/clk/samsung/clk-exynos-audss.c:29:22: warning: =E2=80=98reg_s=
ave=E2=80=99 defined but not used [-Wunused-variable]
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Acked-by: Mike Turquette <mturquette@linaro.org>

> ---
>  drivers/clk/samsung/clk-exynos-audss.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/sam=
sung/clk-exynos-audss.c
> index 39b40aaede2b..68e515d093d8 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -26,17 +26,17 @@ static struct clk_onecell_data clk_data;
>  #define ASS_CLK_DIV 0x4
>  #define ASS_CLK_GATE 0x8
> =20
> +/* list of all parent clock list */
> +static const char *mout_audss_p[] =3D { "fin_pll", "fout_epll" };
> +static const char *mout_i2s_p[] =3D { "mout_audss", "cdclk0", "sclk_=
audio0" };
> +
> +#ifdef CONFIG_PM_SLEEP
>  static unsigned long reg_save[][2] =3D {
>         {ASS_CLK_SRC,  0},
>         {ASS_CLK_DIV,  0},
>         {ASS_CLK_GATE, 0},
>  };
> =20
> -/* list of all parent clock list */
> -static const char *mout_audss_p[] =3D { "fin_pll", "fout_epll" };
> -static const char *mout_i2s_p[] =3D { "mout_audss", "cdclk0", "sclk_=
audio0" };
> -
> -#ifdef CONFIG_PM_SLEEP
>  static int exynos_audss_clk_suspend(void)
>  {
>         int i;
> --=20
> 1.7.9.5
>=20
