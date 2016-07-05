From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly
 non-modular
Date: Tue, 5 Jul 2016 09:32:16 -0400
Message-ID: <20160705133216.GC26134@windriver.com>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-7-paul.gortmaker@windriver.com>
 <577B782E.9090203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <577B782E.9090203@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

[Re: [PATCH 06/10] clk: samsung make clk-exynos-audss explicitly non-modular] On 05/07/2016 (Tue 11:04) Krzysztof Kozlowski wrote:

> On 07/04/2016 11:12 PM, Paul Gortmaker wrote:
> > The Kconfig currently controlling compilation of this code is:
> > 
> > arch/arm/mach-exynos/Kconfig:menuconfig ARCH_EXYNOS
> > arch/arm/mach-exynos/Kconfig:   bool "Samsung EXYNOS" if ARCH_MULTI_V7
> > 
> > ...meaning that it currently is not being built as a module by anyone.
> > 
> > Lets remove the couple traces of modularity so that when reading the
> > driver there is no doubt it is builtin-only.
> > 
> > Lets remove the modular code that is essentially orphaned, so that
> > when reading the driver there is no doubt it is builtin-only.
> > 

[...]

> > -MODULE_DESCRIPTION("Exynos Audio Subsystem Clock Controller");
> > -MODULE_LICENSE("GPL v2");
> > -MODULE_ALIAS("platform:exynos-audss-clk");
> 
> Why not removing .remove() callback as well?
> 
> I don't find sysfs unbind hook useful except testing the exit paths...
> which in that case do not exist anymore (there is no "modprobe -r" for
> it anyway).

Yes, I normally delete the .remove callbacks as indicated in the 0/10,
but somehow I overlooked this one.   Thanks for spotting it.  I'll
delete it and disable the sysfs bind in v2.

Paul.
--

> 
> Best regards,
> Krzysztof
> 
