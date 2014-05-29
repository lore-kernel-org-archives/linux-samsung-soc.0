From: Arun Kumar K <arun.kk@samsung.com>
Subject: Re: [PATCH v2 1/3] ARM: EXYNOS: Add support for clock handling in
 power domain
Date: Thu, 29 May 2014 15:11:09 +0530
Message-ID: <CALt3h79dkoZY9px25ESKqPJDcu4Kp=6dVmiBBDct7666E_Q3mw@mail.gmail.com>
References: <1401105384-8678-1-git-send-email-shaik.ameer@samsung.com>
	<1401105384-8678-2-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f176.google.com ([209.85.220.176]:34458 "EHLO
	mail-vc0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756119AbaE2JlL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 05:41:11 -0400
In-Reply-To: <1401105384-8678-2-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, prathyush.k@samsung.com, abrestic@chromium.org, sunil joshi <joshi@samsung.com>

Hi,

Can we have DT maintainers Ack for this binding change?

Regards
Arun

On Mon, May 26, 2014 at 5:26 PM, Shaik Ameer Basha
<shaik.ameer@samsung.com> wrote:
> From: Prathyush K <prathyush.k@samsung.com>
>
> While powering on/off a local powerdomain in exynos5 chipsets, the input
> clocks to each device gets modified. This behaviour is based on the
> SYSCLK_SYS_PWR_REG registers.
> E.g. SYSCLK_MFC_SYS_PWR_REG = 0x0, the parent of input clock to MFC
>                                    (aclk333) gets modified to oscclk
>                             = 0x1, no change in clocks.
> The recommended value of SYSCLK_SYS_PWR_REG before power gating any
> domain is 0x0. So we must also restore the clocks while powering on a
> domain everytime.
>
> This patch adds the framework for getting the required mux and parent clocks
> through a power domain device node. With this patch, while powering off
> a domain, parent is set to oscclk and while powering back on, its re-set
> to the correct parent which is as per the recommended pd on/off
> sequence.
>
> Signed-off-by: Prathyush K <prathyush.k@samsung.com>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  .../bindings/arm/exynos/power_domain.txt           |   20 +++++++
>  arch/arm/mach-exynos/pm_domains.c                  |   59 +++++++++++++++++++-
>  2 files changed, 78 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> index 5216b41..8b4f7b7f 100644
> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
> @@ -9,6 +9,18 @@ Required Properties:
>  - reg: physical base address of the controller and length of memory mapped
>      region.
>
> +Optional Properties:
> +- clocks: List of clock handles. The parent clocks of the input clocks to the
> +       devices in this power domain are set to oscclk before power gating
> +       and restored back after powering on a domain. This is required for
> +       all domains which are powered on and off and not required for unused
> +       domains.
> +- clock-names: The following clocks can be specified:
> +       - oscclk: Oscillator clock.
> +       - pclkN, clkN: Pairs of parent of input clock and input clock to the
> +               devices in this power domain. Maximum of 4 pairs (N = 0 to 3)
> +               are supported currently.
> +
>  Node of a device using power domains must have a samsung,power-domain property
>  defined with a phandle to respective power domain.
>
> @@ -19,6 +31,14 @@ Example:
>                 reg = <0x10023C00 0x10>;
>         };
>
> +       mfc_pd: power-domain@10044060 {
> +               compatible = "samsung,exynos4210-pd";
> +               reg = <0x10044060 0x20>;
> +               clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MOUT_SW_ACLK333>,
> +                       <&clock CLK_MOUT_USER_ACLK333>;
> +               clock-names = "oscclk", "pclk0", "clk0";
> +       };
> +
>  Example of the node using power domain:
>
>         node {
> diff --git a/arch/arm/mach-exynos/pm_domains.c b/arch/arm/mach-exynos/pm_domains.c
> index fe6570e..34d86b1 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -17,6 +17,7 @@
>  #include <linux/err.h>
>  #include <linux/slab.h>
>  #include <linux/pm_domain.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> @@ -24,6 +25,8 @@
>
>  #include "regs-pmu.h"
>
> +#define MAX_CLK_PER_DOMAIN                     4
> +
>  /*
>   * Exynos specific wrapper around the generic power domain
>   */
> @@ -32,6 +35,9 @@ struct exynos_pm_domain {
>         char const *name;
>         bool is_off;
>         struct generic_pm_domain pd;
> +       struct clk *oscclk;
> +       struct clk *clk[MAX_CLK_PER_DOMAIN];
> +       struct clk *pclk[MAX_CLK_PER_DOMAIN];
>  };
>
>  static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
> @@ -44,6 +50,18 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
>         pd = container_of(domain, struct exynos_pm_domain, pd);
>         base = pd->base;
>
> +       /* Set oscclk before powering off a domain*/
> +       if (!power_on) {
> +               int i;
> +               for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
> +                       if (IS_ERR(pd->clk[i]))
> +                               break;
> +                       if (clk_set_parent(pd->clk[i], pd->oscclk))
> +                               pr_err("%s: error setting oscclk as parent to clock %d\n",
> +                                               pd->name, i);
> +               }
> +       }
> +
>         pwr = power_on ? S5P_INT_LOCAL_PWR_EN : 0;
>         __raw_writel(pwr, base);
>
> @@ -60,6 +78,19 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
>                 cpu_relax();
>                 usleep_range(80, 100);
>         }
> +
> +       /* Restore clocks after powering on a domain*/
> +       if (power_on) {
> +               int i;
> +               for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
> +                       if (IS_ERR(pd->clk[i]))
> +                               break;
> +                       if (clk_set_parent(pd->clk[i], pd->pclk[i]))
> +                               pr_err("%s: error setting parent to clock%d\n",
> +                                               pd->name, i);
> +               }
> +       }
> +
>         return 0;
>  }
>
> @@ -152,9 +183,11 @@ static __init int exynos4_pm_init_power_domain(void)
>
>         for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
>                 struct exynos_pm_domain *pd;
> -               int on;
> +               int on, i;
> +               struct device *dev;
>
>                 pdev = of_find_device_by_node(np);
> +               dev = &pdev->dev;
>
>                 pd = kzalloc(sizeof(*pd), GFP_KERNEL);
>                 if (!pd) {
> @@ -170,6 +203,30 @@ static __init int exynos4_pm_init_power_domain(void)
>                 pd->pd.power_on = exynos_pd_power_on;
>                 pd->pd.of_node = np;
>
> +               pd->oscclk = clk_get(dev, "oscclk");
> +               if (IS_ERR(pd->oscclk))
> +                       goto no_clk;
> +
> +               for (i = 0; i < MAX_CLK_PER_DOMAIN; i++) {
> +                       char clk_name[8];
> +
> +                       snprintf(clk_name, sizeof(clk_name), "clk%d", i);
> +                       pd->clk[i] = clk_get(dev, clk_name);
> +                       if (IS_ERR(pd->clk[i]))
> +                               break;
> +                       snprintf(clk_name, sizeof(clk_name), "pclk%d", i);
> +                       pd->pclk[i] = clk_get(dev, clk_name);
> +                       if (IS_ERR(pd->pclk[i])) {
> +                               clk_put(pd->clk[i]);
> +                               pd->clk[i] = ERR_PTR(-EINVAL);
> +                               break;
> +                       }
> +               }
> +
> +               if (IS_ERR(pd->clk[0]))
> +                       clk_put(pd->oscclk);
> +
> +no_clk:
>                 platform_set_drvdata(pdev, pd);
>
>                 on = __raw_readl(pd->base + 0x4) & S5P_INT_LOCAL_PWR_EN;
> --
> 1.7.9.5
>
