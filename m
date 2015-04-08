From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/1] clk: exynos5420: Restore GATE_BUS_TOP on suspend
Date: Wed, 08 Apr 2015 11:06:48 +0200
Message-ID: <5524EFA8.6000800@samsung.com>
References: <1428471252-15872-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:21119 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751506AbbDHJGx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Apr 2015 05:06:53 -0400
In-reply-to: <1428471252-15872-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kevin Hilman <khilman@linaro.org>, Tyler Baker <tyler.baker@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On 08/04/15 07:34, Javier Martinez Canillas wrote:
> Commit ae43b3289186 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power
> Management support v12") added pm support for the pl330 dma driver but
> it makes the clock for the Exynos5420 MDMA0 DMA controller to be gated
> during suspend and this in turn makes its parent clock aclk266_g2d to
> be gated. But the clock needs to be ungated prior suspend to allow the
> system to be suspend and resumed correctly.
> 
> Add GATE_BUS_TOP register to the list of registers to be restored when
> the system enters into a suspend state so aclk266_g2d will be ungated.
> 
> Thanks to Abhilash Kesavan for figuring out that this was the issue.
> 
> Fixes: ae43b32 ("ARM: 8202/1: dmaengine: pl330: Add runtime Power Management support v12")
> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
> Tested-by: Kevin Hilman <khilman@linaro.org>
> Tested-by: Abhilash Kesavan <a.kesavan@samsung.com>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/clk/samsung/clk-exynos5420.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 07d666cc6a29..bea4a173eef5 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -271,6 +271,7 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
>  	{ .offset = SRC_MASK_PERIC0,		.value = 0x11111110, },
>  	{ .offset = SRC_MASK_PERIC1,		.value = 0x11111100, },
>  	{ .offset = SRC_MASK_ISP,		.value = 0x11111000, },
> +	{ .offset = GATE_BUS_TOP,		.value = 0xffffffff, },
>  	{ .offset = GATE_BUS_DISP1,		.value = 0xffffffff, },
>  	{ .offset = GATE_IP_PERIC,		.value = 0xffffffff, },
>  };

I'm going to tag this patch for inclusion in the stable tree and send
it to Mike or Stephen with other clk/samsung fixes after v4.1-rc1 is
released.

Mike/Stephen, if you're willing to take this patch earlier here is my:

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
