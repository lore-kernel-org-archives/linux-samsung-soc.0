From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: audss: Fix silent hang on Exynos4412
 due to disabled EPLL
Date: Thu, 22 Jun 2017 12:27:10 +0200
Message-ID: <99de23b6-4049-7542-008b-abf65df356f0@samsung.com>
References: <20170621190807.14850-1-krzk@kernel.org>
        <CGME20170621190822epcas2p49ed738ef43e6d68f72903d185e20332e@epcas2p4.samsung.com>
        <20170621190807.14850-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42214 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752977AbdFVK1W (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Jun 2017 06:27:22 -0400
In-reply-to: <20170621190807.14850-2-krzk@kernel.org>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Kukjin Kim <kgene@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>

On 06/21/2017 09:08 PM, Krzysztof Kozlowski wrote:
> Similarly to commit f1e9203e2366 ("clk: samsung: Fix Exynos 5420 pinctrl
> setup and clock disable failure due to domain being gated") for
> Exynos5420, the Exynos4412 also requires that EPLL is not disabled.
> Otherwise any access to MAUDIO block will silently halt.
> 
> This was not visible before because EPLL on Exynos4 could not be
> disabled before commit 6edfa11cb396 ("clk: samsung:
> Add enable/disable operation for PLL36XX clocks").  After this commit,
> on Odroid U3 board one can see silent hang, usually with last (but
> unrelated) messages:
> 
> 	[    2.382741] input: gpio_keys as /devices/platform/gpio_keys/input/input0
> 	[    2.405686] usb 1-3: new high-speed USB device number 3 using exynos-ehci
> 	[    2.419843] max77686-rtc max77686-rtc: setting system clock to 2017-06-21 17:04:13 UTC (1498064653)
> 
> Mark Exynos4 variant as also needed EPLL to be enabled all the time.
> 
> Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Stephen, Mike,

Can you please apply this patch directly?

-- 
Thanks,
Sylwester
