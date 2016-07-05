From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly
 non-modular
Date: Tue, 05 Jul 2016 11:04:46 +0200
Message-ID: <577B782E.9090203@samsung.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-7-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51232 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751248AbcGEJEw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 05:04:52 -0400
In-reply-to: <20160704211220.5685-7-paul.gortmaker@windriver.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org

On 07/04/2016 11:12 PM, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> arch/arm/mach-exynos/Kconfig:menuconfig ARCH_EXYNOS
> arch/arm/mach-exynos/Kconfig:   bool "Samsung EXYNOS" if ARCH_MULTI_V7
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the couple traces of modularity so that when reading the
> driver there is no doubt it is builtin-only.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Since module_init was already not used by this code, the init ordering
> remains unchanged with this commit.
> 
> We also delete the MODULE_LICENSE tags etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Padmavathi Venna <padma.v@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index 4e9584d79089..42b62f865198 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -15,7 +15,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/of_address.h>
>  #include <linux/syscore_ops.h>
> -#include <linux/module.h>
> +#include <linux/init.h>
>  #include <linux/platform_device.h>
>  
>  #include <dt-bindings/clock/exynos-audss-clk.h>
> @@ -278,14 +278,3 @@ static int __init exynos_audss_clk_init(void)
>  	return platform_driver_register(&exynos_audss_clk_driver);
>  }
>  core_initcall(exynos_audss_clk_init);
> -
> -static void __exit exynos_audss_clk_exit(void)
> -{
> -	platform_driver_unregister(&exynos_audss_clk_driver);
> -}
> -module_exit(exynos_audss_clk_exit);
> -
> -MODULE_AUTHOR("Padmavathi Venna <padma.v@samsung.com>");
> -MODULE_DESCRIPTION("Exynos Audio Subsystem Clock Controller");
> -MODULE_LICENSE("GPL v2");
> -MODULE_ALIAS("platform:exynos-audss-clk");

Why not removing .remove() callback as well?

I don't find sysfs unbind hook useful except testing the exit paths...
which in that case do not exist anymore (there is no "modprobe -r" for
it anyway).

Best regards,
Krzysztof
