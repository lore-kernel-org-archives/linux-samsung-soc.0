From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 00/16] Exynos clock clean-up for 3.12
Date: Fri, 30 Aug 2013 15:51:20 +0200
Message-ID: <1920907.Hu7ncHu6EC@amdc1227>
References: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:26264 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752329Ab3H3Nv1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Aug 2013 09:51:27 -0400
In-reply-to: <1377536951-9307-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Abraham <thomas.abraham@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Doug Anderson <dianders@chromium.org>, Kumar Gala <galak@codeaurora.org>

Hi Mike,

On Monday 26 of August 2013 19:08:55 Tomasz Figa wrote:
> This series fixes various functional and non-functional (e.g. stylistic)
> issues in Common Clock Framework drivers for Samsung Exynos SoCs. See
> particular patches for more detailed descriptions.
> 
> Changes since v1:
> [http://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg21665.h
> tml] - Addressed comments from Yadwinder Singh Brar:
>    - added missing __initdata keywords,
>    - various typoes fixed,
>    - other minor stylistic improvements.
> 
> Tomasz Figa (16):
>   pwm: samsung: Update DT bindings documentation to cover clocks
>   ARM: dts: exynos4: Specify PWM clocks in PWM node
>   clocksource: samsung_pwm_timer: Get clock from device tree
>   clk: samsung: exynos4: Use separate aliases for cpufreq related clocks
>   clk: samsung: Modify _get_rate() helper to use __clk_lookup()
>   clk: samsung: exynos4: Remove unused static clkdev aliases
>   clk: samsung: exynos4: Remove checks for DT node
>   clk: samsung: exynos4: Rename exynos4_plls to exynos4x12_plls
>   clk: samsung: pll: Use new registration method for PLL45xx
>   clk: samsung: pll: Add support for rate configuration of PLL45xx
>   clk: samsung: pll: Use new registration method for PLL46xx
>   clk: samsung: pll: Add support for rate configuration of PLL46xx
>   clk: samsung: exynos4: Reorder registration of mout_vpllsrc
>   clk: samsung: exynos4: Register PLL rate tables for Exynos4210
>   clk: samsung: exynos4: Register PLL rate tables for Exynos4x12
>   clk: samsung: exynos5250: Simplify registration of PLL rate tables
> 
>  .../devicetree/bindings/pwm/pwm-samsung.txt        |  12 +
>  arch/arm/boot/dts/exynos4.dtsi                     |   2 +
>  drivers/clk/samsung/clk-exynos4.c                  | 539
> ++++++++++++--------- drivers/clk/samsung/clk-exynos5250.c              
> |  12 +-
>  drivers/clk/samsung/clk-exynos5440.c               |   2 +-
>  drivers/clk/samsung/clk-pll.c                      | 285 ++++++++---
>  drivers/clk/samsung/clk-pll.h                      |  59 ++-
>  drivers/clk/samsung/clk.c                          |  10 +-
>  drivers/clocksource/samsung_pwm_timer.c            |  12 +-
>  9 files changed, 602 insertions(+), 331 deletions(-)

Any chance to still have this merged for 3.12? AFAIK this should apply 
cleanly on your clk-next without any dependencies from other trees.

Best regards,
Tomasz
