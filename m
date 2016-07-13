From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 07/10] clk: samsung: make clk-s5pv210-audss explicitly non-modular
Date: Wed, 13 Jul 2016 14:59:07 -0700
Message-ID: <146844714723.73491.8115500341908237496@resonance>
References: <20160704211220.5685-1-paul.gortmaker@windriver.com>
 <20160704211220.5685-8-paul.gortmaker@windriver.com>
 <578618CA.8090808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <578618CA.8090808@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2016-07-13 03:32:42)
> On 07/04/2016 11:12 PM, Paul Gortmaker wrote:
> > The Kconfig currently controlling compilation of this code is:
> > 
> > arch/arm/mach-s5pv210/Kconfig:config ARCH_S5PV210
> > arch/arm/mach-s5pv210/Kconfig:  bool "Samsung S5PV210/S5PC110" if ARCH_MULTI_V7
> > 
> > ...meaning that it currently is not being built as a module by anyone.
> > 
> > Lets remove the modular code that is essentially orphaned, so that
> > when reading the driver there is no doubt it is builtin-only.
> > 
> > We explicitly disallow a driver unbind, since that doesn't have a
> > sensible use case anyway, and it allows us to drop the ".remove"
> > code for non-modular drivers.
> > 
> > Since this code is already not using module_init, case, the init
> > ordering remains unchanged with this commit.
> > 
> > We also delete the MODULE_LICENSE tags etc. since all that information
> > is already contained at the top of the file in the comments.
> > 
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> 
> In case this is going to be applied directly to current clk-next:
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 

Applied to clk-next.

I know that we normally take PRs for the samsung clk stuff, but this
late in the cycle I'm OK to simply pick individual patches.

Thanks,
Mike
