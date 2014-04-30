From: Alim Akhtar <alim.akhtar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 16/16] clk: exynos5420: add more registers to restore list
Date: Wed, 30 Apr 2014 19:26:10 +0530
Message-ID: <CAGOxZ52zupKFk444ZEue_SinsiaUxchYGfEvH7BamT=zue_RvA@mail.gmail.com>
References: <1398344632-18623-1-git-send-email-shaik.ameer@samsung.com> <1398344632-18623-17-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398344632-18623-17-git-send-email-shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Ameer Basha Shaik <shaik.samsung-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sunil joshi <joshi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rahul Sharma <r.sh.open-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Shaik

On Thu, Apr 24, 2014 at 6:33 PM, Shaik Ameer Basha
<shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> This patch adds more register offsets to the restore list.
>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>  drivers/clk/samsung/clk-exynos5420.c |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 33a48d2..6dfd3fd 100755
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -27,6 +27,7 @@
>  #define DIV_CPU1               0x504
>  #define GATE_BUS_CPU           0x700
>  #define GATE_SCLK_CPU          0x800
> +#define CLKOUT_CMU_CPU         0xa00
>  #define GATE_IP_G2D            0x8800
>  #define CPLL_LOCK              0x10020
>  #define DPLL_LOCK              0x10030
> @@ -39,7 +40,11 @@
>  #define CPLL_CON0              0x10120
>  #define DPLL_CON0              0x10128
>  #define EPLL_CON0              0x10130
> +#define EPLL_CON1              0x10134
> +#define EPLL_CON2              0x10138
>  #define RPLL_CON0              0x10140
> +#define RPLL_CON1              0x10144
> +#define RPLL_CON2              0x10148
>  #define IPLL_CON0              0x10150
>  #define SPLL_CON0              0x10160
>  #define VPLL_CON0              0x10170
> @@ -139,6 +144,13 @@ static unsigned long exynos5420_clk_regs[] __initdata = {
>         DIV_CPU1,
>         GATE_BUS_CPU,
>         GATE_SCLK_CPU,
> +       CLKOUT_CMU_CPU,
> +       EPLL_CON0,
> +       EPLL_CON1,
> +       EPLL_CON2,
> +       RPLL_CON0,
> +       RPLL_CON1,
> +       RPLL_CON2,
>         SRC_TOP0,
>         SRC_TOP1,
>         SRC_TOP2,
> --
> 1.7.9.5
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Regards,
Alim
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
