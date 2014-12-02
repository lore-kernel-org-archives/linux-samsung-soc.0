From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos4415: Fix build with PM_SLEEP disabled
Date: Tue, 02 Dec 2014 10:53:32 +0900
Message-ID: <547D1B9C.9030900@samsung.com>
References: <1417425174-26694-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47943 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753424AbaLBBxf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Dec 2014 20:53:35 -0500
In-reply-to: <1417425174-26694-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 12/01/2014 06:12 PM, Krzysztof Kozlowski wrote:
> Fix following build errors when PM_SLEEP is disabled (e.g. by disabli=
ng
> SUSPEND and HIBERNATION):
>=20
> drivers/clk/samsung/clk-exynos4415.c: In function =E2=80=98exynos4415=
_cmu_init=E2=80=99:
> drivers/clk/samsung/clk-exynos4415.c:982:2: error: =E2=80=98exynos441=
5_ctx=E2=80=99 undeclared (first use in this function)
> drivers/clk/samsung/clk-exynos4415.c:982:2: note: each undeclared ide=
ntifier is reported only once for each function it appears in
> drivers/clk/samsung/clk-exynos4415.c: In function =E2=80=98exynos4415=
_cmu_dmc_init=E2=80=99:
> drivers/clk/samsung/clk-exynos4415.c:1123:2: error: =E2=80=98exynos44=
15_dmc_ctx=E2=80=99 undeclared (first use in this function)
> make[3]: *** [drivers/clk/samsung/clk-exynos4415.o] Error 1
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos4415.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/samsung/clk-exynos4415.c b/drivers/clk/samsu=
ng/clk-exynos4415.c
> index c7208c7a3add..2123fc251e0f 100644
> --- a/drivers/clk/samsung/clk-exynos4415.c
> +++ b/drivers/clk/samsung/clk-exynos4415.c
> @@ -118,12 +118,13 @@ enum exynos4415_plls {
>  	nr_plls,
>  };
> =20
> +static struct samsung_clk_provider *exynos4415_ctx;
> +
>  /*
>   * Support for CMU save/restore across system suspends
>   */
>  #ifdef CONFIG_PM_SLEEP
>  static struct samsung_clk_reg_dump *exynos4415_clk_regs;
> -static struct samsung_clk_provider *exynos4415_ctx;
> =20
>  static unsigned long exynos4415_cmu_clk_regs[] __initdata =3D {
>  	SRC_LEFTBUS,
> @@ -1031,9 +1032,10 @@ enum exynos4415_dmc_plls {
>  	nr_dmc_plls,
>  };
> =20
> +static struct samsung_clk_provider *exynos4415_dmc_ctx;
> +
>  #ifdef CONFIG_PM_SLEEP
>  static struct samsung_clk_reg_dump *exynos4415_dmc_clk_regs;
> -static struct samsung_clk_provider *exynos4415_dmc_ctx;
> =20
>  static unsigned long exynos4415_cmu_dmc_clk_regs[] __initdata =3D {
>  	MPLL_LOCK,
>=20

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks,
Chanwoo Choi
