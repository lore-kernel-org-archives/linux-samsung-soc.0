From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: samsung: clk-exynos-audss: Fix module autoload
Date: Mon, 17 Oct 2016 15:21:50 -0700
Message-ID: <20161017222150.GE8871@codeaurora.org>
References: <1476625507-21377-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1476625507-21377-1-git-send-email-javier@osg.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 10/16, Javier Martinez Canillas wrote:
> If the driver is built as a module, autoload won't work because the module
> alias information is not filled. So user-space can't match the registered
> device with the corresponding module.
> 
> Export the module alias information using the MODULE_DEVICE_TABLE() macro.
> 
> Before this patch:
> 
> $ modinfo drivers/clk/samsung/clk-exynos-audss.ko | grep alias
> alias:          platform:exynos-audss-clk
> 
> After this patch:
> 
> $ modinfo drivers/clk/samsung/clk-exynos-audss.ko | grep alias
> alias:          platform:exynos-audss-clk
> alias:          of:N*T*Csamsung,exynos5420-audss-clockC*
> alias:          of:N*T*Csamsung,exynos5420-audss-clock
> alias:          of:N*T*Csamsung,exynos5410-audss-clockC*
> alias:          of:N*T*Csamsung,exynos5410-audss-clock
> alias:          of:N*T*Csamsung,exynos5250-audss-clockC*
> alias:          of:N*T*Csamsung,exynos5250-audss-clock
> alias:          of:N*T*Csamsung,exynos4210-audss-clockC*
> alias:          of:N*T*Csamsung,exynos4210-audss-clock
> 
> Fixes: 4d252fd5719b ("clk: samsung: Allow modular build of the Audio Subsystem CLKCON driver")
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Tested-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---

Applied to clk-fixes

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
