From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] of/documentation: Fix a typo in exynos5250-clock.txt
Date: Mon, 22 Jul 2013 10:51:54 +0900
Message-ID: <0ab501ce867e$0adadd40$209097c0$%kim@samsung.com>
References: <1373012281-26433-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35227 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755025Ab3GVBv4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Jul 2013 21:51:56 -0400
In-reply-to: <1373012281-26433-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: mturquette@linaro.org, grant.likely@linaro.org, rob@landley.net, patches@linaro.org

Sachin Kamat wrote:
> 
> The clocks should be numbered sequentially as they are represented as
> enum values in the clock driver.
> 
> Typo introduced by commit 17d4caccef ("clk: exynos5250: register
> display block gate clocks to common clock framework")
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  .../devicetree/bindings/clock/exynos5250-clock.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> index 781a627..1a05761 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5250-clock.txt
> @@ -154,7 +154,7 @@ clock which they consume.
>    dsim0			341
>    dp			342
>    mixer			343
> -  hdmi			345
> +  hdmi			344
> 
>  Example 1: An example of a clock controller node is listed below.
> 
> --
> 1.7.9.5

Looks OK to me.

Mike, do you want me to take into the samsung tree?

Thanks,
Kukjin
