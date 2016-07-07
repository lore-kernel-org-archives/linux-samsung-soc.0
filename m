From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly
 non-modular
Date: Thu, 07 Jul 2016 15:12:30 +0200
Message-ID: <577E553E.5020801@samsung.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-7-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <20160704211220.5685-7-paul.gortmaker@windriver.com>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

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
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---

>  #include <dt-bindings/clock/exynos-audss-clk.h>
> @@ -278,14 +278,3 @@ static int __init exynos_audss_clk_init(void)
>  	return platform_driver_register(&exynos_audss_clk_driver);
>  }
>  core_initcall(exynos_audss_clk_init);

Thanks for the patch.  I will try to get rid of the above initcall 
instead of removing module support.  Any clock dependencies should 
now be handled properly with deferred probing.  And the module support 
will be useful since the audss clock controller is present only 
on selected Exynos SoC variants.


