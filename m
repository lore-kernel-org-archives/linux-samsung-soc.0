From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] clk/samsung: Clear OF_POPULATED flag from clkout node in
 init callback
Date: Tue, 25 Oct 2016 11:16:20 -0300
Message-ID: <6a1165ff-e169-09f7-6ee6-c5d368d042ae@osg.samsung.com>
References: <CGME20161025123519eucas1p1f8d2efba82ebd101e8fa0697a5708a28@eucas1p1.samsung.com>
 <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:38608
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755300AbcJYOQa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Oct 2016 10:16:30 -0400
In-Reply-To: <1477398861-2270-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hello Marek,

On 10/25/2016 09:34 AM, Marek Szyprowski wrote:
> The Exynos PMU node is an interrupt, clock and PMU (Power Management Unit)
> controller, and these functionalities are supported by different drivers
> that matches the same compatible strings.
> 
> Since commit 989eafd0b609 ("clk: core: Avoid double initialization of
> clocks") the OF core flags clock controllers registered with the
> CLK_OF_DECLARE() macro as OF_POPULATED, so platform devices with the same
> compatible string as the interrupt controller will not be registered.
> 
> This prevents the PMU platform device to be registered so the Exynos PMU
> driver is never probed. This breaks (among other things) Suspend-to-RAM.
> 
> Fix this by clearing the OF_POPULATED flag in the clkout driver init
> callback, to allow the Exynos PMU platform driver to be probed. The patch
> is based on similar patch from Javier Martinez Canillas: b030485220ca
> "ARM: EXYNOS: Clear OF_POPULATED flag from PMU node in IRQ init callback".
> 
> Fixes: 989eafd0b609 ("clk: core: Avoid double initialization of clocks")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

The patch looks good to me:

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

I've also tested it on an Exynos5800 Peach Pi, the PMU driver is probed
and S2R works correctly:

Tested-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
