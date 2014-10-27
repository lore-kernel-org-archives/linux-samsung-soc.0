From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 3/7] clk: samsung: exynos7: add clocks for RTC block
Date: Mon, 27 Oct 2014 17:31:41 +0100
Message-ID: <544E736D.1070001@samsung.com>
References: <1413870237-1821-1-git-send-email-a.kesavan@samsung.com>
 <1413870237-1821-4-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56111 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753144AbaJ0QcB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Oct 2014 12:32:01 -0400
In-reply-to: <1413870237-1821-4-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>, Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com

Hi,

On 21/10/14 07:43, Abhilash Kesavan wrote:
> From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
> 
> Add clock support for the RTC block in Exynos7.
> 
> Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos7-clock.txt    |    5 ++
>  drivers/clk/samsung/clk-exynos7.c                  |   54 ++++++++++++++++++++
>  include/dt-bindings/clock/exynos7-clk.h            |   17 +++---
>  3 files changed, 70 insertions(+), 6 deletions(-)
[...]
> diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
> index ff63c4e..3227679 100644
> --- a/include/dt-bindings/clock/exynos7-clk.h
> +++ b/include/dt-bindings/clock/exynos7-clk.h
> @@ -11,12 +11,13 @@
>  #define _DT_BINDINGS_CLOCK_EXYNOS7_H
>  
>  /* TOPC */
> -#define DOUT_ACLK_PERIS			1
> -#define DOUT_SCLK_BUS0_PLL		2
> -#define DOUT_SCLK_BUS1_PLL		3
> -#define DOUT_SCLK_CC_PLL		4
> -#define DOUT_SCLK_MFC_PLL		5
> -#define TOPC_NR_CLK			6
> +#define DOUT_ACLK_CCORE_133		1
> +#define DOUT_ACLK_PERIS			2
> +#define DOUT_SCLK_BUS0_PLL		3
> +#define DOUT_SCLK_BUS1_PLL		4
> +#define DOUT_SCLK_CC_PLL		5
> +#define DOUT_SCLK_MFC_PLL		6
> +#define TOPC_NR_CLK			7

Please don't do that, don't change the meaning of already defined
clock identifiers. We should carefully assign the clock identifiers
based on the SoC documentation beforehand, not at will when we see
fit for development of the Linux driver. Please either add
DOUT_ACLK_CCORE_133 at the end of list or move this change to the
first patch in your series adding initial support for Exynos7 SoC.

--
Thanks,
Sylwester
