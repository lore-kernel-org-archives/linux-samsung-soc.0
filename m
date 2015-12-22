From: Mike Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] clk/samsung updates for v4.5
Date: Tue, 22 Dec 2015 10:38:16 -0800
Message-ID: <20151222183816.GC6596@quark.deferred.io>
References: <5671A456.9030203@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5671A456.9030203@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester,

On 12/16, Sylwester Nawrocki wrote:
> 
> The following changes since commit 9f9499ae8e6415cefc4fe0a96ad0e27864353c89:
> 
>   Linux 4.4-rc5 (2015-12-13 17:42:58 -0800)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-4.5

Pulled.

Was it necessary to base on -rc5? That required me to update my tree
from -rc1.

This is not difficult, but it is a bit annoying when it is not strictly
necessary just to take one PR.

Regards,
Mike

> 
> for you to fetch changes up to c5e949c1c24d67ae2813afdf02408a9b0c6fe55c:
> 
>   clk: s3c2410: removed unneeded variable in s3c24xx_clkout_set_parent (2015-12-16 16:36:04 +0100)
> 
> ----------------------------------------------------------------
> drivers/clk/samsung updates (mostly bug fixes):
>  - instantiation of the cpu clocks and addition of the GSCL
>    IP parent clocks to the list of available consumer clocks
>    for exynos542x SoCs;
>  - MFC IP parent clock fix for exynos542x;
>  - fix of locking bug in samsung/clk-cpu.c which caused
>    system crashes with cpufreq enabled;
>  - minor cleanup for s3c2410.
> 
> ----------------------------------------------------------------
> Bartlomiej Zolnierkiewicz (1):
>       clk: samsung: exynos542x/5800: fix cpu clock configuration data
> 
> Marek Szyprowski (3):
>       clk: samsung: exynos542x: add missing parent GSCL block clocks
>       clk: samsung: exynos542x: fix MFC clock hierarchy parent
>       clk: exynos: use irqsave version of spin_lock to avoid deadlock with irqs
> 
> Prasanna Karthik (1):
>       clk: s3c2410: removed unneeded variable in s3c24xx_clkout_set_parent
> 
> Thomas Abraham (1):
>       clk: samsung: exynos5420: add cpu clock configuration data and instantiate cpu clock
> 
>  drivers/clk/samsung/clk-cpu.c          |   10 ++--
>  drivers/clk/samsung/clk-exynos5420.c   |   98 +++++++++++++++++++++++++++++---
>  drivers/clk/samsung/clk-s3c2410-dclk.c |    3 +-
>  include/dt-bindings/clock/exynos5420.h |    4 ++
>  4 files changed, 102 insertions(+), 13 deletions(-)
> 
> -- 
> Thanks,
> Sylwester
