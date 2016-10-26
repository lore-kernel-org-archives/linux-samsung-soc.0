From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2] clk/samsung: Use CLK_OF_DECLARE_DRIVER initialization
 method for CLKOUT
Date: Wed, 26 Oct 2016 07:12:43 -0300
Message-ID: <c5016b20-cf1f-2d9a-a4af-b79a53b3d617@osg.samsung.com>
References: <CGME20161026061227eucas1p20fb865eafd802044ed79ce336fa90eab@eucas1p2.samsung.com>
 <1477462340-7867-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1477462340-7867-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 10/26/2016 03:12 AM, Marek Szyprowski wrote:
> The Exynos PMU node is an interrupt, clock and PMU (Power Management Unit)
> controller, and these functionalities are supported by different drivers
> that matches the same compatible strings.
> 
> Since commit 989eafd0b609 ("clk: core: Avoid double initialization of
> clocks") the OF core flags clock controllers registered with the
> CLK_OF_DECLARE() macro as OF_POPULATED, so platform devices with the same
> compatible string will not be registered.
> 
> This prevents the PMU platform device to be created, so the Exynos PMU
> driver is never probed. This breaks (among other things) Suspend-to-RAM.
> 
> Fix this by changing CLKOUT driver initialization method to
> CLK_OF_DECLARE_DRIVER(), which doesn't clear the OF_POPULATED flag, so
> later a platform device is created and the Exynos PMU platform driver
> can be be probed properly.
> 
> Fixes: 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Changelog:
> v2:
> - switched to CLK_OF_DECLARE_DRIVER instead of calling
>   of_node_clear_flag(node, OF_POPULATED) as suggested by Stephen Boyd
>

I was not aware about this new macro and certainly looks like a better
option. The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
