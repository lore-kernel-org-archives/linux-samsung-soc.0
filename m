From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] watchdog: s3c2410_wdt: parse watchdog dt node to read
 PMU registers adresses
Date: Thu, 25 Jul 2013 12:27:10 +0200
Message-ID: <3356224.pISrcKET7X@amdc1227>
References: <1374658699-3961-1-git-send-email-l.krishna@samsung.com>
 <1374658699-3961-2-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:34886 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754994Ab3GYK1O (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Jul 2013 06:27:14 -0400
In-reply-to: <1374658699-3961-2-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dianders@chromium.org, jg1.han@samsung.com, sachin.kamat@linaro.org, 'Wim Van Sebroeck' <wim@iguana.be>, devicetree@vger.kernel.org

Hi Leela,

On Wednesday 24 of July 2013 15:08:17 Leela Krishna Amudala wrote:
> This patch parses the watchdog node to read pmu wdt sys registers
> addresses and do mask/unmask enable/disable of WDT in probe and s2r
> scenarios.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  .../devicetree/bindings/watchdog/samsung-wdt.txt   |   14 ++++-
>  drivers/watchdog/s3c2410_wdt.c                     |   56
> ++++++++++++++++++++ 2 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt index
> 2aa486c..4c798e3 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
> @@ -7,8 +7,20 @@ occurred.
>  Required properties:
>  - compatible : should be "samsung,s3c2410-wdt"
>  - reg : base physical address of the controller and length of memory
> mapped -	region.
> +	region and the optional (addresses and length of memory mapped regions
> +	of) PMU registers for masking/unmasking WDT.
>  - interrupts : interrupt number to the cpu.

I don't think PMU registers should be passed like this, even if USB PHY 
driver currently does it - it needs to be fixed. Every time you are mapping 
a single 4-byte register, you are creating new mapping for the whole page 
(4K) containing it. In addition, this makes the WDT driver map IO memory 
that does not belong to the IP block it handles, which is not nice.

I would suggest looking into regmap helpers to implement a driver for the 
PMU that can share PMU registers with interested drivers.

>  Optional properties:
>  - timeout-sec : contains the watchdog timeout in seconds.
> +- reset-mask-bit: bit number in the PMU registers to program mask/unmask
> WDT. +
> +Example:

If WDT of Exynos 5420 needs special masking, it is no longer compatible 
with "samsung,s3c2410-wdt". You need to create separate compatible for it 
("samsung,exynos5420-wdt") and do this special masking only for devices 
using it.

> +watchdog {
> +	compatible = "samsung,s3c2410-wdt";
> +	reg = <0x101D0000 0x100>, <0x10040408 0x4>, <0x1004040c 0x4>;
> +	interrupts = <0 42 0>;
> +	status = "disabled";
> +	reset-mask-bit = <0>;
> +};

By the way, you need to Cc devicetree@vger.kernel.org mailing if you modify 
device tree bindings.

Best regards,
Tomasz
