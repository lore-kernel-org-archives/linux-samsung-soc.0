From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [GIT PULL] clk/samsung: clk support for Exynos 5433 SoC
Date: Tue, 24 Feb 2015 08:48:23 +0900
Message-ID: <54EBBC47.4090801@samsung.com>
References: <54D3C820.2010800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54D3C820.2010800@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Dear Mike and Sylwester,

This pull-request was not merged on Linux 4.0-rc1.
Did you have any plan about it?

Best Regards,
Chanwoo Choi

On 02/06/2015 04:44 AM, Sylwester Nawrocki wrote:
> Hi Mike,
> 
> This pull request includes driver for clock controller of the Exynos 
> 5433 SoC.  As the hardware is quite complex, with many peripherals and 
> corresponding clock management units the driver is rather huge.  I guess 
> it will require a bit more cleanups than last time to balance lines 
> introduced in this patch set... Please review and pull if it looks OK.
> 
> The following changes since commit e64fb42da4c6c713cfc7cad607e97e0773fa41ff:
> 
>   clk: samsung: exynos4: Add divider clock id for memory bus frequency 
> (2015-01-28 15:51:17 +0100)
> 
> are available in the git repository at:
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/v3.20-exynos5433-clk
> 
> for you to fetch changes up to b2f0e5f28e0686c0d5db238357a2e32555e97633:
> 
>   clk: samsung: exynos5433: Move CLK_SCLK_HDMI_SPDIF_DISP clock to CMU_TOP 
> domain (2015-02-05 19:31:09 +0100)
> 
> ----------------------------------------------------------------
> Clock controller driver for Exynos 5433 SoC.
> 
> ----------------------------------------------------------------
> Chanwoo Choi (22):
>       clk: samsung: exynos5433: Add binding document for Exynos5433 clock domains
>       clk: samsung: exynos5433: Add clocks using common clock framework
>       clk: samsung: exynos5433: Add MUX clocks of CMU_TOP domain
>       clk: samsung: exynos5433: Add clocks for CMU_PERIC domain
>       clk: samsung: exynos5433: Add clocks for CMU_PERIS domain
>       clk: samsung: exynos5433: Add clocks for CMU_G2D domain
>       clk: samsung: exynos5433: Add clocks for CMU_MIF domain
>       clk: samsung: exynos5433: Add clocks for CMU_DISP domain
>       clk: samsung: exynos5433: Add clocks for CMU_AUD domain
>       clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains
>       clk: samsung: exynos5433: Add missing clocks for CMU_FSYS domain
>       clk: samsung: exynos5433: Add clocks for CMU_G3D domain
>       clk: samsung: exynos5433: Add clocks for CMU_GSCL domain
>       clk: samsung: exynos5433: Add clocks for CMU_APOLLO domain
>       clk: samsung: exynos5433: Add clocks for CMU_ATLAS domain
>       clk: samsung: exynos5433: Add clocks for CMU_MSCL domain
>       clk: samsung: exynos5433: Add clocks for CMU_MFC domain
>       clk: samsung: exynos5433: Add clocks for CMU_HEVC domain
>       clk: samsung: exynos5433: Add clocks for CMU_ISP domain
>       clk: samsung: exynos5433: Add clocks for CMU_CAM0 domain
>       clk: samsung: exynos5433: Add clocks for CMU_CAM1 domain
>       clk: samsung: exynos5433: Move CLK_SCLK_HDMI_SPDIF_DISP clock to CMU_TOP domain
> 
> Inha Song (1):
>       clk: samsung: Add CLKOUT driver support for Exynos5433 SoC
> 
>  .../devicetree/bindings/clock/exynos5433-clock.txt |  462 ++
>  drivers/clk/samsung/Makefile                       |    1 +
>  drivers/clk/samsung/clk-exynos-clkout.c            |    2 +
>  drivers/clk/samsung/clk-exynos5433.c               | 5423 ++++++++++++++++++++
>  include/dt-bindings/clock/exynos5433.h             | 1403 +++++
>  5 files changed, 7291 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>  create mode 100644 drivers/clk/samsung/clk-exynos5433.c
>  create mode 100644 include/dt-bindings/clock/exynos5433.h
> 
