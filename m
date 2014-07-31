From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH 2/3] clk: exynos5410: Add suspend/resume handling
Date: Thu, 31 Jul 2014 11:34:57 +0530
Message-ID: <CAJuA9ai6m_Bf3CvCaU9hXZs4gL9YjKnceD5nMe9MCtffiN5gUQ@mail.gmail.com>
References: <1406730963-30658-1-git-send-email-hsnaves@gmail.com>
	<1406730963-30658-2-git-send-email-hsnaves@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f41.google.com ([209.85.215.41]:56520 "EHLO
	mail-la0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755783AbaGaGE7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 02:04:59 -0400
Received: by mail-la0-f41.google.com with SMTP id s18so1696467lam.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2014 23:04:57 -0700 (PDT)
In-Reply-To: <1406730963-30658-2-git-send-email-hsnaves@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Humberto Silva Naves <hsnaves@gmail.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>

Hi Humberto,

On Wed, Jul 30, 2014 at 8:06 PM, Humberto Silva Naves <hsnaves@gmail.com> wrote:
> This patch implements all the necessary code that handles register
> saving and restoring during a suspend/resume cycle.
>
> To make this possible, the local variable reg_base from the function
> exynos5410_clk_init was changed to global.
>
> Signed-off-by: Humberto Silva Naves <hsnaves@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos5410.c |  132 +++++++++++++++++++++++++++++++++-
>  1 file changed, 131 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
> index 72a533e..aaca65d 100644
> --- a/drivers/clk/samsung/clk-exynos5410.c
> +++ b/drivers/clk/samsung/clk-exynos5410.c
> @@ -16,6 +16,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/syscore_ops.h>
>
>  #include "clk.h"
>
> @@ -160,6 +161,134 @@ enum exynos5410_plls {
>         nr_plls                 /* number of PLLs */
>  };
>
> +static void __iomem *reg_base;
> +
> +#ifdef CONFIG_PM_SLEEP
> +static struct samsung_clk_reg_dump *exynos5410_save;
> +
> +/*
> + * list of controller registers to be saved and restored during a
> + * suspend/resume cycle.
> + */
> +static unsigned long exynos5410_clk_regs[] __initdata = {
> +       SRC_CDREX,
> +       SRC_CPERI0,
> +       SRC_CPERI1,
> +       SRC_CPU,
> +       SRC_DISP0_0,
> +       SRC_DISP0_1,
> +       SRC_DISP1_0,
> +       SRC_DISP1_1,
> +       SRC_FSYS,
> +       SRC_GSCL,
> +       SRC_KFC,
> +       SRC_MAU,
> +       SRC_PERIC0,
> +       SRC_PERIC1,
> +       SRC_TOP0,
> +       SRC_TOP1,
> +       SRC_TOP2,
> +       SRC_TOP3,
> +
> +       DIV_CDREX,
> +       DIV_CDREX2,
> +       DIV_CPU0,
> +       DIV_CPERI1,
> +       DIV_DISP0_0,
> +       DIV_DISP0_1,
> +       DIV_DISP1_0,
> +       DIV_DISP1_1,
> +       DIV_FSYS0,
> +       DIV_FSYS1,
> +       DIV_FSYS2,
> +       DIV_GEN,
> +       DIV_GSCL,
> +       DIV_G2D,
> +       DIV_KFC0,
> +       DIV_MAU,
> +       DIV_PERIC0,
> +       DIV_PERIC1,
> +       DIV_PERIC2,
> +       DIV_PERIC3,
> +       DIV_PERIC4,
> +       DIV_PERIC5,
> +       DIV_TOP0,
> +       DIV_TOP1,
> +       DIV_TOP2,
> +       DIV_TOP3,
> +
> +       GATE_BUS_DISP1,
> +       GATE_BUS_FSYS0,
> +
> +       GATE_IP_CDREX,
> +       GATE_IP_CORE,
> +       GATE_IP_DISP0,
> +       GATE_IP_DISP1,
> +       GATE_IP_FSYS,
> +       GATE_IP_GEN,
> +       GATE_IP_GSCL0,
> +       GATE_IP_GSCL1,
> +       GATE_IP_G2D,
> +       GATE_IP_G3D,
> +       GATE_IP_MFC,
> +       GATE_IP_PERIC,
> +       GATE_IP_PERIS,
> +
> +       GATE_TOP_SCLK_DISP1,
> +       GATE_TOP_SCLK_FSYS,
> +       GATE_TOP_SCLK_GSCL,
> +       GATE_TOP_SCLK_MAU,
> +       GATE_TOP_SCLK_PERIC,
> +
> +       GATE_BUS_DISP1,
> +       GATE_BUS_FSYS0,
> +
> +       GATE_SCLK_CPU,
> +
> +       SRC_MASK_DISP0_0,
> +       SRC_MASK_DISP1_0,
> +       SRC_MASK_FSYS,
> +       SRC_MASK_MAU,
> +       SRC_MASK_PERIC0,
> +       SRC_MASK_PERIC1,
> +};
> +
> +static int exynos5410_clk_suspend(void)
> +{
> +       samsung_clk_save(reg_base, exynos5410_save,
> +                               ARRAY_SIZE(exynos5410_clk_regs));
> +
> +       return 0;
> +}
> +
> +static void exynos5410_clk_resume(void)
> +{
> +       samsung_clk_restore(reg_base, exynos5410_save,
> +                               ARRAY_SIZE(exynos5410_clk_regs));
> +}
> +
> +static struct syscore_ops exynos5410_clk_syscore_ops = {
> +       .suspend = exynos5410_clk_suspend,
> +       .resume = exynos5410_clk_resume,
> +};
> +
> +static void exynos5410_clk_sleep_init(void)
> +{
> +       exynos5410_save = samsung_clk_alloc_reg_dump(exynos5410_clk_regs,
> +                                       ARRAY_SIZE(exynos5410_clk_regs));
> +       if (!exynos5410_save) {
> +               pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
> +                       __func__);
> +               return;
> +       }
> +
> +       register_syscore_ops(&exynos5410_clk_syscore_ops);
> +}
> +#else
> +static void exynos5410_clk_sleep_init(void) {}
> +#endif
> +
> +

Extra new line here can be removed.

>  /* list of all parent clocks */
>  PNAME(apll_p)          = { "fin_pll", "fout_apll", };
>  PNAME(bpll_p)          = { "fin_pll", "fout_bpll", };
> @@ -286,7 +415,6 @@ static struct samsung_pll_clock exynos5410_plls[nr_plls] __initdata = {
>  static void __init exynos5410_clk_init(struct device_node *np)
>  {
>         struct samsung_clk_provider *ctx;
> -       void __iomem *reg_base;
>
>         reg_base = of_iomap(np, 0);
>         if (!reg_base)
> @@ -304,6 +432,8 @@ static void __init exynos5410_clk_init(struct device_node *np)
>         samsung_clk_register_gate(ctx, exynos5410_gate_clks,
>                         ARRAY_SIZE(exynos5410_gate_clks));
>
> +       exynos5410_clk_sleep_init();
> +
>         samsung_clk_of_add_provider(np, ctx);
>
>         pr_debug("Exynos5410: clock setup completed.\n");
> --
> 1.7.10.4

Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>

>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
