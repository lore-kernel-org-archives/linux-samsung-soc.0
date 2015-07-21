From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] clk: exynos4: Fix wrong clock for Exynos4x12 ADC
Date: Tue, 21 Jul 2015 15:42:36 -0700
Message-ID: <20150721224235.GA30021@codeaurora.org>
References: <1434074005-18846-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:39494 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755906AbbGUWmj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Jul 2015 18:42:39 -0400
Content-Disposition: inline
In-Reply-To: <1434074005-18846-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>, stable@vger.kernel.org

On 06/12, Krzysztof Kozlowski wrote:
> The TSADC gate clock was used in Exynos4x12 DTSI for exynos-adc driver.
> However TSADC is present only on Exynos4210 so on Trats2 board (with
> Exynos4412 SoC) the exynos-adc driver could not be probed:
>    ERROR: could not get clock /adc@126C0000:adc(0)
>    exynos-adc 126c0000.adc: failed getting clock, err = -2
>    exynos-adc: probe of 126c0000.adc failed with error -2
> 
> Instead on Exynos4x12 SoCs the main clock used by Analog to Digital
> Converter is located in different register and it is named in datasheet
> as PCLK_ADC. Regardless of the name the purpose of this PCLK_ADC clock
> is the same as purpose of TSADC from Exynos4210.
> 
> The patch adds gate clock for Exynos4x12 using the proper register so
> backward compatibility is preserved. This fixes the probe of exynos-adc
> driver on Exynos4x12 boards and allows accessing sensors connected to it
> on Trats2 board (ntc,ncp15wb473 AP and battery thermistors).
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: <stable@vger.kernel.org>
> Fixes: c63c57433003 ("ARM: dts: Add ADC's dt data to read raw data for exynos4x12")
> Link: https://lkml.org/lkml/2015/6/11/85
> 

Did you want clk maintainers to apply this? The To: list is not
helping so I'm not sure what's going on and it seems to have
slipped through the cracks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
